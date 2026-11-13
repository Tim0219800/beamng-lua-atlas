# `editor_missionEditor_setupModules`

*Fichier : `lua/ge/extensions/editor/missionEditor/setupModules.lua` · VM : Game Engine (GE) · 817 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/setupModules")` (fichier sous extensions/ mais pas une extension classique)

Panneau « SetupModules » de l'éditeur de missions. Il édite mission.setupModules, trois modules activables : vehicles (véhicules proposés, véhicule du joueur, réglages de différentiels), traffic (nombre de véhicules, actifs, garés, taux de réapparition, groupe personnalisé) et environment (heure du jour normalisée, échelle de temps, vent, nuages, brouillard, réglages laissés à l'utilisateur). Il contient aussi la conversion de l'ancienne heure fixe vers normalizedTime et la détection de données mal formées. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- normalizedTime : 0 = midi, 0.25 = coucher du soleil, 0.5 = minuit, 0.75 = lever du soleil, 1 = midi ; une valeur négative annule le réglage de l'heure de la mission ; > 1 est une erreur.
- L'ancien champ time (heure fixe) est dit « legacy » ; la conversion utilise des tables de valeurs (axisTilt) par niveau (west_coast_usa par défaut) pour passer à normalizedTime.
- Si la mission d'instance bloque un module (blockedSetupModules), il est affiché désactivé avec « not available for this mission type ». Pour vehicles, enabled est forcé à not isBlocked à chaque frame.
- Traffic : amount = -1 signifie quantité automatique ; respawnRate va de 0 à 3 ; timeScale à 0 ignore le réglage.
- Désactiver un module vide ses données (table.clear) ; les champs obsolètes setupModules.playerVehicle et setupModules.timeOfDay sont supprimés par setBackwardsCompatibility.

## Classe `C`

Instance du panneau. Champs : missionEditor, name = 'SetupModules', mission, missionInstance, blockedSetupModules, ainsi que de nombreux tampons imgui (traffic*, todInput, normalizedTodInput, windSpeedInput, cloudCoverInput, fogDensityInput…).

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_setupModules")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:displayDiffSetup(veh)` | Combo de cases à cocher pour les réglages de différentiels d'un véhicule : toggleDifferentials, lockFrontDiffs, lockRearDiffs, setTransfercase (4hi), setRangebox (low), ou tous d'un coup. | 762 |
| `C:draw()` | Dessine les trois sections Vehicles, Traffic et Environment avec leurs cases d'activation et champs. Utilise core_environment.getTimeOfDay et getTimeOfDayValueForNormalizedTime pour l'heure actuelle et la conversion. | 226 |
| `C:getMissionIssues(m)` | Appelle setMission(m) puis signale les modules mal formés (error), l'heure fixe legacy (minor) et un normalizedTime invalide (error). | 163 |
| `C:init(missionEditor)` | Constructeur : mémorise missionEditor et le nom du panneau. | 8 |
| `C:setBackwardsCompatibility()` | Copie dans la mission les modules corrigés par l'instance de jeu (ceux marqués _compatibility) et supprime les modules obsolètes playerVehicle et timeOfDay. | 149 |
| `C:setMission(mission)` | Définit la mission courante, applique la compatibilité ascendante et initialise tous les tampons de saisie depuis mission.setupModules. | 114 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/setupModules.lua`.*
