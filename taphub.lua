local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- Tạo giao diện bán
local gui = Instance.new("ScreenGui")
gui.Name = "SellGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local sellBtn = Instance.new("TextButton")
sellBtn.Size = UDim2.new(0, 200, 0, 50)
sellBtn.Position = UDim2.new(0.5, -100, 0.8, 0)
sellBtn.Text = "💰 Bán Inventory"
sellBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
sellBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sellBtn.Parent = gui

-- Lấy SellInventoryEvent từ ReplicatedStorage
local sellEvent = ReplicatedStorage:WaitForChild("SellInventoryEvent")

sellBtn.MouseButton1Click:Connect(function()
	print("📨 Đang gửi yêu cầu bán inventory đến server...")
	sellEvent:FireServer()
end)










