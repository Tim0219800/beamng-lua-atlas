---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/navMeshEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur du navmesh Recast (maillage de navigation de l'IA) dans le World Editor, modelé sur l'éditeur de rivières : un mode d'édition « Navigation Mesh », une barre d'outils, une interaction dans la vue 3D et deux fenêtres (« NavMesh Overview » : grille 2D des tuiles et formes de la tuile courante ; « navMeshTileView »). Six outils : tiles (sélection et verrouillage des tuiles pour qu'une reconstruction ne les change pas), outline (polygone de couverture), areas (volumes convexes typés Exclude/Ground/Road/Sidewalk/Water), links (liaisons hors maillage jump/drop/climb/teleport), test (recherche de chemin A vers B) et crowd (agents IA vivants). Tout est annulable. Il pilote les fonctions C++ navmeshEditor* (navmeshEditorBuild, navmeshEditorSave/Load, navmeshEditorFindPath, navmeshEditorCrowd*, etc.). Le navmesh est enregistré avec le niveau (onEditorAfterSaveLevel) et rechargé à l'ouverture.
--- Accès : extension `editor_navMeshEditor` : `extensions.load("editor_navMeshEditor")`, puis la globale `editor_navMeshEditor`
---@class editor_navMeshEditor
editor_navMeshEditor = {}

--- Indique si le gizmo de transformation est autorisé : vrai uniquement quand le mode d'édition courant est « Navigation Mesh ».
---Source : lua/ge/extensions/editor/navMeshEditor.lua:971
---@return boolean  Vrai si le mode d'édition courant est celui du navmesh.
function editor_navMeshEditor.allowGizmo() end

--- Hook appelé après l'ouverture d'un niveau dans l'éditeur : réinitialise polygones, aires, sélection, tuiles et liaisons ; le navmesh sera rechargé à la prochaine activation du mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/navMeshEditor.lua:964
function editor_navMeshEditor.onEditorAfterOpenLevel() end

--- Hook appelé après la sauvegarde d'un niveau dans l'éditeur : enregistre le navmesh avec le niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/navMeshEditor.lua:963
function editor_navMeshEditor.onEditorAfterSaveLevel() end

--- Hook d'éditeur appelé à chaque frame : dessine les fenêtres Overview et vue de tuile quand le mode navmesh est actif (ou le message d'API manquante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/navMeshEditor.lua:900
function editor_navMeshEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre les deux fenêtres, le gestionnaire d'inspecteur « navMesh », le mode d'édition navMeshEditMode et l'entrée de menu « Navigation Mesh » (groupe Gameplay).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/navMeshEditor.lua:942
function editor_navMeshEditor.onEditorInitialized() end

--- Sélectionne le mode d'édition « Navigation Mesh ».
---Source : lua/ge/extensions/editor/navMeshEditor.lua:920
function editor_navMeshEditor.show() end

