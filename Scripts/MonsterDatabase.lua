-- ===== MONSTER DATABASE =====
-- Komplettes Monster-System mit allen Rarities und Elementen

local MonsterDB = {}

-- Monster Namen basierend auf Seltenheit und Element
local MonsterNames = {
	-- COMMON
	Common = {
		Feuer = "Feuer Goblin",
		Wasser = "Wasser Goblin",
		Luft = "Luft Goblin",
		Erde = "Erde Goblin",
		Dunkelheit = "Dunkelheit Goblin",
		Heilig = "Heilig Goblin"
	},
	
	-- UNCOMMON
	Uncommon = {
		Feuer = "Feuer Merman",
		Wasser = "Wasser Merman",
		Luft = "Luft Orc",
		Erde = "Erde Troll",
		Dunkelheit = "Dunkelheit Werewolf",
		Heilig = "Heilig Gnome"
	},
	
	-- RARE
	Rare = {
		Feuer = "Feuer Chimera",
		Wasser = "Wasser Phoenix",
		Luft = "Luft Cerberus",
		Erde = "Erde Medusa",
		Dunkelheit = "Dunkelheit Roc",
		Heilig = "Heilig Griffin"
	},
	
	-- EPIC
	Epic = {
		Feuer = "Feuer Valkyrie",
		Wasser = "Wasser Behemoth",
		Luft = "Luft Fenrir",
		Erde = "Erde Archangel",
		Dunkelheit = "Dunkelheit Kraken",
		Heilig = "Heilig Seraphim"
	},
	
	-- LEGENDARY
	Legendary = {
		Feuer = "Feuer Bahamut",
		Wasser = "Wasser Leviathan",
		Luft = "Luft Tiamat",
		Erde = "Erde Zeus",
		Dunkelheit = "Dunkelheit Odin",
		Heilig = "Heilig Archangel Lord"
	},
	
	-- ANCIENT
	Ancient = {
		Feuer = "Uralter Feuer Titan",
		Wasser = "Uralter Wasser Titan",
		Luft = "Uralter Luft Titan",
		Erde = "Uralter Erde Titan",
		Dunkelheit = "Uralter Dunkelheit Titan",
		Heilig = "Uralter Heilig Titan"
	},
	
	-- CHAOS
	Chaos = {
		Feuer = "Chaos Feuer Dämon",
		Wasser = "Chaos Wasser Dämon",
		Luft = "Chaos Luft Dämon",
		Erde = "Chaos Erde Dämon",
		Dunkelheit = "Chaos Dunkelheit Dämon",
		Heilig = "Chaos Heilig Dämon"
	},
	
	-- ULTIMATE
	Ultimate = {
		Feuer = "Ultimatives Feuer Wesen",
		Wasser = "Ultimatives Wasser Wesen",
		Luft = "Ultimatives Luft Wesen",
		Erde = "Ultimatives Erde Wesen",
		Dunkelheit = "Ultimatives Dunkelheit Wesen",
		Heilig = "Ultimatives Heilig Wesen"
	},
	
	-- GOD
	God = {
		Feuer = "Feuer Gott",
		Wasser = "Wasser Gott",
		Luft = "Luft Gott",
		Erde = "Erde Gott",
		Dunkelheit = "Dunkelheit Gott",
		Heilig = "Heilig Gott"
	},
	
	-- S GOD
	SGod = {
		Feuer = "Super Feuer Gott",
		Wasser = "Super Wasser Gott",
		Luft = "Super Luft Gott",
		Erde = "Super Erde Gott",
		Dunkelheit = "Super Dunkelheit Gott",
		Heilig = "Super Heilig Gott"
	},
	
	-- SS GOD
	SSGod = {
		Feuer = "Ultra Feuer Gott",
		Wasser = "Ultra Wasser Gott",
		Luft = "Ultra Luft Gott",
		Erde = "Ultra Erde Gott",
		Dunkelheit = "Ultra Dunkelheit Gott",
		Heilig = "Ultra Heilig Gott"
	},
	
	-- ULTRA GOD
	UltraGod = {
		Feuer = "Legendärer Feuer Gott",
		Wasser = "Legendärer Wasser Gott",
		Luft = "Legendärer Luft Gott",
		Erde = "Legendärer Erde Gott",
		Dunkelheit = "Legendärer Dunkelheit Gott",
		Heilig = "Legendärer Heilig Gott"
	},
	
	-- SUPREME
	Supreme = {
		Feuer = "Höchster Feuer Gott",
		Wasser = "Höchster Wasser Gott",
		Luft = "Höchster Luft Gott",
		Erde = "Höchster Erde Gott",
		Dunkelheit = "Höchster Dunkelheit Gott",
		Heilig = "Höchster Heilig Gott"
	}
}

-- Elementtypen
local Elements = {"Feuer", "Wasser", "Luft", "Erde", "Dunkelheit", "Heilig"}

-- Element Emojis
local ElementEmojis = {
	Feuer = "🔥",
	Wasser = "💧",
	Luft = "🌪️",
	Erde = "🌍",
	Dunkelheit = "🌑",
	Heilig = "✨"
}

-- Shop Preise (progressiv höher)
local ShopPrices = {
	Common = 100,
	Uncommon = 300,
	Rare = 800,
	Epic = 2000,
	Legendary = 5000,
	Ancient = 12000,
	Chaos = 25000,
	Ultimate = 50000,
	God = 100000,
	SGod = 200000,
	SSGod = 400000,
	UltraGod = 750000,
	Supreme = 1500000
}

-- Kombinieren Erfolgsraten (sehr niedrig für Balance!)
local CombineRates = {
	Common = 100,      -- 100%
	Uncommon = 70,     -- 70%
	Rare = 45,         -- 45%
	Epic = 30,         -- 30%
	Legendary = 20,    -- 20%
	Ancient = 15,      -- 15%
	Chaos = 12,        -- 12%
	Ultimate = 10,     -- 10%
	God = 8,           -- 8%
	SGod = 6,          -- 6%
	SSGod = 5,         -- 5%
	UltraGod = 4,      -- 4%
	Supreme = 3        -- 3%
}

-- Kombinieren Gold-Kosten (auch progressiv)
local CombineGoldCosts = {
	Common = 50,
	Uncommon = 200,
	Rare = 500,
	Epic = 1500,
	Legendary = 3000,
	Ancient = 7500,
	Chaos = 15000,
	Ultimate = 30000,
	God = 60000,
	SGod = 120000,
	SSGod = 250000,
	UltraGod = 500000,
	Supreme = 1000000
}

-- Raritäts-Reihenfolge
local RarityOrder = {
	"Common",
	"Uncommon",
	"Rare",
	"Epic",
	"Legendary",
	"Ancient",
	"Chaos",
	"Ultimate",
	"God",
	"SGod",
	"SSGod",
	"UltraGod",
	"Supreme"
}

-- Farben für Raritäten (für GUI)
local RarityColors = {
	Common = Color3.fromRGB(128, 128, 128),      -- Grau
	Uncommon = Color3.fromRGB(0, 200, 0),        -- Grün
	Rare = Color3.fromRGB(0, 100, 255),          -- Blau
	Epic = Color3.fromRGB(180, 0, 255),          -- Lila
	Legendary = Color3.fromRGB(255, 200, 0),     -- Gold
	Ancient = Color3.fromRGB(255, 100, 0),       -- Orange
	Chaos = Color3.fromRGB(255, 0, 0),           -- Rot
	Ultimate = Color3.fromRGB(255, 0, 150),      -- Rosa
	God = Color3.fromRGB(200, 100, 255),         -- Helles Lila
	SGod = Color3.fromRGB(100, 200, 255),        -- Helles Blau
	SSGod = Color3.fromRGB(200, 255, 100),       -- Gelb-Grün
	UltraGod = Color3.fromRGB(255, 100, 200),    -- Pink
	Supreme = Color3.fromRGB(255, 255, 0)        -- Leuchtendes Gelb
}

-- Funktionen
function MonsterDB:GetMonsterName(rarity, element)
	if MonsterNames[rarity] and MonsterNames[rarity][element] then
		return MonsterNames[rarity][element]
	end
	return "Unknown Monster"
end

function MonsterDB:GetAllElements()
	return Elements
end

function MonsterDB:GetElementEmoji(element)
	return ElementEmojis[element] or "❓"
end

function MonsterDB:GetShopPrice(rarity)
	return ShopPrices[rarity] or 0
end

function MonsterDB:GetCombineRate(rarity)
	return CombineRates[rarity] or 0
end

function MonsterDB:GetCombineGoldCost(rarity)
	return CombineGoldCosts[rarity] or 0
end

function MonsterDB:GetNextRarity(currentRarity)
	for i, rarity in ipairs(RarityOrder) do
		if rarity == currentRarity and i < #RarityOrder then
			return RarityOrder[i + 1]
		end
	end
	return nil
end

function MonsterDB:GetRarityColor(rarity)
	return RarityColors[rarity] or Color3.fromRGB(255, 255, 255)
end

function MonsterDB:GetAllRarities()
	return RarityOrder
end

return MonsterDB
