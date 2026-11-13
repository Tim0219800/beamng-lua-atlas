# `gameplayStatisticModules_watchBurnout`

*Fichier : `lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua` · VM : Véhicule · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayStatisticModules_watchBurnout` : `extensions.load (VM véhicule)("gameplayStatisticModules_watchBurnout")`, puis la globale `gameplayStatisticModules_watchBurnout`

Module de gameplayStatistic qui détecte les burnouts : une roue motrice intacte patine (vitesse de roue > 2 et > 1,5 x vitesse sol, glissement pondéré par la charge > 4) tout en touchant le sol. À la fin, si la durée dépasse 0,1 s, ajoute la métrique 'vehicle/burnout.time' (agrégée).

## Remarques

- Se décharge si le contrôleur principal n'est pas 'vehicleController/vehicleController', s'il n'y a aucune roue ou aucune roue motrice (wd.isPropulsed).
- Ignoré si le nombre de roues a changé depuis le chargement.
- Condition par roue : not isBroken, wheelSpeed > 2, wheelSpeed > groundSpeed * 1.5, lastSlip * min(downForce * 0.1, 1) > 4, contact au sol.
- Le workload n'est pas enregistré ici (l'appel addSchedule est commenté) ; c'est gameplayStatistic qui l'ajoute au planificateur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayStatisticModules_watchBurnout.onExtensionLoaded()` | Appelé au chargement : liste les roues motrices ; renvoie false pour se décharger si le véhicule ne convient pas. *(interne)* *(hook)* | 42 |
| `gameplayStatisticModules_watchBurnout.workload()` | Fonction de surveillance exécutée à tour de rôle par gameplayStatistic : détecte début/fin de burnout et envoie la métrique. *(interne)* | 15 |

### Détail des paramètres

#### `gameplayStatisticModules_watchBurnout.onExtensionLoaded()`

Appelé au chargement : liste les roues motrices ; renvoie false pour se décharger si le véhicule ne convient pas.

- **renvoie** : boolean|nil false pour demander le déchargement.

## Appels vers le moteur (C++)

- `obj:` `getGroundSpeed`, `getSimTime`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua`.*
