local AddCSLuaFile = AddCSLuaFile
local include = include
local IsValid = IsValid
local ents_Create = ents.Create
local CurTime = CurTime
local net_Start = net.Start
local net_Send = net.Send

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/Combine_Soldier.mdl")
    self:SetUseType(SIMPLE_USE)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:PhysicsInit(SOLID_BBOX)
    self:DrawShadow(false)

    local physObj = self:GetPhysicsObject()

    if ( IsValid(physObj) ) then
        physObj:EnableMotion(false)
        physObj:Sleep()
    end
end

function ENT:SpawnFunction(ply, trace, class)
    local ang = ply:EyeAngles()
    ang:RotateAroundAxis(ang:Right(), 180)
    ang:RotateAroundAxis(ang:Up(), 180)
    ang.x = 180
    ang:SnapTo("y", 45)

    local entity = ents_Create(class)
    entity:SetPos(trace.HitPos + Vector(0, 0, -0.5))
    entity:SetAngles(ang)
    entity:Spawn()

    return entity
end

function ENT:Use(ply)
    if ( ply.nextUse or 0 ) > CurTime() then
        return
    end

    ply.nextUse = CurTime() + 1

    if ( ply:Team() != TEAM_TA ) then
        ply:Notify("You do not have access to this Representative!")
        return
    end

    net_Start("impulseRepresentativeOpenMenu")
        net.WriteUInt(TEAM_TA, 8)
    net_Send(ply)
end