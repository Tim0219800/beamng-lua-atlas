# `flowgraph_nodes_ui_updatedUI_startScreenFinish`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Screen Finish » (repeat_instant, couleur ui). Termine la construction d'un écran (début ou fin) et l'envoie à l'UI. Entrée flow (chainFlow), sortie flow. À placer en bout de chaîne après StartScreen Begin / EndScreen Begin et les nœuds de panneaux.

## Remarques

- Le pin de sortie flow n'est jamais écrit par work.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Émet le hook onStartScreenFinishedBuilding puis appelle modules.ui:finishUIBuilding(). | 21 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onStartScreenFinishedBuilding` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish.lua`.*
