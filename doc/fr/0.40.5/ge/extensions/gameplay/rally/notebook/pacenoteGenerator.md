# `gameplay_rally_notebook_pacenoteGenerator`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_pacenoteGenerator` : `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, puis la globale `gameplay_rally_notebook_pacenoteGenerator`

Générateur simple de pacenotes : à partir d'une liste de points de la ligne de conduite (driveline), il détecte les virages gauche/droite en calculant, pour chaque point, le cercle passant par trois points (le point et ceux situés `lookAheadContext` indices avant/après, en 2D). Les zones quasi droites sont filtrées, puis les segments consécutifs de même direction sont fusionnés. Sert à l'outil de génération de l'éditeur de rallye.

## Exemple

```lua
local gen = require('gameplay_rally_notebook_pacenoteGenerator')
local res = gen.detectCorners(drivelinePoints, { straightThreshold = 8 })
for _, c in ipairs(res.corners) do print(c.direction, c.angle, c.length) end
```

## Remarques

- Direction : " right" ou " left" (avec espace initial) pour un virage, "" pour un tronçon droit. Angle en degrés : positif = droite, négatif = gauche.
- detectCorners complète la table params passée en argument (elle est modifiée en place avec les valeurs par défaut).
- Les deux premiers/derniers points ne reçoivent aucune donnée de direction ; la découpe en virages s'arrête 3 points avant la fin de la liste.
- Si pointList est nil ou a moins de 3 points : log 'E' et résultat { sections = {}, corners = {} }.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params)` | Détecte les virages le long d'une ligne de conduite. Renvoie `sections` (tous les tronçons, droits inclus, pour le dessin de débogage) et `corners` (seulement ceux ayant une direction, candidats à une pacenote). Chaque section contient pos, posEnd, direction, angle, length et nodes. | 218 |

### Détail des paramètres

#### `gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params)`

Détecte les virages le long d'une ligne de conduite. Renvoie `sections` (tous les tronçons, droits inclus, pour le dessin de débogage) et `corners` (seulement ceux ayant une direction, candidats à une pacenote). Chaque section contient pos, posEnd, direction, angle, length et nodes.

- `pointList` (*table*) : Liste de points : tables avec un champ .pos, ou directement des vec3.
- `params` (*table|nil*) : Surcharge de defaultParams (lookAheadContext, straightThreshold, mergeDistanceThreshold, maxSimplifyIterations).
- **renvoie** : table { sections = table[], corners = table[] }.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultParams` | table | Paramètres par défaut : lookAheadContext = 7 (nombre de points avant/après pour le cercle), straightThreshold = 5.0 (angle en degrés sous lequel un tronçon est considéré droit), mergeDistanceThreshold = 0.2 (m, distance à la droite pour fusionner des tronçons droits), maxSimplifyIterations = 10. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua`.*
