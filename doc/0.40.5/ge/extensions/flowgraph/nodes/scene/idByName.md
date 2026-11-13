# `flowgraph_nodes_scene_idByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/idByName.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/idByName")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « ID by Name » (categorie simple). Retrouve l'id du premier objet de la scene portant un nom (scenetree.findObject). Entree : name (string, cache ; sinon le nom est dans self.data.name). Sorties : objID (number) et exist (bool, cache). L'id trouve est memorise jusqu'au debut/fin de mission ou au demarrage du graphe.

## Remarques

- Une fois l'id trouve, il est conserve meme si le nom du pin change ensuite et que l'objet n'est plus trouve.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie l'id memorise au demarrage du graphe. | 56 |
| `C:drawMiddle(builder, style)` | Affiche le nom et l'id courants au milieu du noeud. | 60 |
| `C:init()` | Nom vide et objID nil. | 24 |
| `C:onClientEndMission()` | Hook de fin de mission : oublie l'id memorise. | 48 |
| `C:onClientStartMission()` | Hook de debut de mission : oublie l'id memorise. | 52 |
| `C:work()` | Utilise le pin name s'il est branche, cherche l'objet et ecrit objID et exist. | 29 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/idByName.lua`.*
