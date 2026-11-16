# `flowgraph_nodes_vehicle_touchingStatic`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/touchingStatic")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Static Object Touch » (catégorie `repeat_instant`, tags collision/static). Détecte une intersection du véhicule avec des objets statiques ou le terrain, par rayons (`castRayStatic`) lancés depuis le centre vers 8 points (FL, F, FR, R, BR, B, BL, L) de l'OOBB, décalés. Pins d'entrée : `vehId`, `widthOffset`, `lengthOffset`, `heightOffset` (défaut 0,5), `debugMode`. Sorties : `touching`, flux `touchFL/F/FR/R/BR/B/BL/L` (cachés), `isTouching`.

## Remarques

- Pas de flux d'entrée ni de sortie `flow` : seulement les sorties de touches.
- Debug : sphères rouge (touché) ou verte dessinées dans `onPreRender`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Crée les 8 points et les vecteurs de travail. | 42 |
| `C:_executionStopped()` | Libère les points et réinitialise les sorties. | 47 |
| `C:init()` | Constructeur ; appelle `reset`. | 38 |
| `C:onPreRender()` | Hook de rendu : dessine les sphères de debug si `debugMode` est actif. | 101 |
| `C:reset()` | Met toutes les sorties à false et désactive le nœud. | 52 |
| `C:work()` | Calcule les 8 points, lance les rayons et remplit les sorties. | 59 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua`.*
