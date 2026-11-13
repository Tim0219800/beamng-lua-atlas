# `editor_toolUtilities_fitPoly`

*Fichier : `lua/ge/extensions/editor/toolUtilities/fitPoly.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_fitPoly` : `extensions.load("editor_toolUtilities_fitPoly")`, puis la globale `editor_toolUtilities_fitPoly`

Utilitaire qui ordonne un ensemble non ordonné d'objets en une polyligne. Pour chaque point de départ possible, il construit un chemin glouton (point le plus proche, bonus si la direction continue), puis garde le chemin au meilleur score (lissé de direction, longueur courte). Utile aux outils de l'éditeur qui reçoivent des objets sélectionnés sans ordre.

## Exemple

```lua
local fitPoly = require('editor/toolUtilities/fitPoly')
local ordered = fitPoly.fitPoly(components) -- components[i].obj:getPosition()
```

## Remarques

- Distance maximale entre deux points voisins : 50 m (constante maxDist) ; au-delà, les points ne sont pas chaînés et les points restants sont ajoutés à la fin du chemin dans l'ordre d'origine.
- Complexité O(n^3) environ (chaque départ, chaque pas parcourt tous les points) : prévu pour de petits ensembles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_fitPoly.fitPoly(components)` | Réordonne les composants pour former la meilleure polyligne. Chaque composant doit avoir un champ obj avec getPosition(). Renvoie components tel quel s'il y en a moins de deux. | 118 |

### Détail des paramètres

#### `editor_toolUtilities_fitPoly.fitPoly(components)`

Réordonne les composants pour former la meilleure polyligne. Chaque composant doit avoir un champ obj avec getPosition(). Renvoie components tel quel s'il y en a moins de deux.

- `components` (*table[]*) : Liste de tables { obj = objet avec getPosition() }.
- **renvoie** : table[] Nouvelle liste des mêmes composants, dans l'ordre de la polyligne.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/fitPoly.lua`.*
