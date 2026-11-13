---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur du module (new(rallyEditor)). Champs : rallyEditor, selectedFname, path (carnet chargé), labels (table id -> libellé), error (message ou nil).
---@class editor_rallyEditor_ghostNotebook
local editor_rallyEditor_ghostNotebook = {}

--- Renvoie le carnet actuellement édité (champ path de la fenêtre pacenotes), ou nil.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:282
---@return table|nil  Carnet actif.
function editor_rallyEditor_ghostNotebook:activeNotebook() end

--- Oublie le carnet fantôme sélectionné, son chemin, les libellés et l'erreur.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:249
function editor_rallyEditor_ghostNotebook:clear() end

--- Alias de clear(), appelé par l'éditeur lors d'une réinitialisation d'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:256
function editor_rallyEditor_ghostNotebook:clearState() end

--- Renvoie le dernier message d'erreur de chargement.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:333
---@return string|nil  Message d'erreur, ou nil.
function editor_rallyEditor_ghostNotebook:getError() end

--- Renvoie le texte à afficher pour un pacenote du fantôme. En mode '<metadata>', construit le libellé depuis les métadonnées de calibration (chaîne vide si absent) ; sinon utilise le cache puis recalcule.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:337
---@param pacenote table|nil Pacenote du carnet fantôme.
---@return string|nil  Libellé, ou nil si pacenote est nil.
function editor_rallyEditor_ghostNotebook:getLabelForPacenote(pacenote) end

--- Renvoie le carnet fantôme chargé.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:320
---@return table|nil  Objet carnet, ou nil.
function editor_rallyEditor_ghostNotebook:getPath() end

--- Renvoie le nom de fichier sélectionné (ou '<metadata>').
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:324
---@return string|nil  Chemin sélectionné.
function editor_rallyEditor_ghostNotebook:getSelectedFname() end

--- Renvoie le libellé d'affichage du fantôme sélectionné, ou '(none)' si rien n'est sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:328
---@return string  Libellé.
function editor_rallyEditor_ghostNotebook:getSelectedLabel() end

--- Constructeur interne : mémorise l'éditeur et remet l'état à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:244
---@param rallyEditor table Instance de l'éditeur de rallye (utilise getCurrentMissionDir et getPacenotesWindow).
function editor_rallyEditor_ghostNotebook:init(rallyEditor) end

--- Liste les fantômes sélectionnables : d'abord l'entrée '<metadata>', puis chaque carnet du dossier de la mission. Renvoie une table vide s'il n'y a pas de mission courante.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:260
---@return table<integer, {fname: string, basename: string, label: string}>  Chaque entrée donne le chemin complet, le nom de base et le libellé d'affichage (sans .notebook.json).
function editor_rallyEditor_ghostNotebook:listChoices() end

--- Charge le carnet fantôme indiqué ('<metadata>' = carnet actif), rafraîchit ses notes structurées et précalcule les libellés. Un nom vide ou nil efface la sélection. En cas d'échec, remplit self.error et journalise une erreur.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:287
---@param fname string|nil Chemin complet du carnet, ou '<metadata>'.
---@return boolean  true si la sélection a réussi (ou a été effacée), false si le carnet n'a pas pu être chargé.
function editor_rallyEditor_ghostNotebook:select(fname) end

