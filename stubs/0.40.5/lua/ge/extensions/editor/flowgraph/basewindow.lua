---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/basewindow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base des fenêtres de l'éditeur Flowgraph (legend, history, events, garbageDebug, examples, execution, main…). Elle encapsule Begin/End d'une fenêtre éditeur (editor.beginWindow avec self.windowName), le suivi du focus (hasFocus) et ouverture/fermeture/bascule. use(fgEditor, derivedClass) crée une instance de base et y copie les champs de la classe dérivée.
--- Accès : extension `editor_flowgraph_basewindow` : `extensions.load("editor_flowgraph_basewindow")`, puis la globale `editor_flowgraph_basewindow`
---@class editor_flowgraph_basewindow
editor_flowgraph_basewindow = {}

--- Crée une instance de la classe de base et appelle init(...).
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:65
---@param ... any Arguments passés à init (fgEditor).
---@return table  Instance.
function editor_flowgraph_basewindow.createBase(...) end

--- Crée une instance de base pour fgEditor puis copie tous les champs de derivedClass dessus (surcharges) ; appelle l'init de la dérivée s'il diffère de celui de base.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:73
---@param fgEditor table Éditeur Flowgraph propriétaire.
---@param derivedClass table Classe de la fenêtre (windowName, draw, init…).
---@return table  Instance de fenêtre.
function editor_flowgraph_basewindow.use(fgEditor, derivedClass) end

--- Classe de base d'une fenêtre Flowgraph.
---@class editor_flowgraph_basewindow_C
local editor_flowgraph_basewindow_C = {}

--- Ouvre la fenêtre éditeur self.windowName avec le titre donné.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:15
---@param name string Titre affiché.
---@param flags integer|nil Flags de fenêtre ImGui.
---@return boolean  Résultat d'editor.beginWindow (visible).
function editor_flowgraph_basewindow_C:Begin(name, flags) end

--- Met à jour hasFocus (focus des fenêtres enfants) puis ferme la fenêtre éditeur.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:19
function editor_flowgraph_basewindow_C:End() end

--- Appelle _onDeserialized puis remet hasFocus à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:58
---@param data table Données.
function editor_flowgraph_basewindow_C:__onDeserialized(data) end

--- Crée une table, appelle _onSerialize et la renvoie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:49
---@return table  Données sérialisées.
function editor_flowgraph_basewindow_C:__onSerialize() end

--- Point d'extension de désérialisation, vide par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:55
---@param data table Données.
function editor_flowgraph_basewindow_C:_onDeserialized(data) end

--- Point d'extension de sérialisation, vide par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:46
---@param res table Table à remplir.
function editor_flowgraph_basewindow_C:_onSerialize(res) end

--- Associe le gestionnaire de projet flowgraph (self.mgr).
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:24
---@param mgr table Manager flowgraph.
function editor_flowgraph_basewindow_C:attach(mgr) end

--- Cache la fenêtre et remet hasFocus à false.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:33
function editor_flowgraph_basewindow_C:close() end

--- Mémorise fgEditor et initialise hasFocus à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:10
---@param fgEditor table Éditeur Flowgraph.
function editor_flowgraph_basewindow_C:init(fgEditor) end

--- Affiche la fenêtre.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:28
function editor_flowgraph_basewindow_C:open() end

--- Bascule la visibilité de la fenêtre.
---Source : lua/ge/extensions/editor/flowgraph/basewindow.lua:38
function editor_flowgraph_basewindow_C:toggle() end

