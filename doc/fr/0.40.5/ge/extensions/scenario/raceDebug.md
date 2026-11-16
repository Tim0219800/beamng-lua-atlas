# `scenario_raceDebug`

*Fichier : `lua/ge/extensions/scenario/raceDebug.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_raceDebug` : `extensions.load("scenario_raceDebug")`, puis la globale `scenario_raceDebug`

Aide de débogage visuel pour les courses de scénario : calcule le chemin entre les waypoints de lapConfig (map.getPath) et le dessine avec debugDrawer (sphères rouges aux waypoints, prismes verts le long de la route, rouges quand le segment est direct). N'est actif que si l'éditeur est activé et que le réglage BeamNGRaceDrawDebug est vrai.

## Remarques

- Dans onScenarioChange, la variable lastwp n'est pas déclarée local : c'est une globale partagée, jamais réinitialisée entre deux appels.
- Les données debugPath et debugNodes ne servent qu'au dessin ; le commentaire du code interdit de s'en servir pour autre chose.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_raceDebug.onDrawDebug(focusPos)` | Hook de dessin debug appelé à chaque image : dessine les waypoints (sphère de rayon n.radius et libellé 'wp i/N') et le chemin calculé. *(interne)* *(hook)* | 46 |
| `scenario_raceDebug.onScenarioChange(scenario)` | Hook appelé à chaque changement d'état du scénario. Si le scénario est 'running' et possède lapConfig, remplit currentScenario.debugPath (noeuds de la route) et currentScenario.debugNodes. *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `scenario_raceDebug.onDrawDebug(focusPos)`

Hook de dessin debug appelé à chaque image : dessine les waypoints (sphère de rayon n.radius et libellé 'wp i/N') et le chemin calculé.

- `focusPos` (*vec3*) : Position de focus de la caméra (non utilisée).

#### `scenario_raceDebug.onScenarioChange(scenario)`

Hook appelé à chaque changement d'état du scénario. Si le scénario est 'running' et possède lapConfig, remplit currentScenario.debugPath (noeuds de la route) et currentScenario.debugNodes.

- `scenario` (*table*) : Scénario (non utilisé, le scénario courant est relu).

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceDebug.lua`.*
