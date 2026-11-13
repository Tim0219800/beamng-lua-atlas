---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Session d'édition de clôture d'Easy Object Select. begin() découvre une clôture existante à partir de l'objet sélectionné (fence/anchors) ou démarre une création ; la clôture est représentée par une spline éditable (splineInput, nœuds sphères) sur laquelle le moteur populationEngine de meshSpline place des pièces TSStatic en aperçu (max 512). La validation crée/modifie les objets en une action d'historique annulable (« Edit Fence » ou « Delete Fence »).
--- Accès : extension `editor_ezObjectSelect_subtools_fence_session` : `extensions.load("editor_ezObjectSelect_subtools_fence_session")`, puis la globale `editor_ezObjectSelect_subtools_fence_session`
---@class editor_ezObjectSelect_subtools_fence_session
editor_ezObjectSelect_subtools_fence_session = {}

--- Démarre une session. Échoue si une session est déjà active ou si aucun asset n'est choisi. Si des objets sont sélectionnés, démarre depuis le dernier ; sinon démarre une création vierge. Sauvegarde la sélection d'origine et enregistre l'outil de spline.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:520
---@param options table|nil assetPaths (string[]), anchorDistance (m), noOverlap (boolean, vrai par défaut sauf false explicite).
---@return boolean  true si la session démarre.
---@return string|nil  Message d'erreur en cas d'échec.
function editor_ezObjectSelect_subtools_fence_session.begin(options) end

--- Annule la session : restaure les objets sources et la sélection d'origine.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:722
function editor_ezObjectSelect_subtools_fence_session.cancel() end

--- Supprime les objets d'origine de la clôture en une action d'historique « Delete Fence ».
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:698
---@return integer  Nombre de pièces supprimées ; 0 si impossible.
function editor_ezObjectSelect_subtools_fence_session.deleteAndCommit() end

--- Valide la clôture : sérialise l'état final, termine la session et enregistre l'action d'historique « Edit Fence » (annulable).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:664
---@return integer  Nombre de pièces créées ; 0 si rien ou en cas d'erreur.
function editor_ezObjectSelect_subtools_fence_session.exitAndCommit() end

--- Nombre de nœuds de la spline (0 sans spline).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:751
---@return integer  Nombre de nœuds.
function editor_ezObjectSelect_subtools_fence_session.getNodeCount() end

--- Nombre de pièces de l'aperçu.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:743
---@return integer  Nombre de placements.
function editor_ezObjectSelect_subtools_fence_session.getPieceCount() end

--- Nombre de pièces d'origine sélectionnées au démarrage.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:747
---@return integer  Nombre.
function editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount() end

--- Dernier message d'état (erreur de validation, etc.).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:770
---@return string|nil  Message.
function editor_ezObjectSelect_subtools_fence_session.getStatusMessage() end

--- true si une session est active.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:735
---@return boolean  Session active.
function editor_ezObjectSelect_subtools_fence_session.isActive() end

--- true si la découverte ou l'aperçu a atteint la limite de sécurité ; la validation est alors bloquée.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:759
---@return boolean  Limite atteinte.
function editor_ezObjectSelect_subtools_fence_session.isCapped() end

--- true si un glisser (création initiale ou nœud de spline) est en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:739
---@return boolean  Glisser en cours.
function editor_ezObjectSelect_subtools_fence_session.isDragging() end

--- true si la spline est fermée en boucle.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:755
---@return boolean  Boucle.
function editor_ezObjectSelect_subtools_fence_session.isLoop() end

--- Active/désactive le mode sans chevauchement (longueurs de mesh entières, reste laissé vide en bout) et marque la spline à reconstruire.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:763
---@param enabled boolean true pour activer.
function editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled) end

--- À appeler chaque frame : gère Échap, la création initiale ou l'édition de spline, reconstruit l'aperçu si la spline est modifiée et dessine nœuds et spline.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua:616
---@param canAcceptInput boolean true si les entrées peuvent être traitées.
---@return boolean  false si aucune session active.
function editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput) end

