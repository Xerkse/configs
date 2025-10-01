-- local mp = require 'mp.utils'
local marked = {}

function mark_current()
    local path = mp.get_property("path")
    if path then
        if not marked[path] then
            marked[path] = true
            --mp.msg.warn("Marked: " .. path)
            mp.osd_message("Marked: " .. path)
        else
            marked[path] = nil
            --mp.msg.warn("Unmarked: " .. path)
            mp.osd_message("Unmarked: " .. path)
        end
    end
end

function write_marks()
    local out = {}
    for k, _ in pairs(marked) do
        table.insert(out, k)
    end

    local f, err = io.open("/tmp/mpv_marked.txt", "w")

    if not f then
        print("Error opening file for writing: " .. (err or "unknown"))
        mp.command("quit 1")
    end


    io.stderr:write("Marks written to file: " .. "/tmp/mpv_marked.txt\n")
    f:write(table.concat(out, "\n"))
    io.write(table.concat(out, "\n"))
    f:close()
end

local marked = false
function enable_marks()
    if marked == false then
        mp.add_forced_key_binding("m", "mark-current", mark_current)
        mp.register_event("shutdown", write_marks)
    end
end

mp.add_key_binding("Alt+m", "enable_marks", enable_marks)

