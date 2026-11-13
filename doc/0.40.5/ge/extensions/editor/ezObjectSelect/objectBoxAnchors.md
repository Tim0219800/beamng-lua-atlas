# `editor_ezObjectSelect_objectBoxAnchors`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua` · VM : Game Engine (GE) · 149 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_objectBoxAnchors` : `extensions.load("editor_ezObjectSelect_objectBoxAnchors")`, puis la globale `editor_ezObjectSelect_objectBoxAnchors`

Calcule des points d'ancrage sur le bas de la boîte englobante d'un objet pour l'outil Easy Select. Trois motifs sont produits : shortEdge (milieu du petit côté, à z min), longEdge (milieu du grand côté) et shortEdgeOrigin (comme shortEdge mais à z = 0 local, au niveau de l'origine). Le « long » axe est X si l'étendue mise à l'échelle en X >= celle en Y. Sert à décrire des arêtes de référence pour le déplacement/aimantation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale)` | Décrit une boîte locale (méthodes getCenter/getExtents et minExtents/maxExtents). Renvoie nil si la boîte n'est pas valide. | 54 |
| `editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale)` | Idem describeBox pour une boîte de mesh simple {minExtents, maxExtents, center, extents}. nil si un champ manque. | 59 |
| `editor_ezObjectSelect_objectBoxAnchors.describeObject(obj)` | Décrit un objet de la scène en coordonnées monde. Utilise getObjBox + getTransform + getScale si possible ; sinon retombe sur la boîte monde getWorldBox. Chaque motif contient first, second, firstOffset, secondOffset, centerOffset (offsets relatifs à la position de l'objet). | 88 |

### Détail des paramètres

#### `editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale)`

Décrit une boîte locale (méthodes getCenter/getExtents et minExtents/maxExtents). Renvoie nil si la boîte n'est pas valide.

- `box` (*table*) : Boîte englobante locale
- `scale` (*vec3|nil*) : Échelle de l'objet (défaut 1,1,1)
- **renvoie** : table|nil {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin}, chaque arête ayant firstLocal/secondLocal

#### `editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale)`

Idem describeBox pour une boîte de mesh simple {minExtents, maxExtents, center, extents}. nil si un champ manque.

- `meshBox` (*table*) : Boîte de mesh
- `scale` (*vec3|nil*) : Échelle (défaut 1,1,1)
- **renvoie** : table|nil Même structure que describeBox

#### `editor_ezObjectSelect_objectBoxAnchors.describeObject(obj)`

Décrit un objet de la scène en coordonnées monde. Utilise getObjBox + getTransform + getScale si possible ; sinon retombe sur la boîte monde getWorldBox. Chaque motif contient first, second, firstOffset, secondOffset, centerOffset (offsets relatifs à la position de l'objet).

- `obj` (*userdata*) : Objet de la scène (doit avoir getPosition)
- **renvoie** : table|nil {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin} ou nil si aucune boîte valide

## Appels vers le moteur (C++)

- `obj:` `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getWorldBox`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua`.*
