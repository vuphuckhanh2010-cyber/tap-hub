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






