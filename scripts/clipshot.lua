---Screenshot using mpv's screenshot command and copy to clipboard
---@license MIT

local mp = require('mp')
local utils = require('mp.utils')

-- Platform detection
local platform = mp.get_property_native('platform')
local temp_dir
local temp_screenshot_dir

-- Determine temp directory based on platform
if platform == 'windows' then
    temp_dir = os.getenv('TEMP')
elseif platform == 'darwin' then
    temp_dir = os.getenv('TMPDIR')
else -- Unix-like systems
    temp_dir = '/tmp'
end

-- Root directory name for screenshots
local root_dir_name = "mpv-clipshot"
temp_screenshot_dir = utils.join_path(temp_dir, root_dir_name)

-- Cleanup the root screenshot directory
local function cleanup_shot_root()
    if not temp_screenshot_dir or temp_screenshot_dir == "" then
        return
    end
    local files = utils.readdir(temp_screenshot_dir)
    if files and #files > 0 then
        local file_to_delete = utils.join_path(temp_screenshot_dir, files[1])
        os.remove(file_to_delete)
    end
end

-- Create unique temp screenshot directory
local function ensure_temp_screenshot_dir()
    -- Only create the directory if it doesn't exist
    if not temp_screenshot_dir or temp_screenshot_dir == "" then
        return false
    end
    if platform == 'windows' then
        local win_path = temp_screenshot_dir:gsub("/", "\\")
        mp.commandv("run", "cmd", "/C", "if not exist", win_path, "mkdir", win_path)
    else
        mp.commandv("run", "mkdir", "-p", temp_screenshot_dir)
    end
    cleanup_shot_root()
    return true
end

-- Get the most recent file from the temp screenshot directory
local function get_last_screenshot()
    local files = utils.readdir(temp_screenshot_dir)
    if not files or #files == 0 then return nil end
    return utils.join_path(temp_screenshot_dir, files[1])
end

-- Function to get clipboard command based on platform
local function get_clipboard_command(file)
    if platform == 'windows' then
        return {
            name = "powershell",
            args = {
                '-NoProfile', '-Command',
                string.format(
                    'Add-Type -AssemblyName System.Windows.Forms; ' ..
                    '$s=[System.Collections.Specialized.StringCollection]::new(); ' ..
                    '$s.Add("%s")|Out-Null; ' ..
                    '[System.Windows.Forms.Clipboard]::SetFileDropList($s)',
                    file:gsub("\\", "\\\\")
                )
            }
        }
    elseif platform == 'darwin' then
        return {
            name = "osascript",
            args = {'-e', string.format('set the clipboard to (read (POSIX file %q))', file)}
        }
    else -- Unix-like
        if os.getenv('XDG_SESSION_TYPE') == 'wayland' then
            return {
                name = "sh",
                args = {'-c', string.format('wl-copy < %q', file)}
            }
        else
            return {
                name = "xclip",
                args = {'-sel', 'c', '-i', file}
            }
        end
    end
end

-- Generic function to take screenshot and copy to clipboard
local function clipshot_generic(screenshot_type)
    if not ensure_temp_screenshot_dir() then
        mp.osd_message("Failed to create temp directory", 3)
        return
    end
    local original_dir = mp.get_property("screenshot-directory")
    mp.set_property("screenshot-directory", temp_screenshot_dir)
    if screenshot_type then
        mp.commandv("screenshot", screenshot_type)
    else
        mp.commandv("screenshot")
    end
    mp.add_timeout(0.1, function()
        mp.set_property("screenshot-directory", original_dir)
        local screenshot_file = get_last_screenshot()
        if not screenshot_file then
            mp.osd_message("Failed to locate screenshot", 3)
            return
        end
        local cmd = get_clipboard_command(screenshot_file)
        mp.command_native_async({
            name = "subprocess",
            playback_only = false,
            capture_stdout = true,
            capture_stderr = true,
            args = {cmd.name, unpack(cmd.args)}
        }, function(success, result, error)
            if success then
                mp.osd_message("Screenshot copied to clipboard", 2)
            else
                mp.osd_message("Failed to copy screenshot: " .. (error or "unknown error"), 3)
            end
        end)
    end)
end

-- Register key bindings
mp.add_key_binding('s', 'clipshot', function() clipshot_generic(nil) end)
mp.add_key_binding('S', 'clipshot-video', function() clipshot_generic('video') end)