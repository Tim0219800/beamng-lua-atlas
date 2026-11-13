---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de données de l'outil Assembly Spline : tient la liste des assembly splines (assemblySplines) et la table id -> index (splineMap), crée/supprime/découpe/joint les splines, applique des presets de kit (Wooden Fence, Telegraph Pole, Metal Crash Barrier), gère copie/collage de profil, sérialisation, callbacks undo/redo, liens avec l'outil Master Spline et la mise à jour des splines « sales » (recalcul de la géométrie puis repeuplement en meshes via populate). Chaque spline est une table (name, id, nodes, widths, nmls, divPoints, spacing, verticalOffset, normalMode, sag, preRot, jitter*, splineRandomSeed, kitFolderPath, meshKit, moleculeDescription, isEnabled, isDirty, isLink, linkId, sceneTreeFolderId…) et chaque spline possède un SimGroup dans MissionGroup (cansave = false tant qu'elle n'est pas cuite).
--- Accès : extension `editor_assemblySpline_splineMgr` : `extensions.load("editor_assemblySpline_splineMgr")`, puis la globale `editor_assemblySpline_splineMgr`
---@class editor_assemblySpline_splineMgr
editor_assemblySpline_splineMgr = {}

--- Ajoute une spline vide (nom unique « Assembly Spline N », UUID, SimGroup) avec le kit Wooden Fence par défaut. Si le kit ne se charge pas, un avertissement est journalisé et le kit est vide. Met à jour splineMap.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:174
function editor_assemblySpline_splineMgr.addNewAssemblySpline() end

--- Pose une fois les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline sale. À relancer après un terraformage.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:702
---@param spline table Spline.
function editor_assemblySpline_splineMgr.conformNodesToTerrain(spline) end

--- Convertit des chemins tracés depuis une bitmap en assembly splines : coordonnées grille -> monde via l'éditeur de terrain, normales du terrain pour chaque nœud. Nécessite editor_terrainEditor.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:712
---@param paths table[] Liste de {points = {{x,y}}, widths}.
function editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths) end

--- Copie le profil d'une spline : copie profonde sans identité, nœuds, largeurs, normales ni géométrie dérivée (reste : paramètres, kit, molécule, états d'activation).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:554
---@param spline table Spline.
---@return table  Profil.
function editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline) end

--- Copie profonde d'une spline (encode/decode string.buffer) en vidant la géométrie secondaire dérivée (divPoints, divWidths, tangents, binormals, normals, discMap).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:304
---@param spline table Spline.
---@return table  Copie.
function editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline) end

--- Copie profonde de toutes les splines (pour l'historique d'annulation).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:316
---@return table[]  Copies.
function editor_assemblySpline_splineMgr.deepCopyAssemblySplineState() end

--- Désérialise une spline depuis un blob encodé (string) ou une table JSON de session. Sur le chemin JSON, garantit l'existence des tables dérivées et réhydrate les positions en vec3 avant la première construction.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:624
---@param data string|table Blob ou table.
---@param isCreateObject boolean Créer le SimGroup de scène de la spline (déduit du code).
---@return table  Spline.
function editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject) end

--- Trouve une spline vivante par id.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:269
---@param id string Id (UUID) de la spline.
---@return table|nil  Spline ou nil.
function editor_assemblySpline_splineMgr.findAssemblySpline(id) end

--- Renvoie la table vivante des assembly splines (non copiée).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:94
---@return table[]  Splines.
function editor_assemblySpline_splineMgr.getAssemblySplines() end

--- Liste des splines activées sous forme {name, id, type = 'Assembly Spline'} (pour l'outil Master Spline).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:744
---@return table[]  Entrées.
function editor_assemblySpline_splineMgr.getCurrentAssemblySplineList() end

--- Renvoie les paramètres de curseurs par défaut (ceux du preset Wooden Fence) : spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:127
---@return table  Paramètres.
function editor_assemblySpline_splineMgr.getDefaultSliderParams() end

--- Renvoie la clé du mode d'édition ('assemblySplineEditMode').
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:91
---@return string  Clé.
function editor_assemblySpline_splineMgr.getEditModeKey() end

--- Renvoie la table id -> index des splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:97
---@return table<string, integer>  splineMap.
function editor_assemblySpline_splineMgr.getSplineMap() end

--- Renvoie le préfixe global de l'outil ('Assembly Spline').
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:88
---@return string  Préfixe.
function editor_assemblySpline_splineMgr.getToolPrefixStr() end

--- Indique si la spline d'id donné est liée à une Master Spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:758
---@param id string Id.
---@return boolean  true si liée.
function editor_assemblySpline_splineMgr.isLinked(id) end

--- Joint deux splines ouvertes en une (spline1 modifiée, spline2 supprimée) selon les nœuds d'extrémité donnés (geom.joinSplineGeometry). Ne fait rien si les splines ou le cas de jonction sont invalides.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:414
---@param splineIdx1 integer Première spline.
---@param nodeIdx1 integer Nœud de la première.
---@param splineIdx2 integer Seconde spline.
---@param nodeIdx2 integer Nœud de la seconde.
function editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Callback de rétablissement d'une sélection d'objets (applique data.new).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:551
---@param data table {old, new}.
function editor_assemblySpline_splineMgr.objectSelectRedo(data) end

--- Callback d'annulation d'une opération de sélection d'objets (restaure data.old).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:548
---@param data table {old, new}.
function editor_assemblySpline_splineMgr.objectSelectUndo(data) end

--- Applique un profil copié à une spline : supprime d'abord ses meshes, copie paramètres/kit/molécule/états d'activation, puis la marque sale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:578
---@param spline table Spline cible.
---@param profile table Profil de copyAssemblySplineProfile.
function editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile) end

--- Recalcule la table id -> index (appelé par le helper de session après un chargement).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:659
function editor_assemblySpline_splineMgr.recomputeIdMap() end

--- Supprime toutes les splines si isIncludeDisabled est vrai ; sinon seulement celles qui sont activées et non liées.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:285
---@param isIncludeDisabled boolean Inclure les désactivées (verrouillées) et liées.
function editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled) end

--- Supprime la spline d'index donné : ses meshes (pop.tryRemove), son SimGroup, puis la retire de la liste et met à jour splineMap.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:253
---@param idx integer Index.
function editor_assemblySpline_splineMgr.removeAssemblySpline(idx) end

--- Supprime une spline liée par id (appelé quand une couche de Master Spline est supprimée).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:275
---@param splineId string Id de la spline.
function editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId) end

--- Sérialise une spline en blob encodé (string.buffer) pour la persistance de l'éditeur (voir onSerialize).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:603
---@param spline table Spline.
---@return string  Données encodées.
function editor_assemblySpline_splineMgr.serializeAssemblySpline(spline) end

--- Sérialise une spline en table simple portable pour un fichier de session (toolUtilities/session) : géométrie dérivée vidée, handle de scène supprimé, spline vivante non modifiée.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:615
---@param spline table Spline.
---@return table  Table sérialisable en JSON.
function editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline) end

--- Place une spline à l'index donné, lui crée au besoin un SimGroup dans MissionGroup (nom unique + UUID, cansave = false) et la marque sale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:100
---@param spline table Spline.
---@param idx integer Index.
function editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx) end

--- Applique setAssemblySpline à chaque élément de la liste.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:120
---@param splines table[] Splines.
function editor_assemblySpline_splineMgr.setAssemblySplines(splines) end

--- Lie ou délie une spline (isLink, linkId = groupId), supprime ses meshes et la marque sale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:764
---@param id string Id de la spline.
---@param groupId string|nil Id du groupe de liaison.
---@param isLink boolean true pour lier.
function editor_assemblySpline_splineMgr.setLink(id, groupId, isLink) end

--- Applique un preset à la spline : supprime ses meshes, recharge le kit (mol.getAssemblyKit), reconstruit la molécule et copie les paramètres du preset, puis marque la spline sale. Clé inconnue : seulement marquée sale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:142
---@param spline table Spline.
---@param presetStr string 'wooden_fence', 'telegraph_pole' ou 'metal_crash_barrier'.
function editor_assemblySpline_splineMgr.setPreset(spline, presetStr) end

--- Callback de rétablissement d'une édition d'une seule spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:505
---@param assemblySplineData table Données de l'action d'historique.
function editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData) end

--- Callback d'annulation d'une édition d'une seule spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:497
---@param assemblySplineData table Données de l'action d'historique.
function editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData) end

--- Coupe la spline sélectionnée en deux au nœud sélectionné. Ne fait rien si la spline est invalide.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:325
---@param selectedSplineIdx integer Index de la spline.
---@param selectedNodeIdx integer Index du nœud de coupe.
function editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx) end

--- Callback de rétablissement d'une édition transversale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:525
---@param data table Données de l'action d'historique.
function editor_assemblySpline_splineMgr.transSplineEditRedo(data) end

--- Callback d'annulation d'une édition transversale (état complet des splines).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:513
---@param data table Données de l'action d'historique.
function editor_assemblySpline_splineMgr.transSplineEditUndo(data) end

--- Délie toutes les splines et les marque sales.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:802
function editor_assemblySpline_splineMgr.unlinkAll() end

--- Pour chaque spline sale : recalcule la géométrie (Catmull-Rom avec raycast si isConformToTerrain, sinon libre en 3D), repeuple en meshes (pop.populateAssemblySpline) et met à jour roadLength. Sous 2 nœuds, supprime les meshes. Appelé chaque frame par onEditorGui.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:662
function editor_assemblySpline_splineMgr.updateDirtyAssemblySplines() end

--- Met à jour la géométrie d'une spline liée depuis la master (nœuds, largeurs, normales, boucle, conformité au terrain) ; sous 2 points, vide la géométrie dérivée et supprime les meshes ; marque sale.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:779
---@param id string Id.
---@param points vec3[] Nœuds.
---@param widths number[] Largeurs.
---@param nmls vec3[] Normales.
---@param isLoop boolean Spline fermée.
---@param isConformToTerrain boolean Suivre le terrain.
function editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

