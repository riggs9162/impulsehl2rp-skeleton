local ITEM = {}

ITEM.UniqueID = "wep_spas12"
ITEM.Name = "Franchi SPAS-12"
ITEM.Desc =  "A french designed shotgun, using 12 gauge ammo."
ITEM.Category = "Weapons"
ITEM.Model = Model("models/weapons/w_shotgun.mdl")
ITEM.Weight = 2.8

ITEM.Droppable = true
ITEM.DropOnDeath = true

ITEM.DropIfRestricted = false
ITEM.DropOnDeathIfRestricted = true
ITEM.CraftIfRestricted = false

ITEM.Illegal = true
ITEM.Equipable = true
ITEM.EquipGroup = "primary"
ITEM.CanStack = false

ITEM.WeaponClass = "weapon_shotgun"

impulse.RegisterItem(ITEM)