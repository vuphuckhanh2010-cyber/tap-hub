local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- GUI setup
local gui = Instance.new("ScreenGui")
gui.Name = "SellGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Sell Button
local sellBtn = Instance.new("TextButton")
sellBtn.Size = UDim2.new(0, 200, 0, 50)
sellBtn.Position = UDim2.new(0.5, -100, 0.8, 0)
sellBtn.Text = "💰 Bán Trái Cây"
sellBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
sellBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sellBtn.Font = Enum.Font.SourceSansBold
sellBtn.TextSize = 22
sellBtn.Parent = gui

-- Connect button to server
local sellEvent = ReplicatedStorage:WaitForChild("SellInventoryEvent")

sellBtn.MouseButton1Click:Connect(function()
    print("📨 Yêu cầu bán trái cây gửi lên server...")
    sellEvent:FireServer()
end)










