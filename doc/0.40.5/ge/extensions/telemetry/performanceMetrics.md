# `telemetry_performanceMetrics`

*Fichier : `lua/ge/extensions/telemetry/performanceMetrics.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceMetrics` : `extensions.load("telemetry_performanceMetrics")`, puis la globale `telemetry_performanceMetrics`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceMetrics.getLimitedBy()` | A ceiling the player chose. Without it a reading held at 60 looks like a machine that<br> cannot reach it. | 23 |
| `telemetry_performanceMetrics.isFocused()` |  | 17 |
| `telemetry_performanceMetrics.readAvailable(name)` |  | 12 |
| `telemetry_performanceMetrics.readNumber(name)` |  | 7 |

## Appels vers le moteur (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceMetrics.lua`.*
