local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "TAP HUB"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 50, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Parent = gui

local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(1, -20, 0, 40)
tpBtn.Position = UDim2.new(0, 10, 0, 10)
tpBtn.Text = "Teleport to Seller"
tpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tpBtn.TextColor3 = Color3.new(1, 1, 1)
tpBtn.Parent = frame

tpBtn.MouseButton1Click:Connect(function()
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:FindFirstChild("HumanoidRootPart")

	local sellStand = workspace:FindFirstChild("NPCS") and workspace.NPCS:FindFirstChild("Sell Stands")

	if not workspace:FindFirstChild("NPCS") then
		warn("⚠️ Không tìm thấy workspace.NPCS")
	elseif not sellStand then
		warn("⚠️ Không tìm thấy NPC 'Sell Stands' bên trong workspace.NPCS")
	elseif not hrp then
		warn("⚠️ Không tìm thấy HumanoidRootPart của nhân vật!")
	elseif sellStand and hrp then
		local targetPart = sellStand.PrimaryPart or sellStand:FindFirstChild("HumanoidRootPart")
		if targetPart then
			local offset = Vector3.new(0, 0, -4)
			hrp.CFrame = CFrame.new(targetPart.Position + offset, targetPart.Position)
			print("✅ Đã dịch chuyển đến Sell Stands.")
		else
			warn("⚠️ Sell Stands không có PrimaryPart hoặc HumanoidRootPart!")
		end
	end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SellGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tạo nút Sell
local button = Instance.new("TextButton")
button.Name = "SellButton"
button.Text = "💰 Sell Inventory"
button.Size = UDim2.new(0, 180, 0, 50)
button.Position = UDim2.new(0.5, -90, 0.85, 0)
button.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 20
button.Parent = screenGui

-- Gắn sự kiện bán hàng
button.MouseButton1Click:Connect(function()
	local sellEvent = ReplicatedStorage:FindFirstChild("SellInventoryEvent")
	if sellEvent then
		sellEvent:FireServer()
	else
		warn("Không tìm thấy SellInventoryEvent")
	end
end)

-- SellInventoryHandler (ServerScriptService)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Tạo RemoteEvent nếu chưa tồn tại
local sellEvent = ReplicatedStorage:FindFirstChild("SellInventoryEvent")
if not sellEvent then
	sellEvent = Instance.new("RemoteEvent")
	sellEvent.Name = "SellInventoryEvent"
	sellEvent.Parent = ReplicatedStorage
end

-- Khi người chơi nhấn nút bán
local function sellInventory(player)
	local inventory = player:FindFirstChild("Backpack")
	if not inventory then
		warn("❌ Không tìm thấy Backpack cho người chơi: " .. player.Name)
		return
	end

	local totalValue = 0

	-- Tính tổng giá trị item và xoá
	for _, item in pairs(inventory:GetChildren()) do
		if item:IsA("Tool") then
			local valueObj = item:FindFirstChild("Value")
			if valueObj and valueObj:IsA("NumberValue") then
				totalValue += valueObj.Value
				item:Destroy()
			end
		end
	end

	-- Cộng tiền nếu có giá trị
	if totalValue > 0 then
		local stats = player:FindFirstChild("leaderstats")
		if stats then
			local coins = stats:FindFirstChild("Coins") or stats:FindFirstChild("Money")
			if coins then
				coins.Value += totalValue
				print("✅ " .. player.Name .. " đã bán inventory được " .. totalValue .. " Coins.")
			else
				warn("⚠️ Không tìm thấy Coins trong leaderstats.")
			end
		end
	else
		print("⚠️ Không có item nào để bán.")
	end
end

sellEvent.OnServerEvent:Connect(sellInventory)

-- Tạo leaderstats khi player vào game
game.Players.PlayerAdded:Connect(function(player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	stats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = stats
end)




