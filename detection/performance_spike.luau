local r_s = game:GetService("RunService")

local last_frame = {}
local max_frame = 60

r_s.Heartbeat:Connect(function(dt)

    if #last_frame >= max_frame then table.remove(last_frame, 1) end

    table.insert(last_frame, dt)

    local sum

    for _, per in pairs(last_frame) do sum += per end

    local avg = (sum / #last_frame) * 1.5

    if avg > .05 then
        
        warn("may experience performance spikes")
    end
end)
