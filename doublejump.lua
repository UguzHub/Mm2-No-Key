--[ Delta Executor - Double Jump Bomber v1.0 ]--
-- Paste this in a LocalScript inside StarterPlayerScripts or StarterGui

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- // GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DoubleJumpBomber"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 160)
MainFrame.Position = UDim2.new(1, -220, 1, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Shadow = Instance.new("UIStroke")
Shadow.Color = Color3.fromRGB(60, 60, 60)
Shadow.Thickness = 1.5
Shadow.Transparency = 0.5
Shadow.Parent = MainFrame

-- // Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 28)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "✧ BOMBER ✧"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- // Action Button (Double Jump + Bomb)
local ActionButton = Instance.new("TextButton")
ActionButton.Name = "ActionButton"
ActionButton.Size = UDim2.new(0.85, 0, 0, 45)
ActionButton.Position = UDim2.new(0.075, 0, 0.35, 0)
ActionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ActionButton.BackgroundTransparency = 0.2
ActionButton.BorderSizePixel = 0
ActionButton.Text = "Double Jump"
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.TextSize = 18
ActionButton.Font = Enum.Font.GothamBold
ActionButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ActionButton

-- // Resize Button (bottom-right corner)
local ResizeBtn = Instance.new("ImageButton")
ResizeBtn.Name = "ResizeBtn"
ResizeBtn.Size = UDim2.new(0, 24, 0, 24)
ResizeBtn.Position = UDim2.new(1, -28, 1, -28)
ResizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
ResizeBtn.BackgroundTransparency = 0.2
ResizeBtn.BorderSizePixel = 0
ResizeBtn.Image = "rbxassetid://6031082066" -- classic resize icon
ResizeBtn.ImageColor3 = Color3.fromRGB(180, 180, 180)
ResizeBtn.ZIndex = 3
ResizeBtn.Parent = MainFrame

local ResizeCorner = Instance.new("UICorner")
ResizeCorner.CornerRadius = UDim.new(0, 6)
ResizeCorner.Parent = ResizeBtn

-- // State
local isDragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local isResizing = false
local smallSize = UDim2.new(0, 200, 0, 160)
local bigSize = UDim2.new(0, 300, 0, 220)
local currentSize = smallSize

local cooldownActive = false
local cooldownTime = 30
local cooldownRemaining = 0

-- // Draggable Logic (Main Frame)
local function onInputBegan(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        -- ignore if clicking on resize button
        local target = input.Position
        local absPos = MainFrame.AbsolutePosition
        local absSize = MainFrame.AbsoluteSize
        local resizeBtnAbsPos = ResizeBtn.AbsolutePosition
        local resizeBtnAbsSize = ResizeBtn.AbsoluteSize
        
        local isOnResize = (target.X >= resizeBtnAbsPos.X and target.X <= resizeBtnAbsPos.X + resizeBtnAbsSize.X and
                            target.Y >= resizeBtnAbsPos.Y and target.Y <= resizeBtnAbsPos.Y + resizeBtnAbsSize.Y)
        if isOnResize then return end
        
        isDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end

local function onInputMoved(input, processed)
    if processed then return end
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

MainFrame.InputBegan:Connect(onInputBegan)
UserInputService.InputChanged:Connect(onInputMoved)

-- // Resize Logic
local function toggleSize()
    if isResizing then return end
    isResizing = true
    
    local targetSize = (currentSize == smallSize) and bigSize or smallSize
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(MainFrame, tweenInfo, {Size = targetSize})
    tween:Play()
    tween.Completed:Wait()
    currentSize = targetSize
    isResizing = false
end

ResizeBtn.MouseButton1Click:Connect(toggleSize)
ResizeBtn.TouchTap:Connect(toggleSize)

-- // Cooldown Update
local function updateCooldownUI()
    if cooldownActive then
        ActionButton.Text = "Bekleme: " .. math.ceil(cooldownRemaining) .. "s"
        ActionButton.TextColor3 = Color3.fromRGB(200, 150, 100)
    else
        ActionButton.Text = "Double Jump"
        ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

-- // Core Action: Double Jump + Bomb Teleport
local function executeAction()
    if cooldownActive then return end
    if not Character or not Character.Parent then
        Character = LocalPlayer.Character
        if not Character then return end
        Humanoid = Character:WaitForChild("Humanoid")
        RootPart = Character:WaitForChild("HumanoidRootPart")
    end
    
    if Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
        -- Not in air — optional: notify or ignore
        return
    end
    
    -- Find bomb tool
    local bombTool = nil
    -- Check Backpack first
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
            bombTool = tool
            break
        end
    end
    -- If not found, check Character
    if not bombTool then
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                bombTool = tool
                break
            end
        end
    end
    
    if not bombTool then
        warn("No tool with Handle found in Backpack or Character.")
        return
    end
    
    -- Equip the tool
    local success, err = pcall(function()
        LocalPlayer.Character = Character
        bombTool.Parent = Character
        Humanoid:EquipTool(bombTool)
    end)
    if not success then
        warn("Equip failed: " .. tostring(err))
        return
    end
    
    -- Activate the tool
    pcall(function()
        bombTool:Activate()
    end)
    
    -- Teleport Handle 2.5 studs below RootPart
    local handle = bombTool:FindFirstChild("Handle") or bombTool:FindFirstChildWhichIsA("BasePart")
    if handle and RootPart then
        local targetPos = RootPart.Position - Vector3.new(0, 2.5, 0)
        handle.CFrame = CFrame.new(targetPos)
    end
    
    -- Apply upward velocity (Double Jump)
    if RootPart then
        local currentVel = RootPart.AssemblyLinearVelocity
        RootPart.AssemblyLinearVelocity = Vector3.new(currentVel.X, 50, currentVel.Z)
    end
    
    -- Start cooldown
    cooldownActive = true
    cooldownRemaining = cooldownTime
    updateCooldownUI()
    
    -- Cooldown tick loop
    spawn(function()
        while cooldownRemaining > 0 and cooldownActive do
            task.wait(1)
            cooldownRemaining = cooldownRemaining - 1
            updateCooldownUI()
        end
        cooldownActive = false
        updateCooldownUI()
    end)
end

ActionButton.MouseButton1Click:Connect(executeAction)
ActionButton.TouchTap:Connect(executeAction)

-- // Character respawn handler
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end)

-- // Cleanup when GUI is destroyed
ScreenGui.AncestryChanged:Connect(function()
    if not ScreenGui.Parent then
        ScreenGui:Destroy()
    end
end)

print("[Delta] Double Jump Bomber loaded successfully.")
