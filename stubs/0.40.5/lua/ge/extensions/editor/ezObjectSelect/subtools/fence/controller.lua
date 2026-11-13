---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Panneau ImGui du sous-outil « Fence » d'Easy Object Select. Permet de choisir le mesh de clôture (sélection de l'Asset Browser ou objet sélectionné dans Easy Select), de régler la distance de correspondance des ancres (0.05 à 5 m) et l'option « No overlap », puis de lancer Select Fence, et, une fois le mode actif, de valider (Exit Fence Mode), annuler (Cancel Fence) ou supprimer (Delete Fence) la clôture. Délègue toute la logique à fence/session.
--- Accès : extension `editor_ezObjectSelect_subtools_fence_controller` : `extensions.load("editor_ezObjectSelect_subtools_fence_controller")`, puis la globale `editor_ezObjectSelect_subtools_fence_controller`
---@class editor_ezObjectSelect_subtools_fence_controller
editor_ezObjectSelect_subtools_fence_controller = {}

--- Annule la session de clôture en cours (restaure les pièces d'origine).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:155
function editor_ezObjectSelect_subtools_fence_controller.cancel() end

--- Dessine le panneau du sous-outil et traite les clics sur ses boutons (appelle fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:28
---@param options table|nil canEnter (boolean) : si false, Select Fence est désactivé.
function editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options) end

--- Indique si le mode clôture est actif.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:159
---@return boolean  true si une session est active.
function editor_ezObjectSelect_subtools_fence_controller.isModeActive() end

--- Passe la frame à fenceSession.update (entrées souris/clavier, aperçu, dessin).
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua:151
---@param canAcceptInput boolean true si la vue peut recevoir les entrées.
---@return boolean  true si une session est active.
function editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput) end

