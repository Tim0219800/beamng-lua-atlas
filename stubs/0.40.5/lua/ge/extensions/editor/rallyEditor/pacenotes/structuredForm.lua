---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Formulaire d'édition « structuré » d'un pacenote dans l'éditeur de rallye. Il affiche un aperçu du texte et des fichiers audio, puis les sections Caution, Modifiers Before (preMod1/preMod2), Corner (descripteur d'intensité, direction, forme, pas signés, mode de longueur, type de relâchement des virages lents), Modifiers After (postMod1/postMod2) et Distance. Les modifieurs se choisissent par menu ou par recherche textuelle, avec liste des derniers utilisés (10 max). Les options viennent de la configuration du compositeur de texte du notebook. Utilisé par pacenoteForm.
--- Accès : extension `editor_rallyEditor_pacenotes_structuredForm` : `extensions.load("editor_rallyEditor_pacenotes_structuredForm")`, puis la globale `editor_rallyEditor_pacenotes_structuredForm`
---@class editor_rallyEditor_pacenotes_structuredForm
editor_rallyEditor_pacenotes_structuredForm = {}

--- Réinitialise l'état interne du formulaire (configuration, options, états de recherche, fenêtre active).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua:1022
function editor_rallyEditor_pacenotes_structuredForm.clear() end

--- Dessine tout le formulaire structuré pour le pacenote donné (charge la configuration si besoin).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua:989
---@param pacenote table Pacenote en cours d'édition.
---@param pacenoteToolsWindow table Fenêtre d'outils des pacenotes, mémorisée pour les rafraîchissements.
function editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow) end

