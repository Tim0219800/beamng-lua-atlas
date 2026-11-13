# `gameplay_rally_starThresholds`

*Fichier : `lua/ge/extensions/gameplay/rally/starThresholds.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_starThresholds` : `extensions.load("gameplay_rally_starThresholds")`, puis la globale `gameplay_rally_starThresholds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm)` | baselineSeconds: authored reference time; lengthKm: stage race distance.<br> Missing/zero length -> pace-only (no reset headroom). | 39 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `bronzePaceMult` | number |  |
| `bronzeResetsPerKm` | number | ~2 resets on the shortest (~2.2 km) stages |
| `goldMult` | number | Pace multipliers (clean-run targets, x baseline). Gold is intentionally tight. |
| `perResetSeconds` | number | Time added per reset for the tier headroom: flat recovery clock (~5s) plus the<br> typical accel/momentum loss (~3.5s). A single constant on purpose (per-stage<br> variance is negligible). |
| `silverPaceMult` | number |  |
| `silverResetsPerKm` | number | Reset tolerance (resets per km) forgiven at each tier. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/starThresholds.lua`.*
