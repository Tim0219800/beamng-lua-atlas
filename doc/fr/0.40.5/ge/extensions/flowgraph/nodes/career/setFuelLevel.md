# `flowgraph_nodes_career_setFuelLevel`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/setFuelLevel")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Fuel Level » (catégorie once_f_duration, couleur/icône career). Règle le niveau de carburant d'un véhicule au même pourcentage dans tous ses réservoirs. Entrées : vehId (number, sinon véhicule du joueur 0), mult (number 0-1, fraction du maximum). Demande d'abord l'énergie des réservoirs (core_vehicleBridge 'energyStorage'), puis exécute l'action setEnergyStorageEnergy avec maxEnergy * mult pour chaque réservoir ; l'état passe à finished.

## Remarques

- _executionStarted est défini deux fois (identiques).
- La variable locale allowedTypes (gasoline, diesel, electricEnergy) et fuelType ne sont pas utilisées : tous les réservoirs sont réglés.
- Le code ne vérifie pas que mult est non nil.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset au démarrage du graphe. | 27 |
| `C:init()` | Appelle onNodeReset. | 24 |
| `C:onNodeReset()` | Réinitialise les données reçues, le drapeau d'envoi et l'état de durée ('inactive'). | 36 |
| `C:work()` | Quand les données sont arrivées, règle chaque réservoir à maxEnergy*mult et passe à 'finished'. | 55 |
| `C:workOnce()` | Trouve le véhicule, demande les données d'énergie et passe à l'état 'started'. | 44 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua`.*
