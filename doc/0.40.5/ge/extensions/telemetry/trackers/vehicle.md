# `telemetry_trackers_vehicle`

*Fichier : `lua/ge/extensions/telemetry/trackers/vehicle.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_vehicle` : `extensions.load("telemetry_trackers_vehicle")`, puis la globale `telemetry_trackers_vehicle`

Traceur de télémétrie des véhicules. Il enregistre quels véhicules sont créés (événement `vehicleSpawned`), conduits et pendant combien de temps (activité `vehicleUsed`), et les réinitialisations (événement `vehicleReset`). Les configurations personnalisées sont rapportées comme ":custom" au lieu du contenu de la configuration. S'appuie sur `telemetry_core`, `telemetry_vehicleInfo` et `telemetry_configManager`.

## Remarques

- Seul le joueur 0 est suivi (`player ~= 0` est ignoré dans onVehicleSwitched). `newId == -1` signifie que le joueur n'est plus dans un véhicule.
- Les réinitialisations sont l'événement le plus bruyant : `trackVehReset` ne fait rien si la configuration du module `vehicle` a `trackResets == false`.
- Après un rechargement Lua, onVehicleSwitched ne se redéclenche pas ; onExtensionLoaded rouvre donc l'activité du véhicule actuellement conduit.
- `trackVehReset` n'est appelé par aucun hook de ce fichier : l'appelant est externe (déduit du code).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_vehicle.onClientEndMission()` | Hook appelé à la fin de la mission/du niveau côté client. Ferme l'activité `vehicleUsed`. *(interne)* *(hook)* | 78 |
| `telemetry_trackers_vehicle.onExit()` | Hook appelé à la fermeture du jeu. Ferme l'activité `vehicleUsed`. *(interne)* *(hook)* | 91 |
| `telemetry_trackers_vehicle.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel et, si le joueur 0 conduit déjà un véhicule, ouvre son activité `vehicleUsed`. *(interne)* *(hook)* | 82 |
| `telemetry_trackers_vehicle.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension (un rechargement Lua ne passe pas par onExit). Ferme l'activité `vehicleUsed`. *(interne)* *(hook)* | 21 |
| `telemetry_trackers_vehicle.onVehicleSpawned(vid)` | Hook appelé quand un véhicule est créé. Envoie l'événement `vehicleSpawned` avec le modèle, la configuration et le niveau courant. Ne fait rien si les infos du véhicule sont introuvables. *(interne)* *(hook)* | 37 |
| `telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand le véhicule contrôlé change. Pour le joueur 0, ferme l'activité `vehicleUsed` en cours puis en ouvre une pour le nouveau véhicule (ou seulement la ferme si newId vaut -1). *(interne)* *(hook)* | 49 |
| `telemetry_trackers_vehicle.trackVehReset()` | Envoie l'événement `vehicleReset` (modèle et dégâts du véhicule du joueur 0, lus dans `map.objects[vid].damage`). Désactivable via `trackResets = false` dans la configuration du module `vehicle`. Ignoré si le joueur n'a pas de véhicule. *(interne)* | 61 |

### Détail des paramètres

#### `telemetry_trackers_vehicle.onVehicleSpawned(vid)`

Hook appelé quand un véhicule est créé. Envoie l'événement `vehicleSpawned` avec le modèle, la configuration et le niveau courant. Ne fait rien si les infos du véhicule sont introuvables.

- `vid` (*integer*) : Id du véhicule créé.

#### `telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand le véhicule contrôlé change. Pour le joueur 0, ferme l'activité `vehicleUsed` en cours puis en ouvre une pour le nouveau véhicule (ou seulement la ferme si newId vaut -1).

- `oldId` (*integer*) : Id de l'ancien véhicule.
- `newId` (*integer*) : Id du nouveau véhicule, -1 si le joueur n'est plus dans un véhicule.
- `player` (*integer*) : Indice du joueur ; seul 0 est traité.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions à charger avant celle-ci : `{'telemetry_core'}`. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/vehicle.lua`.*
