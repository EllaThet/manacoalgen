--[[Programa para setar o timing de jogar carvão no chão!]]--

--Sleep
function Wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end
--Clear Function 
function Clear()
    os.execute("cls")
end

Uinput = false

component.colors.yellow
function Start()
    Clear()
    print("Digite o que eu devo fazer:")
    if io.read() == "start" then
    Clear()
    _G.Uinput = false
end
end

repeat
    print("Dropei")
    component.redstone.getOutput(sides.top, 15)
    Wait(0.1)
    component.redstone.getOutput(sides.top, 0)
    Wait(5)
until Uinput == true

if component.redstone.getInput(sides.bottom) == true then
    Uinput = true
    Clear()
    print("Estou desligango!")
    Wait(0.5)
    Clear()
    Start()
end