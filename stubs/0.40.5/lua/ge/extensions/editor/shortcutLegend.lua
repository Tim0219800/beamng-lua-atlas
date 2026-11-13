---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/shortcutLegend.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de l'éditeur de monde (sans barre de titre) qui affiche une légende des raccourcis du mode d'édition actif. Elle lit soit editor.editMode.getLegendCurrentActionNames(), soit les actions de l'actionMap du mode (bindings clavier et souris de core_input_bindings), plus editor.editMode.auxShortcuts, puis les trie et les affiche en ligne. Un moddeur d'outil d'éditeur remplit auxShortcuts ou getLegendCurrentActionNames pour que ses raccourcis apparaissent.
--- Accès : extension `editor_shortcutLegend` : `extensions.load("editor_shortcutLegend")`, puis la globale `editor_shortcutLegend`
---@class editor_shortcutLegend
editor_shortcutLegend = {}

--- Hook appelé quand le mode d'édition change : demande la reconstruction de la liste des raccourcis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shortcutLegend.lua:165
---@param oldEditMode table Ancien mode d'édition.
---@param newEditMode table Nouveau mode d'édition.
function editor_shortcutLegend.onEditorEditModeChanged(oldEditMode, newEditMode) end

--- Hook appelé à chaque frame de l'UI de l'éditeur : reconstruit la liste des raccourcis si nécessaire et dessine la légende centrée avec des pastilles pour les touches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shortcutLegend.lua:22
function editor_shortcutLegend.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : remplit la table des noms de modificateurs (Ctrl, Shift, Alt, LMB, MMB, RMB, MouseWheel, Copy, Paste, etc.), enregistre et affiche la fenêtre shortcutLegend.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shortcutLegend.lua:140
function editor_shortcutLegend.onEditorInitialized() end

--- Hook de chargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/shortcutLegend.lua:137
function editor_shortcutLegend.onExtensionLoaded() end

