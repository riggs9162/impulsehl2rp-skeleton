local ITEM = {}

ITEM.UniqueID = "wep_usp"
ITEM.Name = "Combine Standard Issue Pistol"
ITEM.Desc =  "A lightweight semi-automatic pistol that fires 9mm rounds."
ITEM.Category = "Weapons"
ITEM.Model = Model("models/weapons/w_pistol.mdl")
ITEM.Weight = 0.8

ITEM.Droppable = true
ITEM.DropOnDeath = true

ITEM.DropIfRestricted = false
ITEM.DropOnDeathIfRestricted = true
ITEM.CraftIfRestricted = false

ITEM.Illegal = true
ITEM.Equipable = true
ITEM.EquipGroup = "secondary"
ITEM.CanStack = false

ITEM.WeaponClass = "weapon_pistol"

impulse.RegisterItem(ITEM)