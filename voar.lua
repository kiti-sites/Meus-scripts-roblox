local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Criando a interface
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 50)
flyButton.Position = UDim2.new(0, 10, 0, 10)
flyButton.Text = "Ativar Voo"
flyButton.Parent = screenGui

-- Variável para controlar o voo
local isFlying = false
local flyingSpeed = 50 -- Velocidade do voo
local bodyVelocity

-- Função para alternar voo
local function toggleFlight()
    if isFlying then
        isFlying = false
        -- Parar o voo removendo o BodyVelocity
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        humanoid.PlatformStand = false
        flyButton.Text = "Ativar Voo"
    else
        isFlying = true
        humanoid.PlatformStand = true
        flyButton.Text = "Desativar Voo"
        
        -- Criar o BodyVelocity para o voo
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, flyingSpeed, 0)
        bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    end
end

-- Conectar o botão à função de alternar voo
flyButton.MouseButton1Click:Connect(toggleFlight)

-- Quando o personagem for respawnado, garantir que o voo ainda funcione
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)
