# `editor_roadArchitect_staticMeshMgr`

*Fichier : `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_staticMeshMgr` : `extensions.load("editor_roadArchitect_staticMeshMgr")`, puis la globale `editor_roadArchitect_staticMeshMgr`

Gère l'« audition » des maillages statiques dans le Road Architect : il liste les fichiers .dae disponibles (dossiers art/shapes/objects et art/shapes/garage_and_dealership/Clutter), affiche un maillage choisi dans la scène à 1000 m d'altitude et déplace/fait tourner la caméra libre autour pour le prévisualiser. Il renseigne aussi, dans la couche de profil concernée, les dimensions du maillage (boîte). Utilisé par l'interface d'édition de profils.

## Remarques

- L'objet d'audition s'appelle « Mesh Under Audition [temporary] » et est placé à (0, 0, 1000) dans MissionGroup.
- La caméra tourne par pas de pi/500 par appel de manageRotateCam ; la distance est fonction de la taille du maillage (1.2 x longueur de la boîte).
- availStaticMeshes est vidé et rempli en place (table.clear) : la référence exportée reste valide après fetchAvailableStaticMeshes.
- Dans addMeshToAudition, la table scenetree.MissionGroup:addObject reçoit l'objet directement (et non .obj comme ailleurs) : incohérence possible avec les autres modules.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx)` | Remplace le maillage en audition par celui d'indice donné, ajuste la distance de la caméra à sa taille, puis écrit dans la couche du profil les distances de la boîte autour du centre (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) et ses extensions (extentsL, extentsW, extentsH). | 72 |
| `editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes()` | Cherche récursivement les *.dae dans les dossiers prédéfinis et remplit availStaticMeshes (triée par filename). | 41 |
| `editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time)` | Si la caméra n'est pas déjà en vue d'audition : mémorise sa pose, arrête et remet à zéro le chronomètre, et applique la pose d'audition. | 118 |
| `editor_roadArchitect_staticMeshMgr.goToOldView()` | Restaure la pose de caméra mémorisée avant l'audition et sort de la vue d'audition. | 138 |
| `editor_roadArchitect_staticMeshMgr.manageRotateCam()` | Fait avancer d'un pas l'angle de rotation de la caméra autour du maillage et applique la pose (à appeler à chaque frame). | 129 |
| `editor_roadArchitect_staticMeshMgr.removeAuditionMesh()` | Supprime l'objet de scène du maillage en audition s'il existe. | 55 |
| `editor_roadArchitect_staticMeshMgr.updateCameraPose()` | Passe en caméra libre et place la caméra sur la pose d'audition (derrière et au-dessus du maillage, regardant vers lui). | 64 |

### Détail des paramètres

#### `editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx)`

Remplace le maillage en audition par celui d'indice donné, ajuste la distance de la caméra à sa taille, puis écrit dans la couche du profil les distances de la boîte autour du centre (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) et ses extensions (extentsL, extentsW, extentsH).

- `selectedMeshIdx` (*integer*) : Indice dans availStaticMeshes.
- `road` (*table*) : Route dont le profil contient la couche.
- `customIdx` (*integer*) : Indice de la couche dans road.profile.layers.

#### `editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time)`

Si la caméra n'est pas déjà en vue d'audition : mémorise sa pose, arrête et remet à zéro le chronomètre, et applique la pose d'audition.

- `timer` (*table*) : Chronomètre avec stopAndReset().
- `time` (*number*) : Temps courant.
- **renvoie** : number 0.0 à l'entrée dans la vue ; sinon la valeur time reçue.

## Champs

| Champ | Type | Description |
|---|---|---|
| `availStaticMeshes` | table<integer, {path: string, filename: string}> | Maillages .dae trouvés, triés par nom de fichier. Rempli par fetchAvailableStaticMeshes. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua`.*
