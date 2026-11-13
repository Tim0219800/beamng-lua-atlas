# `gameplay_traffic_baseRole`

*Fichier : `lua/ge/extensions/gameplay/traffic/baseRole.lua` · VM : Game Engine (GE) · 309 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/baseRole")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_baseRole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyPersonality(data)` |  | 171 |
| `C:checkTargetVisible(id)` |  | 191 |
| `C:clearFlowgraph()` |  | 99 |
| `C:freezeTrafficSignals(state)` |  | 202 |
| `C:generatePersonality()` |  | 152 |
| `C:init(veh, name, data)` |  | 9 |
| `C:onActiveDone()` |  | 243 |
| `C:onCollision(otherId, data)` |  | 261 |
| `C:onCrashDamage(data)` |  | 255 |
| `C:onDeserialized(data, veh)` |  | 287 |
| `C:onOtherCollision(id1, id2, data)` |  | 264 |
| `C:onOtherCrashDamage(otherId, data)` |  | 258 |
| `C:onOtherEvent(eventType, otherId, data)` |  | 267 |
| `C:onRefresh()` |  | 246 |
| `C:onRoleEnded()` |  | 252 |
| `C:onRoleStarted()` |  | 249 |
| `C:onSerialize()` |  | 276 |
| `C:onTrafficTick(tickTime)` |  | 270 |
| `C:onUpdate(dt, dtSim)` |  | 273 |
| `C:postInit()` |  | 65 |
| `C:resetAction()` |  | 137 |
| `C:setAction(name, args)` |  | 118 |
| `C:setAggression(baseAggression, ignorePersonality)` |  | 130 |
| `C:setTarget(id)` |  | 108 |
| `C:setupFlowgraph(fgFile, varData)` |  | 75 |
| `C:tryRandomEvent()` |  | 240 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAction` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/baseRole.lua`.*
