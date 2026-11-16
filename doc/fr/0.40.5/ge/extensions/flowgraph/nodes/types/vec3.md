# `flowgraph_nodes_types_vec3`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/vec3.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/vec3")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Vec3 » (catégorie repeat_instant, tags vec3/vector/direction) : construit un vecteur 3D. Entrées number « x », « y », « z » (0 par défaut) ; entrée cachée « rot » (quat) : si elle est reliée, la sortie « value » est le vecteur (0,1,0) tourné par ce quaternion (direction avant). Sortie « value » (vec3 sous forme de table {x,y,z}).

## Remarques

- Si 'rot' a une valeur, x/y/z sont ignorés.
- drawMiddle affiche le vecteur construit à partir de x/y/z (même si rot est utilisé).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Vide. | 48 |
| `C:_onSerialize(res)` | Vide (rien à sauvegarder). | 45 |
| `C:drawMiddle(builder, style)` | Affiche le texte du vecteur (x,y,z) au centre du nœud. | 37 |
| `C:drawProperties()` | Vide. | 42 |
| `C:work()` | Calcule la sortie : direction (0,1,0) tournée par 'rot' si présent, sinon {x,y,z}. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/vec3.lua`.*
