---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_setUILayout_C
local flowgraph_nodes_ui_setUILayout_C = {}

--- Met active selon le flux d'entrée (nom sans underscore : probablement jamais appelé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:63
function flowgraph_nodes_ui_setUILayout_C:afterTrigger() end

--- Zone centrale vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:59
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_setUILayout_C:drawMiddle(builder, style) end

--- useFreeroamMenuWhenUnrestricted = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:29
function flowgraph_nodes_ui_setUILayout_C:init() end

--- Hook : réapplique le layout après le démarrage du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:87
function flowgraph_nodes_ui_setUILayout_C:onClientPostStartMission() end

--- Hook : changement d'état UI (cur, prev) ; en mode 'quickraceScenario' dans le menu, déclenche setQuickRaceMode et HotlappingResetApp.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:96
---@param cur string État UI courant.
---@param prev string État UI précédent.
function flowgraph_nodes_ui_setUILayout_C:onUiChangedState(cur, prev) end

--- Remplit les modèles layout, menu et appContainerContext.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:33
function flowgraph_nodes_ui_setUILayout_C:postInit() end

--- Applique l'état de jeu (layout/menu) et affiche l'app de conteneur demandée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:71
function flowgraph_nodes_ui_setUILayout_C:workOnce() end

