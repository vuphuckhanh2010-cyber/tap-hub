local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "TAP HUB"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 50, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local tpBtn = Instance.new("TextButton", frame)
tpBtn.Size = UDim2.new(1, -20, 0, 40)
tpBtn.Position = UDim2.new(0, 10, 0, 10)
tpBtn.Text = "Teleport to Seller"
tpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

tpBtn.MouseButton1Click:Connect(function()
	local sellerPosition = Vector3.new(65, 2, 0.4)
	if humanoidRootPart then
		humanoidRootPart.CFrame = CFrame.new(sellerPosition)
	end
end)

