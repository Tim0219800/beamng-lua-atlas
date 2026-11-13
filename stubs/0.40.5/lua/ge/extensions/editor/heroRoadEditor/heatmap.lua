---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/heatmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Carte de chaleur de conformité (pente et rayon de virage) du Hero Road Editor. compute() note chaque station de la ligne centrale du groupe de 0 (conforme) à 1 (violation totale) selon la classe de route choisie (group.roadClass) et stocke le résultat dans group.heatGrade / group.heatRadius. draw() peint un ruban coloré bleu vers rouge sur la chaussée de la route sélectionnée.
--- Accès : extension `editor_heroRoadEditor_heatmap` : `extensions.load("editor_heroRoadEditor_heatmap")`, puis la globale `editor_heroRoadEditor_heatmap`
---@class editor_heroRoadEditor_heatmap
---@field classOrder string[] Ordre d'affichage des classes : highway, rural, urban, mountain, rally.
---@field classes table<string, table> Classes de route indexées par id ('highway', 'rural', 'urban', 'mountain', 'rally'), chacune avec label, minRadiusM (m), maxGradePct (%) et desc.
editor_heroRoadEditor_heatmap = {}

--- Remplit group.heatGrade[i] et group.heatRadius[i] (0 conforme à 1 violation totale) pour chaque station de group.divPoints. À appeler quand la géométrie change ou à chaque frame d'affichage.
---Source : lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:40
---@param group table Groupe Hero Road (divPoints, divCurv, divWidths, nodes, discMap, roadClass).
function editor_heroRoadEditor_heatmap.compute(group) end

--- Dessine le ruban de violation plein pour la route sélectionnée : deux demi-panneaux par segment (bord gauche vers couronne, couronne vers bord droit), colorés par util.getHueBasedColour255 (alpha 210) selon la métrique.
---Source : lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:159
---@param group table Groupe Hero Road après compute().
---@param metric string 'grade' ou 'radius' ; toute autre valeur est traitée comme 'grade'.
function editor_heroRoadEditor_heatmap.draw(group, metric) end

