---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'wheels' (section jbeam wheels) : la roue simple. À partir de deux nœuds d'axe (node1, node2), il crée un anneau de 2 x numRays nœuds de pneu autour de l'axe puis les poutres associées (côtés, renforts en X, bande de roulement, périphérie). Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule ; sert à comprendre comment un jbeam de roue est converti en physique.
--- Accès : globale `wheels`
---@class wheels
wheels = {}

--- Crée nœuds et poutres d'une roue simple (alias de addWheel) : 2*numRays nœuds de pneu, puis par rayon 8 poutres (2 côtés, 2 renforts en X, 1 bande, 2 périphérie, 1 diagonale). Stocke vehicle.nodes de la roue dans wheel.nodes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/wheels.lua:18
---@param vehicle table véhicule en construction (nodes, maxIDs…)
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (modifiée : collision, radius, numRays, nodes)
function wheels.process(vehicle, wheelKey, wheel) end

