local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI container
local gui = Instance.new("ScreenGui")
gui.Name = "TAP HUB"
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0, 50, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Parent = gui

-- Teleport Button
local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(1, -20, 0, 40)
tpBtn.Position = UDim2.new(0, 10, 0, 10)
tpBtn.Text = "Teleport to Seller"
tpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tpBtn.TextColor3 = Color3.new(1, 1, 1)
tpBtn.Parent = frame

-- Sell Button
local sellBtn = Instance.new("TextButton")
sellBtn.Size = UDim2.new(1, -20, 0, 40)
sellBtn.Position = UDim2.new(0, 10, 0, 60)
sellBtn.Text = "💰 Bán Inventory"
sellBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
sellBtn.TextColor3 = Color3.new(1, 1, 1)
sellBtn.Parent = frame

-- Teleport handler
tpBtn.MouseButton1Click:Connect(function()
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:FindFirstChild("HumanoidRootPart")

	local sellStand = workspace:FindFirstChild("NPCS") and workspace.NPCS:FindFirstChild("Sell Stands")

	if not sellStand then
		warn("❌ Không tìm thấy 'Sell Stands'")
		return
	end

	local targetPart = sellStand.PrimaryPart or sellStand:FindFirstChild("HumanoidRootPart")
	if targetPart and hrp then
		local offset = Vector3.new(0, 0, -4)
		hrp.CFrame = CFrame.new(targetPart.Position + offset, targetPart.Position)
		print("✅ Đã teleport đến NPC")
	else
		warn("⚠️ Sell Stands không có PrimaryPart")
	end
end)

-- Sell handler
sellBtn.MouseButton1Click:Connect(function()
	local sellEvent = ReplicatedStorage:FindFirstChild("SellInventoryEvent")
	if sellEvent then
		sellEvent:FireServer()
	else
		warn("❌ Không tìm thấy SellInventoryEvent")
	end
end)







