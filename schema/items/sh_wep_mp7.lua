local ITEM = {}

ITEM.UniqueID = "wep_mp7"
ITEM.Name = "Combine Standard Issue Submachine Gun"
ITEM.Desc =  "A lightweight automatic submachine gun that fires submachine rounds."
ITEM.Category = "Weapons"
ITEM.Model = Model("models/weapons/w_smg1.mdl")
ITEM.Weight = 1.7

ITEM.Droppable = true
ITEM.DropOnDeath = true

ITEM.DropIfRestricted = false
ITEM.DropOnDeathIfRestricted = true
ITEM.CraftIfRestricted = false

ITEM.Illegal = true
ITEM.Equipable = true
ITEM.EquipGroup = "primary"
ITEM.CanStack = false

ITEM.WeaponClass = "weapon_smg1"

impulse.RegisterItem(ITEM)