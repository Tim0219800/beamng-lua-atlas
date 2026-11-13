---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cuisson (bake) en fichiers DAE et gestion de l'état Edit/Live d'un groupe du Hero Road Editor. Le bake écrit le maillage de conduite du groupe dans <niveau>/art/heroRoad/heroRoad_<id>/heroRoad_<id>_NNN.dae, puis passe le groupe en état désactivé (Live), où un TSStatic persistant (canSave=true) remplace le ProceduralMesh éditable. Il « brûle » aussi trottoirs et mobilier (sidewalkMgr, barrierMgr) et rend les décals persistants (layerMgr).
--- Accès : extension `editor_heroRoadEditor_exportMgr` : `extensions.load("editor_heroRoadEditor_exportMgr")`, puis la globale `editor_heroRoadEditor_exportMgr`
---@class editor_heroRoadEditor_exportMgr
editor_heroRoadEditor_exportMgr = {}

--- Réconcilie le maillage du groupe avec son état Edit/Live. Edit : supprime le statique cuit et les pièces brûlées, rend décals et dossier transitoires, marque le groupe sale (reconstruction). Live : supprime la surface procédurale et l'aperçu, fait apparaître le statique cuit, rend décals et dossier persistants, et recharge la collision (be:reloadCollision). Si un groupe Live n'a pas de bake valide (ou si les .dae ont disparu), il repasse en Edit. C'est aussi la séparation de sauvegarde du niveau : seule une route Live est écrite.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:126
---@param group table Groupe Hero Road (isEnabled, bakedManifest, sceneTreeFolderId…).
function editor_heroRoadEditor_exportMgr.applyState(group) end

--- Cuit le groupe : génère les chunks avec LODs et maillage de collision (mesh.buildChunkLODs), vide le dossier de bake, écrit les DAE (daeExport.writeDaeLODs), brûle trottoirs et mobilier, met group.isEnabled=false puis appelle applyState.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:179
---@param group table Groupe Hero Road avec au moins 2 nœuds.
---@return boolean  true si le bake a réussi.
---@return string  Message de résultat ou d'erreur (ex. 'need at least 2 nodes', 'no level loaded…', 'mesh has no geometry', 'write failed: <chemin>').
function editor_heroRoadEditor_exportMgr.bakeGroup(group) end

--- Indique si le groupe possède un bake (état final affichable en mode désactivé) : terrainFinalized pour une route terrain, sinon un bakedManifest non vide.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:91
---@param group table Groupe Hero Road.
---@return boolean  true si un bake existe.
function editor_heroRoadEditor_exportMgr.hasBaked(group) end

--- Annule le bake : seule façon de quitter l'état Live. Remet isEnabled=true, appelle applyState, puis efface bakedManifest et terrainFinalized. Les fichiers DAE ne sont supprimés qu'au prochain bake (wipeFolder).
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:233
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_exportMgr.unbakeGroup(group) end

