# `editor_roadArchitect_terraform`

*Fichier : `lua/ge/extensions/editor/roadArchitect/terraform.lua` · VM : Game Engine (GE) · 741 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_terraform` : `extensions.load("editor_roadArchitect_terraform")`, puis la globale `editor_roadArchitect_terraform`

Modifie le terrain (TerrainBlock) pour l'adapter aux routes du Road Architect : aplanit le terrain sous une route ou un réseau de routes (avec un domaine d'influence et une marge), calcule des masques de routes, et importe/exporte la heightmap en PNG 16 bits. Utilisé par l'interface du Road Architect et par l'import de réseaux routiers. Toutes les fonctions sortent sans rien faire si la scène n'a pas de TerrainBlock (ex. smallgrid).

## Exemple

```lua
local tf = extensions.editor_roadArchitect_terraform
tf.terraformMultiRoads(30, 1.0, nil)  -- tout le réseau, domaine d'influence 30 m, marge 1 m
```

## Remarques

- Le domaine d'influence (DOI) est borné à un minimum de 5 m (max(5, DOI)).
- Un callback d'annulation (terraformUndo) existe en interne pour restaurer les hauteurs modifiées.
- conformTerrainToRoad et terraformMultiRoads utilisent un TerrainEditor de repli (TerrainEditor()) si l'éditeur de terrain n'est pas ouvert ; writeHeightmapToPng, setHeightmapFromPng et getRoadMasks exigent extensions.editor_terrainEditor et sortent sinon.
- setHeightmapFromPng : si le chargement du PNG échoue, le code logue une erreur mais continue quand même la boucle d'application (pas de return) ; la bitmap utilisée n'est alors pas valide.
- writeHeightmapToPng renvoie {} quand il n'y a pas de terrain, et rien sinon (valeur de retour incohérente).
- Le PNG est en GFXFormatR16 ; l'échelle va de la hauteur de base du terrain (tb:getPosition().z) à tb.maxHeight.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin)` | Aplanit le terrain local pour qu'il épouse une route : calcule les quads de la route, un masque et des hauteurs fixées, moyenne avec les voisins puis écrit le terrain. L'emprise est la boîte 2D de la route agrandie du DOI. | 303 |
| `editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group)` | Calcule deux masques sur la grille du terrain : un masque des routes seules (valeur 65535 là où une route couvre le point, dilaté de 1 case) et un masque routes + marge (dilatation par margin). | 672 |
| `editor_roadArchitect_terraform.setHeightmapFromPng(path)` | Applique une heightmap PNG au terrain (case par case) puis met à jour la grille du TerrainBlock. | 632 |
| `editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group)` | Modèle le terrain sur tout le réseau routier, ou sur le groupe indiqué. Recalcule d'abord tous les renderData. N'inclut ni overlays ni ponts. | 451 |
| `editor_roadArchitect_terraform.writeHeightmapToPng(path)` | Enregistre la heightmap du terrain dans un fichier PNG 16 bits (hauteurs négatives ramenées à 0). | 604 |

### Détail des paramètres

#### `editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin)`

Aplanit le terrain local pour qu'il épouse une route : calcule les quads de la route, un masque et des hauteurs fixées, moyenne avec les voisins puis écrit le terrain. L'emprise est la boîte 2D de la route agrandie du DOI.

- `rIdx` (*integer*) : Indice de la route dans roads.
- `DOI` (*number*) : Domaine d'influence (distance de fondu), en mètres, minimum 5.
- `margin` (*number*) : Marge autour de la route (déduit du code : dilatation du masque).

#### `editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group)`

Calcule deux masques sur la grille du terrain : un masque des routes seules (valeur 65535 là où une route couvre le point, dilaté de 1 case) et un masque routes + marge (dilatation par margin).

- `DOI` (*number*) : Domaine d'influence, en mètres (minimum 5) ; sert à étendre la boîte de recherche.
- `margin` (*integer*) : Nombre de cases de dilatation du masque de marge (déduit du code).
- `group` (*table|nil*) : Groupe placé, ou nil pour toutes les routes.
- **renvoie** : table<integer, table<integer, number>>|nil Masque des routes indexé [x][y] (0 ou 65535) ; nil s'il n'y a pas de terrain.
- **renvoie** : table<integer, table<integer, number>> Masque routes + marge.

#### `editor_roadArchitect_terraform.setHeightmapFromPng(path)`

Applique une heightmap PNG au terrain (case par case) puis met à jour la grille du TerrainBlock.

- `path` (*string*) : Chemin du PNG.

#### `editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group)`

Modèle le terrain sur tout le réseau routier, ou sur le groupe indiqué. Recalcule d'abord tous les renderData. N'inclut ni overlays ni ponts.

- `DOI` (*number*) : Domaine d'influence, en mètres (minimum 5).
- `margin` (*number*) : Marge autour des routes (déduit du code).
- `group` (*table|nil*) : Groupe placé, ou nil pour tout le réseau.

#### `editor_roadArchitect_terraform.writeHeightmapToPng(path)`

Enregistre la heightmap du terrain dans un fichier PNG 16 bits (hauteurs négatives ramenées à 0).

- `path` (*string*) : Chemin du fichier .png à écrire.
- **renvoie** : table|nil {} s'il n'y a pas de terrain, sinon nil.

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/terraform.lua`.*
