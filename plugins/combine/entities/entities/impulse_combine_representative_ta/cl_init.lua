local include = include
local CurTime = CurTime

include("shared.lua")

ENT.AutomaticFrameAdvance = true

function ENT:Initialize()
    self:ResetSequence("idle_unarmed")
end

function ENT:Think()
    return true
end