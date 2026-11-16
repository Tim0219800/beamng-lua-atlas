# `flowgraph_nodes_career_menuClosed`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/menuClosed")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Menu Closed » (catégorie repeat_instant, couleur/icône ui). Impulsion d'une frame sur la sortie menuClosed quand un menu a été fermé et que le joueur est de retour en jeu (hook onUIPlayStateChanged avec enteredPlay vrai).

## Remarques

- Sa description dans le jeu est « Util Helper for Garage tutorial » (copier-coller).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 19 |
| `C:onUIPlayStateChanged(enteredPlay)` | Hook : si le joueur est revenu en état de jeu, lève le drapeau menuClosed. | 31 |
| `C:work(args)` | Chaque frame : menuClosed à faux, applique puis efface les drapeaux. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua`.*
