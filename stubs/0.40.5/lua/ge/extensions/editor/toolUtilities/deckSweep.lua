---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/deckSweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- « Deck sweep » : balaie une dalle bombée le long d'une ligne centrale quelconque pour produire UN mesh unique. La section (chaussée bombée à la ligne, trottoirs plats à l'extérieur, côtés verticaux, sous-face plate) est posée à chaque station de la ligne dense ; les stations sont décimées selon une tolérance de corde (plan et vertical séparés) ; chaque extrémité peut s'effiler en jupe (dessus incliné, sous-face remontée en lèvre fine) pour se raccorder au sol. Les largeurs peuvent varier par station. Dépend de editor/toolUtilities/meshPart et editor/heroRoadEditor/meshRefine.
--- Accès : extension `editor_toolUtilities_deckSweep` : `extensions.load("editor_toolUtilities_deckSweep")`, puis la globale `editor_toolUtilities_deckSweep`
---@class editor_toolUtilities_deckSweep
editor_toolUtilities_deckSweep = {}

--- Balaye le tablier le long de la ligne dense `dp`. Renvoie les parts de mesh et les indices des stations denses conservées, ou nil si la ligne est dégénérée (moins de 2 points ou longueur < 1 mm).
---Source : lua/ge/extensions/editor/toolUtilities/deckSweep.lua:126
---@param dp table Ligne dense de vec3 ou tables {x,y,z}.
---@param sec table { extL, extR, fwL, fwR (nombres ou tableaux par station : demi-largeur chaussée gauche/droite et largeur de trottoir), crown (creux du bombement), flatEnd (m sur lesquels le bombement s'efface vers le plat à chaque extrémité ; nil/0 = aucun), slabT (épaisseur de dalle), topMat, bodyMat, chamfer = { len, drop, lipT, atStart?, atEnd? } | nil }
---@param opts table { tol (tolérance de corde en plan, m), tolZ (tolérance verticale, m ; nil = tol), maxSeg (plus grand intervalle conservé, m) }
---@return table|nil  Liste de parts de mesh ({ bodyPart[, topPart] }).
---@return integer[]  Indices de stations denses conservées.
function editor_toolUtilities_deckSweep.build(dp, sec, opts) end

