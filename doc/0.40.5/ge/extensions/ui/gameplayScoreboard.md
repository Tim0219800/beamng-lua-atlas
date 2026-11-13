# `ui_gameplayScoreboard`

*Fichier : `lua/ge/extensions/ui/gameplayScoreboard.lua` · VM : Game Engine (GE) · 172 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplayScoreboard` : `extensions.load("ui_gameplayScoreboard")`, puis la globale `ui_gameplayScoreboard`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplayScoreboard.clear()` |  | 86 |
| `ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex)` |  | 100 |
| `ui_gameplayScoreboard.getPlayers()` |  | 147 |
| `ui_gameplayScoreboard.isActive()` |  | 96 |
| `ui_gameplayScoreboard.pulsePlayerColor(playerId, color)` |  | 137 |
| `ui_gameplayScoreboard.setLocalMPClientId(id)` |  | 142 |
| `ui_gameplayScoreboard.setPlayerColor(playerId, color)` |  | 115 |
| `ui_gameplayScoreboard.setPlayerName(playerId, name)` |  | 110 |
| `ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle)` | @param _scoreboardStyle table  the style definition for the scoreboard UI | 152 |
| `ui_gameplayScoreboard.updatePlayerScores(playerId, scores)` |  | 121 |
| `ui_gameplayScoreboard.updatePlayerStatus(playerId, status)` |  | 130 |

**Évènements UI (guihooks.trigger) :** `scoreboardPlayerPulseColor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplayScoreboard.lua`.*
