AddCSLuaFile("autorun/client/ragdoll_zombies.lua")

if SERVER then
    local tf2ContentMounted = false
    local tf2ContentCheck = {
        ["tf2"] = true,
        ["tf2_sound_misc"] = true,
    }

    for _, gameContent in pairs(engine.GetGames()) do
        if tf2ContentCheck[gameContent.folder] then
            tf2ContentMounted = true
            break
        end
    end

    if not tf2ContentMounted then
        hook.Add("OnEntityCreated", "RagdollZombies", function(ent)
            if ent:IsNPC() and ent:IsNextBot() and string.find(ent:GetClass(), "zombie") then
                ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
                ent:AddEFlags(EFL_NO_THINK_FUNCTION)
                ent:AddEFlags(EFL_KILLME)

                local phys = ent:GetPhysicsObject()
                if IsValid(phys) then
                    phys:EnableCollisions(false)
                    phys:EnableMotion(true)
                    phys:Wake()
                end
            end
        end)
    else
        error("THE_UNFORGIVABLE_CRIME")
    end
end
