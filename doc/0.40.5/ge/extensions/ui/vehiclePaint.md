# `ui_vehiclePaint`

*Fichier : `lua/ge/extensions/ui/vehiclePaint.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehiclePaint` : `extensions.load("ui_vehiclePaint")`, puis la globale `ui_vehiclePaint`

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehiclePaint.changeData(change, index)` |  | 91 |
| `ui_vehiclePaint.onExtensionLoaded()` | *(hook)* | 82 |
| `ui_vehiclePaint.onUpdate()` | *(hook)* | 41 |
| `ui_vehiclePaint.show()` |  | 78 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `ui_imgui.` `BoolPtr`, `FloatPtr`, `SliderFloat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehiclePaint.lua`.*
