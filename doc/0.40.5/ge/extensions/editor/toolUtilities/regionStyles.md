# `editor_toolUtilities_regionStyles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/regionStyles.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_regionStyles` : `extensions.load("editor_toolUtilities_regionStyles")`, puis la globale `editor_toolUtilities_regionStyles`

Style de peinture de marquage routier pour une région. Pour l'instant une seule région est définie : USA (circulation à droite). Donne les matériaux et largeurs des lignes centrales, de voie, de rive, d'arrêt et de cédez-le-passage, ainsi que de la zone de séparation hachurée.

## Remarques

- Le cédez-le-passage (dents de requin) n'existe pas comme matériau DecalRoad : c'est une barre blanche pleine.
- getRegion ignore tout argument et renvoie toujours la table USA.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_regionStyles.getRegion()` | Renvoie la table de style de marquage de la région courante (toujours USA) : centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen. | 25 |

### Détail des paramètres

#### `editor_toolUtilities_regionStyles.getRegion()`

Renvoie la table de style de marquage de la région courante (toujours USA) : centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen.

- **renvoie** : table Table de style (matériaux en string, largeurs et longueurs de texture en mètres).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/regionStyles.lua`.*
