local ITEM = {}

ITEM.UniqueID = "food_apple"
ITEM.Name = "Apple"
ITEM.Desc =  "I know it looks like a watermelon, but its an apple, trust me."
ITEM.Category = "Food"
ITEM.Model = Model("models/props_junk/watermelon01.mdl")
ITEM.FOV = 16
ITEM.Weight = 0.2
ITEM.NoCenter = true

ITEM.Droppable = true
ITEM.DropOnDeath = false

ITEM.Illegal = false
ITEM.CanStack = true

ITEM.UseName = "Eat"
ITEM.UseWorkBarTime = 1
ITEM.UseWorkBarName = "Eating..."
ITEM.UseWorkBarSound = "impulse/eat.wav"

ITEM.Food = 30

function ITEM:OnUse(ply)
    ply:FeedHunger(self.Food)
    return true -- returning true removes the item after use
end

impulse.RegisterItem(ITEM)