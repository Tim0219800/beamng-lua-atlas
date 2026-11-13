---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/customLua.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_customLua_C
local flowgraph_nodes_util_customLua_C = {}

--- Compile les quatre blocs puis exécute _executionStarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:131
function flowgraph_nodes_util_customLua_C:_executionStarted() end

--- Exécute _executionStopped puis libère l'environnement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:137
function flowgraph_nodes_util_customLua_C:_executionStopped() end

--- Restaure nom et code puis recompile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:160
---@param data any
function flowgraph_nodes_util_customLua_C:_onDeserialized(data) end

--- Sauvegarde nom et code.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:168
---@param data any
function flowgraph_nodes_util_customLua_C:_onSerialize(data) end

--- Construit (une fois) et renvoie la table d'environnement du code utilisateur : self, map, be, FS, scenetree, extensions, vec3/quat, outils JSON et math, toutes les extensions chargées, etc. Fournit aussi refreshExtensions, loadExtension, unloadExtension, log (journalise aussi dans le gestionnaire).
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:173
function flowgraph_nodes_util_customLua_C:buildBaseEnv() end

--- Compile le bloc de code donné avec l'environnement de base ; enregistre le message d'erreur dans self.status, sinon la fonction dans self.compiled (nop en cas d'erreur).
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:44
---@param code string Nom du bloc : work, _executionStarted, _executionStopped ou onPreRender.
function flowgraph_nodes_util_customLua_C:compile(code) end

--- Dessine l'éditeur : chargement depuis la bibliothèque, nom, bouton de sauvegarde, et un champ multiligne par bloc avec indicateur d'erreur de compilation. Renvoie la description du changement ou false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:54
function flowgraph_nodes_util_customLua_C:drawCustomProperties() end

--- Exécute le bloc compilé sous pcall ; en cas d'erreur, logue, marque le nœud en erreur et ajoute un évènement au gestionnaire.
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:145
---@param code string Nom du bloc.
function flowgraph_nodes_util_customLua_C:exec(code) end

--- Crée les quatre blocs de code vides et autorise les pins d'entrée et de sortie personnalisés (savePins=true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:29
function flowgraph_nodes_util_customLua_C:init() end

--- Exécute le bloc onPreRender (avant le rendu).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:141
---@param dt number Delta temps réel.
---@param dtSim number Delta temps simulé.
function flowgraph_nodes_util_customLua_C:onPreRender(dt, dtSim) end

--- Exécute le bloc work.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/customLua.lua:156
function flowgraph_nodes_util_customLua_C:work() end

