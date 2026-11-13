---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des splines de l'outil Decal Spline de l'éditeur (préfixe « Decal Spline », mode d'édition decalSplineEditMode) : une spline de decals suit un tracé (nœuds, largeurs, normales) sur lequel des decals sont répartis (espacement, jitter, rotation, lignes/colonnes de l'atlas, échelle, frame, jusqu'à 4 composants). Le module garde la liste des splines et une table id vers index, crée/supprime/coupe/joint des splines, gère undo/redo, copie de profil, sérialisation (buffer binaire ou table JSON de session), liens avec des splines maîtres, et reconstruit la géométrie et les decals des splines marquées isDirty.
--- Accès : extension `editor_decalSpline_splineMgr` : `extensions.load("editor_decalSpline_splineMgr")`, puis la globale `editor_decalSpline_splineMgr`
---@class editor_decalSpline_splineMgr
editor_decalSpline_splineMgr = {}

--- Ajoute à la fin une nouvelle spline vide avec un nom unique (« Decal Spline N »), un UUID Engine.generateUUID() et les paramètres par défaut.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:83
function editor_decalSpline_splineMgr.addNewDecalSpline() end

--- Convertit des tracés issus d'une image (points en grille terrain) en splines : coordonnées monde via l'éditeur de terrain, normales du terrain. Les tracés dont la plus petite dimension fait au plus 10 m ne sont pas importés (voir notes).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:608
---@param paths table tableau de {points, widths}
function editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths) end

--- Copie le profil (paramètres de répartition des decals) d'une spline, sans nodes, widths, nmls ni géométrie dérivée.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:466
---@param spline table spline source
---@return table  profil
function editor_decalSpline_splineMgr.copyDecalSplineProfile(spline) end

--- Copie profonde (encode/decode string.buffer) d'une spline, avec la géométrie dérivée vidée.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:198
---@param spline table spline
---@return table  copie
function editor_decalSpline_splineMgr.deepCopyDecalSpline(spline) end

--- Copie profonde de toutes les splines (pour l'historique undo).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:210
---@return table  tableau de copies
function editor_decalSpline_splineMgr.deepCopyDecalSplineState() end

--- Désérialise une spline depuis le blob de l'éditeur (string) ou une table JSON de session. Sur le chemin JSON, les tables dérivées sont vides et les positions réhydratées en vec3 avant la première construction.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:546
---@param data string|table blob ou table
---@param isCreateObject boolean|nil (déduit du code) indique s'il faut créer l'objet
---@return table  spline
function editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject) end

--- Liste des splines activées sous forme {name, id, type} (type = préfixe de l'outil), pour les sélecteurs d'autres outils.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:641
---@return table  tableau de {name, id, type}
function editor_decalSpline_splineMgr.getCurrentDecalSplineList() end

--- Renvoie la table des splines (référence, non copiée).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:61
---@return table  tableau de splines
function editor_decalSpline_splineMgr.getDecalSplines() end

--- Renvoie les valeurs par défaut des curseurs de l'interface.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:80
---@return table  spacing, jitter, rot, randomSeed, numRows, numCols, scale, frame…
function editor_decalSpline_splineMgr.getDefaultSliderParams() end

--- Renvoie la clé du mode d'édition (« decalSplineEditMode »).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:58
---@return string  clé
function editor_decalSpline_splineMgr.getEditModeKey() end

--- Renvoie la table id de spline vers index.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:64
---@return table<string, integer>  id vers index
function editor_decalSpline_splineMgr.getSplineMap() end

--- Renvoie le préfixe de l'outil (« Decal Spline »).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:55
---@return string  préfixe
function editor_decalSpline_splineMgr.getToolPrefixStr() end

--- Indique si la spline d'id donné est liée à une spline maîtresse.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:655
---@param id string id de spline
---@return boolean  vrai si liée
function editor_decalSpline_splineMgr.isLinked(id) end

--- Joint deux splines non bouclées : la géométrie concaténée est appliquée à la première, la seconde est supprimée. Sans effet si les index de nœuds sont invalides.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:335
---@param splineIdx1 integer index de la première spline (conservée)
---@param nodeIdx1 integer nœud d'extrémité de la première
---@param splineIdx2 integer index de la seconde spline (supprimée)
---@param nodeIdx2 integer nœud d'extrémité de la seconde
function editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Applique un profil à une spline : supprime ses decals, copie les paramètres (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN…) et la marque isDirty.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:481
---@param spline table spline cible
---@param profile table profil issu de copyDecalSplineProfile
function editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile) end

--- Recalcule la table id vers index (appelée par l'utilitaire de session après un chargement).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:565
function editor_decalSpline_splineMgr.recomputeIdMap() end

--- Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées et non liées.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:179
---@param isIncludeDisabled boolean inclure les splines désactivées (et liées)
function editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled) end

--- Supprime une spline, retire ses decals de la scène, met à jour la table d'index, et supprime le dossier de decals s'il ne reste plus de spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:158
---@param idx integer index (base 1)
function editor_decalSpline_splineMgr.removeDecalSpline(idx) end

--- Supprime une spline à partir de son id (appelée quand la couche maîtresse est supprimée). Sans effet si l'id est inconnu.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:169
---@param splineId string id de la spline
function editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId) end

--- Sérialise une spline en blob binaire (string.buffer) pour l'éditeur.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:524
---@param spline table spline
---@return string  données encodées
function editor_decalSpline_splineMgr.serializeDecalSpline(spline) end

--- Sérialise une spline en table portable pour un fichier de session : géométrie dérivée vidée, handle de scène supprimé, la spline vivante n'est pas modifiée.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:537
---@param spline table spline
---@return table  table simple
function editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline) end

--- Place une spline à l'index donné et la marque isDirty.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:67
---@param spline table spline
---@param idx integer index (base 1)
function editor_decalSpline_splineMgr.setDecalSpline(spline, idx) end

--- Place toutes les splines d'un tableau aux mêmes index (chacune marquée isDirty) ; ne supprime pas les autres.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:73
---@param splines table tableau de splines
function editor_decalSpline_splineMgr.setDecalSplines(splines) end

--- Active ou désactive le lien d'une spline avec un groupe, supprime ses decals et la marque isDirty.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:661
---@param id string id de spline
---@param groupId string|nil id du groupe de lien
---@param isLink boolean lier ou délier
function editor_decalSpline_splineMgr.setLink(id, groupId, isLink) end

--- Rétablit une édition de spline unique avec decalSplineData.new (si présent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:434
---@param decalSplineData table {old, new}
function editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData) end

--- Annule une édition de spline unique avec decalSplineData.old (si présent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:426
---@param decalSplineData table {old, new}
function editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData) end

--- Coupe une spline au nœud donné en deux splines. Une boucle est ouverte sur place en démarrant au nœud choisi.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:219
---@param selectedSplineIdx integer index de la spline
---@param selectedNodeIdx integer index du nœud de coupe
function editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx) end

--- Rétablit une édition globale avec data.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:454
---@param data table {old, new} avec des tableaux de splines
function editor_decalSpline_splineMgr.transSplineEditRedo(data) end

--- Annule une édition globale : supprime toutes les splines, remet data.old, marque tout isDirty et recalcule la table d'index.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:442
---@param data table {old, new} avec des tableaux de splines
function editor_decalSpline_splineMgr.transSplineEditUndo(data) end

--- Délie toutes les splines liées et marque toutes les splines isDirty.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:698
function editor_decalSpline_splineMgr.unlinkAll() end

--- Reconstruit les splines isDirty : raycasts verticaux des nœuds, géométrie Catmull-Rom, decals, longueur ; marque l'édition dans la session si au moins une a été reconstruite. Appelée chaque frame par l'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:568
function editor_decalSpline_splineMgr.updateDirtyDecalSplines() end

--- Met à jour une spline liée avec la géométrie de la spline maîtresse (nœuds, largeurs, normales, boucle). Si moins de 2 points, vide la géométrie dérivée et supprime les decals.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:676
---@param id string id de spline
---@param points table nœuds vec3
---@param widths table largeurs
---@param nmls table normales
---@param isLoop boolean boucle
---@param isConformToTerrain boolean (non utilisé dans la fonction)
function editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

