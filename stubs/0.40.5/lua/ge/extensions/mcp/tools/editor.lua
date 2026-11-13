---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour le World Editor : activer/désactiver, état, sélection, annuler/rétablir, modes d'édition, ouvrir/sauvegarder un niveau, lister les classes, créer des objets et modifier leur transformation, avec historique d'annulation. Charge editor_main à la demande.
--- Accès : extension `mcp_tools_editor` : `extensions.load("mcp_tools_editor")`, puis la globale `mcp_tools_editor`
---@class mcp_tools_editor
---@field schemas table<string, table> Schémas des outils d'éditeur.
mcp_tools_editor = {}

--- Vide la sélection.
---Source : lua/ge/extensions/mcp/tools/editor.lua:112
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.clear_editor_selection() end

--- Crée un objet de scène (worldEditorCppApi.createObject), configure champs, nom, position, échelle, yaw, l'ajoute au parent et enregistre une action d'historique CreateObject.
---Source : lua/ge/extensions/mcp/tools/editor.lua:293
---@param args table|nil {class?|classname?: string, shape?|shapeName?: string, name?: string, pos?: {x,y,z}, scale?: number|{x,y,z}, yaw?: number°, parent?: string, parentId?: integer, fields?: table, field?: string, value?: any, index?: string, collisionType?: string, decalType?: string}
---@return string  JSON {id, name, class, parentId, shapeName?}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.create_editor_object(args) end

--- Supprime les objets sélectionnés (annulable).
---Source : lua/ge/extensions/mcp/tools/editor.lua:120
---@return string  Message.
---@return boolean  true si rien n'est sélectionné ou erreur.
function mcp_tools_editor.delete_editor_selection() end

--- Ouvre un niveau dans l'éditeur (editor.openLevel, perd les modifications non sauvegardées, asynchrone). Ajoute un '/' final à un dossier.
---Source : lua/ge/extensions/mcp/tools/editor.lua:205
---@param args table {name?: string, path?: string}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.editor_load_level(args) end

--- Rétablit des étapes de l'historique.
---Source : lua/ge/extensions/mcp/tools/editor.lua:141
---@param args table|nil {steps?: integer (défaut 1)}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.editor_redo(args) end

--- Sauvegarde le niveau courant (editor.saveLevel).
---Source : lua/ge/extensions/mcp/tools/editor.lua:223
---@return string  « saved level: … ».
---@return boolean  true si aucun chemin de niveau.
function mcp_tools_editor.editor_save_level() end

--- État de l'éditeur : active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless.
---Source : lua/ge/extensions/mcp/tools/editor.lua:68
---@return string  JSON.
---@return boolean  true si editor_main ne charge pas.
function mcp_tools_editor.editor_status() end

--- Annule des étapes de l'historique.
---Source : lua/ge/extensions/mcp/tools/editor.lua:133
---@param args table|nil {steps?: integer (défaut 1)}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.editor_undo(args) end

--- Cadre la caméra de l'éditeur sur la sélection (fitViewToSelectionSmooth ou fitViewToSelection).
---Source : lua/ge/extensions/mcp/tools/editor.lua:171
---@return string  Message.
---@return boolean  true si rien n'est sélectionné ou erreur.
function mcp_tools_editor.fit_view_to_selection() end

--- Objets actuellement sélectionnés.
---Source : lua/ge/extensions/mcp/tools/editor.lua:95
---@return string  JSON {count, objects:[{id, name, class}]}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.get_editor_selection() end

--- Liste les modes d'édition enregistrés et le mode courant.
---Source : lua/ge/extensions/mcp/tools/editor.lua:149
---@return string  JSON {current, modes}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.list_edit_modes() end

--- Liste (500 max, triée) les classes dérivées de SimObject via Sim.getSimObjectDerivedClassNames.
---Source : lua/ge/extensions/mcp/tools/editor.lua:273
---@param args table|nil {pattern?: string} sous-chaîne insensible à la casse.
---@return string  JSON {count, classes}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.list_editor_classes(args) end

--- Sélectionne des objets par id, ids[] ou name.
---Source : lua/ge/extensions/mcp/tools/editor.lua:103
---@param args table {id?, ids?: integer[], name?: string, mode?: 'new'|'add'|'remove'|'toggle' (défaut new)}
---@return string  JSON {count, ids}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.select_editor_objects(args) end

--- Change de mode d'édition par nom (editor.selectEditMode).
---Source : lua/ge/extensions/mcp/tools/editor.lua:159
---@param args table {name: string} (de list_edit_modes).
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.set_edit_mode(args) end

--- Active ou désactive le World Editor (editor.setEditorActive).
---Source : lua/ge/extensions/mcp/tools/editor.lua:86
---@param args table {active: boolean, safeMode?: boolean}
---@return string  « editor activating/deactivating ».
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.set_editor_active(args) end

--- Applique position/rotation/échelle à des objets en une transaction d'historique annulable.
---Source : lua/ge/extensions/mcp/tools/editor.lua:435
---@param args table {items?: {id|name, pos?, euler?|rot?, scale?}[], id?, ids?, name?, pos?, euler?, rot?, rotation?, scale?}. Sans cible, utilise la sélection.
---@return string  JSON {count, ids}.
---@return boolean  true en cas d'erreur.
function mcp_tools_editor.set_editor_transform(args) end

