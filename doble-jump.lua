local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local canDoubleJump = true -- Agora começa como true!
local hasDoubleJumped = false
local jumpPower = humanoid.JumpPower -- Guarda o poder padrão do pulo
local doubleJumpPower = jumpPower -- Define o poder do segundo pulo

-- Reinicia as permissões de pulo quando o jogador toca o chão
humanoid.StateChanged:Connect(function(_, state)
    if state == Enum.HumanoidStateType.Landed then
        canDoubleJump = true -- Permite o duplo pulo ao tocar o chão
        hasDoubleJumped = false
    end
end)

-- Detecta a entrada do jogador para pular
userInputService.JumpRequest:Connect(function()
    if humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        if canDoubleJump and not hasDoubleJumped then
            hasDoubleJumped = true
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping) -- Força o estado de pulo
            local rootPart = character:WaitForChild("HumanoidRootPart")
            rootPart.Velocity = Vector3.new(rootPart.Velocity.X, doubleJumpPower, rootPart.Velocity.Z)
        end
    end
end)
