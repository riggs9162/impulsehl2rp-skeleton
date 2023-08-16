local ITEM = {}

ITEM.UniqueID = "wep_stunstick"
ITEM.Name = "Combine Standard Issue Displinary Melee"
ITEM.Desc =  "A combine manufactured displinary melee to use against disobidient victims."
ITEM.Category = "Weapons"
ITEM.Model = Model("models/weapons/w_stunbaton.mdl")
ITEM.Weight = 0.8

ITEM.Droppable = true
ITEM.DropOnDeath = true

ITEM.DropIfRestricted = false
ITEM.DropOnDeathIfRestricted = true
ITEM.CraftIfRestricted = false

ITEM.Illegal = true
ITEM.Equipable = true
ITEM.EquipGroup = "melee"
ITEM.CanStack = false

ITEM.WeaponClass = "weapon_stunstick"

impulse.RegisterItem(ITEM)