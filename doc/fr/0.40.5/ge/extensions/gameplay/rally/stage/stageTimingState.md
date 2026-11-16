# `gameplay_rally_stage_stageTimingState`

*Fichier : `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/stage/stageTimingState")` (fichier sous extensions/ mais pas une extension classique)

Machine d'état du chronomètre d'une spéciale de rallye : temps écoulé, activation, fin, pas de temps de la frame et temps intermédiaires (splits). Utilisé par rallyManager (getStageTimingState). Le module renvoie un constructeur.

## Remarques

- Statuts possibles : 'idle', 'active', 'complete'.
- Une fois complete, setActive ne réactive plus le chrono ; seul reset le remet à zéro.
- addTime ignore les valeurs <= 0 et renvoie false si le chrono n'est pas actif.

## Classe `C`

Objet d'état de chronométrage.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_stage_stageTimingState")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addTime(seconds)` | Ajoute des secondes au temps écoulé (pénalité, par exemple de récupération). | 50 |
| `C:advance(dt)` | Fait avancer le chrono de dt s'il est actif et non terminé, en mémorisant le début et la durée de la frame ; sinon frameDt vaut 0. | 39 |
| `C:completeAt(time)` | Termine le chrono : statut 'complete', fige finishTime et elapsedTime. | 60 |
| `C:getFrameDt()` | Durée de la dernière frame traitée par advance (0 si inactif). | 143 |
| `C:getFrameStartTime()` | Temps au début de la dernière frame traitée par advance. | 139 |
| `C:getSplitOrder()` | Liste des pathnodeId dans l'ordre d'enregistrement. | 123 |
| `C:getSplitTimes()` | Table des splits indexée par pathnodeId. | 119 |
| `C:getState()` | Instantané de l'état : status, active, complete, elapsedTime, finishTime, frameStartTime, frameDt, splitTimes, splitOrder (les tables de splits sont partagées, pas copiées). | 147 |
| `C:getTime()` | Temps de fin s'il existe, sinon temps écoulé (secondes). | 135 |
| `C:init()` | Appelle reset. | 7 |
| `C:isActive()` | Vrai si le chrono tourne (actif et non terminé). | 127 |
| `C:isComplete()` | Vrai si le chrono est terminé. | 131 |
| `C:markSplitMissing(splitData, reason)` | Marque un split comme manquant (sans temps) avec une raison ; l'entrée remplace une éventuelle entrée existante. | 95 |
| `C:recordSplit(splitData, time, source)` | Enregistre un temps intermédiaire pour un point de chemin, si splitData.isSplitTiming. Complète splitData.time et splitData.source si absents. | 68 |
| `C:reset()` | Remet tout à zéro : statut idle, inactif, non terminé, temps 0, aucun split. | 11 |
| `C:setActive(active)` | Active ou met en pause le chrono (statut 'active' / 'idle'). Sans effet si le chrono est terminé (il reste inactif). | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua`.*
