---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/notebookInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, path (carnet édité), valid, windowDescription = 'Notebook'.
---@class editor_rallyEditor_notebookInfo
local editor_rallyEditor_notebookInfo = {}

--- Oublie le carnet et vide les champs de texte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:34
function editor_rallyEditor_notebookInfo:clearState() end

--- Dessine l'onglet (délègue à drawNotebook).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:78
---@param mouseInfo table Informations souris (non utilisées).
function editor_rallyEditor_notebookInfo:draw(mouseInfo) end

--- Affiche les champs de calibration définis dans le carnet, ou un bouton pour les initialiser s'ils n'existent pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:142
function editor_rallyEditor_notebookInfo:drawCalibrationMetadataFields() end

--- Dessine le sélecteur du carnet fantôme (liste des choix, option « (none) », message d'erreur) en appelant les fonctions ghostNotebook de l'éditeur de rallye.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:96
function editor_rallyEditor_notebookInfo:drawGhostNotebook() end

--- Valide puis dessine les informations du carnet (erreurs éventuelles, id, fichier), les champs éditables avec annulation/rétablissement, le mode audio, puis les sections calibration et ghost.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:165
function editor_rallyEditor_notebookInfo:drawNotebook() end

--- Constructeur interne : mémorise l'éditeur, valid = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:29
---@param rallyEditor table Instance de l'éditeur de rallye.
function editor_rallyEditor_notebookInfo:init(rallyEditor) end

--- Renvoie le résultat de la dernière validation.
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:42
---@return boolean  true si le carnet est valide.
function editor_rallyEditor_notebookInfo:isValid() end

--- Appelée par l'éditeur quand l'onglet est sélectionné : recopie nom, auteurs et description du carnet dans les champs, puis émet onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:60
function editor_rallyEditor_notebookInfo:selected() end

--- Définit le carnet édité par l'onglet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:55
---@param path table Objet carnet.
function editor_rallyEditor_notebookInfo:setPath(path) end

--- Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:72
function editor_rallyEditor_notebookInfo:unselect() end

--- Lance path:validate() et met à jour valid selon path:is_valid(). Les problèmes sont dans path.validation_issues.
---Source : lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:46
function editor_rallyEditor_notebookInfo:validate() end

