-- FUNHUB V5.1 - FLASH GRAB COM TRIGGER DE MOUSE
local function executeFlashGrab()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    local char = player.Character
    local bp = player.Backpack
    
    -- O 'Trigger' é a ativação instantânea do item de coleta
    local itemColeta = bp:FindFirstChild("Brainrot") or bp:FindFirstChild("Pet")
    if itemColeta then
        char.Humanoid:EquipTool(itemColeta)
        -- Trigger: força a ativação do item de coleta no início do flash
        itemColeta:Activate() 
    end

    local tpItem = bp:FindFirstChild("Teletransporte Instantâneo") or char:FindFirstChild("Teletransporte Instantâneo")
    
    if tpItem then
        char.Humanoid:EquipTool(tpItem)
        
        -- Pega a posição de onde você está mirando (Mira do Vídeo)
        local targetPos = mouse.Hit 
        local hrp = char:FindFirstChild("HumanoidRootPart")
        
        if hrp then
            -- Trigger de Movimento: Ativa o teletransporte com o rastro de rapidez
            tpItem:Activate() 
            
            -- Teleporte instantâneo para a mira
            hrp.CFrame = CFrame.new(targetPos.p) 
        end
        
        -- Trigger de Servidor (Instrução da Imagem):
        -- Envia o 'fire' para o remote confirmando a ação na coordenada
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("FlashRemote")
        if remote then
            -- O amigo sugeriu deixar fixo em 91 se necessário, 
            -- mas aqui usamos a posição do trigger do mouse
            remote:FireServer(targetPos.p)
        end
    end
end

-- Conecta ao botão do seu painel móvel
FlashGrabBtn.MouseButton1Click:Connect(executeFlashGrab)
