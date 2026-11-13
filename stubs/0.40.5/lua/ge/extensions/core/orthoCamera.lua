---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/orthoCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_orthoCamera` : active une vue orthographique (sans perspective) sur la vue principale de l'objet OnlyGui, via scenetree.OnlyGui:setOrthoMainView. On définit les plans proches et lointains et la taille de la fenêtre orthographique (soit left/right/top/bottom, soit une taille `size` avec le ratio de la fenêtre). Contient aussi une fenêtre ImGui de débogage (debugMode, désactivé en dur).
--- Accès : extension `core_orthoCamera` : `extensions.load("core_orthoCamera")`, puis la globale `core_orthoCamera`
---@class core_orthoCamera
core_orthoCamera = {}

--- Active ou désactive la vue orthographique principale et fixe ses paramètres (bornes, plans de clip, taille).
---Source : lua/ge/extensions/core/orthoCamera.lua:52
---@param _enabled boolean true pour activer.
---@param options table|nil { left, right, top, bottom, nearClip, farClip, size, useWindowAspectRatio } ; useWindowAspectRatio vaut true si absent.
function core_orthoCamera.enable(_enabled, options) end

--- Renvoie la taille verticale courante de la vue orthographique.
---Source : lua/ge/extensions/core/orthoCamera.lua:85
---@return number  size (1 par défaut).
function core_orthoCamera.getSize() end

--- Hook par frame : affiche la fenêtre de débogage ImGui 'OnlyGui OrthoMainView' uniquement si debugMode est vrai (faux dans le code livré, donc inactif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/orthoCamera.lua:106
---@param dtReal number Non utilisé.
---@param dtSim number Non utilisé.
---@param dtRaw number Non utilisé.
function core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand la fenêtre est redimensionnée : recalcule le ratio et réapplique la vue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/orthoCamera.lua:89
---@param size any Nouvelle taille de fenêtre (non utilisée).
function core_orthoCamera.onWindowResized(size) end

--- Met à jour size, nearClip et farClip (défauts 1, 1, 5000) et réapplique la vue orthographique si elle a déjà été configurée.
---Source : lua/ge/extensions/core/orthoCamera.lua:75
---@param options table|nil { size, nearClip, farClip }
function core_orthoCamera.setOptions(options) end

