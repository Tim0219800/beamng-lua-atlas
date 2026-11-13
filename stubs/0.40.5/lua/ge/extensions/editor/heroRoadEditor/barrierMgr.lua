---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du mobilier de bord de route (glissières, clôtures, lampadaires) d'un groupe du Hero Road Editor. Il lit les bords de maillage du groupe (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp) et pose des pièces via editor/toolUtilities/roadsideProps (pools transitoires identifiés par id..'bL', 'fL', 'lL'…). Il gère les rails de toute la route (onglet Furniture) et les segments de barrière placés (onglet Features, group.barriers).
--- Accès : extension `editor_heroRoadEditor_barrierMgr` : `extensions.load("editor_heroRoadEditor_barrierMgr")`, puis la globale `editor_heroRoadEditor_barrierMgr`
---@class editor_heroRoadEditor_barrierMgr
editor_heroRoadEditor_barrierMgr = {}

--- « Burn » : rend persistantes (canSave=true) les pièces actuelles via props.commitPool et les détache des pools transitoires. Renvoie le manifeste des noms, que exportMgr stocke lors du bake.
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:159
---@param group table Groupe Hero Road.
---@return table  Tableau des identifiants/noms d'objets de scène créés (vide si le groupe est invalide).
function editor_heroRoadEditor_barrierMgr.burnGroup(group) end

--- Nombre de pièces actuellement posées pour le groupe, par catégorie, côtés cumulés. Lit les pools transitoires (donc l'aperçu éditable).
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:146
---@param group table Groupe Hero Road.
---@return integer  Nombre de barrières.
---@return integer  Nombre de clôtures.
---@return integer  Nombre de lampadaires.
function editor_heroRoadEditor_barrierMgr.counts(group) end

--- Supprime tout le mobilier posé du groupe (démontage ou moins de 2 nœuds).
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:131
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_barrierMgr.removeGroup(group) end

--- (Re)construit barrières, clôtures et lampadaires du groupe d'après les bords du maillage actuel et les sélections. Appelé après la reconstruction du maillage ; ne fait rien si le groupe n'a pas de dossier scenetree (sceneTreeFolderId).
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:111
---@param group table Groupe Hero Road (id, sceneTreeFolderId, meshEdgeL/R, barrierLeftType, fenceLeftType, lampLeftType, barriers…).
function editor_heroRoadEditor_barrierMgr.updateGroup(group) end

