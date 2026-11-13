# `telemetry_vehicleInfo`

*Fichier : `lua/ge/extensions/telemetry/vehicleInfo.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_vehicleInfo` : `extensions.load("telemetry_vehicleInfo")`, puis la globale `telemetry_vehicleInfo`

Utilitaires partagés par les traceurs de télémétrie pour décrire un véhicule : modèle et configuration (`getData`) et mod d'origine (`getMod`). Ce n'est pas un traceur lui-même, d'où sa place hors du dossier `trackers`.

## Exemple

```lua
local data = telemetry_vehicleInfo.getData(be:getPlayerVehicleID(0))
if data then print(data.model, data.config) end
```

## Remarques

- Une configuration personnalisée (partConfig contenant `{` ou `[`) est rapportée comme ":custom", pour qu'aucune configuration construite par l'utilisateur ne quitte la machine.
- getMod ne sait résoudre que les mods zippés : un mod décompressé renvoie nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_vehicleInfo.getData(vid)` | Renvoie le modèle (`vehicle.JBeam`) et la configuration d'un véhicule. La configuration est le nom du fichier sans extension, ou ":custom" si elle est personnalisée. Renvoie nil (avec un avertissement dans le log si l'id est inconnu) si le véhicule n'existe pas ou n'est pas un BeamNGVehicle. | 14 |
| `telemetry_vehicleInfo.getMod(model)` | Renvoie le mod d'où provient un modèle de véhicule, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil pour le contenu d'origine, si le modèle est nil ou si `core_modmanager` est absent. | 37 |

### Détail des paramètres

#### `telemetry_vehicleInfo.getData(vid)`

Renvoie le modèle (`vehicle.JBeam`) et la configuration d'un véhicule. La configuration est le nom du fichier sans extension, ou ":custom" si elle est personnalisée. Renvoie nil (avec un avertissement dans le log si l'id est inconnu) si le véhicule n'existe pas ou n'est pas un BeamNGVehicle.

- `vid` (*integer*) : Id de l'objet véhicule.
- **renvoie** : table|nil `{model = string, config = string}` ou nil.

#### `telemetry_vehicleInfo.getMod(model)`

Renvoie le mod d'où provient un modèle de véhicule, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil pour le contenu d'origine, si le modèle est nil ou si `core_modmanager` est absent.

- `model` (*string|nil*) : Nom du modèle de véhicule (dossier sous /vehicles).
- **renvoie** : table|nil `{name = string, modID = any}` (modID peut être nil), ou nil.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/vehicleInfo.lua`.*
