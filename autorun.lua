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
        r.setOutput(sides.bottom, 15)
        os.sleep(1)
        r.setOutput(sides.bottom, 0)
        os.sleep(28)
    until wrong == true
  elseif r.getInput(sides.right) == 15 then
     term.clear()
     print("Maquina desligada")
     os.sleep(1)
     wrong=true
  else 
    wrong=true
  end
end