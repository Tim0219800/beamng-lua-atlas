---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioForest/audioForestCommon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Code partagé entre l'exécution (audioForest.lua) et l'éditeur : transforme les objets d'une Forest en un nuage de noeuds audio éclaircis. Se charge avec require('core/audioForest/audioForestCommon'). L'algorithme : (1) pré-passe qui lit les items de la forêt (par blocs) et calcule volume et hauteur par modèle (shape) ; (2) classement S/M/L par volume normalisé (percentile 95) avec surcharge possible ; (3) éclaircissement glouton : on garde un item et on absorbe tous ses voisins à moins de minNodeSpacing (20 m) ; (4) construction d'un KD-tree 3D des noeuds.
--- Accès : extension `core_audioForest_audioForestCommon` : `extensions.load("core_audioForest_audioForestCommon")`, puis la globale `core_audioForest_audioForestCommon`
---@class core_audioForest_audioForestCommon
core_audioForest_audioForestCommon = {}

--- Construit le nuage de noeuds audio. Termine la pré-passe si besoin, classe les modèles, éclaircit les items et construit un KD-tree (kdtreepoint3d). Renvoie un nuage vide (nodeCount 0) s'il n'y a aucun item inclus.
---Source : lua/ge/extensions/core/audioForest/audioForestCommon.lua:231
---@param forestObj userdata Objet Forest
---@param st table|nil État d'outil : classSelByShape, classOverrideByShape, includeByShape
---@param cfg table|nil Configuration (clés de defaultCfg, ainsi que pitchDensityPercentile)
---@param opts table|nil Options : prepass (pré-passe déjà faite), shapeToRow + includeEditorFields (ajoute nodeTypeRow et nodeClassId pour l'éditeur)
---@return table  {minNodeSpacing, nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, nodeTypeRow, nodeClassId, kdNodes}
function core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts) end

--- Convertit un volume normalisé [0..1] en classe de taille : 1 sous t0, 2 sous t1, sinon 3.
---Source : lua/ge/extensions/core/audioForest/audioForestCommon.lua:137
---@param normVol number Volume normalisé
---@param classT0 number|nil Seuil 1/2, 1/3 par défaut
---@param classT1 number|nil Seuil 2/3, 2/3 par défaut (échangé avec t0 si t0 > t1)
---@return integer  1, 2 ou 3
function core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1) end

--- Volume (m³) de la boîte englobante d'un item de forêt, multiplié par son échelle. Renvoie 0 sans boîte.
---Source : lua/ge/extensions/core/audioForest/audioForestCommon.lua:113
---@param item userdata|nil Item de forêt (getObjBox, getScale)
---@return number  Volume
function core_audioForest_audioForestCommon.getItemVolume(item) end

--- Prépare l'état d'une pré-passe incrémentale : récupère tous les items de la forêt (forestObj:getData():getItems()).
---Source : lua/ge/extensions/core/audioForest/audioForestCommon.lua:170
---@param forestObj userdata Objet Forest
---@param st table|nil État d'outil ; utilise includeByShape (un modèle absent ou true est inclus, false est exclu)
---@return table  État de pré-passe {all, allCount, i, includeByShape, shapeVol, shapeMaxZ, includedItem, includedShape, volList, volN, itemCount, isReady}
function core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st) end

--- Traite jusqu'à maxSteps items de la pré-passe : retient les items inclus et mesure le volume et la hauteur max une fois par modèle. Passe isReady à true quand tous les items ont été vus.
---Source : lua/ge/extensions/core/audioForest/audioForestCommon.lua:190
---@param p table État renvoyé par startRuntimePrepass
---@param maxSteps integer|nil Nombre maximal d'items par appel, 10000 par défaut
---@return boolean  true quand la pré-passe est terminée
function core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps) end

