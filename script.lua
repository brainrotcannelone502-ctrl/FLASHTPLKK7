-- NOVO SCRIPT: IMPÉRIO GG / LK7 HUB
-- Foco: Painel Móvel, Flash Grab por Mira e Trigger 91

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FlashGrabBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Interface Móvel (Igual ao vídeo)
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 180, 0, 80)
MainFrame.Active = true
MainFrame.Draggable = true -- Permite mexer na tela como no vídeo

FlashGrabBtn.Name = "FlashGrabBtn"
FlashGrabBtn.Parent = MainFrame
FlashGrabBtn.Size = UDim2.new(0.9, 0, 0.7, 0)
FlashGrabBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
FlashGrabBtn.Text = "FLASH GRAB"
FlashGrabBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
FlashGrabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlashGrabBtn.Font = Enum.Font.SourceSansBold
FlashGrabBtn.TextSize = 20

UICorner.Parent = FlashGrabBtn

-- Função de Flash Grab com Mira e Trigger
local function executeFlashGrab()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    local char = player.Character
    local bp = player.Backpack
    
    local targetPos = mouse.Hit -- Mira onde a pessoa aponta (vídeo)
    local targetY = 91 -- Trigger de coordenada fixa (instrução do amigo)

    -- Puxa o item (Brainrot ou Pet)
    local item = bp:FindFirstChild("Brainrot") or bp:FindFirstChild("Pet")
    if item then char.Humanoid:EquipTool(item) end

    -- Usa o Teletransporte Instantâneo
    local tp = bp:FindFirstChild("Teletransporte Instantâneo") or char:FindFirstChild("Teletransporte Instantâneo")
    if tp then
        char.Humanoid:EquipTool(tp)
        tp:Activate() -- Efeito rapidex do vídeo
        
        -- Teleporta para a mira, mas respeitando o Trigger Y 91 do amigo
        char.HumanoidRootPart.CFrame = CFrame.new(targetPos.X, targetY, targetPos.Z)
        
        -- Remote Fire para o Flash (Instrução do amigo)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("FlashRemote")
        if remote then remote:FireServer(targetY) end
    end
end

FlashGrabBtn.MouseButton1Click:Connect(executeFlashGrab)
