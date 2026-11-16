# `editor_missionEditor_startTrigger`

*Fichier : `lua/ge/extensions/editor/missionEditor/startTrigger.lua` · VM : Game Engine (GE) · 218 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/startTrigger")` (fichier sous extensions/ mais pas une extension classique)

Panneau « StartTrigger » de l'éditeur de missions. Il édite mission.startTrigger : type « coordinates » (niveau + position, rotation et rayon éditables avec un gizmo, dessinés avec debugDrawer), « league » (démarrable depuis l'écran de progression de la carrière dans un niveau donné) ou « none ». Changer de type mémorise les valeurs précédentes de chaque type. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Valeurs par défaut d'un nouveau déclencheur : coordinates = {level = 'gridmap', pos = {0,0,0}, radius = 3, rot = {0,0,0,1}} ; league = {level = 'gridmap'}.
- Le gizmo et le dessin (sphère rouge, prismes) ne sont actifs que si getCurrentLevelIdentifier() égale startTrigger.level.
- L'échelle de l'assistant de transformation sert de rayon (radius) ; pos et rot sont stockés sous forme de tables.
- Les types « automatic », « world » et « level » existent dans newStartTrigger mais pas dans startTriggerTypes (non proposés dans le combo).

## Classe `C`

Instance du panneau. Champs : missionEditor, name = 'StartTrigger', mission, fields, sortedLevels (niveaux triés).

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_startTrigger")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine le combo de type de déclencheur puis l'éditeur du type choisi (niveau, position, rayon). | 158 |
| `C:getStartTriggerTransform()` | Renvoie l'assistant de transformation si le niveau courant est celui du déclencheur. | 203 |
| `C:init(missionEditor)` | Constructeur : liste et trie les niveaux (getAllLevelIdentifiers). | 136 |
| `C:setMission(mission)` | Définit la mission, réinitialise les champs, arrête le gizmo et le repositionne si le déclencheur est de type coordinates. | 147 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/startTrigger.lua`.*
