util.AddNetworkString("impulseRepresentativeOpenMenu")
util.AddNetworkString("impulseRepresentativeSelect")

net.Receive("impulseRepresentativeSelect", function(len, ply)
    local teamID = net.ReadUInt(8)

    if not ( IsValid(ply) and ply:Alive() and ply:Team() == teamID ) then
        return
    end

    local teamData = impulse.Teams.Data[teamID]
    if not ( teamData ) then
        return
    end

    local classID = net.ReadUInt(8)
    local classData = teamData.classes
    if not ( classID != 0 ) then
        ply:Notify("Select a class first!")
        return
    end

    if ( table.IsEmpty(classData) ) then
        error(teamData.name.." has no classes!")
    end

    if not ( classData[classID] ) then
        error("undefined class "..classID)
    end

    local rankID = net.ReadUInt(8)
    local rankData = teamData.ranks
    if ( teamData.rankRequired ) then
        if not ( rankID != 0 ) then
            ply:Notify("Select a rank first!")
            return
        end
    end

    local canBecomeClass, canBecomeClassMessage = impulse.Combine.CanBecomeTeamClass(ply, classID)
    if ( teamData.rankRequired ) then
        local canBecomeRank, canBecomeRankMessage = impulse.Combine.CanBecomeTeamRank(ply, rankID)
        if not ( canBecomeRank ) then
            if ( canBecomeRankMessage != nil or canBecomeRankMessage != "" ) then
                ply:Notify(tostring(canBecomeRankMessage))
            end

            return false
        end
    end

    if ( canBecomeClass ) then
        ply:ResetSubMaterials()
        ply:SetTeamClass(classID)
    else
        if ( canBecomeClassMessage != nil or canBecomeClassMessage != "" ) then
            ply:Notify(tostring(canBecomeClassMessage))
        end

        return false
    end

    if ( rankData and rankData[rankID] ) then
        ply:SetTeamRank(rankID)
    end

    if ( teamData.nameFormat and teamData.taglines ) then
        local randomTagline = teamData.taglines[math.random(1, #teamData.taglines)]
        local randomNumbers = math.random(1, 9999)
        local rpName = string.format(teamData.nameFormat, randomTagline, randomNumbers)
        ply:SetRPName(rpName)
    end

    ply:ScreenFade(SCREENFADE.IN, color_black, 5, 0)
    ply:EmitSound("items/ammo_pickup.wav")
    ply:EmitSound("items/nvg_on.wav")
end)