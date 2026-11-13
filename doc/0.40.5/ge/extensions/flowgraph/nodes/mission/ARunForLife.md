# `flowgraph_nodes_mission_ARunForLife`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua` · VM : Game Engine (GE) · 839 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/ARunForLife")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:activateBuff(buff, pos)` |  | 380 |
| `C:activatePropsAndBuffs()` |  | 458 |
| `C:calcMedal()` |  | 732 |
| `C:checkBuffAvailabilty()` |  | 326 |
| `C:checkCoinForRepair()` |  | 355 |
| `C:checkLose()` |  | 285 |
| `C:checkTriggers()` | Check the different triggers (jump, gate, buffs) | 701 |
| `C:coinBuff()` |  | 692 |
| `C:createDecalPool()` |  | 609 |
| `C:deactivateBuff(buff)` |  | 363 |
| `C:deactivateProp(propName)` |  | 395 |
| `C:deactivatePropsAndBuffs()` | Will deactivate props that are out of the camera | 403 |
| `C:doBuffsTime()` |  | 340 |
| `C:doScore()` |  | 278 |
| `C:drawDecals()` | Draw arrows and crosses | 627 |
| `C:getBuffByName(name)` |  | 428 |
| `C:getBuffNextTime(baseTime)` |  | 376 |
| `C:getPropByName(name)` |  | 436 |
| `C:increaseDecalPool(amount)` |  | 603 |
| `C:init(mgr, ...)` |  | 133 |
| `C:linkContainers()` |  | 211 |
| `C:linkProps()` | Because every props rotation are different, because some props are special, here i'm defining some of the "corrected properties"<br>or why they're special | 138 |
| `C:moveCamera()` |  | 233 |
| `C:moveTriggers()` |  | 528 |
| `C:pushBall()` |  | 304 |
| `C:repairBuff()` |  | 686 |
| `C:resetValues()` |  | 749 |
| `C:setParameters()` |  | 786 |
| `C:setReferences()` |  | 571 |
| `C:slowDownCar()` |  | 673 |
| `C:tpContainers()` |  | 264 |
| `C:updateValues()` |  | 546 |
| `C:work()` |  | 807 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua`.*
