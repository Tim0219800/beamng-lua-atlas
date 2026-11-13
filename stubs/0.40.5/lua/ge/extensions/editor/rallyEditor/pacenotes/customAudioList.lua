---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Liste imgui des clips audio personnalisés d'un carnet de rallye, utilisée dans l'éditeur de pacenotes (mode audio custom). Elle affiche tous les clips dans l'ordre, regroupés sous un en-tête par pacenote (couleurs jaune/violet en alternance, vert pour le pacenote sélectionné). Chaque ligne a un bouton de lecture, un bouton « ancre » (viseur) pour choisir dans la vue 3D le pacenote auquel rattacher le clip, un bouton pour effacer l'ancre, et le texte de transcription (sinon le nom du fichier). Un bouton « Sync audio files » relit le dossier audio.
--- Accès : extension `editor_rallyEditor_pacenotes_customAudioList` : `extensions.load("editor_rallyEditor_pacenotes_customAudioList")`, puis la globale `editor_rallyEditor_pacenotes_customAudioList`
---@class editor_rallyEditor_pacenotes_customAudioList
editor_rallyEditor_pacenotes_customAudioList = {}

--- Dessine la barre d'outils, l'aide de sélection d'ancre et la liste défilante des clips. Affiche un message si le carnet est absent ou si aucun fichier audio n'est trouvé.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua:184
---@param notebook table|nil Carnet (méthodes customAudioBasenamesFor, scanCustomAudioBasenames, syncCustomAudioFromDisk, resolveCustomAudioBasename, getCustomAudioAnchorInfo, clearCustomAudioAnchor, loadCustomPacenoteTranscriptions).
---@param selectedPacenote table|nil Pacenote actuellement sélectionné, dont le groupe est surligné.
---@param pacenoteToolsWindow table|nil Fenêtre d'outils pacenotes : fournit beginCustomAudioAnchorPick, isPickingCustomAudioAnchorFor, getCustomAudioAnchorPickBasename.
function editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow) end

