# `editor_vehicleEditor_veToolbar`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua` · VM : Game Engine (GE) · 377 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_veToolbar` : `extensions.load("editor_vehicleEditor_veToolbar")`, puis la globale `editor_vehicleEditor_veToolbar`

**Dépendances (chargées avant) :** `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_veToolbar.onEditorGuiToolBar()` | *(hook)* | 262 |
| `editor_vehicleEditor_veToolbar.onEditorInitialized()` | *(hook)* | 353 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorGuiEditModeToolbar`

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/veToolbar.lua`.*
