---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/garbageDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre Garbage Debug (windowName = 'fg_garbage').
---@class editor_flowgraph_garbageDebug_C
local editor_flowgraph_garbageDebug_C = {}

--- Désérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:303
---@param data table Données.
function editor_flowgraph_garbageDebug_C:_onDeserialized(data) end

--- Sérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:299
---@param data table Données.
function editor_flowgraph_garbageDebug_C:_onSerialize(data) end

--- Associe le manager flowgraph.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:12
---@param mgr table Manager.
function editor_flowgraph_garbageDebug_C:attach(mgr) end

--- Calcule une fois les stats de tous les graphes/nœuds et leur somme, puis les trie par valeur décroissante.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:95
function editor_flowgraph_garbageDebug_C:computeAllStats() end

--- Complète et calcule les statistiques d'une entrée (historiques, moyenne, quantiles, min/max, pourcentage d'activité).
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:26
---@param entry table Entrée de garbageData (graphe, nœud ou somme) avec history, totalHistory, total.
function editor_flowgraph_garbageDebug_C:computeStats(entry) end

--- Dessine la fenêtre : case Debug Garbage, tri, projet complet, graphes puis nœuds.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:244
function editor_flowgraph_garbageDebug_C:draw() end

--- Dessine le bloc de statistiques et les courbes d'une entrée ; ignore les entrées sans valeur ou inactives.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:151
---@param label string Libellé.
---@param entry table|nil Entrée.
function editor_flowgraph_garbageDebug_C:drawStats(label, entry) end

--- Affiche un bouton « View Node » ou « View Graph » qui sélectionne et centre l'élément.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:220
---@param e table Entrée avec e.meta.
function editor_flowgraph_garbageDebug_C:handleMeta(e) end

--- Enregistre la fenêtre et prépare une palette de couleurs par magnitude (20 niveaux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:18
function editor_flowgraph_garbageDebug_C:init() end

--- Définit entry.value (selon la clé de tri courante) et sa magnitude en puissance de 2.
---Source : lua/ge/extensions/editor/flowgraph/garbageDebug.lua:71
---@param entry table Entrée.
function editor_flowgraph_garbageDebug_C:setSortingValue(entry) end

