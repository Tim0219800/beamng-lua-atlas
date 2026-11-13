---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/perfProfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de l'éditeur « CameraProfiler » (menu Debug > Performance Recorder) pour enregistrer et comparer des performances. Elle lance un enregistrement le long d'un chemin de caméra (*.camPath.json du dossier levels/<niveau>/perfRecordingCampaths/) via test_util_fpsCamRecorder et util_stepHandler, charge des fichiers .perfRecording.json, trace des courbes (fps_average, fps_min, polyCount, drawCalls, mémoire…) dans des fenêtres « Profiler Chart N » (10 max) et compare les fichiers dans un tableau. Utile pour mesurer l'impact d'un mod ou d'un réglage graphique.
--- Accès : extension `editor_perfProfiler` : `extensions.load("editor_perfProfiler")`, puis la globale `editor_perfProfiler`
---@class editor_perfProfiler
editor_perfProfiler = {}

--- Charge un fichier de performance JSON (jsonReadFile), complète meta.name (nom de fichier), cherche un fichier d'annotation du niveau, convertit chaque sample en pos=vec3 et rot=quat, marque le fichier actif et l'ajoute à la liste des fichiers comparés. Ne fait rien si filepath est vide.
---Source : lua/ge/extensions/editor/perfProfiler.lua:426
---@param data table Table de retour du dialogue de fichier ; seul data.filepath (chemin du .perfRecording.json) est lu.
function editor_perfProfiler.loadFile(data) end

--- Appelé à chaque frame par l'éditeur. Dessine la fenêtre principale (menu Record / Load / New Chart Window, tableau des fichiers avec case, couleur, nom), recalcule couleurs et graphiques si nécessaire, puis les graphiques, le tableau comparateur, la fenêtre de métadonnées et le popup d'enregistrement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/perfProfiler.lua:461
---@param dt number Delta temps passé aux graphiques.
function editor_perfProfiler.onEditorGui(dt) end

--- Enregistre la fenêtre CameraProfiler (500x500) et l'entrée de menu « Performance Recorder » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/perfProfiler.lua:549
function editor_perfProfiler.onEditorInitialized() end

--- Affiche la fenêtre CameraProfiler (editor.showWindow).
---Source : lua/ge/extensions/editor/perfProfiler.lua:545
function editor_perfProfiler.show() end

