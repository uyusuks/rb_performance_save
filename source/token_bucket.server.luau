--!nonstrict

local rs: ReplicatedStorage = game:GetService("ReplicatedStorage")
local r_s: RunService = game:GetService("RunService")

local random_event: RemoteEvent = rs:WaitForChild("random")

local token = {}

local max_token: number = 20
local per_fill: number = 5

r_s.Heartbeat:Connect(function(dt)

	for p_id, current_token: number in pairs(token) do

		if not token[p_id] then return end

		local token_count: number = token[p_id]

		token[p_id] = math.min(max_token, token_count + per_fill * dt)
	end
end)

random_event.OnServerEvent:Connect(function(p: Player)

	local p_id: number = p.UserId

	local token_count: number = token[p_id] or max_token

	token[p_id] = token_count

	if token_count < 1 then return end

	token[p_id] -= 1

	--and rest of the statement(s)
end)
