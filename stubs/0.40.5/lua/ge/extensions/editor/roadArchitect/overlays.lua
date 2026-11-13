---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/overlays.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génération des routes de superposition (overlays) des jonctions de Road Architect : lignes de trajectoire fictives qui traversent la jonction, d'une voie d'entrée à une voie de sortie. Chaque fonction ajoute au tableau des routes une route marquée isOverlay, isJctRoad et non drivable (isDrivable = false), avec un profil créé par profileMgr.createOverlayProfile, et ajoute son nom à jct.roads. Les voies et sorties sont tirées au hasard avec math.randomseed(jct.seed[0]), donc le résultat est reproductible pour une même graine. Le nombre de superpositions est jct.numCrossings[0]. Appelé par le gestionnaire de jonctions de Road Architect lors de la finalisation d'une jonction.
--- Accès : extension `editor_roadArchitect_overlays` : `extensions.load("editor_roadArchitect_overlays")`, puis la globale `editor_roadArchitect_overlays`
---@class editor_roadArchitect_overlays
editor_roadArchitect_overlays = {}

--- Ajoute jct.numCrossings[0] routes de superposition à un carrefour à 4 branches (routes jct.roads[5..8]) : une trajectoire entre une voie de sortie d'une branche et une voie d'entrée d'une autre, lissée par des points Catmull-Rom chordaux.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:17
---@param jct table Table de la jonction (roads, seed, numCrossings, laneWidthX…).
function editor_roadArchitect_overlays.addCrossroadsOverlays(jct) end

--- Ajoute des routes de superposition à une jonction de fusion d'autoroute (routes jct.roads[1..3]) : une trajectoire par traversée qui part d'une voie de la route 1, passe sur la route 2 (avec un éventuel changement de voie aléatoire d'une voie) puis sur la route 3.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:367
---@param jct table Table de la jonction (numLanesX, laneWidthX, numCrossings, seed, roads).
function editor_roadArchitect_overlays.addHighwayMergeOverlays(jct) end

--- Ajoute des routes de superposition à une jonction d'autoroute avec bretelles (routes principales jct.roads[1..4] et bretelles d'entrée/sortie jct.roads[5] et [6]).
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:457
---@param jct table Table de la jonction à bretelles.
function editor_roadArchitect_overlays.addHighwaySlipOverlays(jct) end

--- Ajoute des routes de superposition à une jonction de transition autoroute-urbain (routes jct.roads[1..3]), sur le même principe que la fusion d'autoroute.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:412
---@param jct table Table de la jonction de transition.
function editor_roadArchitect_overlays.addHighwayTransOverlays(jct) end

--- Ajoute des routes de superposition à un rond-point (branches jct.roads[5..8], anneau jct.roads[9]) : chaque trajectoire passe par un arc de l'anneau, construit en faisant tourner le vecteur rayon autour de l'axe vertical par pas de 45 degrés (17 points) pour chacune des jct.numRBLanes[0] voies de l'anneau.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:265
---@param jct table Table de la jonction de rond-point.
---@param cen vec3 Centre du rond-point.
function editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen) end

--- Ajoute jct.numCrossings[0] routes de superposition à une jonction en T (routes jct.roads[4..6]), avec la même méthode de tirage de voies et de lissage que pour un carrefour.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:121
---@param jct table Table de la jonction en T.
function editor_roadArchitect_overlays.addTJunctionOverlays(jct) end

--- Ajoute des routes de superposition à une jonction en Y. Gère les branches à sens unique (jct.isYOneWay[0]) et leur orientation (isY1Outwards, isY2Outwards) pour inverser le sens des points si besoin.
---Source : lua/ge/extensions/editor/roadArchitect/overlays.lua:205
---@param jct table Table de la jonction en Y.
function editor_roadArchitect_overlays.addYJunctionOverlays(jct) end

