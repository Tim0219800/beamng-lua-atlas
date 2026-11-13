# `ui_busRouteSelector_general`

*Fichier : `lua/ge/extensions/ui/busRouteSelector/general.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_busRouteSelector_general` : `extensions.load("ui_busRouteSelector_general")`, puis la globale `ui_busRouteSelector_general`

Backend du sélecteur en grille de l'assistant Vue « BusRoute ». Décrit via un descripteur les niveaux ayant des lignes de bus (scenario_scenariosLoader.getLevels('bus')) et, par niveau, la liste de ses lignes, puis délègue à ui/oneshotRaceSelector/core.createBackend(descriptor). Toutes les fonctions publiques du backend généré sont copiées dans M.

## Remarques

- Les lignes n'ont pas de champ id : le nom affiché de la ligne (route.name) sert de clé, comme l'ancien service Angular BusRouteService pour les highscores et la navigation.
- Le fichier n'exporte aucune fonction écrite localement : l'API réelle (fonctions copiées depuis le backend) est définie dans oneshotRaceSelector/core.
- Le descripteur fournit tuiles de niveau (clé levelName, nombre de lignes), tuiles de ligne et panneaux de détails (taille du niveau, nombre d'arrêts, difficulté, date de création).

**Dépendances (chargées avant) :** `scenario_scenariosLoader`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"scenario_scenariosLoader"} : extension chargée avant celle-ci. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/busRouteSelector/general.lua`.*
