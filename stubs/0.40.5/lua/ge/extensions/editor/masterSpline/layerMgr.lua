---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des couches (layers) d'une Master Spline. Une couche relie la Master Spline à une spline enfant d'un autre outil (mesh, assembly, decal, road, tree) et lui envoie une copie décalée latéralement de la géométrie discrétisée, simplifiée par RDP (tolérance 0.25). Ce module crée, met à jour, supprime, copie et (dé)sérialise les couches.
--- Accès : extension `editor_masterSpline_layerMgr` : `extensions.load("editor_masterSpline_layerMgr")`, puis la globale `editor_masterSpline_layerMgr`
---@class editor_masterSpline_layerMgr
editor_masterSpline_layerMgr = {}

--- Ajoute une couche « New Layer N » (UUID généré, isDirty vrai, non liée, type de lien par défaut = mesh, position par défaut).
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:189
---@param spline table Master Spline qui reçoit la couche.
function editor_masterSpline_layerMgr.addNewLayer(spline) end

--- Copie profonde d'un tableau de couches.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:72
---@param layers table Tableau de couches.
---@return table  Copie indépendante.
function editor_masterSpline_layerMgr.deepCopyAllLayers(layers) end

--- Copie profonde d'une couche (via string.buffer encode/decode).
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:69
---@param layer table Couche à copier.
---@return table  Copie indépendante.
function editor_masterSpline_layerMgr.deepCopyLayer(layer) end

--- Reconstruit une couche à partir de données sérialisées ; isDirty est mis à true, un UUID est généré si id manque, valeurs par défaut sinon.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:219
---@param data table Table produite par serializeLayer.
---@return table  Couche.
function editor_masterSpline_layerMgr.deserializeLayer(data) end

--- Renvoie la table des valeurs par défaut des curseurs, pour l'interface de l'outil.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:66
---@return table<string, number>  Valeurs par défaut (defaultDOI, defaultTerraMargin, defaultBankStrength…).
function editor_masterSpline_layerMgr.getSliderDefaults() end

--- Supprime toutes les couches et leurs splines liées.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:177
---@param masterSpline table Master Spline.
function editor_masterSpline_layerMgr.removeAllLayers(masterSpline) end

--- Supprime la couche d'indice idx ; si elle a une spline liée, celle-ci est supprimée dans son outil.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:167
---@param idx integer Indice de la couche (à partir de 1).
---@param masterSpline table Master Spline propriétaire.
function editor_masterSpline_layerMgr.removeLayer(idx, masterSpline) end

--- Convertit une couche en table simple (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), sans les tampons internes.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:204
---@param layer table Couche.
---@return table  Données sérialisables.
function editor_masterSpline_layerMgr.serializeLayer(layer) end

--- Envoie la géométrie de la Master Spline à la spline liée de chaque couche, dirty ou non, et remet isDirty à false.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:148
---@param masterSpline table Master Spline (nodes, divPoints, divWidths, binormals, normals, layers, isLoop, isConformToTerrain).
function editor_masterSpline_layerMgr.updateAllLayers(masterSpline) end

--- Comme updateAllLayers mais seulement pour les couches avec isDirty vrai.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:155
---@param masterSpline table Master Spline.
function editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline) end

