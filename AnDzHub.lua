local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

pcall(function()
    game.CoreGui.AutoJumpGUI:Destroy()
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoJumpGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,170,0,90)
Frame.Position = UDim2.new(0.4,0,0.35,0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,10)
UICorner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(70,170,255)
Stroke.Thickness = 2
Stroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundTransparency = 1
Title.Text = "AnDz Hub Jump"
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = Frame

local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(0.8,0,0,35)
Toggle.Position = UDim2.new(0.1,0,0.5,0)
Toggle.Text = "Nhiên"
Toggle.BackgroundColor3 = Color3.fromRGB(170,0,0)
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextScaled = true
Toggle.Parent = Frame
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0,8)
BtnCorner.Parent = Toggle
local Enabled = false
local Delay = 0.32

Toggle.Text = "AnDz"
Toggle.BackgroundColor3 = Color3.fromRGB(0,170,0)

Toggle.MouseButton1Click:Connect(function()
    Enabled = not Enabled

    if Enabled then
        Toggle.Text = "AnDz"
        Toggle.BackgroundColor3 = Color3.fromRGB(0,170,0)
    else
        Toggle.Text = "Nhiên"
        Toggle.BackgroundColor3 = Color3.fromRGB(170,0,0)
    end
end)

task.spawn(function()
    while true do
        if Enabled then
            local Character = LocalPlayer.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

            if Humanoid and Humanoid.FloorMaterial ~= Enum.Material.Air then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            task.wait(Delay)
        else
            task.wait(0.1)
        end
    end
end)
