-- Criação de uma mira simples no centro da tela

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criação de um ScreenGui para conter a mira
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Criação do Frame para a mira
local crosshair = Instance.new("Frame")
crosshair.Size = UDim2.new(0, 30, 0, 30)  -- Tamanho da mira
crosshair.Position = UDim2.new(0.5, -15, 0.5, -15)  -- Posicionando no centro da tela
crosshair.AnchorPoint = Vector2.new(0.5, 0.5)  -- Faz a mira centralizada
crosshair.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- Cor da mira (branca)

-- Adicionando a mira à tela
crosshair.Parent = screenGui

-- Criando duas linhas para a mira (horizontal e vertical)
local horizontalLine = Instance.new("Frame")
horizontalLine.Size = UDim2.new(1, 0, 0, 2)  -- Linha horizontal
horizontalLine.Position = UDim2.new(0, 0, 0.5, -1)
horizontalLine.AnchorPoint = Vector2.new(0.5, 0.5)
horizontalLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha para a linha
horizontalLine.Parent = crosshair

local verticalLine = Instance.new("Frame")
verticalLine.Size = UDim2.new(0, 2, 1, 0)  -- Linha vertical
verticalLine.Position = UDim2.new(0.5, -1, 0, 0)
verticalLine.AnchorPoint = Vector2.new(0.5, 0.5)
verticalLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha para a linha
verticalLine.Parent = crosshair
