local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local canDoubleJump = false
local hasDoubleJumped = false
local doubleJumpPower = 50 -- Ajuste a força do pulo duplo aqui

-- Reinicia as variáveis ao tocar o chão
humanoid.StateChanged:Connect(function(_, state)
    if state == Enum.HumanoidStateType.Landed then
        canDoubleJump = false
        hasDoubleJumped = false
    elseif state == Enum.HumanoidStateType.Freefall then
        canDoubleJump = true
    end
end)

-- Detecta o pulo e aplica o duplo pulo
userInputService.JumpRequest:Connect(function()
    if canDoubleJump and not hasDoubleJumped then
        hasDoubleJumped = true
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        local rootPart = character:WaitForChild("HumanoidRootPart")
        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, doubleJumpPower, rootPart.Velocity.Z)
    end
end)
