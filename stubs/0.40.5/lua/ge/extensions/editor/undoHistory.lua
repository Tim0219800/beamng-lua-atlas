---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/undoHistory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Undo History » : affiche côte à côte la pile d'annulation (editor.history.undoStack) et la pile de rétablissement (redoStack). Chaque action est listée avec son nom ; une infobulle montre un dump tronqué de l'action (20 lignes de 100 caractères max). Boutons « Undo Selected », « Redo Selected » (appellent editor.undo / editor.redo avec le nombre d'étapes) et « Delete All History » (editor.clearUndoHistory, sans défaire les modifications).
--- Accès : extension `editor_undoHistory` : `extensions.load("editor_undoHistory")`, puis la globale `editor_undoHistory`
---@class editor_undoHistory
editor_undoHistory = {}

--- Hook appelé à chaque frame de l'éditeur : dessine la fenêtre Undo History avec les deux piles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/undoHistory.lua:34
function editor_undoHistory.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Undo History » et enregistre la fenêtre (taille initiale 300x500).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/undoHistory.lua:88
function editor_undoHistory.onEditorInitialized() end

--- Hook appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/undoHistory.lua:85
function editor_undoHistory.onExtensionLoaded() end

