# `flowgraph_nodes_scene_sevensegmentDisplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/sevensegmentDisplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Sevensegment Display » (repeat_instant, auteur BeamNG). Crée un afficheur sept segments composé de TSStatic (art/shapes/quarter_mile_display/display_*.dae) à la position/rotation données et y affiche le nombre du pin number. Réglages dans self.data : mode ('number', 'minutes', 'hours'), scaling, count (5 chiffres), decimals (3), decimalOffset, spacing, shapeFolder, showLeadingZeroes. Sortie : number.

## Remarques

- Le pin de sortie number n'est jamais écrit.
- Les modes 'hours' et 'number' n'ont pas de logique distincte : seul 'minutes' ajoute les deux points.
- Si le pin number est nil, updateNumbers échoue (division de nil).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie le dernier nombre affiché. | 135 |
| `C:_executionStopped()` | Supprime les objets à l'arrêt. | 131 |
| `C:clearObjects()` | Supprime tous les objets créés et remet spawned à false. | 139 |
| `C:createObjects(objectName)` | Crée les chiffres (shape '8'), le point décimal et, en mode minutes, les deux points. | 42 |
| `C:destroy()` | Appelé à la destruction du noeud : nettoie les objets créés. | 169 |
| `C:init(mgr, ...)` | Initialise les réglages par défaut (mode 'minutes', count 5, decimals 3, spacing 5...). | 27 |
| `C:makeDot(offset, name)` | Crée un TSStatic de point (shape 'period') décalé par rapport à la position de base. | 81 |
| `C:onClientEndMission()` | Hook de fin de mission : nettoie les objets créés par le noeud. | 165 |
| `C:updateNumbers()` | Change la shape de chaque chiffre selon le nombre courant ; efface les zéros de tête si showLeadingZeroes est faux. | 101 |
| `C:work()` | Sur clear, supprime l'afficheur ; sinon le crée si besoin et met à jour les chiffres si le nombre a changé. | 152 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`, `postApply`, `preApply`, `setField`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua`.*
