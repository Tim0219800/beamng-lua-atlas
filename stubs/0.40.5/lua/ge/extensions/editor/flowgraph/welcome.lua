---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/welcome.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_welcome', windowDescription 'Welcome').
---@class editor_flowgraph_welcome_C
local editor_flowgraph_welcome_C = {}

--- Hook de désérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:240
---@param data table Données restaurées.
function editor_flowgraph_welcome_C:_onDeserialized(data) end

--- Hook de sérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:236
---@param data table Table de sauvegarde.
function editor_flowgraph_welcome_C:_onSerialize(data) end

--- Mémorise le manager courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:15
---@param mgr table Manager flowgraph.
function editor_flowgraph_welcome_C:attach(mgr) end

--- Dessine la fenêtre « Welcome » si elle est visible. Appelée à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:183
function editor_flowgraph_welcome_C:draw() end

--- Assemble les images et les deux colonnes de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:192
function editor_flowgraph_welcome_C:drawContent() end

--- Dessine « Projects » (New Project via core_flowgraphManager.addManager, Open Project... via le dialogue de fichier) et « Recent Files ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:96
function editor_flowgraph_welcome_C:drawLeftColumn() end

--- Dessine le texte d'introduction de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:126
function editor_flowgraph_welcome_C:drawRightColumn() end

--- Enregistre la fenêtre (150x300, visible par défaut), charge les textures d'en-tête et latérale, prépare la liste des projets de démo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/welcome.lua:19
function editor_flowgraph_welcome_C:init() end

