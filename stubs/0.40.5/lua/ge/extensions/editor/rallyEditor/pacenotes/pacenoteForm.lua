---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du formulaire de pacenote.
---@class editor_rallyEditor_pacenotes_pacenoteForm
local editor_rallyEditor_pacenotes_pacenoteForm = {}

--- Remet à zéro l'état d'édition (édition en cours, confirmation de suppression) et retire le pacenote.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:50
function editor_rallyEditor_pacenotes_pacenoteForm:clearState() end

--- Dessine le formulaire dans une zone enfant imgui, ou « No pacenote selected ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:440
function editor_rallyEditor_pacenotes_pacenoteForm:draw() end

--- Constructeur : mémorise la fenêtre d'outils et son état, sans pacenote.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:37
---@param pacenoteToolsWindow table Fenêtre d'outils des pacenotes (fournit pacenoteToolsState).
function editor_rallyEditor_pacenotes_pacenoteForm:init(pacenoteToolsWindow) end

--- Définit le pacenote édité et réinitialise StructuredForm, CustomForm et MeasurementsForm.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:43
---@param pacenote table|nil Pacenote à éditer, ou nil.
function editor_rallyEditor_pacenotes_pacenoteForm:setPacenote(pacenote) end

