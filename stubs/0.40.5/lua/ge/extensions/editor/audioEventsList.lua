---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioEventsList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « SFX Previewer » (menu Audio) qui liste tous les événements sonores (FMOD « event:>... » et fichiers son) du jeu et permet de les écouter. La liste vient de Sim.getSFXTrackSet() ; elle est affichée en arborescence de dossiers ou filtrée par une recherche texte. Clic gauche sur un événement = lecture via Engine.Audio.playOnce('AudioGui', nom, {position}) à la position du véhicule joueur (ou 0,0,0) ; clic droit = copier le nom dans le presse-papiers. Utile à un moddeur pour retrouver le nom exact d'un événement à mettre dans un jbeam ou une scène.
--- Accès : extension `editor_audioEventsList` : `extensions.load("editor_audioEventsList")`, puis la globale `editor_audioEventsList`
---@class editor_audioEventsList
---@field dependencies table<integer, string> Extensions à charger avant celle-ci : {"editor_main"}.
editor_audioEventsList = {}

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu dans le groupe « Audio ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioEventsList.lua:273
function editor_audioEventsList.onEditorInitialized() end

--- Hook appelé quand une fenêtre d'outil est masquée ; pour « sfxPreviewer », sauvegarde l'état des fenêtres (editor.saveWindowsState).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioEventsList.lua:263
---@param windowName string Nom de la fenêtre masquée.
function editor_audioEventsList.onEditorToolWindowHide(windowName) end

--- Hook appelé quand une fenêtre d'outil de l'éditeur est affichée ; si c'est « sfxPreviewer », reconstruit la liste des événements sonores.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioEventsList.lua:257
---@param windowName string Nom de la fenêtre affichée.
function editor_audioEventsList.onEditorToolWindowShow(windowName) end

--- Dessine la fenêtre SFX Previewer (champ de recherche, navigation dans l'arbre des dossiers ou résultats de recherche, bouton « Stop Current Sound »). Ne fait rien si l'éditeur ou la fenêtre ne sont pas enregistrés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioEventsList.lua:214
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée de la frame (s).
---@param dtRaw number Durée brute de la frame (s).
function editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé par l'entrée de menu Audio > SFX Previewer ; affiche la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioEventsList.lua:269
function editor_audioEventsList.onWindowMenuItem() end

