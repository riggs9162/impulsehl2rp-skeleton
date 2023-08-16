net.Receive("impulseRepresentativeOpenMenu", function()
    local ply = LocalPlayer()
    local teamID = net.ReadUInt(8)

    if not ( IsValid(ply) and ply:Alive() and ply:Team() == teamID ) then
        return
    end

    local panel = vgui.Create("impulseRepresentative")
    panel:SetTeam(teamID)
    panel:Populate()
end)