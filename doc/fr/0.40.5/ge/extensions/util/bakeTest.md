# `util_bakeTest`

*Fichier : `lua/ge/extensions/util/bakeTest.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_bakeTest` : `extensions.load("util_bakeTest")`, puis la globale `util_bakeTest`

Outil de développement interne : après le démarrage d'une mission, il lance le « baker » de matériaux GPU (bakeShapeMaterialsPBR) puis l'export glTF (exportShapeToGltf) sur une liste figée de 10 bâtiments du niveau west_coast_usa, pour valider la chaîne de bout en bout. Les résultats (atlas PNG et fichier .gltf) sont écrits dans /temp/bakeTest/<nom>/.

## Exemple

```lua
-lua "extensions.load('util/bakeTest')"
```

## Remarques

- Cuisson en 4096 px avec une marge (gutter) de 16 px. Une attente de 60 frames suit le démarrage de la mission pour laisser les shaders se compiler ; un mesh est traité par frame (onUpdate).
- Un journal [i/n] est écrit pour chaque mesh (OK ou FAIL), puis un bilan « bakeTest DONE: n ok, m failed ».
- Dépend de fonctions moteur globales (bakeShapeMaterialsPBR, exportShapeToGltf) et de fichiers .dae du niveau west_coast_usa.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_bakeTest.onClientPostStartMission()` | Hook appelé après le démarrage d'une mission : arme le traitement et lance une attente de 60 frames. *(interne)* *(hook)* | 50 |
| `util_bakeTest.onUpdate()` | Hook appelé à chaque frame : après l'attente, traite un mesh par frame (cuisson puis export glTF) jusqu'à la fin de la liste. *(interne)* *(hook)* | 55 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/bakeTest.lua`.*
