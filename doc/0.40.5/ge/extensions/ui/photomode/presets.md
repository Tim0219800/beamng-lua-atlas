# `ui_photomode_presets`

*Fichier : `lua/ge/extensions/ui/photomode/presets.lua` · VM : Game Engine (GE) · 484 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_presets` : `extensions.load("ui_photomode_presets")`, puis la globale `ui_photomode_presets`

**Dépendances (chargées avant) :** `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_presets.applyPreset(presetType, presetId, options)` |  | 275 |
| `ui_photomode_presets.applyPresetPayload(presetType, payload)` |  | 398 |
| `ui_photomode_presets.captureSessionDefaultPresets()` |  | 129 |
| `ui_photomode_presets.deletePreset(presetType, presetId)` |  | 320 |
| `ui_photomode_presets.discoverTemporaryPresets(presetType)` |  | 228 |
| `ui_photomode_presets.getScreenshotPresetBundle()` |  | 462 |
| `ui_photomode_presets.listPresets(presetType)` |  | 213 |
| `ui_photomode_presets.renamePreset(presetType, presetId, name)` |  | 373 |
| `ui_photomode_presets.resetTemporaryPresets()` |  | 58 |
| `ui_photomode_presets.saveCurrentPreset(presetType, name, options)` |  | 245 |
| `ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin)` |  | 436 |
| `ui_photomode_presets.savePresetPayload(presetType, name, payload, origin)` |  | 415 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/presets.lua`.*
