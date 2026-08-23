local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("MM2DoubleJumpGUI") then
    PlayerGui.MM2DoubleJumpGUI:Destroy()
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2DoubleJumpGUI"
ScreenGui.Parent = PlayerGui

-- MainFrame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 160, 0, 90)
MainFrame.Position = UDim2.new(0.5, -80, 0.75, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- ActionButton
local ActionButton = Instance.new("TextButton")
ActionButton.Size = UDim2.new(1, -12, 1, -12)
ActionButton.Position = UDim2.new(0, 6, 0, 6)
ActionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.TextSize = 13
ActionButton.Font = Enum.Font.SourceSansBold
ActionButton.Text = "Double Jump"
ActionButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ActionButton

-- ResizeBtn
local ResizeBtn = Instance.new("TextButton")
ResizeBtn.Size = UDim2.new(0, 24, 0, 24)
ResizeBtn.Position = UDim2.new(1, -26, 1, -26)
ResizeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ResizeBtn.Text = "⤢"
ResizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResizeBtn.TextSize = 12
ResizeBtn.ZIndex = 3
ResizeBtn.Parent = MainFrame

local ResizeCorner = Instance.new("UICorner")
ResizeCorner.CornerRadius = UDim.new(0, 4)
ResizeCorner.Parent = ResizeBtn

-- Sürükleme Mantığı
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if input.Target == ResizeBtn then return end
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Boyut Değiştirme Mantığı
local isBig = false
ResizeBtn.MouseButton1Click:Connect(function()
    isBig = not isBig
    if isBig then
        MainFrame:TweenSize(UDim2.new(0, 220, 0, 120), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        ActionButton.TextSize = 16
        ResizeBtn.Text = "⤡"
    else
        MainFrame:TweenSize(UDim2.new(0, 160, 0, 90), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        ActionButton.TextSize = 13
        ResizeBtn.Text = "⤢"
    end
end)

-- Havada Bomba Koyma ve 2. Zıplama Mantığı
local coolDown = false
local cooldownTime = 30

ActionButton.MouseButton1Click:Connect(function()
    if coolDown then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    
    if not hrp or not humanoid then return end

    -- 1. Eşyayı (Bombayı) Ele Alma
    local bombTool = character:FindFirstChildOfClass("Tool")
    if not bombTool and backpack then
        bombTool = backpack:FindFirstChildOfClass("Tool")
        if bombTool then
            humanoid:EquipTool(bombTool)
            task.wait(0.02)
        end
    end

    -- 2. Bombayı Tetikleme ve Ayak Altına Işınlama
    if bombTool then
        bombTool:Activate() -- Bombayı kullanır
        
        local handle = bombTool:FindFirstChild("Handle") or bombTool:FindFirstChildOfClass("BasePart")
        if handle then
            -- Bombayı tam ayak tabanının 2.5 birim altına getirir
            handle.CFrame = hrp.CFrame - Vector3.new(0, 2.5, 0)
        end
        
        -- 3. Havada İkinci Zıplama İvmesi (Double Jump)
        -- Dikey hızı (Y ekseni) sıfırlayıp temiz bir 50 birimlik zıplama kuvveti uygular
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 50, hrp.AssemblyLinearVelocity.Z)
    end

    -- 30 Saniyelik Cooldown
    coolDown = true
    local timeLeft = cooldownTime
    
    task.spawn(function()
        while timeLeft > 0 do
            ActionButton.Text = "Bekleme: " .. timeLeft .. "s"
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        ActionButton.Text = "Double Jump"
        coolDown = false
    end)
end)
