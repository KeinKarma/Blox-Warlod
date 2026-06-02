📚 UPDATED INSTALLATION GUIDE - Blox Warlord v2.0

Mit Shop-System, Monster-Verwaltung, Daten-Speicher und Kombinieren!

---

## 🎯 NEUE DATEIEN HINZUFÜGEN

### Schritt 1: Module Scripts in ServerScriptService

1. **Rechtsklick** auf **ServerScriptService**
2. **Insert Object** → **ModuleScript**
3. Benenne nacheinander:
   - `MonsterDatabase` ✅ (bereits vorhanden)
   - `ShopSystem` ← NEU!
   - `DataStore` ← NEU!
   - `MonsterManagement` ← NEU!

#### 1.1 ShopSystem Code einfügen

1. **Doppelklick** auf `ShopSystem`
2. Kopiere Code von: https://github.com/KeinKarma/Blox-Warlod/blob/main/Scripts/ShopSystem.lua
3. Einfügen (Ctrl+A, Delete, dann Ctrl+V)
4. Speichern

#### 1.2 DataStore Code einfügen

1. **Doppelklick** auf `DataStore`
2. Kopiere Code von: https://github.com/KeinKarma/Blox-Warlod/blob/main/Scripts/DataStore.lua
3. Einfügen
4. Speichern

#### 1.3 MonsterManagement Code einfügen

1. **Doppelklick** auf `MonsterManagement`
2. Kopiere Code von: https://github.com/KeinKarma/Blox-Warlod/blob/main/Scripts/MonsterManagement.lua
3. Einfügen
4. Speichern

---

## 🎯 GUI FRAMES ERSTELLEN FÜR SHOP

### Schritt 2: Shop Fenster bauen

#### 2.1 ShopWindow Frame

1. **Rechtsklick** auf **ScreenGui**
2. **Insert Object** → **Frame**
3. Benenne zu `ShopWindow`
4. Properties:

| Eigenschaft | Wert |
|---|---|
| Size | X: `1` Scale, Y: `1` Scale |
| Position | X: `0` Offset, Y: `0` Offset |
| BackgroundColor3 | R: `20`, G: `20`, B: `30` |
| Visible | `false` |
| BorderSizePixel | `0` |

#### 2.2 Back Button

1. **Rechtsklick** auf **ShopWindow**
2. **Insert Object** → **TextButton**
3. Benenne zu `BackButton`

| Eigenschaft | Wert |
|---|---|
| Text | `← ZURÜCK` |
| Position | X: `20` Offset, Y: `80` Offset |
| Size | X: `150` Offset, Y: `50` Offset |
| BackgroundColor3 | R: `100`, G: `100`, B: `100` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `18` |
| Font | `GothamBold` |

#### 2.3 Title Label

1. **Rechtsklick** auf **ShopWindow**
2. **Insert Object** → **TextLabel**
3. Benenne zu `Title`

| Eigenschaft | Wert |
|---|---|
| Text | `🛍️ SHOP - DIAMANTEN` |
| Position | X: `0` Offset, Y: `20` Offset |
| Size | X: `1` Scale, Y: `0` Offset `60` |
| TextSize | `30` |
| Font | `GothamBlack` |
| TextColor3 | R: `100`, G: `200`, B: `255` |
| BackgroundTransparency | `1` |

#### 2.4 ShopList (ScrollingFrame)

1. **Rechtsklick** auf **ShopWindow**
2. **Insert Object** → **ScrollingFrame**
3. Benenne zu `ShopList`

| Eigenschaft | Wert |
|---|---|
| Position | X: `0` Offset, Y: `100` Offset |
| Size | X: `1` Scale, Y: `0` Offset `-150` |
| CanvasSize | X: `0` Offset, Y: `0` Offset |
| BackgroundColor3 | R: `25`, G: `25`, B: `35` |
| ScrollBarThickness | `15` |

---

## 🎯 MONSTER-VERWALTUNG FENSTER

### Schritt 3: Inventory Window

#### 3.1 InventoryWindow Frame

1. **Rechtsklick** auf **ScreenGui**
2. **Insert Object** → **Frame**
3. Benenne zu `InventoryWindow`
4. Gleiche Settings wie ShopWindow

#### 3.2 Back Button, Title, ScrollingFrame

- Gleich wie Shop (Back Button, Title Label, ScrollingFrame "MonsterList")

---

## 🎯 KOMBINIEREN-FENSTER

### Schritt 4: Combine Window

#### 4.1 CombineWindow Frame

1. **Rechtsklick** auf **ScreenGui**
2. **Insert Object** → **Frame**
3. Benenne zu `CombineWindow`
4. Gleiche Settings

#### 4.2 Back Button + Title

- Back Button
- Title: `🔗 MONSTER KOMBINIEREN`

#### 4.3 Combine UI Elemente

Wir bauen diese später mit Script! (Dynamisch erstellt)

---

## 🎯 SHOP BUTTON ZUM MAINMENU

### Schritt 5: Shop Button hinzufügen

1. **Rechtsklick** auf **MainMenu**
2. **Insert Object** → **TextButton**
3. Benenne zu `ShopButton`

| Eigenschaft | Wert |
|---|---|
| Text | `💎 SHOP` |
| Position | X: `0.5` Scale, Y: `0.9` Scale |
| Size | X: `300` Offset, Y: `60` Offset |
| AnchorPoint | X: `0.5`, Y: `0.5` |
| BackgroundColor3 | R: `100`, G: `150`, B: `200` |
| TextColor3 | R: `255`, G: `255`, B: `255` |
| TextSize | `20` |
| Font | `GothamBold` |

---

## 🎯 HAUPTSCRIPT AKTUALISIEREN

### Schritt 6: GUIManager aktualisieren

Das neue GUIManager Script enthält:
- ✅ DataStore Integration
- ✅ Shop UI Rendering
- ✅ Monster-Verwaltung UI
- ✅ Kombinieren Fenster
- ✅ Auto-Save System

Kopiere das aktualisierte GUIManager Script von GitHub!

---

## 🔧 TEST FEATURES

Nach Installation kannst du testen:

✅ **Shop-System:**
- Klick "💎 SHOP" Button
- Kaufe Lager-Erweiterung (50 💎)
- Kaufe Energie-Booster (40 💎)
- Beobachte wie Diamanten sinken & Effekte angewendet werden

✅ **Monster-Verwaltung:**
- Klick "📜 Inventory"
- Sehe deine Monster
- Verkaufe Monster für Gold
- Kombiniere 2 gleiche Monster

✅ **Daten-Speicher:**
- Quests machen
- Spiel verlassen
- Zurückkehren → Daten gespeichert! ✅

---

## 📋 FEATURE-LISTE

- [x] Quests (10 pro Stage, 20 Clicks)
- [x] Monster-Sammlung (anschauen)
- [x] Shop-System (Diamanten-basiert)
  - [x] Lager-Erweiterungen
  - [x] Energie-Booster
  - [x] Ausdauer-Booster
  - [x] Gold/Diamanten-Pakete
- [x] Monster-Verkauf
- [x] Monster-Kombinieren (Fusion)
- [x] Daten-Speichersystem (Auto-Save)
- [ ] World Boss (Alle 2 Stunden)
- [ ] PvP Arena
- [ ] Guilds

---

🎮 **Gutes Leveling!** Gib mir Bescheid wenn fertig!
