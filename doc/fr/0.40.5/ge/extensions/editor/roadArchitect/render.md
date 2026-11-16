# `editor_roadArchitect_render`

*Fichier : `lua/ge/extensions/editor/roadArchitect/render.lua` · VM : Game Engine (GE) · 1248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_render` : `extensions.load("editor_roadArchitect_render")`, puis la globale `editor_roadArchitect_render`

Rendu de debug (utils/debugDraw et debugDrawer) de tout ce que Road Architect affiche dans la vue 3D : surface et contour des routes, ligne de référence, guides, sphères et numéros de nœuds, numéros et flèches de voies, tunnels automatiques, couches (layers) de la route sélectionnée, routes de superposition, proposition de liaison ou de jonction, polygone de création de groupe, nœuds de sélection multiple et zones de terraformage. Un seul point d'entrée public : drawRoadMarkups, appelé à chaque image par l'éditeur. Seules les routes situées dans un carré de 700 m centré sur la caméra (interrogation de l'arbre spatial) sont dessinées ; les détails secondaires sont limités à 150 m de la caméra.

## Remarques

- Constantes visuelles : épaisseur de la ligne de référence 4, du contour 2 (x2 si sélectionnée), des guides 3 (5 si sélectionnée) ; longueur des guides 200 m ; distance max des détails (innerCullLimit) 150 m ; rayon de la zone de culling autour de la caméra 350 m.
- Les guides des routes non sélectionnées sont plafonnés : au-delà de 200 guides accumulés (hors routes sélectionnées ou en sélection multiple), les routes supplémentaires n'en ajoutent plus.
- Les couches de profil (layers) ne sont dessinées que pour la route sélectionnée, si elle n'est ni un pont, ni une route de jonction, ni invisible.
- Les zones de terraformage sont des cylindres de 5 m de haut dont le rayon vaut terraParams.domainOfInfluence[0] + terraParams.terraMargin[0].

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams)` | Dessine toutes les annotations 3D de Road Architect pour l'image courante. Ne fait rien si tree est nil. Parcourt les routes proches de la caméra (tree:queryNotNested) et, selon les cases cochées de chaque route (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) et son état (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), affiche les éléments correspondants, puis la liaison/jonction proposée, le polygone de groupe, les nœuds en sélection multiple, les guides et la zone de terraformage. *(interne)* | 1094 |

### Détail des paramètres

#### `editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams)`

Dessine toutes les annotations 3D de Road Architect pour l'image courante. Ne fait rien si tree est nil. Parcourt les routes proches de la caméra (tree:queryNotNested) et, selon les cases cochées de chaque route (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) et son état (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), affiche les éléments correspondants, puis la liaison/jonction proposée, le polygone de groupe, les nœuds en sélection multiple, les guides et la zone de terraformage.

- `roads` (*table[]*) : Tableau des routes Road Architect.
- `map` (*table<string, integer>*) : Table nom de route -> indice dans roads.
- `tree` (*table|nil*) : Arbre spatial (quadtree) des routes ; son absence désactive tout le rendu.
- `selectedRoadIdx` (*integer|nil*) : Indice de la route sélectionnée.
- `selectedNodeIdx` (*integer|nil*) : Indice du nœud sélectionné (mis en évidence).
- `selectedLayerIdx` (*integer|nil*) : Indice de la couche sélectionnée de la route sélectionnée.
- `isGroupMode` (*boolean*) : Mode groupes actif (affiche aussi les routes cachées).
- `isProfileMode` (*boolean*) : Mode édition de profil actif (affiche aussi les routes cachées).
- `isCreateGroup` (*boolean*) : L'utilisateur dessine un polygone de groupe : affiche la clôture gPolygon.
- `gPolygon` (*table*) : Points du polygone de création de groupe.
- `multi` (*table[]*) : Sélection multiple de nœuds (éléments avec champ r = nom de route) ; leurs nœuds sont mis en évidence.
- `selectedLink` (*table|nil*) : Liaison bout à bout proposée (voir link.computePossibleLinks), à dessiner.
- `selectedCandidateJct` (*table|nil*) : Jonction candidate (voir link.computePossibleJct), à dessiner.
- `isGuidelines` (*boolean*) : Affiche les guides le long des routes.
- `isShowTerraSingle` (*boolean*) : Affiche la zone de terraformage de la route sélectionnée.
- `isShowTerraGroup` (*boolean*) : Affiche la zone de terraformage du groupe placé sélectionné.
- `selectedPlacedGroup` (*table|nil*) : Groupe placé sélectionné pour la visualisation du terraformage de groupe.
- `terraParams` (*table*) : Paramètres de terraformage (pointeurs ImGui domainOfInfluence et terraMargin).

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/render.lua`.*
