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
    gpu.set(1,1,"Essa função não existe! Tente de novo")
    wrong=false
  end
  term.setCursor(1,2)
  local input=io.read()
  if input=="start" then
        term.clear()
    repeat
        print("Combustivel dropado!")
        r.setOutput(sides.top, 15)
        os.sleep(1)
        r.setOutput(sides.top, 0)
        os.sleep(8)
    until wrong == true
elseif r.setWakeOnRedstone(sides.bottom) then
     term.clear()
     wrong=true
else 
    wrong=true
  end
end