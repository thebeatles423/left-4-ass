-- Steam Version Check
local isSteamVersion = false

if game.GetSteamID and game.GetSteamID() ~= "0" then
    isSteamVersion = true
end

local function SmoothRagdoll(ent)
    if IsValid(ent) and ent:IsRagdoll() then
        local bones = ent:GetPhysicsObjectCount()

        for i = 0, bones - 1 do
            local phys = ent:GetPhysicsObjectNum(i)
            if IsValid(phys) then
                phys:SetDamping(0.1, 2)
                phys:Wake()
            end
        end
    end
end

hook.Add("CreateEntityRagdoll", "SmoothRagdoll", SmoothRagdoll)

if isSteamVersion then
    print("The Steam version has smoother ragdolls.")
end


-- what am i even doing with my life
