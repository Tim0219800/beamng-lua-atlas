# `editor_roadArchitect_tunnelMesh`

*Fichier : `lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua` · VM : Game Engine (GE) · 410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_tunnelMesh` : `extensions.load("editor_roadArchitect_tunnelMesh")`, puis la globale `editor_roadArchitect_tunnelMesh`

Génère les tunnels automatiques du Road Architect : un maillage procédural (ProceduralMesh) en forme de tube autour de la route, et il perce la holemap du terrain pour que le tunnel traverse le relief. À la suppression du tunnel, il restaure la holemap d'origine. Appelé par roads.finalise (création) et unfinalise/removeAll (suppression).

## Remarques

- Les maillages sont stockés par indice de route puis par nom de tunnel ; l'API est donc basée sur l'indice de route (et non sur le nom).
- createTunnel modifie la holemap du terrain (editHolemap) ; tryRemove la rétablit (recoverHolemap) : toujours supprimer le tunnel par tryRemove pour ne pas laisser de trous.
- Les paramètres du tunnel viennent de la route : radGran, radOffset, thickness, zOffsetFromRoad, protrudeS/E, extraS/E.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder)` | Crée le maillage procédural du tunnel à partir du renderData de la route (centre et bords latéraux, section circulaire) et perce la holemap du terrain le long du tunnel. | 200 |
| `editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name)` | Si le tunnel existe : restaure la holemap, supprime l'objet maillage et oublie l'entrée. | 393 |

### Détail des paramètres

#### `editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder)`

Crée le maillage procédural du tunnel à partir du renderData de la route (centre et bords latéraux, section circulaire) et perce la holemap du terrain le long du tunnel.

- `roadIdx` (*integer*) : Indice de la route dans roads.
- `name` (*string*) : Nom du tunnel (clé dans la table des maillages).
- `rData` (*table*) : renderData de la route.
- `tunnel` (*table*) : Description du tunnel (indices de début s et de fin e, etc.).
- `folder` (*userdata*) : SimGroup de scène qui reçoit le maillage.

#### `editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name)`

Si le tunnel existe : restaure la holemap, supprime l'objet maillage et oublie l'entrée.

- `roadIdx` (*integer*) : Indice de la route.
- `name` (*string|nil*) : Nom du tunnel ; ne fait rien si nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua`.*
