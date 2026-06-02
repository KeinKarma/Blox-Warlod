-- GUI Manager - Komplettes System mit Quests, Monstern und Kombinieren
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = playerGui:WaitForChild("ScreenGui")

-- Module laden
local MonsterDB = require(game.ServerScriptService:WaitForChild("MonsterDatabase"))

-- Alle Frames
local mainMenu = screenGui:WaitForChild("MainMenu")
local monsterCollection = screenGui:WaitForChild("MonsterCollection")
local shop = screenGui:WaitForChild("Shop")
local profile = screenGui:WaitForChild("Profile")
local inventory = screenGui:WaitForChild("Inventory")
local worldBoss = screenGui:WaitForChild("WorldBoss")
local dailyRaid = screenGui:WaitForChild("DailyRaid")
local questWindow = screenGui:WaitForChild("QuestWindow")
local topBar = screenGui:WaitForChild("TopBar")

-- Ressourcen-Labels
local goldLabel = topBar:WaitForChild("GoldLabel")
local diamondLabel = topBar:WaitForChild("DiamondLabel")
local energyLabel = topBar:WaitForChild("EnergyLabel")
local hpLabel = topBar:WaitForChild("HPLabel")

-- ===== SPIELER-DATEN =====
local playerData = {
	-- Ressourcen
	gold = 5000,
	diamonds = 100,
	energy = 100,
	maxEnergy = 100,
	hp = 1000,
	maxHP = 1000,
	stamina = 50,
	maxStamina = 50,
	
	-- Level & XP
	level = 1,
	xp = 0,
	xpToLevelUp = 100,
	skillPoints = 0,
	
	-- Skills
	staminarSkill = 0,
	energySkill = 0,
	hpSkill = 0,
	
	-- Monster
	monsters = {}, -- {rarity = "Common", element = "Feuer", level = 1, count = 5}
	
	-- Quests
	currentStage = 1,
	quests = {},
	activeQuests = {}
}

-- ===== QUEST-SYSTEM =====
local QuestSystem = {}

function QuestSystem:GenerateQuests(stage)
	local quests = {}
	
	for i = 1, 10 do
		local questID = (stage - 1) * 10 + i
		
		-- XP berechnen: progressiv höher
		local baseXP = 50 + ((stage - 1) * 200)
		local questXP = baseXP + (i * 50)
		
		-- Gold berechnen: progressiv höher
		local baseGold = 100 + ((stage - 1) * 300)
		local questGold = baseGold + (i * 50)
		
		-- Energie-Kosten
		local energyCost = 1 + math.floor((stage - 1) / 3)
		
		-- Monster für Quest
		local monsterCount = math.random(1, 3)
		local monstersInQuest = {}
		
		for j = 1, monsterCount do
			local randomElement = MonsterDB:GetAllElements()[math.random(1, 6)]
			table.insert(monstersInQuest, randomElement)
		end
		
		quests[i] = {
			id = questID,
			stage = stage,
			questNumber = i,
			name = "Quest " .. i,
			xpPerClick = questXP / 20,
			xpTotal = questXP,
			gold = questGold,
			energyCost = energyCost,
			monstersRequired = monstersInQuest,
			totalClicks = 20,
			currentClicks = 0,
			completed = false
		}
	end
	
	return quests
end

-- Quests initialisieren
playerData.quests = QuestSystem:GenerateQuests(playerData.currentStage)

-- ===== GUI FUNKTIONEN =====

-- Ressourcen-Labels aktualisieren
local function updateResourceLabels()
	goldLabel.Text = "💰 Gold: " .. math.floor(playerData.gold)
	diamondLabel.Text = "💎 Diamanten: " .. playerData.diamonds
	energyLabel.Text = "⚡ Energie: " .. playerData.energy .. "/" .. playerData.maxEnergy
	hpLabel.Text = "❤️ HP: " .. playerData.hp .. "/" .. playerData.maxHP
end

-- Alle Menüs verstecken
local function hideAllMenus()
	mainMenu.Visible = false
	monsterCollection.Visible = false
	shop.Visible = false
	profile.Visible = false
	inventory.Visible = false
	worldBoss.Visible = false
	dailyRaid.Visible = false
	questWindow.Visible = false
end

-- Menü anzeigen
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
	elseif menuName == "Quest" then
		questWindow.Visible = true
		QuestSystem:RefreshQuestUI()
	end
end

-- ===== QUEST UI =====

function QuestSystem:RefreshQuestUI()
	local questList = questWindow:WaitForChild("QuestList")
	local title = questWindow:WaitForChild("Title")
	
	-- Title aktualisieren
	title.Text = "QUESTS - STAGE " .. playerData.currentStage
	
	-- Alte Quests löschen
	for _, child in ipairs(questList:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	
	-- Neue Quests anzeigen
	for i, quest in ipairs(playerData.quests) do
		local questFrame = Instance.new("Frame")
		questFrame.Name = "Quest_" .. i
		questFrame.Size = UDim2.new(1, -20, 0, 120)
		questFrame.Position = UDim2.new(0, 10, 0, (i-1) * 130)
		questFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
		questFrame.BorderSizePixel = 0
		questFrame.Parent = questList
		
		-- Quest Name & Rank
		local nameLabel = Instance.new("TextLabel")
		nameLabel.Name = "NameLabel"
		nameLabel.Size = UDim2.new(0.6, 0, 0, 30)
		nameLabel.Position = UDim2.new(0, 10, 0, 5)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = quest.name .. " (Rank " .. quest.stage .. ")"
		nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		nameLabel.TextSize = 16
		nameLabel.Font = Enum.Font.GothamBold
		nameLabel.TextXAlignment = Enum.TextXAlignment.Left
		nameLabel.Parent = questFrame
		
		-- Monster Icons
		local monsterLabel = Instance.new("TextLabel")
		monsterLabel.Name = "MonsterLabel"
		monsterLabel.Size = UDim2.new(0.6, 0, 0, 25)
		monsterLabel.Position = UDim2.new(0, 10, 0, 35)
		monsterLabel.BackgroundTransparency = 1
		monsterLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		monsterLabel.TextSize = 20
		monsterLabel.Font = Enum.Font.GothamBold
		
		local monsterIcons = ""
		for _, element in ipairs(quest.monstersRequired) do
			monsterIcons = monsterIcons .. MonsterDB:GetElementEmoji(element) .. " "
		end
		monsterLabel.Text = monsterIcons
		monsterLabel.Parent = questFrame
		
		-- XP Belohnung
		local xpLabel = Instance.new("TextLabel")
		xpLabel.Name = "XPLabel"
		xpLabel.Size = UDim2.new(0, 100, 0, 25)
		xpLabel.Position = UDim2.new(0.6, 10, 0, 35)
		xpLabel.BackgroundTransparency = 1
		xpLabel.Text = "⭐ " .. math.floor(quest.xpTotal) .. " XP"
		xpLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
		xpLabel.TextSize = 14
		xpLabel.Font = Enum.Font.GothamBold
		xpLabel.Parent = questFrame
		
		-- Gold Belohnung
		local goldLabel = Instance.new("TextLabel")
		goldLabel.Name = "GoldLabel"
		goldLabel.Size = UDim2.new(0, 100, 0, 25)
		goldLabel.Position = UDim2.new(0.75, 10, 0, 35)
		goldLabel.BackgroundTransparency = 1
		goldLabel.Text = "💰 " .. math.floor(quest.gold) .. " G"
		goldLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
		goldLabel.TextSize = 14
		goldLabel.Font = Enum.Font.GothamBold
		goldLabel.Parent = questFrame
		
		-- Progress Bar
		local progressBG = Instance.new("Frame")
		progressBG.Name = "ProgressBG"
		progressBG.Size = UDim2.new(0.6, 0, 0, 20)
		progressBG.Position = UDim2.new(0, 10, 0, 65)
		progressBG.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
		progressBG.BorderSizePixel = 0
		progressBG.Parent = questFrame
		
		-- Progress Fill
		local progressFill = Instance.new("Frame")
		progressFill.Name = "ProgressFill"
		progressFill.Size = UDim2.new(math.min((quest.currentClicks / quest.totalClicks), 1), 0, 1, 0)
		progressFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
		progressFill.BorderSizePixel = 0
		progressFill.Parent = progressBG
		
		-- Progress Text
		local progressText = Instance.new("TextLabel")
		progressText.Name = "ProgressText"
		progressText.Size = UDim2.new(1, 0, 1, 0)
		progressText.BackgroundTransparency = 1
		progressText.Text = quest.currentClicks .. "/" .. quest.totalClicks
		progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
		progressText.TextSize = 12
		progressText.Font = Enum.Font.GothamBold
		progressText.Parent = progressBG
		
		-- GO Button
		local goButton = Instance.new("TextButton")
		goButton.Name = "GoButton"
		goButton.Size = UDim2.new(0, 80, 0, 40)
		goButton.Position = UDim2.new(0.75, 0, 0, 65)
		goButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
		goButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		goButton.Text = "GO"
		goButton.TextSize = 16
		goButton.Font = Enum.Font.GothamBold
		goButton.BorderSizePixel = 0
		goButton.Parent = questFrame
		
		-- Button Click Handler
		goButton.MouseButton1Click:Connect(function()
			QuestSystem:DoQuest(quest)
		end)
	end
	
	-- Canvas Size
	questList.CanvasSize = UDim2.new(0, 0, 0, #playerData.quests * 130)
end

-- Quest durchführen
function QuestSystem:DoQuest(quest)
	if playerData.energy < quest.energyCost then
		print("❌ Nicht genug Energie! Benötigt: " .. quest.energyCost)
		return
	end
	
	-- Energie abziehen
	playerData.energy = playerData.energy - quest.energyCost
	
	-- Click hinzufügen
	quest.currentClicks = quest.currentClicks + 1
	
	-- Belohnungen
	local xpGain = quest.xpPerClick
	local goldGain = quest.gold / 20
	
	playerData.xp = playerData.xp + xpGain
	playerData.gold = playerData.gold + goldGain
	
	print("🎮 Quest geklickt! (" .. quest.currentClicks .. "/" .. quest.totalClicks .. ")")
	
	-- Leveln wenn genug XP
	if playerData.xp >= playerData.xpToLevelUp then
		playerData.xp = playerData.xp - playerData.xpToLevelUp
		playerData.level = playerData.level + 1
		playerData.skillPoints = playerData.skillPoints + 1
		playerData.xpToLevelUp = playerData.xpToLevelUp + 50
		print("⭐ LEVEL UP! Level: " .. playerData.level .. " | Skill Punkte: " .. playerData.skillPoints)
	end
	
	-- Wenn Quest fertig
	if quest.currentClicks >= quest.totalClicks then
		quest.completed = true
		print("✅ QUEST ABGESCHLOSSEN!")
		
		-- Alle Quests fertig?
		local allCompleted = true
		for _, q in ipairs(playerData.quests) do
			if not q.completed then
				allCompleted = false
				break
			end
		end
		
		if allCompleted then
			print("🎉 STAGE " .. playerData.currentStage .. " FERTIG!")
			playerData.currentStage = playerData.currentStage + 1
			playerData.quests = QuestSystem:GenerateQuests(playerData.currentStage)
		end
	end
	
	updateResourceLabels()
	QuestSystem:RefreshQuestUI()
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

mainMenu.QuestButton.MouseButton1Click:Connect(function()
	showMenu("Quest")
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

questWindow.BackButton.MouseButton1Click:Connect(function()
	showMenu("MainMenu")
end)

-- Beim Start
showMenu("MainMenu")
updateResourceLabels()

print("=== BLOX WARLORD LOADED ===")
print("🎮 Gutes Leveling-System aktiviert!")
