# `gameplay_speedTraps`

*Fichier : `lua/ge/extensions/gameplay/speedTraps.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_speedTraps` : `extensions.load("gameplay_speedTraps")`, puis la globale `gameplay_speedTraps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType)` |  | 105 |
| `gameplay_speedTraps.onBeamNGTrigger(data)` | example data<br>  {<br>    event = "enter",<br>    speedLimit = "11.176",<br>    speedTrapLightName = "speedTrapLight1",<br>    speedTrapType = "speed",<br>    subjectID = 46855,<br>    subjectName = "clone0",<br>    triggerEvent = 0,<br>    triggerID = 16584,<br>    triggerName = "speedTrapTrigger1"<br>  } *(hook)* | 45 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRedLightCamTriggered` — écouté par 2 module(s)
- `onSpeedTrapTriggered` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`, `getObjectVelocityXYZ`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/speedTraps.lua`.*
