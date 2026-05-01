local rs = game:GetService("ReplicatedStorage")
local r_s = game:GetService("RunService")

local random_event = rs:WaitForChild("random")

local token = {}

local max_token = 20
local per_fill = 5

r_s.Heartbeat:Connect(function(dt)

    for p_id, current_token in pairs(token) do
        
        if not token[p_id] then return end

        local token_count = token[p_id]

        token[p_id] = math.min(max_token, token_count + per_fill * dt)
    end
end)

random_event.OnServerEvent:Connect(function(p)
    
    local p_id = p.UserId

    local token_count = token[p_id] or max_token

    token[p_id] = token_count
    
    if token_count < 1 then return end

    token[p_id] -= 1
    
    --and rest of the statement(s)
end)
