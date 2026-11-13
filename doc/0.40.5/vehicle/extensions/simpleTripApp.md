# `simpleTripApp`

*Fichier : `lua/vehicle/extensions/simpleTripApp.lua` · VM : Véhicule · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `simpleTripApp` : `extensions.load (VM véhicule)("simpleTripApp")`, puis la globale `simpleTripApp`

Alimente l'appli UI « trip » : cumule distance et temps de simulation, estime la consommation de carburant et l'autonomie, et envoie le résultat à l'UI environ chaque seconde réelle via guihooks.trigger('tripData', data). Lit electrics.values.fuelVolume, wheelspeed et airspeed.

## Remarques

- L'événement tripData contient : totalDistance (m), avgSpeed (m/s), avgFuelConsumptionRate (volume de carburant par mètre, sur tout le trajet), fuelConsumptionRate (volume par mètre sur la dernière seconde), range (distance restante, math.huge si aucune consommation et vitesse > 0.1, 0 à l'arrêt).
- La vitesse utilisée est electrics.values.wheelspeed si le véhicule a des roues (wheels.wheels non vide), sinon airspeed.
- Le timer d'envoi est décompté en temps réel (obj:getRealdt), les cumuls en temps de simulation (dtSim).
- onExtensionLoaded renvoie false (ce qui décharge l'extension) si le véhicule n'a ni roues ni dispositif de powertrain ; onPlayersChanged la décharge si plus aucun joueur n'est assis ou si le véhicule est inadapté.
- Division par zéro possible dans fuelConsumptionRate/avgFuelConsumptionRate quand speed ou totalDistance valent 0 (résultat inf/nan envoyé à l'UI).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `simpleTripApp.onExtensionLoaded()` | Hook de chargement : renvoie false (déchargement) si le véhicule n'a ni roue ni dispositif powertrain, sinon appelle reset(). *(interne)* *(hook)* | 66 |
| `simpleTripApp.onPlayersChanged(anyPlayerSeated)` | Hook appelé par main.lua quand les joueurs assis changent ; décharge l'extension (extensions.unload) s'il n'y a plus de joueur ou si le véhicule est inadapté. *(interne)* *(hook)* | 73 |
| `simpleTripApp.reset()` | Remet à zéro distance, temps, timer d'envoi (1 s), carburant précédent et carburant de départ. Appelé au chargement ; utilisable pour redémarrer un trajet. | 14 |
| `simpleTripApp.updateGFX(dtSim)` | Appelé à chaque frame graphique via extensions.hook('updateGFX'). Intègre distance et temps, puis toutes les ~1 s réelle calcule les statistiques et appelle guihooks.trigger('tripData', data). *(interne)* | 22 |

### Détail des paramètres

#### `simpleTripApp.onExtensionLoaded()`

Hook de chargement : renvoie false (déchargement) si le véhicule n'a ni roue ni dispositif powertrain, sinon appelle reset().

- **renvoie** : boolean|nil false pour demander le déchargement, nil sinon.

#### `simpleTripApp.onPlayersChanged(anyPlayerSeated)`

Hook appelé par main.lua quand les joueurs assis changent ; décharge l'extension (extensions.unload) s'il n'y a plus de joueur ou si le véhicule est inadapté.

- `anyPlayerSeated` (*boolean*) : true si au moins un joueur est assis dans ce véhicule.

#### `simpleTripApp.updateGFX(dtSim)`

Appelé à chaque frame graphique via extensions.hook('updateGFX'). Intègre distance et temps, puis toutes les ~1 s réelle calcule les statistiques et appelle guihooks.trigger('tripData', data).

- `dtSim` (*number*) : Pas de temps de simulation en secondes.

**Évènements UI (guihooks.trigger) :** `tripData`

## Appels vers le moteur (C++)

- `obj:` `getRealdt`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/simpleTripApp.lua`.*
