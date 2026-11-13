# `gameplayStatisticModules_watchAirtime`

*Fichier : `lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua` · VM : Véhicule · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayStatisticModules_watchAirtime` : `extensions.load (VM véhicule)("gameplayStatisticModules_watchAirtime")`, puis la globale `gameplayStatisticModules_watchAirtime`

Module de gameplayStatistic qui mesure le temps où le véhicule est entièrement en l'air : vitesse sol > 6 m/s, aucune roue en contact (contactMaterialID1 et 2 = -1) et axe haut du véhicule à moins de 45° de la verticale (z > 0,707). Au retour au sol, si la durée dépasse 0,1 s, ajoute la métrique 'vehicle/airtime.time' (agrégée).

## Remarques

- Se décharge (onExtensionLoaded renvoie false) si le contrôleur principal n'est pas 'vehicleController/vehicleController' ou si le véhicule n'a pas de roues.
- Ignoré si le nombre de roues a changé depuis le chargement (roue perdue).
- Le temps est mesuré avec obj:getSimTime(). Le code contient un commentaire 'todo redo this' sur le test d'inclinaison.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayStatisticModules_watchAirtime.onExtensionLoaded()` | Appelé au chargement : mémorise le nombre de roues ; renvoie false pour se décharger si le véhicule ne convient pas. *(interne)* *(hook)* | 39 |
| `gameplayStatisticModules_watchAirtime.workload()` | Fonction de surveillance exécutée à tour de rôle par gameplayStatistic : met à jour l'état 'en l'air' et envoie la métrique à l'atterrissage. *(interne)* | 11 |

### Détail des paramètres

#### `gameplayStatisticModules_watchAirtime.onExtensionLoaded()`

Appelé au chargement : mémorise le nombre de roues ; renvoie false pour se décharger si le véhicule ne convient pas.

- **renvoie** : boolean|nil false pour demander le déchargement.

## Appels vers le moteur (C++)

- `obj:` `getDirectionVectorUpXYZ`, `getGroundSpeed`, `getSimTime`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua`.*
