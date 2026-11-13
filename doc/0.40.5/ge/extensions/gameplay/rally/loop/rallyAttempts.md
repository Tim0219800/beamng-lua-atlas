# `gameplay_rally_loop_rallyAttempts`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_rallyAttempts` : `extensions.load("gameplay_rally_loop_rallyAttempts")`, puis la globale `gameplay_rally_loop_rallyAttempts`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType)` | Public API: Create and save an abandon attempt<br> @param dnfType: Type of DNF - "restart" or "abandon"<br> @return totalChange: The aggregate change result from the attempt | 85 |
| `gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr)` | Public API: Create and save a normal attempt<br> @return totalChange: The aggregate change result from the attempt<br> @return attempt: The created attempt object | 66 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua`.*
