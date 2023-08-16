// made my own, since impulse is garbage framework smh

function impulse.Combine.CanBecomeTeamClass(ply, classID, forced)
	local teamData = impulse.Teams.Data[ply:Team()]
	local classData = teamData.classes[classID]
	local classPlayers = 0

	if not ( classData ) then
		return
	end

	if not ply:Alive() then
		return false, "You are not alive, bro how the fuck did this happen man?"
	end

	if ply:GetTeamClass() == classID then
		return false, "You are already on this class!"
	end

	if classData.whitelistLevel and classData.whitelistUID then
		if not ( ply:HasTeamWhitelist(classData.whitelistUID, classData.whitelistLevel) ) then
			local add = classData.whitelistFailMessage or ""
			return false, "You must be whitelisted to play as this rank. "..add
		end
	end

	if classData.xp and classData.xp > ply:GetXP() and forced != true then
		return false, "You don't have the XP required to play as this class."
	end

	if classData.limit then
		local classPlayers = 0

		for v,k in pairs(team.GetPlayers(ply:Team())) do
			if k:GetTeamClass() == classID then
				classPlayers = classPlayers + 1
			end
		end

		if classData.percentLimit and classData.percentLimit == true then
			local percentClass = classPlayers / #player.GetAll()
			if percentClass > classData.limit then
				return false, classData.name .. " is full."
			end
		else
			if classPlayers >= classData.limit then
				return false, classData.name .. " is full."
			end
		end
	end

	if classData.customCheck then
		local r = classData.customCheck(ply, classID)

		if r != nil and r == false then
			return false, "Failed custom check!"
		end
	end

	return true
end

function impulse.Combine.CanBecomeTeamRank(ply, rankID, forced)
	local teamData = impulse.Teams.Data[ply:Team()]
	local rankData = teamData.ranks[rankID]
	local rankPlayers = 0

	if not ply:Alive() then
		return false, "You are not alive, bro how the fuck did this happen man?"
	end

	if ply:GetTeamRank() == rankID then
		return false, "You are already on this rank!"
	end

	if rankData.whitelistLevel and not ply:HasTeamWhitelist(ply:Team(), rankData.whitelistLevel) then
		local add = rankData.whitelistFailMessage or ""
		return false, "You must be whitelisted to play as this rank. "..add
	end
		
	if rankData.xp and rankData.xp > ply:GetXP() and forced != true then
		return false, "You don't have the XP required to play as this rank."
	end

	if rankData.limit then
		local rankPlayers = 0 

		for v,k in pairs(team.GetPlayers(ply:Team())) do
			if k:GetTeamRank() == rankID then
				rankPlayers = rankPlayers + 1
			end
		end

		if rankData.percentLimit and rankData.percentLimit == true then
			local percentRank = rankPlayers / #player.GetAll()

			if percentRank > rankData.limit then
				return false, rankData.name .. " is full."
			end
		else
			if rankPlayers >= rankData.limit then
				return false, rankData.name .. " is full."
			end
		end
	end

	if rankData.customCheck then
		local r = rankData.customCheck(ply, rankID)

		if r != nil and r == false then
			return false
		end
	end

	return true
end