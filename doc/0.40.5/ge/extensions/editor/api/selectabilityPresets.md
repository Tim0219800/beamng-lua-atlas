# `editor_api_selectabilityPresets`

*Fichier : `lua/ge/extensions/editor/api/selectabilityPresets.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_selectabilityPresets` : `extensions.load("editor_api_selectabilityPresets")`, puis la globale `editor_api_selectabilityPresets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_selectabilityPresets.applyPreset(presetId, persist, owner)` |  | 72 |
| `editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel)` |  | 83 |
| `editor_api_selectabilityPresets.drawControls()` |  | 163 |
| `editor_api_selectabilityPresets.endScope(owner)` |  | 102 |
| `editor_api_selectabilityPresets.getActivePresetId()` |  | 155 |
| `editor_api_selectabilityPresets.getActivePresetLabel()` |  | 159 |
| `editor_api_selectabilityPresets.getScopeOwner()` |  | 120 |
| `editor_api_selectabilityPresets.initialize()` |  | 68 |
| `editor_api_selectabilityPresets.isScoped()` |  | 124 |
| `editor_api_selectabilityPresets.markCurrent()` |  | 128 |
| `editor_api_selectabilityPresets.syncActivePresetFromMask()` |  | 134 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getObjectClassNames`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/selectabilityPresets.lua`.*
