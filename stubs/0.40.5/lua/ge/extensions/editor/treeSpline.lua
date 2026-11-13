---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil Tree Spline de l'éditeur : on dessine une polyligne éditable sur le terrain et l'outil plante une rangée régulière d'arbres/arbustes (vraies instances Forest) le long de celle-ci (avenues, haies). Dès 2 nœuds, la spline plante et replante en direct quand on ajoute/déplace/supprime des nœuds ou change la distribution. Frère « ligne » de forestZoneEditor ; partage le noyau de toolUtilities/foliageScatter. Structure identique à meshSpline/assemblySpline (editor/<outil>.lua + <outil>/splineMgr.lua + populate.lua). Fenêtre « treeSpline » et mode d'édition treeSplineEditMode.
--- Accès : extension `editor_treeSpline` : `extensions.load("editor_treeSpline")`, puis la globale `editor_treeSpline`
---@class editor_treeSpline
editor_treeSpline = {}

--- Hook de fin de mission : oublie les arbres soulevés et supprime toutes les splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:592
function editor_treeSpline.onClientEndMission() end

--- Après rechargement : restaure l'état (splines marquées sales, replantées au prochain onEditorGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:556
---@param data table|nil Valeur renvoyée par onSerialize.
function editor_treeSpline.onDeserialized(data) end

--- Avant la sauvegarde du niveau : soulève de la forêt (scatter.lift) les arbres des splines actives pour qu'ils ne soient pas écrits ; seuls les arbres des splines verrouillées font partie du niveau. Ils sont remis à la frame suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:598
function editor_treeSpline.onEditorBeforeSaveLevel() end

--- Hook de frame de l'éditeur : restitue les arbres soulevés, replante les splines sales (même outil inactif), dessine la fenêtre, gère l'édition des nœuds via splineInput et le rendu des splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:504
function editor_treeSpline.onEditorGui() end

--- Hook d'initialisation de l'éditeur : crée editor.editModes.treeSplineEditMode et enregistre la fenêtre treeSpline (330x760).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:579
function editor_treeSpline.onEditorInitialized() end

--- Avant le rechargement de la VM Lua : pour chaque spline verrouillée, garde les clés de ses arbres (keptObjects via populate.release), puis prend un instantané des définitions et retire les instances plantées pour éviter les orphelins. onDeserialized les replante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:546
---@return table  État des splines (splineMgr.getState()).
function editor_treeSpline.onSerialize() end

--- Verrouille/déverrouille la tree spline d'identifiant donné (isEnabled = not isLocked), la marque sale et la replante immédiatement. Aussi utilisé par la Master Spline pour les enfants liés. Les arbres d'une spline verrouillée restent dans la forêt à la sauvegarde. Sans effet si l'id est inconnu.
---Source : lua/ge/extensions/editor/treeSpline.lua:118
---@param id string Identifiant de la spline.
---@param isLocked boolean Vrai pour verrouiller.
function editor_treeSpline.setLockedById(id, isLocked) end

--- Définit l'index du nœud sélectionné ; appelé par splineInput lors d'un saut vers cet outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:99
---@param idx integer Index du nœud (à partir de 1).
function editor_treeSpline.setSelectedNodeIdx(idx) end

--- Définit l'index de la spline sélectionnée ; appelé par splineInput lors d'un saut vers cet outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/treeSpline.lua:98
---@param idx integer Index de la spline (à partir de 1).
function editor_treeSpline.setSelectedSplineIdx(idx) end

