# `core_settings_dynCaptureQuality`

*Fichier : `lua/ge/extensions/core/settings/dynCaptureQuality.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_dynCaptureQuality` : `extensions.load("core_settings_dynCaptureQuality")`, puis la globale `core_settings_dynCaptureQuality`

Préréglages de qualité des captures dynamiques des véhicules : reflets dynamiques (cubemap) et rétroviseurs dynamiques. Chaque fonction applique un niveau en écrivant les variables $pref::BeamNGVehicle::dynamicReflection::* ou dynamicMirrors::* dans VariableRegistry. Le commentaire du code dit qu'il restaure les réglages Normal/High/Ultra de la 0.39.

## Exemple

```lua
core_settings_dynCaptureQuality.applyReflection("High")
core_settings_dynCaptureQuality.applyMirrors("Low")
```

## Remarques

- Un niveau inconnu est ignoré sans message.
- Niveaux disponibles : Disabled, Lowest, Low, Normal, High, Ultra.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_dynCaptureQuality.applyMirrors(level)` | Applique un niveau de rétroviseurs dynamiques : écrit enabled, textureSize, detail et distance dans $pref::BeamNGVehicle::dynamicMirrors::*. | 36 |
| `core_settings_dynCaptureQuality.applyReflection(level)` | Applique un niveau de reflets dynamiques : écrit enabled, textureSize, facesPerUpdate, detail et distance dans $pref::BeamNGVehicle::dynamicReflection::*. | 26 |

### Détail des paramètres

#### `core_settings_dynCaptureQuality.applyMirrors(level)`

Applique un niveau de rétroviseurs dynamiques : écrit enabled, textureSize, detail et distance dans $pref::BeamNGVehicle::dynamicMirrors::*.

- `level` (*string*) : Clé de mirrorLevels (Disabled, Lowest, Low, Normal, High, Ultra).

#### `core_settings_dynCaptureQuality.applyReflection(level)`

Applique un niveau de reflets dynamiques : écrit enabled, textureSize, facesPerUpdate, detail et distance dans $pref::BeamNGVehicle::dynamicReflection::*.

- `level` (*string*) : Clé de reflectionLevels (Disabled, Lowest, Low, Normal, High, Ultra).

## Champs

| Champ | Type | Description |
|---|---|---|
| `mirrorLevels` | table<string, table> | Par niveau : enabled (boolean), textureSize (128 à 1024), detail (0 à 0.75), distance (50 à 300). Pas de facesPerUpdate. |
| `reflectionLevels` | table<string, table> | Par niveau : enabled (boolean), textureSize (128 à 1024), facesPerUpdate (1 ou 2), detail (0 à 0.75), distance (50 à 300). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/dynCaptureQuality.lua`.*
