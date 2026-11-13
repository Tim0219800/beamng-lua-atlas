---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteLibrary` : `extensions.load("editor_toolUtilities_siteLibrary")`, puis la globale `editor_toolUtilities_siteLibrary`
---@class editor_toolUtilities_siteLibrary
editor_toolUtilities_siteLibrary = {}

--- One tool's binding to its shelf. cfg:
---   toolId     the tool's id: its session key, and the tag its model.json was written under
---   kind       which shelf the document lives on ('building' / 'openSpace' / 'carPark')
---   noun       what one of them is called, for the tooltips
---   stateKey   the key the serialised document sits under inside model.json's `state`
---   editMode   the edit mode to select when the placer sends one here to be opened
---   hasContent (doc) -> is there yet anything worth saving
---   bakeRun    (doc) -> ok, and the folder written or the reason it could not be
---   applyState (state) -> load the document out of a model.json state; ok, and a reason when not
---   rename     (doc, name) put the name on the document through the tool's own undo
---Source : lua/ge/extensions/editor/toolUtilities/siteLibrary.lua:35
---@param cfg any
function editor_toolUtilities_siteLibrary.new(cfg) end

