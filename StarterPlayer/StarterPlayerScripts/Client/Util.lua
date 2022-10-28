print("Loaded Client.Util")
local client = require(script.Parent)

--Services
local RunService = game:GetService("RunService")

--Methods
local methods = {}

methods.Sleep = function(duration)
	local t = tick() + duration
	while tick() < t do RunService.Stepped:Wait() end
	t = nil
end

methods.Align = function(orientation, ...)
	local objects = {...}
	if orientation == "Center" then
		local canvasWidth = objects[#objects] -- manual override
		if typeof(canvasWidth) == "number" then
			objects[#objects] = nil
		else
			canvasWidth = objects[1].Parent.AbsoluteSize.X
		end
		local objectWidth = 0
		for i = 1, #objects do
			if typeof(objects[i]) == "number" then
				objectWidth = objectWidth + objects[i]
			else
				objects[i].AnchorPoint = Vector2.new(0, objects[i].AnchorPoint.Y)
				if objects[i].ClassName == "TextLabel" then
					objects[i].TextXAlignment = "Center"
					objects[i].Size = UDim2.new(0, objects[i].TextBounds.X, objects[i].Size.Y.Scale, objects[i].Size.Y.Offset)
				end
				objectWidth = objectWidth + objects[i].Size.X.Offset
			end
		end
		local x = math.ceil((canvasWidth - objectWidth) * 0.5)
		for i = 1, #objects do
			if typeof(objects[i]) == "number" then
				x += objects[i]
			else
				objects[i].Position = UDim2.new(0, x, objects[i].Position.Y.Scale, objects[i].Position.Y.Offset)
				x += objects[i].Size.X.Offset
			end
		end
	else
		for i = 1, #objects do
			if typeof(objects[i]) ~= "number" then
				objects[i].AnchorPoint = Vector2.new(orientation == "Left" and 0 or 1, objects[i].AnchorPoint.Y)
				if objects[i].ClassName == "TextLabel" then
					objects[i].TextXAlignment = "Center"
					objects[i].Size = UDim2.new(0, objects[i].TextBounds.X, objects[i].Size.Y.Scale, objects[i].Size.Y.Offset)
				end
			end
		end
		local x = 0
		for i = 1, #objects do
			if typeof(objects[i]) == "number" then
				x += objects[i]
			else
				if orientation == "Left" then
					objects[i].Position = UDim2.new(0, x, objects[i].Position.Y.Scale, objects[i].Position.Y.Offset)
				else
					objects[i].Position = UDim2.new(1, -x, objects[i].Position.Y.Scale, objects[i].Position.Y.Offset)
				end
				x += objects[i].Size.X.Offset
			end
		end
	end
end

return methods