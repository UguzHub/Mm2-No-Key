local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Eğer daha önce açıldıysa eski GUI'yi temizle
if PlayerGui:FindFirstChild("MM2DoubleJumpGUI") then
    PlayerGui.MM2DoubleJumpGUI:Destroy()
end

-- Ana Ekran Çerçevesi (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2DoubleJumpGUI"
ScreenGui.Parent = PlayerGui

-- Sürüklenebilir Ana Panel
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 160, 0, 90)
MainFrame.Position = UDim2.new(0.5, -80, 0.75, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Ana İşlem Butonu (Double Jump / Bomba)
local ActionButton = Instance.new("TextButton")
ActionButton.Size = UDim2.new(1, -12, 1, -12)
ActionButton.Position = UDim2.new(0, 6, 0, 6)
ActionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.TextSize = 13
ActionButton.Font = Enum.Font.SourceSansBold
ActionButton.Text = "Double Jump (Hazır)"
ActionButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ActionButton

-- Sağ Altta Boyut Değiştirme Butonu (Buyut / Kucult)
local ResizeBtn = Instance.new("TextButton")
ResizeBtn.Size = UDim2.new(0, 22, 0, 22)
ResizeBtn.Position = UDim2.new(1, -22, 1, -22)
ResizeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ResizeBtn.Text = "⤢"
ResizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResizeBtn.TextSize = 12
ResizeBtn.Parent = MainFrame

local ResizeCorner = Instance.new("UICorner")
ResizeCorner.CornerRadius = UDim.new(0, 4)
ResizeCorner.Parent = ResizeBtn

-- Sürükleme (Draggable) Mantığı
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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

-- Boyut Değiştirme (Büyült / Küçült) Mantığı
local isBig = false
ResizeBtn.MouseButton1Click:Connect(function()
    isBig = not isBig
    if isBig then
        MainFrame.Size = UDim2.new(0, 220, 0, 120)
        ActionButton.TextSize = 16
    else
        MainFrame.Size = UDim2.new(0, 160, 0, 90)
        ActionButton.TextSize = 13
    end
end)

-- 30 Saniye Cooldown ve Eylem Mantığı
local coolDown = false
local cooldownTime = 30

ActionButton.MouseButton1Click:Connect(function()
    if coolDown then return end
    
    -- Karakter ve Eşya Kontrolü
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        
        -- Eşyayı ele alma (Equip)
        local tool = character:FindFirstChildOfClass("Tool") or (backpack and backpack:FindFirstChildOfClass("Tool"))
        if tool and humanoid then
            humanoid:EquipTool(tool)
        end
        
        -- Fizik / Yukarı Fırlatma (Double Jump Efekti)
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 55, hrp.AssemblyLinearVelocity.Z)
        end
    end

    -- 30 Saniyelik Geri Sayım Döngüsü
    coolDown = true
    local timeLeft = cooldownTime
    
    task.spawn(function()
        while timeLeft > 0 do
            ActionButton.Text = "Bekleme: " .. timeLeft .. "s"
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        ActionButton.Text = "Double Jump (Hazır)"
        coolDown = false
    end)
end)

