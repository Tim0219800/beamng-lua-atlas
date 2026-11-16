# `editor_aiViz`

*Fichier : `lua/ge/extensions/editor/aiViz.lua` · VM : Game Engine (GE) · 410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_aiViz` : `extensions.load("editor_aiViz")`, puis la globale `editor_aiViz`

Visualisation du navgraph de l'IA dans l'éditeur. Quand un mode de dessin est actif, dessine les nœuds de la carte de navigation (map.getMap().nodes) sous forme de sphères, les liens (prismes colorés selon le mode), les voies et flèches de sens (lanes ou oneWay), et surligne le nœud ou le lien survolé par la souris. Quatre modes exclusifs : drivability, type (public/private), speedLimit et hiddenInNavi. Les liens proches (moins de 100 m en distance de chemin depuis le nœud survolé) sont aussi tracés en vert. Les nœuds sont indexés dans un quadtree.

## Exemple

```lua
editor_aiViz.enableDrawMode("speedLimit", true)
print(editor_aiViz.getDrawMode())
```

## Remarques

- enableDrawMode désactive les autres modes quand on en active un ; avec un mode inconnu, une erreur est loggée.
- Couleurs : drivability en arc-en-ciel (valeur bornée 0-1), speedLimit borné à 0-36 m/s, texte du lien en g ou « m/s » (valeur en m/s).
- Les nœuds ne sont pas dessinés en sphère quand le mode d'édition courant est « Edit Road ».
- Les listes de nœuds sont rechargées après le hook onNavgraphReloaded.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_aiViz.enableDrawMode(mode, enabled)` | Active ou désactive un mode de dessin ; activer un mode désactive les autres. | 389 |
| `editor_aiViz.getDrawMode()` | Retourne le mode de dessin actif. | 401 |
| `editor_aiViz.onEditorGui()` | Hook de dessin de l'éditeur : gère le survol (rayon caméra/souris contre nœuds et liens) et dessine les nœuds proches de la caméra selon le mode. *(interne)* *(hook)* | 305 |
| `editor_aiViz.onNavgraphReloaded()` | Hook émis quand le navgraph est rechargé : vide le cache de nœuds et reconstruit le quadtree. *(interne)* *(hook)* | 300 |

### Détail des paramètres

#### `editor_aiViz.enableDrawMode(mode, enabled)`

Active ou désactive un mode de dessin ; activer un mode désactive les autres.

- `mode` (*string*) : "drivability", "type", "speedLimit" ou "hiddenInNavi".
- `enabled` (*boolean*) : Activer ou désactiver.

#### `editor_aiViz.getDrawMode()`

Retourne le mode de dessin actif.

- **renvoie** : string|nil Nom du mode ou nil si rien n'est dessiné.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/aiViz.lua`.*
