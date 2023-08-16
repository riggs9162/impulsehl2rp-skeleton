local ITEM = {}

ITEM.UniqueID = "wep_ar2"
ITEM.Name = "Overwatch Standard Issue Pulse-Rifle"
ITEM.Desc =  "A combine manufactured assault rifle using dark matter ammunition."
ITEM.Category = "Weapons"
ITEM.Model = Model("models/weapons/w_irifle.mdl")
ITEM.Weight = 3.4

ITEM.Droppable = true
ITEM.DropOnDeath = true

ITEM.DropIfRestricted = false
ITEM.DropOnDeathIfRestricted = true
ITEM.CraftIfRestricted = false

ITEM.Illegal = true
ITEM.Equipable = true
ITEM.EquipGroup = "primary"
ITEM.CanStack = false

ITEM.WeaponClass = "weapon_ar2"

impulse.RegisterItem(ITEM)