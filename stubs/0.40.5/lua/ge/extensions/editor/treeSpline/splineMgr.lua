---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de données de l'outil Tree Spline : détient la liste des splines d'arbres (treeSplines) et la table id -> index (splineMap), crée/supprime/copie/divise les splines, gère la sérialisation (rechargement Lua et fichiers de session JSON), l'annulation/rétablissement, les liens avec la Master Spline et la reconstruction des splines sales (géométrie puis replantage via editor/treeSpline/populate). Utilisé par editor/treeSpline.lua et par les outils partagés (splineInput, session).
--- Accès : extension `editor_treeSpline_splineMgr` : `extensions.load("editor_treeSpline_splineMgr")`, puis la globale `editor_treeSpline_splineMgr`
---@class editor_treeSpline_splineMgr
editor_treeSpline_splineMgr = {}

--- Ajoute une nouvelle spline vide (nom unique, UUID Engine.generateUUID, isConformToTerrain = true) ; l'utilisateur place ensuite ses nœuds en cliquant sur le terrain.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:83
---@return integer  Index de la nouvelle spline.
function editor_treeSpline_splineMgr.addNewTreeSpline() end

--- Copie le profil (paramètres de feuillage seulement, pas la géométrie) ; callback requis par splineInput.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:259
---@param spline table Spline source.
---@return table  Profil copié.
function editor_treeSpline_splineMgr.copyTreeSplineProfile(spline) end

--- Copie profonde d'une spline, sans la géométrie dérivée ni les poignées runtime (reconstruites depuis les nœuds et paramètres).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:142
---@param spline table Spline à copier.
---@return table  Copie.
function editor_treeSpline_splineMgr.deepCopyTreeSpline(spline) end

--- Copie profonde de toute la liste (pour l'annulation/rétablissement inter-splines).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:162
---@return table  Liste copiée.
function editor_treeSpline_splineMgr.deepCopyTreeSplineState() end

--- Reconstruit une spline depuis un blob encodé (string) ou une table JSON. Réinitialise les tables dérivées, marque la spline sale, réhydrate les vec3 (nodes, nmls) et reprend les arbres conservés (keptObjects) via pop.adopt.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:296
---@param data string|table Blob de l'éditeur ou table issue d'un fichier de session.
---@return table  Spline reconstruite.
function editor_treeSpline_splineMgr.deserializeTreeSpline(data) end

--- Liste des splines actives sous forme {name, id, type} pour le lien avec la Master Spline.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:364
---@return table[]  Entrées {name, id, type = préfixe de l'outil}.
function editor_treeSpline_splineMgr.getCurrentTreeSplineList() end

--- Renvoie la clé du mode d'édition de l'outil.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:49
---@return string  Clé du mode d'édition.
function editor_treeSpline_splineMgr.getEditModeKey() end

--- Valeurs numériques de distribution par défaut pour une nouvelle spline (sans accès au scenetree, sûr au chargement du module).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:58
---@return table  class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed.
function editor_treeSpline_splineMgr.getFoliageParamDefaults() end

--- Renvoie la table id -> index des splines.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:55
---@return table<string, integer>  Table id vers index.
function editor_treeSpline_splineMgr.getSplineMap() end

--- Instantané complet (toutes les splines) en données simples, pour onSerialize.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:317
---@return table  Liste de blobs sérialisés.
function editor_treeSpline_splineMgr.getState() end

--- Renvoie le préfixe de nom de l'outil (utilisé pour nommer les splines et identifier le type dans la Master Spline).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:46
---@return string  Préfixe de l'outil.
function editor_treeSpline_splineMgr.getToolPrefixStr() end

--- Renvoie la liste (vivante, non copiée) des tree splines.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:52
---@return table  Liste de splines.
function editor_treeSpline_splineMgr.getTreeSplines() end

--- Indique si la spline d'identifiant donné est liée à une Master Spline.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:377
---@param id string Identifiant de la spline.
---@return boolean  Vrai si liée.
function editor_treeSpline_splineMgr.isLinked(id) end

--- Construit la distribution de feuillage par défaut d'une nouvelle spline : les valeurs numériques plus une espèce cochée (species) avec son poids 1.0 (speciesWeights).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:72
---@return table  Paramètres de feuillage.
function editor_treeSpline_splineMgr.makeFoliageDefaults() end

--- Applique un profil de feuillage à une spline ; la géométrie reste inchangée.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:265
---@param spline table Spline cible.
---@param profile table Profil renvoyé par copyTreeSplineProfile.
function editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile) end

--- Recalcule la table id -> index ; appelé par l'aide de session après un chargement qui ajoute des splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:314
function editor_treeSpline_splineMgr.recomputeIdMap() end

--- Supprime toutes les splines (et leurs arbres). Sans isIncludeDisabled, seules les splines actives et non liées sont supprimées.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:131
---@param isIncludeDisabled boolean Vrai pour inclure les splines verrouillées ou liées.
function editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled) end

--- Supprime une spline liée par id (appelé quand un calque de la Master Spline est retiré).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:414
---@param splineId string Identifiant.
function editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId) end

--- Supprime la spline à l'index donné et retire ses arbres plantés. Sans effet si l'index est invalide.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:122
---@param idx integer Index de la spline.
function editor_treeSpline_splineMgr.removeTreeSpline(idx) end

--- Sérialise une spline (liste blanche des champs primaires, sans géométrie dérivée) en blob encodé, pour la persistance au rechargement Lua.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:274
---@param spline table Spline.
---@return string  Blob encodé.
function editor_treeSpline_splineMgr.serializeTreeSpline(spline) end

--- Table simple portable pour un fichier de session (toolUtilities/session) : décode le blob de serializeTreeSpline ; jsonWriteFile aplatit les nœuds vec3.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:290
---@param spline table Spline.
---@return table  Table sérialisable en JSON.
function editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline) end

--- Lie ou délie la spline à un groupe de Master Spline (linkId), retire ses arbres et la marque sale.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:383
---@param id string Identifiant de la spline.
---@param groupId string Identifiant du groupe Master Spline.
---@param isLink boolean Vrai pour lier.
function editor_treeSpline_splineMgr.setLink(id, groupId, isLink) end

--- Restaure toute la liste depuis un instantané (supprime d'abord tout) ; les splines sont marquées sales et replantées.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:324
---@param state table|nil Instantané de getState.
function editor_treeSpline_splineMgr.setState(state) end

--- Remplace l'enregistrement d'une spline (chemin d'annulation de la sélection d'objet dans splineInput).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:203
---@param spline table Nouvelle spline.
---@param idx integer Index à remplacer.
function editor_treeSpline_splineMgr.setTreeSpline(spline, idx) end

--- Remplace toute la liste des splines (annulation/rétablissement inter-splines).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:215
---@param splines table Nouvelle liste.
function editor_treeSpline_splineMgr.setTreeSplines(splines) end

--- Rétablit l'édition d'une seule spline (callback d'historique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:244
---@param splineData table Données {old, new} de l'action.
function editor_treeSpline_splineMgr.singleSplineEditRedo(splineData) end

--- Annule l'édition d'une seule spline (callback d'historique de l'éditeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:243
---@param splineData table Données {old, new} de l'action.
function editor_treeSpline_splineMgr.singleSplineEditUndo(splineData) end

--- Coupe la spline sélectionnée en deux au nœud choisi (splines ouvertes), ou déroule une boucle sur place. Les deux moitiés héritent des paramètres de feuillage et du réglage de conformité.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:180
---@param selIdx integer Index de la spline.
---@param nodeIdx integer Index du nœud de coupe.
---@return integer  Nouvel index sélectionné.
function editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx) end

--- Rétablit une édition inter-splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:252
---@param data table Données {old, new} de l'action.
function editor_treeSpline_splineMgr.transSplineEditRedo(data) end

--- Annule une édition inter-splines (ajout, suppression, réordonnancement sur toute la liste).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:247
---@param data table Données {old, new} de l'action.
function editor_treeSpline_splineMgr.transSplineEditUndo(data) end

--- Délie toutes les splines liées et les marque sales.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:422
function editor_treeSpline_splineMgr.unlinkAll() end

--- Reconstruit la géométrie et replante les splines sales ; peut être appelée à chaque frame. Signale l'édition à la session (session.markEdited).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:332
function editor_treeSpline_splineMgr.updateDirtyTreeSplines() end

--- Met à jour une spline liée avec la géométrie poussée par la Master Spline (nœuds, largeurs, normales, boucle) ; vide la géométrie dérivée et les arbres si moins de 2 points. Le paramètre isConformToTerrain est ignoré.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:395
---@param id string Identifiant.
---@param points table Nœuds.
---@param widths table Largeurs.
---@param nmls table Normales.
---@param isLoop boolean Spline fermée.
---@param isConformToTerrain boolean Ignoré.
function editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

