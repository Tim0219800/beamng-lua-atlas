# `career_modules_debug_missionDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/missionDebug.lua` · VM : Game Engine (GE) · 21 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_missionDebug` : `extensions.load("career_modules_debug_missionDebug")`, puis la globale `career_modules_debug_missionDebug`

Onglet de debug carrière « Missions ». Deux entrées : '> Reload Missions' (gameplay_missions_missions.reloadCompleteMissionSystem) et '> Make All Missions Startable' (force startable et visible sur toutes les missions via gameplay_missions_unlocks.overrideStartable/overrideVisible puis vide gameplay_rawPois).

## Remarques

- Outil de développement ; debugOrder = 3 (même valeur que organizationsDebug).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_missionDebug.drawDebugFunctions()` | Dessine les deux entrées de menu de debug des missions (rechargement, déblocage de toutes les missions). *(interne)* | 9 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Missions'. |
| `debugOrder` | number | Ordre de tri (3). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/missionDebug.lua`.*
