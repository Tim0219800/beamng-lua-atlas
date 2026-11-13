# `ui_oneshotRaceSelector_core`

*Fichier : `lua/ge/extensions/ui/oneshotRaceSelector/core.lua` · VM : Game Engine (GE) · 246 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_oneshotRaceSelector_core` : `extensions.load("ui_oneshotRaceSelector_core")`, puis la globale `ui_oneshotRaceSelector_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_oneshotRaceSelector_core.createBackend(descriptor)` | descriptor contract:<br>   backendName: string<br>   middlePathKey: "tracks" \| "routes" - path.keys[1] for the drilldown level<br>   levelListTitleKey, middleListTitleKey: translation ids<br>   getLevels(): array of level tables<br>   findLevel(levelName): optional override; defaults to scanning getLevels()<br>   getMiddleItems(level): array of track/route tables for a level<br>   middleName(middle): stable key for a track/route within its level<br>   levelDisplayName(level), middleDisplayName(middle): already-_tr()'d names<br>   levelToTile(level), middleToTile(middle, levelName): grid tile tables<br>   getLevelDetails(level), getMiddleDetails(middle, levelName): getDetails() payloads | 42 |
| `ui_oneshotRaceSelector_core.difficultyLabel(value)` |  | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/oneshotRaceSelector/core.lua`.*
