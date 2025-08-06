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

	if hrp and sellStand and sellStand:IsA("Model") and (sellStand.PrimaryPart or sellStand:FindFirstChild("HumanoidRootPart")) then
		local targetPart = sellStand.PrimaryPart or sellStand:FindFirstChild("HumanoidRootPart")
		local offset = Vector3.new(0, 0, -4) -- đứng cách 4 studs phía trước
		hrp.CFrame = CFrame.new(targetPart.Position + offset, targetPart.Position)
		print("✅ Teleported to Sell Stand")
	else
		warn("⚠️ Không tìm thấy NPC 'Sell Stands' hoặc HumanoidRootPart/PrimaryPart")
	end
end)




