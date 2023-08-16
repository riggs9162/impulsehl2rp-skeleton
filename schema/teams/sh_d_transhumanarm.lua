TEAM_TA = impulse.Teams.Define({
    name = "Transhuman Arm",
    color = Color(25, 25, 25),
    description = [[The Transhuman Arm is a branch of the Combine's military forces that is responsible for maintaining order and suppressing resistance on Earth. The TF is composed of genetically enhanced soldiers who have been augmented with cybernetic implants and advanced armor, giving them increased strength, speed, and resilience. The TF serves as the primary offensive force of the Combine's occupation forces, tasked with quelling any uprisings or insurgencies among the human population. They are equipped with a variety of advanced weaponry, including energy weapons and pulse rifles, and are often seen patrolling the streets in gunships and armored vehicles. The TF also plays a key role in the Combine's suppression of the Resistance, a group of human rebels fighting against the Combine's rule. They frequently engage in firefights with Resistance fighters, and are often dispatched to eliminate high-value targets or to secure strategic locations.]],
    loadout = {"impulse_hands", "weapon_physgun", "gmod_tool"},
    salary = 500,
    model = "models/combine_soldier.mdl",
    handModel = "models/weapons/c_arms_combine.mdl",
    percentLimit = true,
    limit = 0.15,
    xp = 400,
    cp = true,
    blockNameChange = true,
    doorGroup = {1, 2, 3},

    rankRequired = false, // enable this if this team requires a rank for representative npc
    nameFormat = "TA:S17.%s-%s", // 1st "%s" is the tagline, 2nd "%s" is the numbers"

    taglines = {
        "BLADE",
        "FIST",
        "FLASH",
        "HAMMER",
        "HUNTER",
        "LEADER",
        "RANGER",
        "RAZOR",
        "SAVAGE",
        "SCAR",
        "SLASH",
        "SPEAR",
        "STAB",
        "SWEEPER",
        "SWIFT",
        "SWORD",
        "TRACKER",
    },

    classes = {
        {
            name = "Soldier",
            description = "The Soldier is a well-rounded unit designed for general combat situations. Equipped with the reliable H&K MP7 submachine gun and a standard grenade, this unit is ideal for soldiers who need to be prepared for a variety of combat scenarios. Although soldiers are not able to carry both the Overwatch Standard Issue Pulse Rifle and H&K MP7 at the same time. Overall, this kit provides soldiers with a solid foundation for success on the battlefield.",
            model = "models/combine_soldier.mdl",
            skin = 0,
            xp = 0,
            armour = 60,
            itemsAdd = {
                {class = "wep_mp7", amount = 1},
            },
        },
        {
            name = "Shotgunner",
            description = "The Shotgunner is perfect for soldiers who specialize in close-quarters combat. Featuring the powerful SPAS-12 shotgun and a standard grenade, this unit allows soldiers to quickly dispatch enemies in tight spaces. While not as effective at long range, the SPAS-12 can make short work of any enemy caught in its deadly blast radius.",
            model = "models/combine_soldier.mdl",
            skin = 1,
            xp = 600,
            armour = 80,
            itemsAdd = {
                {class = "wep_spas12", amount = 1},
            },
        },
        {
            name = "Elite",
            description = "The Elite is reserved for the highest-ranking Combine soldiers, known as the Combine Elite. These soldiers are the deadliest of the Combine Overwatch infantry, sporting a distinctive white uniform and helmet with a single red ocular lens. The unit is equipped with the Overwatch Standard Issue Pulse Rifle as their default weapon. With this weapon at their disposal, the Combine Elite are the most formidable force on the battlefield.",
            model = "models/combine_super_soldier.mdl",
            skin = 1,
            xp = 1200,
            armour = 100,
            itemsAdd = {
                {class = "wep_ar2", amount = 1},
            },
        },
    },
})

CLASS_TA_SOLDIER = 1
CLASS_TA_SHOTGUNNER = 2
CLASS_TA_ELITE = 3