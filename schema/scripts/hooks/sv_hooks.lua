function SCHEMA:PlayerShouldGetHungry(ply)
    return ply:Team() != TEAM_TA
end

function SCHEMA:OnPlayerChangedTeam(ply, oldTeam, newTeam)
    ply:SetJumpPower(160)
    ply:SetRunSpeed(impulse.Config.JogSpeed)
    ply:SetWalkSpeed(impulse.Config.WalkSpeed)
    ply:SetRPName(ply:GetSavedRPName(), true)

    local teamData = impulse.Teams.Data[newTeam]
    if ( teamData.relations ) then
        for k, v in ipairs(ents_GetAll()) do
            if ( teamData.relations[v:GetClass()] ) then
                v:AddEntityRelationship(ply, teamData.relations[v:GetClass()] or D_HT, 0)
            end
        end
    end
end