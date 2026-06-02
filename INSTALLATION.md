# 📚 INSTALLATIONS-ANLEITUNG - Blox Warlord

Follge diesen GENAUEN Schritten in dieser Reihenfolge!

---

## 🎯 SCHRITT 1: Basis-Struktur erstellen

### 1.1 ScreenGui erstellen
1. Öffne dein Roblox Spiel in **Roblox Studio**
2. Schau links im **Explorer** (wenn nicht sichtbar: View → Explorer)
3. Finde **StarterGui**
4. **Rechtsklick** auf StarterGui
5. Klick **Insert Object**
6. Suche und klick **ScreenGui**
7. Das neue Element heißt automatisch `ScreenGui` ✅

### 1.2 Alle Frames erstellen

Für jeden Namen unten:
1. **Rechtsklick** auf ScreenGui
2. **Insert Object** → **Frame**
3. **Rechtsklick** auf neuen Frame → **Rename** → Namen eingeben

**Erstelle diese Frames (in dieser Reihenfolge):**
- MainMenu
- MonsterCollection
- Shop
- Profile
- Inventory
- WorldBoss
- DailyRaid

---

## 🎯 SCHRITT 2: Frames formatieren

### 2.1 MainMenu formatieren

1. Klick auf `MainMenu` (einmal anklicken)
2. Rechts oben schau nach **Properties**
3. Stelle folgendes ein:

| Eigenschaft | Wert |
|---|---|
| Size | X: `1` Scale, Y: `1` Scale |
| Position | X: `0` Offset, Y: `0` Offset |
| BackgroundColor3 | R: `20`, G: `20`, B: `30` |
| Visible | `true` |
| BorderSizePixel | `0` |

### 2.2 Andere Frames formatieren

Für **MonsterCollection, Shop, Profile, Inventory, WorldBoss, DailyRaid**:

Alle Einstellungen **GLEICH** wie MainMenu, aber:
- **Visible:** `false` (nicht sichtbar am Anfang!)

---

## 🎯 SCHRITT 3: TopBar (Ressourcen-Leiste) erstellen

1. **Rechtsklick** auf **ScreenGui**
2. **Insert Object** → **Frame**
3. Benenne zu `TopBar`
4. Stelle folgendes ein:

| Eigenschaft | Wert |
|---|---|
| Position | X: `0` Offset, Y: `0` Offset |
| Size | X: `1` Scale, Y: `0` Offset `60` |
| BackgroundColor3 | R: `15`, G: `15`, B: `25` |
| BorderSizePixel | `0` |

---

## 🎯 SCHRITT 4: Resource Labels in TopBar

Für **JEDEN Label** unten:
1. **Rechtsklick** auf **TopBar**
2. **Insert Object** → **TextLabel**
3. Benenne entsprechend
4. Stelle die Werte ein

### 4.1 GoldLabel

| Eigenschaft | Wert |
|---|---|
| Name | `GoldLabel` |
| Text | `💰 Gold: 0` |
| Position | X: `20` Offset, Y: `15` Offset |
| Size | X: `200` Offset, Y: `30` Offset |
| TextColor3 | R: `255`, G: `215`, B: `0` |
| BackgroundTransparency | `1` |
| TextSize | `18` |
| Font | `GothamBold` |

### 4.2 DiamondLabel

| Eigenschaft | Wert |
|---|---|
| Name | `DiamondLabel` |
| Text | `💎 Diamanten: 0` |
| Position | X: `250` Offset, Y: `15` Offset |
| Size | X: `200` Offset, Y: `30` Offset |
| TextColor3 | R: `100`, G: `200`, B: `255` |
| BackgroundTransparency | `1` |
| TextSize | `18` |
| Font | `GothamBold` |

### 4.3 EnergyLabel

| Eigenschaft | Wert |
|---|---|
| Name | `EnergyLabel` |
| Text | `⚡ Energie: 100/100` |
| Position | X: `480` Offset, Y: `15` Offset |
| Size | X: `200` Offset, Y: `30` Offset |
| TextColor3 | R: `255`, G: `100`, B: `100` |
| BackgroundTransparency | `1` |
| TextSize | `18` |
| Font | `GothamBold` |

### 4.4 HPLabel

| Eigenschaft | Wert |
|---|---|
| Name | `HPLabel` |
| Text | `❤️ HP: 1000/1000` |
| Position | X: `710` Offset, Y: `15` Offset |
| Size | X: `200` Offset, Y: `30` Offset |
| TextColor3 | R: `255`, G: `50`, B: `50` |
| BackgroundTransparency | `1` |
| TextSize | `18` |
| Font | `GothamBold` |

---

## 🎯 SCHRITT 5: MainMenu Title erstellen

1. **Rechtsklick** auf **MainMenu**
2. **Insert Object** → **TextLabel**
3. Benenne zu `Title`
4. Stelle folgendes ein:

| Eigenschaft | Wert |
|---|---|
| Text | `BLOX WARLORD` |
| Position | X: `0` Offset, Y: `20` Offset |
| Size | X: `1` Scale, Y: `0` Offset `100` |
| TextSize | `50` |
| Font | `GothamBlack` |
| TextColor3 | R: `255`, G: `200`, B: `50` |
| BackgroundTransparency | `1` |
| TextStrokeTransparency | `0.5` |
| TextScaled | `false` |

---

## 🎯 SCHRITT 6: MainMenu Buttons erstellen

Für **JEDEN Button** unten:
1. **Rechtsklick** auf **MainMenu**
2. **Insert Object** → **TextButton**
3. Benenne entsprechend
4. Stelle die Werte ein

### 6.1 CollectionButton

| Eigenschaft | Wert |
|---|---|
| Name | `CollectionButton` |
| Text | `🐉 MONSTER SAMMLUNG` |
| Position | X: `0.5` Scale, Y: `0.25` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `100`, G: `50`, B: `200` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

### 6.2 ShopButton

| Eigenschaft | Wert |
|---|---|
| Name | `ShopButton` |
| Text | `🛍️ SHOP` |
| Position | X: `0.5` Scale, Y: `0.38` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `200`, G: `150`, B: `50` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

### 6.3 WorldBossButton

| Eigenschaft | Wert |
|---|---|
| Name | `WorldBossButton` |
| Text | `👹 WORLD BOSS` |
| Position | X: `0.5` Scale, Y: `0.51` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `200`, G: `50`, B: `50` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

### 6.4 DailyRaidButton

| Eigenschaft | Wert |
|---|---|
| Name | `DailyRaidButton` |
| Text | `📅 DAILY RAID` |
| Position | X: `0.5` Scale, Y: `0.64` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `50`, G: `150`, B: `100` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

### 6.5 ProfileButton

| Eigenschaft | Wert |
|---|---|
| Name | `ProfileButton` |
| Text | `👤 PROFIL` |
| Position | X: `0.5` Scale, Y: `0.77` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `50`, G: `150`, B: `200` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

---

## 🎯 SCHRITT 7: Back Buttons für alle Menüs

Für **JEDES Menü** (MonsterCollection, Shop, Profile, Inventory, WorldBoss, DailyRaid):

1. **Rechtsklick** auf das Menü
2. **Insert Object** → **TextButton**
3. Benenne zu `BackButton`
4. Stelle folgendes ein:

| Eigenschaft | Wert |
|---|---|
| Text | `← ZURÜCK` |
| Position | X: `20` Offset, Y: `80` Offset |
| Size | X: `150` Offset, Y: `50` Offset |
| BackgroundColor3 | R: `100`, G: `100`, B: `100` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `18` |
| Font | `GothamBold` |
| BorderSizePixel | `0` |

---

## 🎯 SCHRITT 8: GUIManager Script einfügen

1. **Rechtsklick** auf **StarterGui** (nicht auf ScreenGui!)
2. **Insert Object** → **LocalScript**
3. Das Script heißt automatisch `LocalScript` → **Rechtsklick** → **Rename** → `GUIManager`
4. **Doppelklick** auf GUIManager Script um es zu öffnen
5. Wähle ALLES aus: **Ctrl+A**
6. Lösche alles: **Delete**
7. Gehe zu: https://github.com/KeinKarma/Blox-Warlod/blob/main/Scripts/GUIManager.lua
8. Klick auf das Code-Fenster
9. **Ctrl+A** um alles zu markieren
10. **Ctrl+C** um zu kopieren
11. Gehe zurück zu Roblox Studio
12. **Ctrl+V** um einzufügen
13. **Ctrl+S** um zu speichern

---

## ✅ FERTIG!

Jetzt sollte dein Spiel funktionieren! 🎮

### Test-Befehle:
- **Q** = Quest machen
- **W** = World Boss angreifen
- **E** = Ausdauer Skill
- **R** = Energie Skill
- **T** = HP Skill

Drücke **Play** und teste es! 🚀

---

## 📝 Wenn etwas nicht funktioniert:

1. **Überprüfe die Namen:** Alle Namen müssen EXAKT wie in der Anleitung sein (Groß-/Kleinschreibung beachten!)
2. **Überprüfe das Script:** Öffne GUIManager und schau nach rot gekennzeichneten Fehlern
3. **Output Console:** View → Output um Fehler zu sehen

Bei Problemen schreib mir! 💪