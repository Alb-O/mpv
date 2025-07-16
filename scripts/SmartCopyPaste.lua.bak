-- Copyright (c) 2022, Eisa AlAwadhi
-- License: BSD 2-Clause License
-- Creator: Eisa AlAwadhi
-- Project: SmartCopyPaste
-- Version: 3.2.1

local o = {
---------------------------USER CUSTOMIZATION SETTINGS---------------------------
--These settings are for users to manually change some options.
--Changes are recommended to be made in the script-opts directory.

	-----Script Settings----
	device = 'auto', --'auto' is for automatic device detection, or manually change to: 'windows' or 'mac' or 'linux'
	linux_copy = 'xclip -silent -selection clipboard -in', --copy command that will be used in Linux. OR write a different command
	linux_paste = 'xclip -selection clipboard -o', --paste command that will be used in Linux. OR write a different command
	mac_copy = 'pbcopy', --copy command that will be used in MAC. OR write a different command
	mac_paste = 'pbpaste', --paste command that will be used in MAC. OR write a different command
	windows_copy = 'powershell', --'powershell' is for using windows powershell to copy. OR write the copy command, e.g: ' clip'
	windows_paste = 'powershell', --'powershell' is for using windows powershell to paste. OR write the paste command
	resume_offset = -0.65, --change to 0 so item resumes from the exact position, or decrease the value so that it gives you a little preview before loading the resume point
	osd_messages = true, --true is for displaying osd messages when actions occur. Change to false will disable all osd messages generated from this script
	time_seperator = ' 🕒 ', --Time seperator that will be shown before the saved time in osd messages
	prefer_filename_over_title = 'local', --Prefers to copy filename over filetitle. Select between 'local', 'protocols', 'all', and 'none'. 'local' prefer filenames for videos that are not protocols. 'protocols' will prefer filenames for protocols only. 'all' will prefer filename over filetitle for both protocols and not protocols videos. 'none' will always use filetitle instead of filename
	copy_time_method = 'all', --Option to copy time with video, 'none' for disabled, 'all' to copy time for all videos, 'protocols' for copying time only for protocols, 'specifics' to copy time only for websites defined below, 'local' to copy time for videos that are not protocols
	specific_time_attributes=[[
	[ ["twitter", "?t=", ""], ["twitch", "?t=", "s"], ["youtube", "&t=", "s"] ]
	]], --The time attributes which will be added when copying protocols of specific websites from this list. Additional attributes can be added following the same format.
	protocols_time_attribute = '&t=', --The text that will be copied before the seek time when copying a protocol video from mpv 
	local_time_attribute = '#t=', --The text that will be copied before the seek time when copying a local video from mpv
	pastable_time_attributes=[[
	[" | time="]
	]], --The time attributes that can be pasted for resume, specific_time_attributes, protocols_time_attribute, local_time_attribute are automatically added
	
	-- Copy behaviors 1-3
	copy_behavior_1 = 'path&timestamp', --Copy behavior 1 - Select between: title, path, timestamp, path&timestamp, obsidian.
	copy_keybind_1=[[
	["ctrl+c"]
	]], --Keybind that will be used to copy with behavior 1
	
	copy_behavior_2 = 'path', --Copy behavior 2 - Select between: title, path, timestamp, path&timestamp, obsidian.
	copy_keybind_2=[[
	["ctrl+C"]
	]], --Keybind that will be used to copy with behavior 2
	
	copy_behavior_3 = 'obsidian', --Copy behavior 3 - Select between: title, path, timestamp, path&timestamp, obsidian.
	copy_keybind_3=[[
	["ctrl+alt+c", "ctrl+alt+C"]
	]], --Keybind that will be used to copy with behavior 3
	
	-- Paste behaviors 1-3
	paste_behavior_1 = 'playlist', --Paste behavior 1 - Select between: playlist, timestamp, force.
	paste_keybind_1=[[
	["ctrl+v"]
	]], --Keybind that will be used to paste with behavior 1
	
	paste_behavior_2 = 'timestamp', --Paste behavior 2 - Select between: playlist, timestamp, force.
	paste_keybind_2=[[
	["ctrl+V"]
	]], --Keybind that will be used to paste with behavior 2
	
	paste_behavior_3 = 'force', --Paste behavior 3 - Select between: playlist, timestamp, force.
	paste_keybind_3=[[
	["ctrl+alt+v", "ctrl+alt+V"]
	]], --Keybind that will be used to paste with behavior 3
	
	paste_protocols=[[
	["https?://", "magnet:", "rtmp:", "file:"]
	]], --add above (after a comma) any protocol you want paste to work with; e.g: ,'ftp://'. Or set it as "" by deleting all defined protocols to make paste works with any protocol.
	paste_extensions=[[
	["ac3", "a52", "eac3", "mlp", "dts", "dts-hd", "dtshd", "true-hd", "thd", "truehd", "thd+ac3", "tta", "pcm", "wav", "aiff", "aif",  "aifc", "amr", "awb", "au", "snd", "lpcm", "yuv", "y4m", "ape", "wv", "shn", "m2ts", "m2t", "mts", "mtv", "ts", "tsv", "tsa", "tts", "trp", "adts", "adt", "mpa", "m1a", "m2a", "mp1", "mp2", "mp3", "mpeg", "mpg", "mpe", "mpeg2", "m1v", "m2v", "mp2v", "mpv", "mpv2", "mod", "tod", "vob", "vro", "evob", "evo", "mpeg4", "m4v", "mp4", "mp4v", "mpg4", "m4a", "aac", "h264", "avc", "x264", "264", "hevc", "h265", "x265", "265", "flac", "oga", "ogg", "opus", "spx", "ogv", "ogm", "ogx", "mkv", "mk3d", "mka", "webm", "weba", "avi", "vfw", "divx", "3iv", "xvid", "nut", "flic", "fli", "flc", "nsv", "gxf", "mxf", "wma", "wm", "wmv", "asf", "dvr-ms", "dvr", "wtv", "dv", "hdv", "flv","f4v", "f4a", "qt", "mov", "hdmov", "rm", "rmvb", "ra", "ram", "3ga", "3ga2", "3gpp", "3gp", "3gp2", "3g2", "ay", "gbs", "gym", "hes", "kss", "nsf", "nsfe", "sap", "spc", "vgm", "vgz", "m3u", "m3u8", "pls", "cue",
	"ase", "art", "bmp", "blp", "cd5", "cit", "cpt", "cr2", "cut", "dds", "dib", "djvu", "egt", "exif", "gif", "gpl", "grf", "icns", "ico", "iff", "jng", "jpeg", "jpg", "jfif", "jp2", "jps", "lbm", "max", "miff", "mng", "msp", "nitf", "ota", "pbm", "pc1", "pc2", "pc3", "pcf", "pcx", "pdn", "pgm", "PI1", "PI2", "PI3", "pict", "pct", "pnm", "pns", "ppm", "psb", "psd", "pdd", "psp", "px", "pxm", "pxr", "qfx", "raw", "rle", "sct", "sgi", "rgb", "int", "bw", "tga", "tiff", "tif", "vtf", "xbm", "xcf", "xpm", "3dv", "amf", "ai", "awg", "cgm", "cdr", "cmx", "dxf", "e2d", "egt", "eps", "fs", "gbr", "odg", "svg", "stl", "vrml", "x3d", "sxd", "v2d", "vnd", "wmf", "emf", "art", "xar", "png", "webp", "jxr", "hdp", "wdp", "cur", "ecw", "iff", "lbm", "liff", "nrrd", "pam", "pcx", "pgf", "sgi", "rgb", "rgba", "bw", "int", "inta", "sid", "ras", "sun", "tga",
	"torrent"]
	]], --add above (after a comma) any extension you want paste to work with; e.g: ,'pdf'. Or set it as "" by deleting all defined extension to make paste works with any extension.
	paste_subtitles=[[
	["aqt", "gsub", "jss", "sub", "ttxt", "pjs", "psb", "rt", "smi", "slt", "ssf", "srt", "ssa", "ass", "usf", "idx", "vtt"]
	]], --add above (after a comma) any extension you want paste to attempt to add as a subtitle file, e.g.:'txt'. Or set it as "" by deleting all defined extension to make paste attempt to add any subtitle.
	
	-----Time Format Settings-----
	--in the first parameter, you can define from the available styles: default, hms, hms-full, timestamp, timestamp-concise "default" to show in HH:MM:SS.sss format. "hms" to show in 1h 2m 3.4s format. "hms-full" is the same as hms but keeps the hours and minutes persistent when they are 0. "timestamp" to show the total time as timestamp 123456.700 format. "timestamp-concise" shows the total time in 123456.7 format (shows and hides decimals depending on availability).
	--in the second parameter, you can define whether to show milliseconds, round them or truncate them. Available options: 'truncate' to remove the milliseconds and keep the seconds. 0 to remove the milliseconds and round the seconds. 1 or above is the amount of milliseconds to display. The default value is 3 milliseconds.
	--in the third parameter you can define the seperator between hour:minute:second. "default" style is automatically set to ":", "hms", "hms-full" are automatically set to " ". You can define your own. Some examples: ["default", 3, "-"],["hms-full", 5, "."],["hms", "truncate", ":"],["timestamp-concise"],["timestamp", 0],["timestamp", "truncate"],["timestamp", 5]
	copy_time_format=[[
	["timestamp-concise"]
	]],
	osd_time_format=[[
	["default", "truncate"]
	]],

---------------------------END OF USER CUSTOMIZATION SETTINGS---------------------------
}

(require 'mp.options').read_options(o)
local utils = require 'mp.utils'
local msg = require 'mp.msg'

o.copy_keybind_1 = utils.parse_json(o.copy_keybind_1)
o.copy_keybind_2 = utils.parse_json(o.copy_keybind_2)
o.copy_keybind_3 = utils.parse_json(o.copy_keybind_3)
o.paste_keybind_1 = utils.parse_json(o.paste_keybind_1)
o.paste_keybind_2 = utils.parse_json(o.paste_keybind_2)
o.paste_keybind_3 = utils.parse_json(o.paste_keybind_3)
o.paste_protocols = utils.parse_json(o.paste_protocols)
o.paste_extensions = utils.parse_json(o.paste_extensions)
o.paste_subtitles = utils.parse_json(o.paste_subtitles)
o.specific_time_attributes = utils.parse_json(o.specific_time_attributes)
o.pastable_time_attributes = utils.parse_json(o.pastable_time_attributes)
o.copy_time_format = utils.parse_json(o.copy_time_format)
o.osd_time_format = utils.parse_json(o.osd_time_format)

local protocols = {'https?:', 'magnet:', 'rtmps?:', 'smb:', 'ftps?:', 'sftp:'}
local seekTime = 0
local clip, clip_time, clip_file, filePath, fileTitle
local clipboard_pasted = false

function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	
	return false
end

table.insert(o.pastable_time_attributes, o.protocols_time_attribute)
table.insert(o.pastable_time_attributes, o.local_time_attribute)
for i = 1, #o.specific_time_attributes do
	if not has_value(o.pastable_time_attributes, o.specific_time_attributes[i][2]) then
		table.insert(o.pastable_time_attributes, o.specific_time_attributes[i][2])
	end
end

if not o.device or o.device == 'auto' then
	if os.getenv('windir') ~= nil then
		o.device = 'windows'
	elseif os.execute '[ -d "/Applications" ]' == 0 and os.execute '[ -d "/Library" ]' == 0 or os.execute '[ -d "/Applications" ]' == true and os.execute '[ -d "/Library" ]' == true then
		o.device = 'mac'
	else
		o.device = 'linux'
  end
end

function starts_protocol(tab, val)
	for index, value in ipairs(tab) do
		if (val:find(value) == 1) then
			return true
		end
	end
	return false
end

function contain_value(tab, val)
	if not tab then return end
	if not val then return end

	for index, value in ipairs(tab) do
		if value.match(string.lower(val), string.lower(value)) then
			return true
		end
	end
	
	return false
end

function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then io.close(f) return true else return false end
end

function format_time(seconds, sep, decimals, style)
	local function divmod (a, b)
		return math.floor(a / b), a % b
	end
	decimals = decimals == nil and 3 or decimals
	
	local s = seconds
	local h, s = divmod(s, 60*60)
	local m, s = divmod(s, 60)

	if decimals == 'truncate' then
		s = math.floor(s)
		decimals = 0
		if style == 'timestamp' then
			seconds = math.floor(seconds)
		end
	end
	
	if not style or style == '' or style == 'default' then
		local second_format = string.format("%%0%d.%df", 2+(decimals > 0 and decimals+1 or 0), decimals)
		sep = sep and sep or ":"
		return string.format("%02d"..sep.."%02d"..sep..second_format, h, m, s)
	elseif style == 'default-no-hour' then
		local second_format = string.format("%%0%d.%df", 2+(decimals > 0 and decimals+1 or 0), decimals)
		sep = sep and sep or ":"
		return string.format("%02d"..sep..second_format, m, s)
	elseif style == 'hms' or style == 'hms-full' then
	  sep = sep ~= nil and sep or " "
	  if style == 'hms-full' or h > 0 then
		return string.format("%dh"..sep.."%dm"..sep.."%." .. tostring(decimals) .. "fs", h, m, s)
	  elseif m > 0 then
		return string.format("%dm"..sep.."%." .. tostring(decimals) .. "fs", m, s)
	  else
		return string.format("%." .. tostring(decimals) .. "fs", s)
	  end
	elseif style == 'timestamp' then
		return string.format("%." .. tostring(decimals) .. "f", seconds)
	elseif style == 'timestamp-concise' then
		return seconds
	end
end

function get_appropriate_time_format(video_time, video_duration)
	local has_hours = video_duration and video_duration >= 3600
	local style = has_hours and "default" or "default-no-hour"
	return format_time(video_time, o.osd_time_format[3], o.osd_time_format[2], style)
end

function get_path()
	local path = mp.get_property('path')
	if not path then return end
	
	local title = mp.get_property('media-title'):gsub("\"", "")
	
	if starts_protocol(protocols, path) and o.prefer_filename_over_title == 'protocols' then
		title = mp.get_property('filename'):gsub("\"", "")
	elseif not starts_protocol(protocols, path) and o.prefer_filename_over_title == 'local' then
		title = mp.get_property('filename'):gsub("\"", "")
	elseif o.prefer_filename_over_title == 'all' then
		title = mp.get_property('filename'):gsub("\"", "")
	end
	
	return path, title
end

function bind_keys(keys, name, func, opts)
	if not keys then
		mp.add_forced_key_binding(keys, name, func, opts)
		return
	end
	
	for i = 1, #keys do
		if i == 1 then 
			mp.add_forced_key_binding(keys[i], name, func, opts)
		else
			mp.add_forced_key_binding(keys[i], name .. i, func, opts)
		end
	end
end

function handleres(res, args)
	if not res.error and res.status == 0 then
		return res.stdout
	else
		msg.error("There was an error getting "..o.device.." clipboard: ")
		msg.error("  Status: "..(res.status or ""))
		msg.error("  Error: "..(res.error or ""))
		msg.error("  stdout: "..(res.stdout or ""))
		msg.error("args: "..utils.to_string(args))
		return ''
	end
end

function os.capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

function make_raw(s)
	if not s then return end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

function get_extension(path)
	if not path then return end

    match = string.match(path, '%.([^%.]+)$' )
    if match == nil then
        return 'nomatch'
    else
        return match
    end
end


function get_specific_attribute(target_path)
		local pre_attribute = ''
		local after_attribute = ''
		if not starts_protocol(protocols, target_path) then
			pre_attribute = o.local_time_attribute
		elseif starts_protocol(protocols, target_path) then
			pre_attribute = o.protocols_time_attribute
			for i = 1, #o.specific_time_attributes do
				if contain_value({o.specific_time_attributes[i][1]}, target_path) then
					pre_attribute = o.specific_time_attributes[i][2]
					after_attribute = o.specific_time_attributes[i][3]
					break
				end
			end
		end
	return pre_attribute, after_attribute
end

function get_time_attribute(target_path)
	local pre_attribute = ''
	for i = 1, #o.pastable_time_attributes do
		if contain_value({o.pastable_time_attributes[i]}, target_path) then
			pre_attribute = o.pastable_time_attributes[i]
			break
		end
	end
	return pre_attribute
end


function get_clipboard()
	local clipboard
	if o.device == 'linux' then
		clipboard = os.capture(o.linux_paste)
		return clipboard
	elseif o.device == 'windows' then
		if o.windows_paste == 'powershell' then
			local args = {
				'powershell', '-NoProfile', '-Command', [[& {
					Trap {
						Write-Error -ErrorRecord $_
						Exit 1
					}
					$clip = Get-Clipboard -Raw -Format Text -TextFormatType UnicodeText
					if (-not $clip) {
						$clip = Get-Clipboard -Raw -Format FileDropList
					}
					$u8clip = [System.Text.Encoding]::UTF8.GetBytes($clip)
					[Console]::OpenStandardOutput().Write($u8clip, 0, $u8clip.Length)
				}]]
			}
			return handleres(utils.subprocess({ args =  args, cancellable = false }), args)
		else
			clipboard = os.capture(o.windows_paste)
			return clipboard
		end
	elseif o.device == 'mac' then
		clipboard = os.capture(o.mac_paste)
		return clipboard
	end
	return ''
end


function set_clipboard(text)
	local pipe
	if o.device == 'linux' then
		pipe = io.popen(o.linux_copy, 'w')
		pipe:write(text)
		pipe:close()
	elseif o.device == 'windows' then
		if o.windows_copy == 'powershell' then
			local res = utils.subprocess({ args = {
				'powershell', '-NoProfile', '-Command', string.format([[& {
					Trap {
						Write-Error -ErrorRecord $_
						Exit 1
					}
					Add-Type -AssemblyName PresentationCore
					[System.Windows.Clipboard]::SetText('%s')
				}]], text)
			} })
		else
			pipe = io.popen(o.windows_copy,'w')
			pipe:write(text)
			pipe:close()
		end
	elseif o.device == 'mac' then
		pipe = io.popen(o.mac_copy,'w')
		pipe:write(text)
		pipe:close()
	end
	return ''
end

function parse_clipboard(text)
	if not text then return end
	
	local clip_table = {}
	local clip = text
	local clip_file, clip_time

	for c in clip:gmatch("[^\n\r]+") do
		c = make_raw(c)
		local c_clip_file, c_clip_time, c_clip_extension
		
		if starts_protocol(protocols, c) then
			for c_protocols in c:gmatch("[^%s]+") do
				if starts_protocol(protocols, c_protocols) then
					local c_pre_attribute = get_time_attribute(c)
					if c_pre_attribute and string.match(c, '(.*)'..c_pre_attribute) then
						c_clip_file = string.match(c_protocols, '(.*)'..c_pre_attribute)
						c_clip_time = tonumber(string.match(c_protocols, c_pre_attribute..'(%d*%.?%d*)'))
					else
						c_clip_file = string.match(c, '^\"(.*)\"$') or c_protocols
					end			
					c_clip_extension = get_extension(c_clip_file)
					table.insert(clip_table, {c_clip_file, c_clip_time, c_clip_extension})
				end
			end
		else
			local c_pre_attribute = get_time_attribute(c)
			if c_pre_attribute and string.match(c, '(.*)'..c_pre_attribute) then
				c_clip_file = string.match(c, '(.*)'..c_pre_attribute)
				c_clip_time = tonumber(string.match(c, c_pre_attribute..'(%d*%.?%d*)'))
			else
				c_clip_file = string.match(c, '^\"(.*)\"$') or c
			end
			
			c_clip_extension = get_extension(c_clip_file)
			table.insert(clip_table, {c_clip_file, c_clip_time, c_clip_extension})
		end
	end

	clip = make_raw(clip)
	local pre_attribute = get_time_attribute(clip)

	if pre_attribute and string.match(clip, '(.*)'..pre_attribute) then
		clip_file = string.match(clip, '(.*)'..pre_attribute)
		clip_time = tonumber(string.match(clip, pre_attribute..'(%d*%.?%d*)'))
	else
		clip_file = string.match(clip, '^\"(.*)\"$') or clip
	end

	return clip, clip_file, clip_time, clip_table
end

function copy_behavior(behavior)
	if not behavior then return end

	if filePath == nil then
		if o.osd_messages == true then
			mp.osd_message('Failed to Copy\nNo Video Found')
		end
		msg.info("Failed to copy, no video found")
		return
	end

	local video_time = mp.get_property_number('time-pos')
	local video_duration = mp.get_property_number('duration')
	local formatted_time = video_time and format_time(video_time, o.copy_time_format[3], o.copy_time_format[2], o.copy_time_format[1])
	local osd_formatted_time = video_time and get_appropriate_time_format(video_time, video_duration)
	local pre_attribute, after_attribute = "", ""
	local clipboard_text = ""
	local osd_msg = ""
	local is_zero_time = (not video_time or video_time == 0)

	local function title_behavior()
		clipboard_text = fileTitle
		osd_msg = "Copied file title:\n" .. fileTitle
	end

	local function path_behavior()
		clipboard_text = filePath
		osd_msg = "Copied location for:\n" .. fileTitle
	end

	local function timestamp_behavior()
		pre_attribute, after_attribute = get_specific_attribute(filePath)
		clipboard_text = pre_attribute .. formatted_time .. after_attribute
		osd_msg = "Copied" .. o.time_seperator .. osd_formatted_time
	end

	local function path_timestamp_behavior()
		pre_attribute, after_attribute = get_specific_attribute(filePath)
		if is_zero_time then
			clipboard_text = filePath
			osd_msg = "Copied location for:\n" .. fileTitle
		else
			clipboard_text = filePath .. pre_attribute .. formatted_time .. after_attribute
			osd_msg = "Copied location with timestamp:\n" .. fileTitle .. o.time_seperator .. osd_formatted_time
		end
	end

	local function obsidian_behavior()
		if starts_protocol(protocols, filePath) then
			pre_attribute, after_attribute = get_specific_attribute(filePath)
			if is_zero_time then
				clipboard_text = "![" .. osd_formatted_time .. "](" .. filePath .. o.local_time_attribute .. "0)"
			else
				clipboard_text = "![" .. osd_formatted_time .. "](" .. filePath .. pre_attribute .. formatted_time .. after_attribute .. o.local_time_attribute .. formatted_time .. ")"
			end
		else
			local filename = mp.get_property('filename')
			if is_zero_time then
				clipboard_text = "![[" .. filename .. "|" .. osd_formatted_time .. "]]"
			else
				clipboard_text = "![[" .. filename .. o.local_time_attribute .. formatted_time .. "|" .. osd_formatted_time .. "]]"
			end
		end
		osd_msg = "Copied Obsidian Link:\n" .. clipboard_text
	end

	if behavior == 'title' then
		title_behavior()
	elseif behavior == 'path' then
		path_behavior()
	elseif behavior == 'timestamp' then
		timestamp_behavior()
	elseif behavior == 'path&timestamp' then
		path_timestamp_behavior()
	elseif behavior == 'obsidian' then
		obsidian_behavior()
	end

	if o.osd_messages == true then
		mp.osd_message(osd_msg)
	end
	set_clipboard(clipboard_text)
	msg.info("Copied the below into clipboard:\n" .. clipboard_text)
end

function trigger_paste_action(action)
	if not action then return end
	
	local osd_msg = ""
	local info_msg = ""
	
	if action == 'load-file' then
		filePath = clip_file
		
		if clip_time ~= nil then
			osd_msg = "Pasted:\n" .. clip_file .. o.time_seperator .. format_time(clip_time, o.osd_time_format[3], o.osd_time_format[2], o.osd_time_format[1])
			info_msg = "Pasted the below file into mpv:\n" .. clip_file .. format_time(clip_time)
		else
			osd_msg = "Pasted:\n" .. clip_file
			info_msg = "Pasted the below file into mpv:\n" .. clip_file
		end
		
		mp.commandv('loadfile', clip_file)
		clipboard_pasted = true
	elseif action == 'load-subtitle' then
		osd_msg = "Pasted Subtitle:\n" .. clip_file
		info_msg = "Pasted the below subtitle into mpv:\n" .. clip_file
		mp.commandv('sub-add', clip_file, 'select')
	elseif action == 'file-seek' then
		local video_duration = mp.get_property_number('duration')
		seekTime = clip_time + o.resume_offset
		
		if seekTime > video_duration then 
			osd_msg = 'Time Paste Exceeds Video Length' .. o.time_seperator .. format_time(clip_time, o.osd_time_format[3], o.osd_time_format[2], o.osd_time_format[1])
			info_msg = "The time pasted exceeds the video length:\n" .. format_time(clip_time)
			if o.osd_messages == true then mp.osd_message(osd_msg) end
			msg.info(info_msg)
			return
		end 
		
		seekTime = math.max(0, seekTime) -- Ensure seek time is not negative
		
		osd_msg = 'Resumed to Pasted Time' .. o.time_seperator .. format_time(clip_time, o.osd_time_format[3], o.osd_time_format[2], o.osd_time_format[1])
		info_msg = "Resumed to the pasted time" .. o.time_seperator .. format_time(clip_time)
		mp.commandv('seek', seekTime, 'absolute', 'exact')
	elseif action == 'add-playlist' then
		osd_msg = 'Pasted Into Playlist:\n' .. clip_file
		info_msg = "Pasted the below into playlist:\n" .. clip_file
		mp.commandv('loadfile', clip_file, 'append-play')
	elseif action == 'error-subtitle' then
		osd_msg = 'Subtitle Paste Requires Running Video:\n' .. clip_file
		info_msg = 'Subtitles can only be pasted if a video is running:\n' .. clip_file
	elseif action == 'error-unsupported' then
		osd_msg = 'Paste of this item is unsupported possibly due to configuration:\n' .. clip
		info_msg = 'Failed to paste into mpv, pasted item shown below is unsupported possibly due to configuration:\n' .. clip
	elseif action == 'error-missing' then
		osd_msg = 'File Doesn\'t Exist:\n' .. clip_file
		info_msg = 'The file below doesn\'t seem to exist:\n' .. clip_file
	elseif action == 'error-time' then
		if clip_time ~= nil then
			osd_msg = 'Time Paste Requires Running Video' .. o.time_seperator .. format_time(clip_time, o.osd_time_format[3], o.osd_time_format[2], o.osd_time_format[1])
			info_msg = 'Time can only be pasted if a video is running:\n' .. format_time(clip_time)
		else
			osd_msg = 'Time Paste Requires Running Video'
			info_msg = 'Time can only be pasted if a video is running'
		end
	elseif action == 'error-missingtime' then
		osd_msg = 'Clipboard does not contain time for seeking:\n' .. clip
		info_msg = "Clipboard does not contain the time attribute and time for seeking:\n" .. clip
	elseif action == 'error-samefile' then
		osd_msg = 'Pasted file is already running:\n' .. clip
		info_msg = "Pasted file shown below is already running:\n" .. clip
	elseif action == 'error-unknown' then
		osd_msg = 'Paste was ignored due to an error:\n' .. clip
		info_msg = 'Paste was ignored due to an error:\n' .. clip
	end

	if o.osd_messages == true then
		mp.osd_message(osd_msg)
	end
	
	if info_msg ~= "" then
		msg.info(info_msg)
	end
end

function multipaste()
	if #clip_table < 2 then return msg.warn('Single paste should be called instead of multipaste') end
	local file_ignored_total = 0
	local file_subtitle_total = 0
	local triggered_multipaste = {}

	if filePath == nil then
		for i=1, #clip_table do
			if file_exists(clip_table[i][1]) and has_value(o.paste_extensions, clip_table[i][3]) 
			or starts_protocol(o.paste_protocols, clip_table[i][1]) then
				filePath = clip_table[i][1]
				mp.commandv('loadfile', clip_table[i][1])
				clipboard_pasted = true
				table.remove(clip_table, i)
				triggered_multipaste[1] = true
				break
			end
		end
	end
	
	if filePath ~= nil then
		for i=1, #clip_table do
			if file_exists(clip_table[i][1]) and has_value(o.paste_extensions, clip_table[i][3])
			or starts_protocol(o.paste_protocols, clip_table[i][1]) then
				mp.commandv('loadfile', clip_table[i][1], 'append-play')
				triggered_multipaste[2] = true
			elseif file_exists(clip_table[i][1]) and has_value(o.paste_subtitles, clip_table[i][3]) then
				mp.commandv('sub-add', clip_table[i][1])
				file_subtitle_total = file_subtitle_total + 1
			elseif not has_value(o.paste_extensions, clip_table[i][3]) and not has_value(o.paste_subtitles, clip_table[i][3]) then
				msg.warn('The below was ignored since it is unsupported possibly due to configuration:\n'..clip_table[i][1])
				file_ignored_total = file_ignored_total + 1
			elseif not file_exists(clip_table[i][1]) then
				msg.warn('The below doesn\'t seem to exist:\n' .. clip_table[i][1])
				file_ignored_total = file_ignored_total + 1
			else
				msg.warn('The below was ignored due to an error:\n' .. clip_table[i][1])
				file_ignored_total = file_ignored_total + 1
			end
		end
	end
	
	local osd_msg = ''
	if triggered_multipaste[1] == true then
		if osd_msg ~= '' then osd_msg = osd_msg..'\n' end
		osd_msg = osd_msg..'Pasted: '..filePath
	end
	if file_subtitle_total > 0 then
		if osd_msg ~= '' then osd_msg = osd_msg..'\n' end
		osd_msg = osd_msg..'Added '..file_subtitle_total..' Subtitle/s'
	end
	if triggered_multipaste[2] == true then
		if osd_msg ~= '' then osd_msg = osd_msg..'\n' end
		osd_msg = osd_msg..'Added Into Playlist '..#clip_table - file_ignored_total - file_subtitle_total..' item/s'
	end	
	if file_ignored_total > 0 then
		if osd_msg ~= '' then osd_msg = osd_msg..'\n' end
		osd_msg = osd_msg..'Ignored '..file_ignored_total.. ' Item/s'
	end
	
	if osd_msg == '' then
		osd_msg = 'Pasted Items Ignored or Unable To Append Into Video:\n'..clip
	end
	
	if o.osd_messages == true then
		mp.osd_message(osd_msg)
	end
	msg.info(osd_msg)
end


function paste_behavior(behavior)
	if not behavior then return end
	
	if o.osd_messages == true then
		mp.osd_message("Pasting...")
	end
	msg.info("Pasting...")
	
	clip = get_clipboard(clip)
	if not clip then msg.error('Error: clip is null' .. clip) return end
	clip, clip_file, clip_time, clip_table = parse_clipboard(clip)
	
	if #clip_table > 1 then
		multipaste()
	else
		local currentVideoExtension = string.lower(get_extension(clip_file))
		if behavior == 'playlist' then
			if filePath == nil then
				if file_exists(clip_file) and has_value(o.paste_extensions, currentVideoExtension) 
				or starts_protocol(o.paste_protocols, clip_file) then
					trigger_paste_action('load-file')
				elseif file_exists(clip_file) and has_value(o.paste_subtitles, currentVideoExtension) then
					trigger_paste_action('error-subtitle')
				elseif not has_value(o.paste_extensions, currentVideoExtension) and not has_value(o.paste_subtitles, currentVideoExtension) then
					trigger_paste_action('error-unsupported')
				elseif not file_exists(clip_file) then
					trigger_paste_action('error-missing')
				else
					trigger_paste_action('error-unknown')				
				end
			else
				if file_exists(clip_file) and has_value(o.paste_subtitles, currentVideoExtension) then
					trigger_paste_action('load-subtitle')
				elseif filePath ~= clip_file and file_exists(clip_file) and has_value(o.paste_extensions, currentVideoExtension)
				or filePath ~= clip_file and starts_protocol(o.paste_protocols, clip_file)
				or filePath == clip_file and file_exists(clip_file) and has_value(o.paste_extensions, currentVideoExtension) and clip_time == nil
				or filePath == clip_file and starts_protocol(o.paste_protocols, clip_file) and clip_time == nil then
					trigger_paste_action('add-playlist')
				elseif clip_time ~= nil then
					trigger_paste_action('file-seek')
				elseif not has_value(o.paste_extensions, currentVideoExtension) and not has_value(o.paste_subtitles, currentVideoExtension) then
					trigger_paste_action('error-unsupported')
				elseif not file_exists(clip_file) then
					trigger_paste_action('error-missing')
				else
					trigger_paste_action('error-unknown')
				end
			end
		elseif behavior == 'timestamp' then
			if filePath == nil then
				trigger_paste_action('error-time')
			elseif clip_time ~= nil then
				trigger_paste_action('file-seek')
			elseif file_exists(clip_file) and has_value(o.paste_subtitles, currentVideoExtension) then
				trigger_paste_action('load-subtitle')
			elseif file_exists(clip_file) and has_value(o.paste_extensions, currentVideoExtension) 
			or starts_protocol(o.paste_protocols, clip_file) then
				trigger_paste_action('add-playlist')
			elseif clip_time == nil then
				trigger_paste_action('error-missingtime')
			elseif not has_value(o.paste_extensions, currentVideoExtension) and not has_value(o.paste_subtitles, currentVideoExtension) then
				trigger_paste_action('error-unsupported')
			elseif not file_exists(clip_file) then
				trigger_paste_action('error-missing')
			else
				trigger_paste_action('error-unknown')
			end
		elseif behavior == 'force' then
			if filePath ~= clip_file and file_exists(clip_file) and has_value(o.paste_extensions, currentVideoExtension) 
			or filePath ~= clip_file and starts_protocol(o.paste_protocols, clip_file) then
				trigger_paste_action('load-file')
			elseif clip_time ~= nil then
				trigger_paste_action('file-seek')
			elseif file_exists(clip_file) and has_value(o.paste_subtitles, currentVideoExtension) then
				trigger_paste_action('load-subtitle')
			elseif file_exists(clip_file) and filePath == clip_file 
			or filePath == clip_file and starts_protocol(o.paste_protocols, clip_file) then
				trigger_paste_action('add-playlist')
			elseif not has_value(o.paste_extensions, currentVideoExtension) and not has_value(o.paste_subtitles, currentVideoExtension) then
				trigger_paste_action('error-unsupported')
			elseif not file_exists(clip_file) then
				trigger_paste_action('error-missing')
			else
				trigger_paste_action('error-unknown')
			end
		end
	end
end

mp.register_event('file-loaded', function()
	filePath, fileTitle = get_path()
	if clipboard_pasted == true then
		clip = get_clipboard(clip)
		if not clip then msg.error('Error: clip is null' .. clip) return end
		clip, clip_file, clip_time, clip_table = parse_clipboard(clip)
		
		if #clip_table > 1 then
			for i=1, #clip_table do
				if file_exists(clip_table[i][1]) and has_value(o.paste_extensions, clip_table[i][3]) 
				or starts_protocol(o.paste_protocols, clip_table[i][1]) then
					clip_file = clip_table[i][1]
					clip_time = clip_table[i][2]
					break
				end
			end
		end
		
		if filePath == clip_file and clip_time ~= nil then
			local video_duration = mp.get_property_number('duration')
			seekTime = clip_time + o.resume_offset

			if seekTime > video_duration then 
				if o.osd_messages == true then
					mp.osd_message('Time Paste Exceeds Video Length' .. o.time_seperator .. format_time(clip_time, o.osd_time_format[3], o.osd_time_format[2], o.osd_time_format[1]))
				end
				msg.info("The time pasted exceeds the video length:\n"..format_time(clip_time))
				return
			end 

			if seekTime < 0 then
				seekTime = 0
			end

			mp.commandv('seek', seekTime, 'absolute', 'exact')
			clipboard_pasted = false
		end
	end
end)

bind_keys(o.copy_keybind_1, 'copy-behavior-1', function() copy_behavior(o.copy_behavior_1) end)
bind_keys(o.copy_keybind_2, 'copy-behavior-2', function() copy_behavior(o.copy_behavior_2) end)
bind_keys(o.copy_keybind_3, 'copy-behavior-3', function() copy_behavior(o.copy_behavior_3) end)
bind_keys(o.paste_keybind_1, 'paste-behavior-1', function() paste_behavior(o.paste_behavior_1) end)
bind_keys(o.paste_keybind_2, 'paste-behavior-2', function() paste_behavior(o.paste_behavior_2) end)
bind_keys(o.paste_keybind_3, 'paste-behavior-3', function() paste_behavior(o.paste_behavior_3) end)
