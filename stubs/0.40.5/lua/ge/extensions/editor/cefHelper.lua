---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cefHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit outil prévu pour masquer l'interface CEF (scenetree.maincef) quand l'éditeur imgui est actif. Dans la version 0.40.5 le code est commenté (« disabled for release due to bugs with the track editor »), donc le module ne fait rien.
--- Accès : extension `editor_cefHelper` : `extensions.load("editor_cefHelper")`, puis la globale `editor_cefHelper`
---@class editor_cefHelper
editor_cefHelper = {}

--- Appelé à l'activation de l'éditeur. Devrait cacher l'UI CEF mais est désactivé (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cefHelper.lua:14
function editor_cefHelper.onEditorActivated() end

--- Appelé à la désactivation de l'éditeur. Devrait réafficher l'UI CEF mais est désactivé (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cefHelper.lua:9
function editor_cefHelper.onEditorDeactivated() end

