# `editor_heroRoadEditor_exportMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_exportMgr` : `extensions.load("editor_heroRoadEditor_exportMgr")`, puis la globale `editor_heroRoadEditor_exportMgr`

Cuisson (bake) en fichiers DAE et gestion de l'état Edit/Live d'un groupe du Hero Road Editor. Le bake écrit le maillage de conduite du groupe dans <niveau>/art/heroRoad/heroRoad_<id>/heroRoad_<id>_NNN.dae, puis passe le groupe en état désactivé (Live), où un TSStatic persistant (canSave=true) remplace le ProceduralMesh éditable. Il « brûle » aussi trottoirs et mobilier (sidewalkMgr, barrierMgr) et rend les décals persistants (layerMgr).

## Remarques

- L'état est piloté par group.isEnabled : true = Edit (surface procédurale transitoire, rien n'est écrit dans le niveau), false = Live (statique cuit, persistant).
- Les sommets sont écrits relatifs au centre AABB de chaque chunk et le TSStatic est placé à ce centre, pour garder de petites coordonnées locales même loin de l'origine monde (limite moteur 2048 m citée dans le code).
- Les statiques cuits sont nommés 'HeroRoadBaked_<id>_<n>' (n à partir de 1) ; collisionType 'Collision Mesh', decalType 'Visible Mesh Final'.
- Longueur de chunk par défaut : group.chunkLenM ou 120 m.
- Pour une route terrain (group.isMesh == false) aucun DAE n'est écrit ; terrainFinalized remplace le manifeste.
- Le niveau courant est obtenu par getMissionPath() ; sans niveau chargé, bakeGroup échoue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_exportMgr.applyState(group)` | Réconcilie le maillage du groupe avec son état Edit/Live. Edit : supprime le statique cuit et les pièces brûlées, rend décals et dossier transitoires, marque le groupe sale (reconstruction). Live : supprime la surface procédurale et l'aperçu, fait apparaître le statique cuit, rend décals et dossier persistants, et recharge la collision (be:reloadCollision). Si un groupe Live n'a pas de bake valide (ou si les .dae ont disparu), il repasse en Edit. C'est aussi la séparation de sauvegarde du niveau : seule une route Live est écrite. | 126 |
| `editor_heroRoadEditor_exportMgr.bakeGroup(group)` | Cuit le groupe : génère les chunks avec LODs et maillage de collision (mesh.buildChunkLODs), vide le dossier de bake, écrit les DAE (daeExport.writeDaeLODs), brûle trottoirs et mobilier, met group.isEnabled=false puis appelle applyState. | 179 |
| `editor_heroRoadEditor_exportMgr.hasBaked(group)` | Indique si le groupe possède un bake (état final affichable en mode désactivé) : terrainFinalized pour une route terrain, sinon un bakedManifest non vide. | 91 |
| `editor_heroRoadEditor_exportMgr.unbakeGroup(group)` | Annule le bake : seule façon de quitter l'état Live. Remet isEnabled=true, appelle applyState, puis efface bakedManifest et terrainFinalized. Les fichiers DAE ne sont supprimés qu'au prochain bake (wipeFolder). | 233 |

### Détail des paramètres

#### `editor_heroRoadEditor_exportMgr.applyState(group)`

Réconcilie le maillage du groupe avec son état Edit/Live. Edit : supprime le statique cuit et les pièces brûlées, rend décals et dossier transitoires, marque le groupe sale (reconstruction). Live : supprime la surface procédurale et l'aperçu, fait apparaître le statique cuit, rend décals et dossier persistants, et recharge la collision (be:reloadCollision). Si un groupe Live n'a pas de bake valide (ou si les .dae ont disparu), il repasse en Edit. C'est aussi la séparation de sauvegarde du niveau : seule une route Live est écrite.

- `group` (*table*) : Groupe Hero Road (isEnabled, bakedManifest, sceneTreeFolderId…).

#### `editor_heroRoadEditor_exportMgr.bakeGroup(group)`

Cuit le groupe : génère les chunks avec LODs et maillage de collision (mesh.buildChunkLODs), vide le dossier de bake, écrit les DAE (daeExport.writeDaeLODs), brûle trottoirs et mobilier, met group.isEnabled=false puis appelle applyState.

- `group` (*table*) : Groupe Hero Road avec au moins 2 nœuds.
- **renvoie** : boolean true si le bake a réussi.
- **renvoie** : string Message de résultat ou d'erreur (ex. 'need at least 2 nodes', 'no level loaded…', 'mesh has no geometry', 'write failed: <chemin>').

#### `editor_heroRoadEditor_exportMgr.hasBaked(group)`

Indique si le groupe possède un bake (état final affichable en mode désactivé) : terrainFinalized pour une route terrain, sinon un bakedManifest non vide.

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : boolean true si un bake existe.

#### `editor_heroRoadEditor_exportMgr.unbakeGroup(group)`

Annule le bake : seule façon de quitter l'état Live. Remet isEnabled=true, appelle applyState, puis efface bakedManifest et terrainFinalized. Les fichiers DAE ne sont supprimés qu'au prochain bake (wipeFolder).

- `group` (*table*) : Groupe Hero Road.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua`.*
