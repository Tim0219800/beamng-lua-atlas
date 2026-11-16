# `flowgraph_nodes_gameplay_race_pathDefaultStartTransform`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Start Transform » (catégorie repeat_instant, tags scenario et race). Donne la transformation d'une position de départ d'un pathData, utile pour créer des triggers personnalisés. Entrées : pathData et name (string ou number : nom ou id de la position ; défaut = defaultStartPosition). Sorties : existing, pos (position décalée vers l'arrière de la moitié de startBoxLength et relevée de la moitié de startBoxHeight, donc centre de la boîte de départ), origPos (position d'origine), rot (quat), scl ({largeur, longueur, hauteur}). Calculé une seule fois (tant que self.path est nil).

## Remarques

- Options data : startBoxWidth = 2, startBoxLength = 5, startBoxHeight = 1.5, useStringMatch = false (si vrai, la première position dont le nom contient la chaîne donnée est utilisée).
- Si la position est absente ou 'missing', existing vaut false et les autres sorties ne sont pas mises à jour.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Oublie le chemin mémorisé. | 36 |
| `C:init(mgr, ...)` | Initialise self.path, désactive clearOutPinsOnStart et définit les options de boîte de départ. | 27 |
| `C:work(args)` | Cherche la position de départ et calcule pos, origPos, rot, scl et existing. | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform.lua`.*
