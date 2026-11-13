---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/sketch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module d'API de l'éditeur pour les « sketches » (croquis dans le monde). Dans cette version il n'est qu'une coquille : initialize(editor) ajoute à l'objet editor trois fonctions (createSketch, deleteSketch, getSketches) dont le corps est vide (commentaire TODO). Les hooks prévus sont listés en commentaire : onEditorSketchCreated, onEditorSketchDelete, onEditorSketchChanged.
--- Accès : extension `editor_api_sketch` : `extensions.load("editor_api_sketch")`, puis la globale `editor_api_sketch`
---@class editor_api_sketch
editor_api_sketch = {}

--- Enregistre createSketch, deleteSketch et getSketches sur l'objet editor passé en argument. Appelé par le chargeur de l'API de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/sketch.lua:26
---@param editorInstance table Objet editor global de l'éditeur sur lequel les fonctions sont ajoutées.
function editor_api_sketch.initialize(editorInstance) end

--- Objet editor de l'éditeur, enrichi par initialize. Toutes ces méthodes sont des stubs vides.
---@class editor_api_sketch_editor
local editor_api_sketch_editor = {}

--- Prévu pour créer un croquis. Corps vide (TODO).
---Source : lua/ge/extensions/editor/api/sketch.lua:14
---@param position any Position du croquis (déduit du nom).
---@param size any Taille du croquis (déduit du nom).
function editor_api_sketch_editor.createSketch(position, size) end

--- Prévu pour supprimer un croquis. Corps vide (TODO).
---Source : lua/ge/extensions/editor/api/sketch.lua:18
---@param sketchObjectId integer Id de l'objet croquis (déduit du nom).
function editor_api_sketch_editor.deleteSketch(sketchObjectId) end

--- Prévu pour lister les croquis. Corps vide (TODO), renvoie nil.
---Source : lua/ge/extensions/editor/api/sketch.lua:22
function editor_api_sketch_editor.getSketches() end

