# `editor_rallyEditor_zSnap`

*Fichier : `lua/ge/extensions/editor/rallyEditor/zSnap.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_zSnap` : `extensions.load("editor_rallyEditor_zSnap")`, puis la globale `editor_rallyEditor_zSnap`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise)` |  | 81 |
| `editor_rallyEditor_zSnap.getCurrentMethod()` |  | 60 |
| `editor_rallyEditor_zSnap.isValidMethod(method)` |  | 47 |
| `editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast)` |  | 73 |
| `editor_rallyEditor_zSnap.noSnappingInPlace(pos)` |  | 24 |
| `editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise)` |  | 77 |
| `editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise)` |  | 51 |
| `editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise)` |  | 69 |
| `editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise)` |  | 36 |
| `editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos)` |  | 28 |
| `editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise)` |  | 56 |
| `editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos)` |  | 65 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMethod` | any |  |
| `methodValues` | table |  |
| `methods` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/zSnap.lua`.*
