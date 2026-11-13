---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Decal Spline » du World Editor : on trace une spline (nœuds, largeur par défaut 10 m) le long de laquelle des decals sont posés automatiquement à partir de jusqu'à 4 composants (matériau, lignes/colonnes de texture, frame, espacement, jitter). Le fichier est le point d'entrée de l'outil (fenêtre « decalSpline », mode d'édition « Decal Spline ») ; la logique est répartie dans editor/decalSpline/splineMgr, editor/decalSpline/populate et les utilitaires editor/toolUtilities (splineInput, render/spline, session, bake, panCamera, materialSelectionMgr…). Il gère aussi la sauvegarde des splines dans le niveau (onSerialize/onDeserialized, qui survit au rechargement Lua) et l'import/export de sessions.
--- Accès : extension `editor_decalSpline` : `extensions.load("editor_decalSpline")`, puis la globale `editor_decalSpline`
---@class editor_decalSpline
editor_decalSpline = {}

--- Hook appelé quand on quitte la carte ; supprime toutes les splines de decals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline.lua:1745
function editor_decalSpline.onClientEndMission() end

--- Hook de restauration après rechargement Lua : recrée les splines depuis les données sérialisées, reprend les decals conservés des splines verrouillées (populate.adopt), borne l'index sélectionné et recalcule la table id vers index.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline.lua:127
---@param data table|nil liste de splines sérialisées (ignorée si vide)
function editor_decalSpline.onDeserialized(data) end

--- Hook appelé à chaque frame de l'éditeur. Met à jour les splines modifiées ; si l'outil n'est pas actif, ne fait que dessiner les contours. Sinon gère la fenêtre principale, la caméra panoramique, la sélection de matériau, les événements souris/clavier (splineInput) et le rendu des splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline.lua:1664
function editor_decalSpline.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : déclare editor.editModes.decalSplineEditMode (icône decalRoad) et enregistre la fenêtre 300x700.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline.lua:1731
function editor_decalSpline.onEditorInitialized() end

--- Hook de sauvegarde avant rechargement Lua : renvoie la liste des splines sérialisées ({} s'il n'y en a pas) et supprime les splines en mémoire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalSpline.lua:108
---@return table  splines sérialisées
function editor_decalSpline.onSerialize() end

--- Verrouille ou déverrouille la spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés). Les decals sont enregistrés par le gestionnaire de persistance dans les deux cas : le verrou rend seulement la spline non éditable. Ne fait rien si l'id est inconnu.
---Source : lua/ge/extensions/editor/decalSpline.lua:96
---@param id integer id de la spline
---@param isLocked boolean true pour verrouiller
function editor_decalSpline.setLockedById(id, isLocked) end

--- Définit l'index du nœud sélectionné (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/decalSpline.lua:92
---@param idx integer index du nœud, à partir de 1
function editor_decalSpline.setSelectedNodeIdx(idx) end

--- Définit l'index de la spline sélectionnée (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/decalSpline.lua:89
---@param idx integer index de la spline, à partir de 1
function editor_decalSpline.setSelectedSplineIdx(idx) end

