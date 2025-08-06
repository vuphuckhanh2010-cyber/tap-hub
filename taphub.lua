local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- RemoteEvent (tạo nếu chưa có)
local sellEvent = ReplicatedStorage:FindFirstChild("SellInventoryEvent")
if not sellEvent then
	sellEvent = Instance.new("RemoteEvent")
	sellEvent.Name = "SellInventoryEvent"
	sellEvent.Parent = ReplicatedStorage
end

-- Tạo leaderstats và Inventory
Players.PlayerAdded:Connect(function(player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	stats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = stats

	local inventory = Instance.new("Folder")
	inventory.Name = "MyItems"
	inventory.Parent = player
end)

-- Danh sách trái cây hợp lệ để bán
local fruitNames = {
	["Apple"] = true,
	["Banana"] = true,
	["Berry"] = true,
	["Tranquil Bloom"] = true,
	["Magic Fruit"] = true,
	["Blueberry"] = true,
	["Pear"] = true,
	["Melon"] = true,
	["Cactus Fruit"] = true
}

-- Xử lý bán
sellEvent.OnServerEvent:Connect(function(player)
	local inventory = player:FindFirstChild("MyItems")
	local stats = player:FindFirstChild("leaderstats")
	if not inventory or not stats then return end

	local coins = stats:FindFirstChild("Coins")
	if not coins then return end

	local total = 0

	for _, item in ipairs(inventory:GetChildren()) do
		if fruitNames[item.Name] then
			local val = item:FindFirstChild("Value")
			if val and val:IsA("NumberValue") then
				total += val.Value
				item:Destroy()
			end
		end
	end

	if total > 0 then
		coins.Value += total
		print("✅ " .. player.Name .. " bán trái được " .. total .. " Coins.")
	else
		print("⚠️ Không có trái nào để bán.")
	end
end)









