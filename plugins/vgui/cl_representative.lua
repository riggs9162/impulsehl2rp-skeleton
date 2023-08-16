local PANEL = {}

function PANEL:Init()
    impulse.Combine.RepresentativePanel = self

    self:SetTitle("Combine Representative")
    self:SetSize(ScrW() * 0.5, ScrH() * 0.75)
    self:Center()
    self:MakePopup()

    self.teamID = nil
    self.class = nil
    self.rank = nil
end

function PANEL:SetTeam(teamID)
    self.teamID = teamID
end

function PANEL:Populate()
    if not ( self.teamID ) then
        return
    end

    local teamData = impulse.Teams.Data[self.teamID]
    if not ( teamData ) then
        return
    end

    local panel = self:Add("impulseModelPanel")
    panel:Dock(RIGHT)
    panel:SetModel(teamData.model)
    panel:SetWide(self:GetWide() * 0.25)
    panel:SetFOV(ScreenScale(8))
    panel.LayoutEntity = function(this)
        // move it up a little
        if ( IsValid(this.Entity) ) then
            this.Entity:SetPos(Vector(0, -2, 4))
        end

        this:RunAnimation()
    end

    local label = self:Add("DLabel")
    label:Dock(TOP)
    label:DockMargin(0, 0, 0, 0)
    label:SetText(teamData.name.." Representative")
    label:SetFont("Impulse-SpecialFont")
    label:SizeToContents()

    label = self:Add("DLabel")
    label:Dock(TOP)
    label:DockMargin(0, 0, 0, 4)
    label:SetText(teamData.description)
    label:SetFont("Impulse-Elements17")
    label:SetWrap(true)
    label:SetAutoStretchVertical(true)

    local classData = teamData.classes
    if ( classData and not table.IsEmpty(classData) ) then
        panel = self:Add("DComboBox")
        panel:Dock(TOP)
        panel:DockMargin(0, 8, 0, 0)
        panel:SetFont("Impulse-Elements17")
        panel:SizeToContents()
        panel:SetValue("Select a class")
        panel:SetSortItems(false)
        for k, v in ipairs(classData) do
            panel:AddChoice(v.name.." - "..(v.xp and ((v.xp) != 0 and ( v.xp.." XP" )) or "Free"), k)
        end
        panel.OnSelect = function(this, index, value, data)
            self.class = data

            if ( IsValid(classNameLabel) ) then
                classNameLabel:SetText(classData[self.class].name)
                classNameLabel:SizeToContents()
            end

            if ( IsValid(classDescriptionLabel) ) then
                classDescriptionLabel:SetText(classData[self.class].description)
            end
        end

        label = self:Add("DLabel")
        label:Dock(TOP)
        label:DockMargin(0, 4, 0, -4)
        label:SetText("")
        label:SetFont("Impulse-SpecialFont")

        classNameLabel = label

        label = self:Add("DLabel")
        label:Dock(TOP)
        label:DockMargin(0, 0, 0, 4)
        label:SetText("")
        label:SetFont("Impulse-Elements17")
        label:SetWrap(true)
        label:SetAutoStretchVertical(true)

        classDescriptionLabel = label
    end

    local rankData = teamData.ranks
    if ( rankData and not table.IsEmpty(rankData) ) then
        panel = self:Add("DComboBox")
        panel:Dock(TOP)
        panel:DockMargin(0, 8, 0, 0)
        panel:SetFont("Impulse-Elements17")
        panel:SizeToContents()
        panel:SetValue("Select a rank")
        panel:SetSortItems(false)
        for k, v in ipairs(rankData) do
            panel:AddChoice(v.name.." - "..(v.xp and ((v.xp) != 0 and ( v.xp.." XP" )) or "Free"), k)
        end
        panel.OnSelect = function(this, index, value, data)
            self.rank = data

            if ( IsValid(rankNameLabel) ) then
                rankNameLabel:SetText(rankData[self.rank].name)
                rankNameLabel:SizeToContents()
            end

            if ( IsValid(rankDescriptionLabel) ) then
                rankDescriptionLabel:SetText(rankData[self.rank].description)
            end
        end

        label = self:Add("DLabel")
        label:Dock(TOP)
        label:DockMargin(0, 4, 0, -4)
        label:SetText("")
        label:SetFont("Impulse-SpecialFont")

        rankNameLabel = label

        label = self:Add("DLabel")
        label:Dock(TOP)
        label:DockMargin(0, 0, 0, 4)
        label:SetText("")
        label:SetFont("Impulse-Elements17")
        label:SetWrap(true)
        label:SetAutoStretchVertical(true)

        rankDescriptionLabel = label
    end

    local button = self:Add("DButton")
    button:Dock(BOTTOM)
    button:SetText("Become")
    button:SetFont("Impulse-SpecialFont")
    button:SizeToContents()
    button.DoClick = function(this)
        net.Start("impulseRepresentativeSelect")
            net.WriteUInt(self.teamID or 0, 8)
            net.WriteUInt(self.class or 0, 8)
            net.WriteUInt(self.rank or 0, 8)
        net.SendToServer()
    end
end

vgui.Register("impulseRepresentative", PANEL, "DFrame")

if ( IsValid(impulse.Combine.RepresentativePanel) ) then
    local teamID = impulse.Combine.RepresentativePanel.teamID

    impulse.Combine.RepresentativePanel:Remove()

    timer.Simple(0, function()
        local panel = vgui.Create("impulseRepresentative")
        panel:SetTeam(teamID)
        panel:Populate()
    end)
end