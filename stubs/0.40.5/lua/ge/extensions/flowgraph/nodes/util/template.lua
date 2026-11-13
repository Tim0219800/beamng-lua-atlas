---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_template_C
local flowgraph_nodes_util_template_C = {}

--- Appelé au démarrage du projet, avant tout work.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:121
function flowgraph_nodes_util_template_C:_executionStarted() end

--- Appelé à l'arrêt du projet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:130
function flowgraph_nodes_util_template_C:_executionStopped() end

--- Appelé quand le nœud doit être nettoyé (avant sérialisation, avant démarrage...) ; par défaut appelle _executionStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:135
function flowgraph_nodes_util_template_C:_onClear() end

--- Restaure les champs personnalisés (self.data est restauré automatiquement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:189
---@param data table Données sauvegardées.
function flowgraph_nodes_util_template_C:_onDeserialized(data) end

--- Sauvegarde les champs personnalisés dans res (self.data est sauvegardé automatiquement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:182
---@param res table Table de sauvegarde.
function flowgraph_nodes_util_template_C:_onSerialize(res) end

--- Appelé quand le nœud est supprimé.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:195
function flowgraph_nodes_util_template_C:destroy() end

--- Code imgui affiché dans la fenêtre de propriétés (champ texte et curseur) ; renvoyer une chaîne crée un point d'historique (annuler/rétablir).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:148
function flowgraph_nodes_util_template_C:drawCustomProperties() end

--- Code imgui affiché dans le nœud ; doit commencer par builder:Middle().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:166
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_template_C:drawMiddle(builder, style) end

--- Appelé quand les propriétés ne sont plus affichées.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:160
function flowgraph_nodes_util_template_C:hideProperties() end

--- Appelé à la première création du nœud ; initialise myField, la table data et le curseur sliderWidth.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:109
---@param mgr table Gestionnaire flowgraph.
function flowgraph_nodes_util_template_C:init(mgr) end

--- Appelé quand les propriétés du nœud sont affichées.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:141
function flowgraph_nodes_util_template_C:showProperties() end

--- Appelé quand le nœud doit exécuter sa fonction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:125
function flowgraph_nodes_util_template_C:work() end

