do
  local addr, invoke = computer.getBootAddress(), component.invoke
  local function loadfile(file)
    local handle = assert(invoke(addr, "open", file))
    local buffer = ""
    repeat
      local data = invoke(addr, "read", handle, math.huge)
      buffer = buffer .. (data or "")
    until not data
    invoke(addr, "close", handle)
    return load(buffer, "=" .. file, "bt", _G)
  end
  loadfile("/lib/core/boot.lua")(loadfile)
end

while true do
  local result, reason = xpcall(require("shell").getShell(), function(msg)
    return tostring(msg).."\n"..debug.traceback()
  end)
  if not result then
    io.stderr:write((reason ~= nil and tostring(reason) or "unknown error") .. "\n")
    io.write("Press any key to continue.\n")
    os.sleep(0.5)
    require("event").pull("key")
  end
end

local component=require("component")
local r=component.redstone
local gpu=component.gpu
local term=require("term")
local sides = require("sides")

local wrong=false

while true do
  term.clear()
  gpu.set(1,1,"O que eu devo fazer?")
  if wrong then
    gpu.set(1,1,"Essa função não existe!")
    wrong=false
  end
  term.setCursor(1,2)
  local input=io.read()
  if input=="start" then
    repeat
        print("Dropei")
        r.setOutput(sides.top, 15)
        os.sleep(1)
        r.setOutput(sides.top, 0)
        os.sleep(8)
    until wrong == true
else 
    wrong=true
  end
end