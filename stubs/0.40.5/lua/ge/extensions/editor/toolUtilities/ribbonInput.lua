---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/ribbonInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des événements souris et clavier pour les splines « ruban » des outils d'édition de l'éditeur. Un ruban est une spline posée en paires de nœuds gauche/droite (chaque paire a une profondeur). handleRibbonEvents (alias handlePrismEvents) dessine le curseur, l'aide à la pose des paires (premier nœud, second nœud), cherche le segment de ruban le plus proche du curseur, gère sélection, glissement de nœuds (libre ou rigide), gizmo (Alt), réglage de profondeur au glisser (0.1 m par pixel, entre 1 et 500 m), suppression (Suppr), insertion, et enregistre les modifications dans l'historique d'annulation.
--- Accès : extension `editor_toolUtilities_ribbonInput` : `extensions.load("editor_toolUtilities_ribbonInput")`, puis la globale `editor_toolUtilities_ribbonInput`
---@class editor_toolUtilities_ribbonInput
editor_toolUtilities_ribbonInput = {}

--- Alias de handleRibbonEvents (ancien nom, « prism » pour ruban prisme). Mêmes paramètres et valeurs de retour.
---Source : lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons table Liste des rubans.
---@param out table Table de sortie (ribbonIdx ou prismIdx, nodeIdx, isGizmoActive).
---@param useGizmo boolean Gizmo utilisable.
---@param isRigidTranslation boolean Translation rigide.
---@param masterDepth number Profondeur des nouvelles paires.
---@param updateRibbonDataFn function Callback de mise à jour.
---@param deepCopyFn function Callback de copie profonde.
---@param undoFn function Callback d'annulation.
---@param redoFn function Callback de rétablissement.
---@return integer  Indice du segment le plus proche.
---@return boolean  Glissement de nœud en cours.
function editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

--- Gère les événements utilisateur pour les rubans, à appeler chaque frame par l'outil actif. Met à jour out, appelle updateRibbonDataFn après chaque modification et enregistre l'état complet via deepCopyFn / undoFn / redoFn. Renvoie le meilleur segment trouvé pour la recherche du segment sous le curseur, sur le ruban sélectionné.
---Source : lua/ge/extensions/editor/toolUtilities/ribbonInput.lua:281
---@param ribbons table Liste des rubans à éditer.
---@param out table Table de sortie : ribbonIdx (ruban), nodeIdx (nœud), isGizmoActive (gizmo actif).
---@param useGizmo boolean Le gizmo est-il utilisable.
---@param isRigidTranslation boolean true : le glissement déplace tous les nœuds du même vecteur ; false : chaque nœud bouge indépendamment.
---@param masterDepth number Profondeur utilisée pour les nouvelles paires de nœuds.
---@param updateRibbonDataFn function Callback pour recalculer les données du ruban après modification.
---@param deepCopyFn function Callback copiant en profondeur TOUTES les données de rubans (état complet) pour l'annulation.
---@param undoFn function Callback d'annulation de l'état complet.
---@param redoFn function Callback de rétablissement de l'état complet.
---@return integer  Indice du segment le plus proche du curseur sur le ruban sélectionné.
---@return boolean  true si un glissement de nœud est en cours (isNodeDrag).
function editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn) end

