TEAM_ADMINISTRATOR = impulse.Teams.Define({
	name = "Administrator",
	color = Color(128, 0, 0),
	description = [[The Administrator is an unmodified human appointed to run the city by the Combine. He has been chosen because of his fierce support of and loyalty for the Combine. He spends most of his time in his office, managing the piles of paperwork a bustling city produces, and rarely takes to the streets.]],
	loadout = {"impulse_hands", "weapon_physgun", "gmod_tool"},
	salary = 500,
	model = "models/player/breen.mdl",
	limit = 1,
	xp = 200,
	cp = true,
    doorGroup = {1, 2, 3},
})