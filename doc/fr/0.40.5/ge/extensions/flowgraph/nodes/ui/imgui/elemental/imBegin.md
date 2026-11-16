# `flowgraph_nodes_ui_imgui_elemental_imBegin`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imBegin")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Begin » (catégorie repeat_instant, tag imgui) : ouvre une fenêtre imgui (à terminer avec « im End »). Entrées : « title » (sans titre = barre de titre masquée), « width » (200), « height » (150), « posX », « posY » (100), « anchor » (TL, TR, BL, BR : coin de référence de la fenêtre par rapport à la fenêtre du jeu). Sortie « wasClosed » (impulsion quand l'utilisateur ferme la fenêtre).

## Remarques

- Taille et position ne sont appliquées qu'une fois (flag done) ; ensuite la fenêtre est librement déplaçable.
- Si anchor est nil, il vaut 100 dans le code (faute : valeur numérique) et aucune position n'est appliquée.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | done = false et sorties à false. | 33 |
| `C:init()` | done = false. | 27 |
| `C:work()` | Fixe taille/position (une seule fois, via l'ancre) puis appelle im.Begin et écrit wasClosed. | 41 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua`.*
