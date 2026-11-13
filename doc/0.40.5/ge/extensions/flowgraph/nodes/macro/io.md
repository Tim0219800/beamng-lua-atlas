# `flowgraph_nodes_macro_io`

*Fichier : `lua/ge/extensions/flowgraph/nodes/macro/io.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/macro/io")` (fichier sous extensions/ mais pas une extension classique)

Noeud macro 'I/O' (cache, non supprimable) : sert de passerelle entre un sous-graphe (macro) et son graphe parent. ioType vaut 'in' (entrees du sous-graphe, pins de sortie personnalisables) ou 'out' (sorties, pins d'entree personnalisables). Le noeud 'out' demande au noeud Integrated de mettre a jour ses pins.

## Remarques

- Une partie de drawMiddle est du code commente (bloc --[[ ]]) ; le fichier contient donc des restes d'une ancienne mise en surbrillance.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Relit nom, couleur et ioType et autorise les pins personnalises dans le bon sens. | 35 |
| `C:_onSerialize(res)` | Sauvegarde nom, couleur et ioType (erreur journalisee si ioType est resté 'io'). | 24 |
| `C:doubleClicked()` | Selectionne le graphe cible dans l'editeur. | 71 |
| `C:drawMiddle(builder, style)` | Affiche le nom du graphe cible et un apercu au survol. | 47 |
| `C:init()` | savePins=true, ioType='io' (doit devenir 'in' ou 'out'), ignoreAsRoot=true. | 17 |
| `C:work()` | Pour un noeud 'out' : appelle integratedNode:updatePins(). | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/macro/io.lua`.*
