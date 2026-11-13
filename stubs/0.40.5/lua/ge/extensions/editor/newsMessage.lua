---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/newsMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'éditeur qui affiche une fenêtre modale « World Editor News » avec les notes de version importantes, une seule fois par version de message (EditorNewsMessageVersion = 5), avec des liens vers le support et le forum BeamNG. Elle mémorise l'affichage dans deux préférences cachées (newsMessage.general.newsMessageShown et newsMessageVersion).
--- Accès : extension `editor_newsMessage` : `extensions.load("editor_newsMessage")`, puis la globale `editor_newsMessage`
---@class editor_newsMessage
editor_newsMessage = {}

--- Hook d'éditeur appelé à chaque frame : ouvre la fenêtre modale si le message n'a pas encore été vu pour cette version, puis la dessine (texte, liens, bouton Close).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/newsMessage.lua:13
function editor_newsMessage.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre modale « newsModalDlg ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/newsMessage.lua:54
function editor_newsMessage.onEditorInitialized() end

--- Hook d'enregistrement des préférences : crée la catégorie newsMessage avec les préférences cachées newsMessageShown (bool) et newsMessageVersion (int).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/newsMessage.lua:43
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_newsMessage.onEditorRegisterPreferences(prefsRegistry) end

