---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/visibility.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affiche ou masque l'interface du jeu : l'UI web (CEF) et les fenêtres imgui. Utile pour les captures d'écran, les vidéos ou les outils. Il mémorise l'état dans M.state (cefVisible, imguiVisible) et diffuse le changement de visibilité CEF.
--- Accès : extension `ui_visibility` : `extensions.load("ui_visibility")`, puis la globale `ui_visibility`
---@class ui_visibility
ui_visibility = {}

--- Renvoie l'état de visibilité général, qui est celui de l'UI web (CEF).
---Source : lua/ge/extensions/ui/visibility.lua:46
---@return boolean  true si visible.
function ui_visibility.get() end

--- Indique si l'UI web (CEF) est visible.
---Source : lua/ge/extensions/ui/visibility.lua:10
---@return boolean  true si visible.
function ui_visibility.getCef() end

--- Indique si imgui est activé.
---Source : lua/ge/extensions/ui/visibility.lua:35
---@return boolean  true si visible.
function ui_visibility.getImgui() end

--- Affiche ou masque en même temps l'UI web et imgui.
---Source : lua/ge/extensions/ui/visibility.lua:40
---@param visible boolean true pour afficher.
function ui_visibility.set(visible) end

--- Affiche ou masque l'UI web ; émet 'onCefVisibilityChanged' (UI et extensions) seulement si l'état change.
---Source : lua/ge/extensions/ui/visibility.lua:13
---@param visible boolean true pour afficher.
function ui_visibility.setCef(visible) end

--- Active ou désactive imgui (Engine.imgui.setEnabled) si l'état change.
---Source : lua/ge/extensions/ui/visibility.lua:27
---@param visible boolean true pour activer.
function ui_visibility.setImgui(visible) end

--- Inverse la visibilité générale (selon get(), donc l'état CEF) et l'applique à CEF et imgui.
---Source : lua/ge/extensions/ui/visibility.lua:50
function ui_visibility.toggle() end

--- Inverse la visibilité de l'UI web.
---Source : lua/ge/extensions/ui/visibility.lua:22
function ui_visibility.toggleCef() end

