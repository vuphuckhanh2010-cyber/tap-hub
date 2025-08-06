local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI container
local gui = Instance.new("ScreenGui")
gui.Name = "SellGUI"
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0, 50, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Parent = gui

-- Sell Button only
local sellBtn = Instance.new("TextButton")
sellBtn.Size = UDim2.new(1, -20, 0, 50)
sellBtn.Position = UDim2.new(0, 10, 0, 15)
sellBtn.Text = "💰 Bán Inventory"
sellBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
sellBtn.TextColor3 = Color3.new(1, 1, 1)
sellBtn.Parent = frame

-- Sell handler
sellBtn.MouseButton1Click:Connect(function()
	local sellEvent = ReplicatedStorage:FindFirstChild("SellInventoryEvent")
	if sellEvent then
		sellEvent:FireServer()
	else
		warn("❌ Không tìm thấy SellInventoryEvent")
	end
end)








