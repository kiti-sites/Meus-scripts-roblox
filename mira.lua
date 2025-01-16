local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local camera = game:GetService("Workspace").CurrentCamera

-- Criação de um ScreenGui para conter a mira
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Criação do Frame para a mira (a base do X)
local crosshair = Instance.new("Frame")
crosshair.Size = UDim2.new(0, 30, 0, 30)  -- Tamanho reduzido para a mira
crosshair.AnchorPoint = Vector2.new(0.5, 0.5)  -- Faz a mira centralizada
crosshair.BackgroundTransparency = 1  -- Tornando o fundo transparente
crosshair.Parent = screenGui

-- Calculando a posição no centro da tela com base no ViewportSize
crosshair.Position = UDim2.new(0.5, 0, 0.5, 0)

-- Criando a linha diagonal para o X (da esquerda para a direita)
local diagonalLine1 = Instance.new("Frame")
diagonalLine1.Size = UDim2.new(0, 15, 0, 2)  -- Linha diagonal pequena
diagonalLine1.Position = UDim2.new(0.5, 0, 0.5, 0)  -- Posiciona no centro
diagonalLine1.AnchorPoint = Vector2.new(0.5, 0.5)
diagonalLine1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor da linha
diagonalLine1.Rotation = 45  -- Rotaciona a linha para formar o X
diagonalLine1.Parent = crosshair

-- Criando a outra linha diagonal para o X (da direita para a esquerda)
local diagonalLine2 = Instance.new("Frame")
diagonalLine2.Size = UDim2.new(0, 15, 0, 2)  -- Linha diagonal pequena
diagonalLine2.Position = UDim2.new(0.5, 0, 0.5, 0)  -- Posiciona no centro
diagonalLine2.AnchorPoint = Vector2.new(0.5, 0.5)
diagonalLine2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor da linha
diagonalLine2.Rotation = -45  -- Rotaciona a linha para formar o X
diagonalLine2.Parent = crosshair
