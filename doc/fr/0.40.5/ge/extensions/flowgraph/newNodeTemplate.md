# `flowgraph_newNodeTemplate`

*Fichier : `lua/ge/extensions/flowgraph/newNodeTemplate.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/newNodeTemplate")` (fichier sous extensions/ mais pas une extension classique)

Modèle de départ pour écrire un nouveau nœud flowgraph (nom « New Node Template »). Il montre comment déclarer name, description, couleur/icône/catégorie/tags (en commentaires) et un C.pinSchema contenant un exemple de pin d'entrée et de sortie pour chaque type : flow, number, bool, string, vec3, quat, color, table, any et un pin à types multiples ({'number','bool'}). La méthode work() est vide. À copier par un moddeur, pas utilisé en jeu.

## Remarques

- Les pins de sortie de type table déclarent tableType = 'generic'.
- Valeurs par défaut montrées : number 42, bool true, string 'Text', vec3 {1,2,3}, quat {0,0,0,1}, color {1,1,1,0.5}.
- Le fichier se termine par return _flowgraph_createNode(C).

## Classe `C`

Classe du nœud modèle.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelée à chaque frame où le nœud est actif ; vide dans le modèle. C'est là qu'on lit les pins d'entrée (self.pinIn.x.value) et écrit les sorties. | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/newNodeTemplate.lua`.*
