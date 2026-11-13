# `gameplay_rally_loop_rallyEventLog`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua` · VM : Game Engine (GE) · 199 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/rallyEventLog")` (fichier sous extensions/ mais pas une extension classique)

Journal des évènements d'une boucle de rallye. Chaque entrée (item) porte un timestamp, un eventId, un eventGroup, un type ('penalty', etc.) et une table data. À chaque ajout, les agrégats sont recalculés : pénalité totale, temps de spéciale total, temps total (spéciales + pénalités) et résumé des pénalités par groupe et par type. Utilisé par rallyLoopManager et rallyAttempts.

## Exemple

```lua
local log = require('gameplay_rally_loop_rallyEventLog')()
log:addItem({eventId='ss1', eventGroup='SS1'}, 12.3, 'penalty', {penaltyType='speeding', amount=10})
print(log:getTotalPenalty())
```

## Remarques

- Le module renvoie une fonction constructeur ; les options passées sont transmises à C:init (qui n'en utilise aucune).
- Seuls les items dont data.stageTimeSecs existe comptent comme temps de spéciale ; seuls les items de type 'penalty' avec data.amount comptent dans la pénalité.
- Un item sans data provoquerait une erreur dans getStageTimes/_calcTotalStageTime (accès à item.data.stageTimeSecs sans garde).
- C:clear() vide items et itemsByEventGroup mais ne remet pas aggregatedItems à zéro : les totaux restent ceux d'avant jusqu'au prochain addItem.

## Classe `C`

Journal d'évènements. Champs d'instance : items (liste ordonnée), itemsByEventGroup (table eventGroup -> liste), aggregatedItems (totalPenalty, totalStageTime, totalTime, penaltySummary).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_rallyEventLog")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_calcPenaltySummary()` | Construit le résumé des pénalités par groupe puis par penaltyType. | 115 |
| `C:_calcTotalPenalty()` | Somme data.amount des items de type 'penalty'. | 95 |
| `C:_calcTotalStageTime()` | Somme data.stageTimeSecs de tous les items. | 105 |
| `C:addItem(event, timestamp, type, data)` | Ajoute une entrée au journal et au groupe de l'évènement, puis recalcule les agrégats. eventId et eventGroup valent 'unknown' s'ils sont absents. | 19 |
| `C:clear()` | Vide le journal (items et groupes) et log un message de debug. Les agrégats ne sont pas recalculés. | 185 |
| `C:getAllItems()` | Renvoie tous les items dans l'ordre d'ajout. | 55 |
| `C:getItemsByEventGroup(eventGroup)` | Renvoie les items d'un groupe d'évènements (table vide si aucun). | 51 |
| `C:getItemsByType(type)` | Renvoie les items dont le type correspond. | 59 |
| `C:getPenaltySummary()` | Résumé des pénalités : {totalPenalty, groups = {{eventGroup, totalPenalty, penalties = {{type, count, amount}}}}}. Les groupes suivent l'ordre de première apparition, les pénalités sont triées par type. | 91 |
| `C:getStageTimes()` | Renvoie les items qui portent data.stageTimeSecs (un par spéciale terminée). | 69 |
| `C:getTotalPenalty()` | Pénalité totale en secondes (0 si rien). | 79 |
| `C:getTotalStageTime()` | Somme des temps de spéciales en secondes. | 83 |
| `C:getTotalTime()` | Temps de spéciales plus pénalités, en secondes. | 87 |
| `C:init()` | Initialise les listes vides. Appelé par le constructeur. | 9 |
| `C:recalculateAggregatedItems()` | Recalcule totalPenalty, totalStageTime, totalTime et penaltySummary. Appelé par addItem. | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua`.*
