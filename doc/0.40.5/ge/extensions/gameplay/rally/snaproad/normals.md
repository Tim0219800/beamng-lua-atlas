# `gameplay_rally_snaproad_normals`

*Fichier : `lua/ge/extensions/gameplay/rally/snaproad/normals.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_snaproad_normals` : `extensions.load("gameplay_rally_snaproad_normals")`, puis la globale `gameplay_rally_snaproad_normals`

Petit utilitaire de calcul de normales pour les points d'un snaproad de rallye. À partir d'un point doté de liens prev/next, il calcule le vecteur normal « vers l'avant » en s'appuyant sur les voisins disponibles (rallyUtil.calculateForwardNormal).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_snaproad_normals.forwardNormalVec(point)` | Calcule la normale vers l'avant du point. Utilise prev→next si les deux existent, sinon courant→next, sinon prev→courant ; renvoie nil si aucun voisin n'existe. | 19 |
| `gameplay_rally_snaproad_normals.normalAlignPoints(point)` | Renvoie le triplet (point précédent, point courant, point suivant) d'un point ; renvoie nil, nil, nil si le point est nil. | 9 |

### Détail des paramètres

#### `gameplay_rally_snaproad_normals.forwardNormalVec(point)`

Calcule la normale vers l'avant du point. Utilise prev→next si les deux existent, sinon courant→next, sinon prev→courant ; renvoie nil si aucun voisin n'existe.

- `point` (*table*) : Point avec pos, prev et next
- **renvoie** : vec3|nil Vecteur normal construit à partir de x, y, z du résultat de rallyUtil.calculateForwardNormal

#### `gameplay_rally_snaproad_normals.normalAlignPoints(point)`

Renvoie le triplet (point précédent, point courant, point suivant) d'un point ; renvoie nil, nil, nil si le point est nil.

- `point` (*table|nil*) : Point avec champs prev et next (et pos)
- **renvoie** : table|nil point.prev
- **renvoie** : table|nil le point lui-même
- **renvoie** : table|nil point.next

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/snaproad/normals.lua`.*
