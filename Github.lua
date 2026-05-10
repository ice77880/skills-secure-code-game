local tornadoPart = script.Parent
local pullStrength = 50 -- How hard it pulls
local pullRadius = 100  -- How far away it can grab things
local liftForce = 25    -- How much it throws things upward

while true do
	task.wait(0.1)
	
	-- Find all parts in the workspace
	for _, object in pairs(workspace:GetDescendants()) do
		-- Check if it's a Part or a Player's limb
		if object:IsA("BasePart") and not object.Anchored then
			local distance = (tornadoPart.Position - object.Position).Magnitude
			
			if distance < pullRadius then
				-- Calculate direction towards the center
				local direction = (tornadoPart.Position - object.Position).Unit
				
				-- Apply force: Pulling in + Lifting up
				local force = (direction * pullStrength) + Vector3.new(0, liftForce, 0)
				
				-- Apply the movement
				object:ApplyImpulse(force * object:GetMass())
			end
		end
	end
end

