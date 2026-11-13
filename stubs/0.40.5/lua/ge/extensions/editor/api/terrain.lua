---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/terrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Squelette d'API de l'éditeur pour le terrain (sculpture, peinture de matériaux, feuillage). initialize(editor) ajoute 46 fonctions à l'objet editor, mais toutes ont un corps vide (commentaire TODO) : elles ne font rien et renvoient nil. Les hooks prévus sont cités en commentaire : onEditorTerrainCreated, onEditorTerrainDelete, onEditorTerrainHeightBrushChanged, onEditorTerrainHeightChanged, onEditorTerrainCleared, onEditorTerrainRestored.
--- Accès : extension `editor_api_terrain` : `extensions.load("editor_api_terrain")`, puis la globale `editor_api_terrain`
---@class editor_api_terrain
editor_api_terrain = {}

--- Ajoute à l'objet editor toutes les fonctions terrain/feuillage listées dans la classe editor. Appelé par le chargeur de l'API de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/terrain.lua:205
---@param editorInstance table Objet editor global.
function editor_api_terrain.initialize(editorInstance) end

--- Fonctions ajoutées à editor. Toutes sont des stubs vides (TODO).
---@class editor_api_terrain_editor
local editor_api_terrain_editor = {}

--- Prévu : ajouter une brosse de feuillage à un groupe. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:157
---@param groupName string Nom du groupe.
---@param foliageBrush any Brosse (déduit du nom).
function editor_api_terrain_editor.addFoliageBrushToGroup(groupName, foliageBrush) end

--- Prévu : aligner le terrain sur un maillage (haut ou bas). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:97
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param topOrBottom any Choix haut/bas (déduit du nom).
---@param amount number Intensité.
function editor_api_terrain_editor.alignTerrainWithMesh(x, y, topOrBottom, amount) end

--- Prévu : appliquer un preset de brosse de hauteur. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:41
---@param name string Nom du preset.
function editor_api_terrain_editor.applyTerrainHeightBrushPreset(name) end

--- Prévu : lissage par moyenne. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:73
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.averageSmoothTerrain(x, y, amount) end

--- Prévu : effacer le terrain en (x, y) (hook onEditorTerrainCleared). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:89
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.clearTerrain(x, y) end

--- Prévu : créer un groupe de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:137
---@param name string Nom du groupe.
function editor_api_terrain_editor.createFoliageGroup(name) end

--- Prévu : créer un maillage de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:145
---@param foliageMesh any Définition du maillage (déduit du nom).
function editor_api_terrain_editor.createFoliageMesh(foliageMesh) end

--- Prévu : créer un terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:17
---@param terrainInfo table Infos de création (déduit du nom).
function editor_api_terrain_editor.createTerrain(terrainInfo) end

--- Prévu : créer un matériau de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:109
---@param mtl any Matériau (déduit du nom).
function editor_api_terrain_editor.createTerrainPaintMaterial(mtl) end

--- Prévu : supprimer une brosse de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:161
---@param name string Nom de la brosse.
function editor_api_terrain_editor.deleteFoliageBrush(name) end

--- Prévu : supprimer un groupe de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:141
---@param name string Nom du groupe.
function editor_api_terrain_editor.deleteFoliageGroup(name) end

--- Prévu : supprimer un maillage de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:149
---@param foliageMeshName string Nom du maillage.
function editor_api_terrain_editor.deleteFoliageMesh(foliageMeshName) end

--- Prévu : supprimer un terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:21
---@param terrainObjectId integer Id du terrain (déduit du nom).
function editor_api_terrain_editor.deleteTerrain(terrainObjectId) end

--- Prévu : supprimer un preset de brosse de hauteur. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:45
---@param name string Nom du preset.
function editor_api_terrain_editor.deleteTerrainHeightBrushPreset(name) end

--- Prévu : supprimer un preset de brosse de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:129
---@param name string Nom du preset.
function editor_api_terrain_editor.deleteTerrainPaintBrushPreset(name) end

--- Prévu : effacer du feuillage en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:181
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.eraseFoliage(x, y) end

--- Prévu : effacer les éléments de la brosse/groupe actif en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:185
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.eraseSetFoliageBrushOrGroup(x, y) end

--- Prévu : exporter la heightmap d'un terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:29
---@param terrainObjectId integer Id du terrain.
---@param filename string Fichier de sortie.
function editor_api_terrain_editor.exportTerrainHeightmap(terrainObjectId, filename) end

--- Prévu : aplatir le terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:81
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.flattenTerrain(x, y, amount) end

--- Prévu : lister les maillages de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:153
function editor_api_terrain_editor.getFoliageMeshes() end

--- Prévu : lister les presets de brosse de hauteur. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:49
function editor_api_terrain_editor.getTerrainHeightBrushPresets() end

--- Prévu : lister les presets de brosse de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:133
function editor_api_terrain_editor.getTerrainPaintBrushPresets() end

--- Prévu : outil « saisir » le terrain en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:53
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.grabTerrain(x, y, amount) end

--- Prévu : importer une heightmap. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:25
---@param importInfo table Infos d'import (déduit du nom).
function editor_api_terrain_editor.importTerrainHeightmap(importInfo) end

--- Prévu : charger un preset de brosse de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:125
---@param name string Nom du preset.
function editor_api_terrain_editor.loadTerrainPaintBrushPreset(name) end

--- Prévu : abaisser le terrain en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:61
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.lowerTerrain(x, y, amount) end

--- Prévu : ajouter du bruit au terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:77
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.noiseTerrain(x, y, amount) end

--- Prévu : peindre du feuillage en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:177
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.paintFoliage(x, y) end

--- Prévu : peindre le terrain en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:113
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.paintTerrain(x, y) end

--- Prévu : lever le terrain en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:57
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.raiseTerrain(x, y, amount) end

--- Prévu : restaurer le terrain en (x, y) (hook onEditorTerrainRestored). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:93
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.restoreTerrain(x, y) end

--- Prévu : tourner la sélection de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:193
---@param delta any Rotation (déduit du nom).
function editor_api_terrain_editor.rotateFoliageSelection(delta) end

--- Prévu : sauvegarder un preset de brosse de hauteur. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:37
---@param name string Nom du preset.
function editor_api_terrain_editor.saveTerrainHeightBrushPreset(name) end

--- Prévu : sauvegarder un preset de brosse de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:121
---@param name string Nom du preset.
function editor_api_terrain_editor.saveTerrainPaintBrushPreset(name) end

--- Prévu : mettre à l'échelle la sélection de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:197
---@param delta any Facteur (déduit du nom).
function editor_api_terrain_editor.scaleFoliageSelection(delta) end

--- Prévu : sélectionner du feuillage en (x, y). Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:201
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.selectFoliage(x, y) end

--- Prévu : choisir le matériau de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:105
---@param mtl any Matériau (déduit du nom).
function editor_api_terrain_editor.selectTerrainPaintMaterial(mtl) end

--- Prévu : choisir la brosse de feuillage active. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:169
---@param brushName string Nom de la brosse.
function editor_api_terrain_editor.setFoliageBrush(brushName) end

--- Prévu : choisir le groupe de brosses actif. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:165
---@param name string Nom du groupe.
function editor_api_terrain_editor.setFoliageBrushGroup(name) end

--- Prévu : régler la brosse de peinture de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:173
---@param brush table Réglages (déduit du nom).
function editor_api_terrain_editor.setFoliagePaintBrushSettings(brush) end

--- Prévu : fixer la hauteur du terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:85
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Hauteur (déduit du nom).
function editor_api_terrain_editor.setTerrainHeight(x, y, amount) end

--- Prévu : définir la brosse de hauteur. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:33
---@param brush table Brosse (déduit du nom).
function editor_api_terrain_editor.setTerrainHeightBrush(brush) end

--- Prévu : définir la brosse de peinture. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:117
---@param brush table Brosse (déduit du nom).
function editor_api_terrain_editor.setTerrainPaintBrush(brush) end

--- Prévu : lisser la pente. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:69
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.smoothSlopeTerrain(x, y, amount) end

--- Prévu : lisser le terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:65
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
---@param amount number Intensité.
function editor_api_terrain_editor.smoothTerrain(x, y, amount) end

--- Prévu : soustraire un maillage du terrain. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:101
---@param x number Coordonnée X.
---@param y number Coordonnée Y.
function editor_api_terrain_editor.subtractMeshFromTerrain(x, y) end

--- Prévu : translater la sélection de feuillage. Stub vide.
---Source : lua/ge/extensions/editor/api/terrain.lua:189
---@param delta any Décalage (déduit du nom).
function editor_api_terrain_editor.translateFoliageSelection(delta) end

