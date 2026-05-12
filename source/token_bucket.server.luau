--!strict

local rs = game:GetService("ReplicatedStorage") :: ReplicatedStorage
local r_s = game:GetService("RunService") :: RunService

local random_event = rs:WaitForChild("random") :: RemoteEvent

local token = {}

local max_token = 20 :: number
local per_fill = 5 :: number

r_s.Heartbeat:Connect(function(dt)

	for p_id, current_token: any in pairs(token) do

		if not token[p_id] then return end

		local token_count = token[p_id] :: number

		token[p_id] = math.min(max_token, token_count + per_fill * dt)
	end
end)

random_event.OnServerEvent:Connect(function(p: Player)

	local p_id = p.UserId :: number

	local token_count = token[p_id] or max_token :: number

	token[p_id] = token_count

	if token_count < 1 then return end

	token[p_id] -= 1

	--and rest of the statement(s)
end)
