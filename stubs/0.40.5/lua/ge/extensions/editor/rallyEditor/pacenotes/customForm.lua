---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Formulaire imgui de l'éditeur de pacenotes pour les pacenotes en mode audio « custom » (fichiers audio personnalisés). Il affiche la case « Slow Corner » et son type de relâchement, l'aperçu texte du pacenote (noteOutputCustom), des boutons pour ouvrir ou copier le dossier des fichiers audio, puis la liste des clips assignés avec un bouton de lecture (Engine.Audio.intercomPlayPacenote). La description affichée d'un clip vient des transcriptions du carnet, sinon du nom du fichier.
--- Accès : extension `editor_rallyEditor_pacenotes_customForm` : `extensions.load("editor_rallyEditor_pacenotes_customForm")`, puis la globale `editor_rallyEditor_pacenotes_customForm`
---@class editor_rallyEditor_pacenotes_customForm
editor_rallyEditor_pacenotes_customForm = {}

--- Réinitialisation d'état appelée par l'éditeur ; ne fait rien dans ce module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua:116
function editor_rallyEditor_pacenotes_customForm.clear() end

--- Dessine le formulaire d'un pacenote en mode audio custom.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua:86
---@param pacenote table Pacenote édité (méthodes toggleSlowCorner, getCustomAudioFiles, noteOutputCustom, customAudioFileDir…).
function editor_rallyEditor_pacenotes_customForm.draw(pacenote) end

