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

-- Variáveis para controlar o voo
local isFlying = false
local flyingSpeed = 50 -- Velocidade do voo
local verticalSpeed = 20 -- Velocidade para controlar o movimento para cima/baixo
local bodyGyro -- Para manter o personagem ereto

-- Função para alternar voo
local function toggleFlight()
    if isFlying then
        isFlying = false
        humanoid.PlatformStand = false
        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end
        flyButton.Text = "Ativar Voo"
    else
        isFlying = true
        humanoid.PlatformStand = true
        flyButton.Text = "Desativar Voo"
        
        -- Criar um BodyGyro para manter o personagem ereto
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000) -- Força para manter ereto
        bodyGyro.CFrame = character:WaitForChild("HumanoidRootPart").CFrame
        bodyGyro.Parent = character:WaitForChild("HumanoidRootPart")
    end
end

-- Controle de voo no ar (usando as teclas WASD)
game:GetService("RunService").Heartbeat:Connect(function()
    if isFlying then
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local moveDirection = humanoid.MoveDirection

        -- Movimento horizontal com base nas teclas WASD
        local horizontalVelocity = moveDirection * flyingSpeed

        -- Controle vertical (subir/descer)
        local verticalVelocity = 0
        if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            verticalVelocity = verticalSpeed -- Subir
        elseif userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            verticalVelocity = -verticalSpeed -- Descer
        end

        -- Atualizar a velocidade do personagem com a física de voo
        rootPart.Velocity = Vector3.new(horizontalVelocity.X, verticalVelocity, horizontalVelocity.Z)
    end
end)

-- Conectar o botão à função de alternar voo
flyButton.MouseButton1Click:Connect(toggleFlight)

-- Garantir que a variável 'userInputService' seja declarada corretamente
local userInputService = game:GetService("UserInputService")

-- Quando o personagem for respawnado, garantir que o voo ainda funcione
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)
