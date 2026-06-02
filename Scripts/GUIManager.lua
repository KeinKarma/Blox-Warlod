-- GUI Manager - Verwaltet alle Menü-Wechsel und Ressourcen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = playerGui:WaitForChild("ScreenGui")

-- Alle Frames
local mainMenu = screenGui:WaitForChild("MainMenu")
local monsterCollection = screenGui:WaitForChild("MonsterCollection")
local shop = screenGui:WaitForChild("Shop")
local profile = screenGui:WaitForChild("Profile")
local inventory = screenGui:WaitForChild("Inventory")
local worldBoss = screenGui:WaitForChild("WorldBoss")
local dailyRaid = screenGui:WaitForChild("DailyRaid")
local topBar = screenGui:WaitForChild("TopBar")

-- Ressourcen-Labels
local goldLabel = topBar:WaitForChild("GoldLabel")
local diamondLabel = topBar:WaitForChild("DiamondLabel")
local energyLabel = topBar:WaitForChild("EnergyLabel")
local hpLabel = topBar:WaitForChild("HPLabel")

-- ===== SPIELER-DATEN =====
local playerData = {
	gold = 5000,
	diamonds = 100,
	energy = 100,
	maxEnergy = 100,
	hp = 1000,
	maxHP = 1000,
	stamina = 50,
	maxStamina = 50,
	level = 1,
	xp = 0,
	xpToLevelUp = 100,
	skillPoints = 0,
	staminarSkill = 0,
	energySkill = 0,
	hpSkill = 0
}

-- Funktion zum Aktualisieren der GUI Labels
local function updateResourceLabels()
	goldLabel.Text = "💰 Gold: " .. playerData.gold
	diamdLabel.Text = "💎 Diamanten: " .. playerData.diamonds
	energyLabel.Text = "⚡ Energie: " .. playerData.energy .. "/" .. playerData.maxEnergy
	hpLabel.Text = "❤️ HP: " .. playerData.hp .. "/" .. playerData.maxHP
end

-- Funktion zum Verstecken aller Menüs
local function hideAllMenus()
	mainMenu.Visible = false
	monsterCollection.Visible = false
	shop.Visible = false
	profile.Visible = false
	inventory.Visible = false
	worldBoss.Visible = false
	dailyRaid.Visible = false
end

-- Funktion zum Anzeigen eines bestimmten Menüs
local function showMenu(menuName)
	hideAllMenus()
	
	if menuName == "MainMenu" then
		mainMenu.Visible = true
	elseif menuName == "Collection" then
		monsterCollection.Visible = true
	elseif menuName == "Shop" then
		shop.Visible = true
	elseif menuName == "Profile" then
		profile.Visible = true
	elseif menuName == "Inventory" then
		inventory.Visible = true
	elseif menuName == "WorldBoss" then
		worldBoss.Visible = true
	elseif menuName == "DailyRaid" then
		dailyRaid.Visible = true
	end
end

-- ===== QUEST SYSTEM =====
local function doQuest()
	if playerData.energy >= 1 then
		playerData.energy = playerData.energy - 1
		
		-- Random XP zwischen 50-100
		local xpGain = math.random(50, 100)
		playerData.xp = playerData.xp + xpGain
		
		-- Random Gold zwischen 100-300
		local goldGain = math.random(100, 300)
		playerData.gold = playerData.gold + goldGain
		
		print("Quest abgeschlossen! +", xpGain, "XP, +", goldGain, "Gold")
		
		-- Leveln wenn genug XP
		if playerData.xp >= playerData.xpToLevelUp then
			playerData.xp = playerData.xp - playerData.xpToLevelUp
			playerData.level = playerData.level + 1
			playerData.skillPoints = playerData.skillPoints + 1
			playerData.xpToLevelUp = playerData.xpToLevelUp + 50
			print("LEVEL UP! Level:", playerData.level, "| Skill Punkte:", playerData.skillPoints)
		end
		
		updateResourceLabels()
	else
		print("Nicht genug Energie!")
	end
end

-- ===== WORLD BOSS SYSTEM =====
local function attackWorldBoss()
	if playerData.stamina >= 10 then
		playerData.stamina = playerData.stamina - 10
		
		-- Schaden berechnen
		local baseDamage = 50 + (playerData.staminarSkill * 10)
		local damage = math.random(baseDamage - 10, baseDamage + 10)
		
		print("Boss angegriffen! Schaden: " .. damage)
		
		-- XP und Belohnungen
		local xpGain = math.random(200, 400)
		local goldGain = math.random(500, 1000)
		
		playerData.xp = playerData.xp + xpGain
		playerData.gold = playerData.gold + goldGain
		
		if playerData.xp >= playerData.xpToLevelUp then
			playerData.xp = playerData.xp - playerData.xpToLevelUp
			playerData.level = playerData.level + 1
			playerData.skillPoints = playerData.skillPoints + 1
			playerData.xpToLevelUp = playerData.xpToLevelUp + 50
			print("LEVEL UP! Level:", playerData.level)
		end
		
		updateResourceLabels()
	else
		print("Nicht genug Ausdauer!")
	end
end

-- ===== SKILL SYSTEM =====
local function addSkillPoint(skillType)
	if playerData.skillPoints > 0 then
		if skillType == "stamina" then
			playerData.staminarSkill = playerData.staminarSkill + 1
			playerData.maxStamina = playerData.maxStamina + 5
			playerData.stamina = playerData.maxStamina
			print("Ausdauer erhöht! +5 max Ausdauer")
		elseif skillType == "energy" then
			playerData.energySkill = playerData.energySkill + 1
			playerData.maxEnergy = playerData.maxEnergy + 5
			playerData.energy = playerData.maxEnergy
			print("Energie erhöht! +5 max Energie")
		elseif skillType == "hp" then
			playerData.hpSkill = playerData.hpSkill + 1
			playerData.maxHP = playerData.maxHP + 50
			playerData.hp = playerData.maxHP
			print("HP erhöht! +50 max HP")
		end
		
		playerData.skillPoints = playerData.skillPoints - 1
		updateResourceLabels()
	else
		print("Keine Skill Punkte verfügbar!")
	end
end

-- ===== BUTTON KLICKS =====

-- MainMenu Buttons
mainMenu.CollectionButton.MouseButton1Click:Connect(function()
	showMenu("Collection")
end)

mainMenu.ShopButton.MouseButton1Click:Connect(function()
	showMenu("Shop")
end)

mainMenu.WorldBossButton.MouseButton1Click:Connect(function()
	showMenu("WorldBoss")
end)

mainMenu.DailyRaidButton.MouseButton1Click:Connect(function()
	showMenu("DailyRaid")
end)

mainMenu.ProfileButton.MouseButton1Click:Connect(function()
	showMenu("Profile")
end)

-- Back Buttons
monsterCollection.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

shop.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

profile.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

inventory.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

worldBoss.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

dailyRaid.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

-- ===== TEST BUTTONS FÜR QUESTS =====
-- Du kannst diese später in echte Quest-Buttons umwandeln
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Q then
		doQuest()
	elseif input.KeyCode == Enum.KeyCode.W then
		attackWorldBoss()
	elseif input.KeyCode == Enum.KeyCode.E then
		addSkillPoint("stamina")
	elseif input.KeyCode == Enum.KeyCode.R then
		addSkillPoint("energy")
	elseif input.KeyCode == Enum.KeyCode.T then
		addSkillPoint("hp")
	end
end)

-- Beim Start: Hauptmenü anzeigen und Labels aktualisieren
showMenu("MainMenu")
updateResourceLabels()

print("=== BLOX WARLORD LOADED ===")
print("Q = Quest | W = Boss Attack | E/R/T = Skill Points")