---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/walkRibbon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère un trottoir bordé (bordure et dalles) balayé le long de deux rails, sous forme d'un seul mesh unique, pour les outils de routes de l'éditeur. Les parties de mesh sont regroupées par matériau (deux trottoirs de même pierre partagent un même mesh, donc un seul draw). Gère aussi les bordures abaissées au droit des passages piétons : le trottoir s'affleure sur la zone du passage et remonte en rampe de chaque côté. Utilise meshPart (face4, face4n) et kerbSpec (matériaux et cotes de bordure).
--- Accès : extension `editor_toolUtilities_walkRibbon` : `extensions.load("editor_toolUtilities_walkRibbon")`, puis la globale `editor_toolUtilities_walkRibbon`
---@class editor_toolUtilities_walkRibbon
---@field crossingDepthM number Longueur par défaut de la partie à plat quand le passage n'indique rien (3.5 m).
---@field crossingRampM number Longueur de la rampe de chaque côté d'un passage abaissé (1.5 m).
editor_toolUtilities_walkRibbon = {}

--- Balaie le trottoir entre deux rails correspondants : la ligne de bordure sur la route et le fond du pavage. Ajoute des faces dans opts.parts (un mesh par matériau). Les options : parts (obligatoire, liste de parties), paving (matériau des dalles, défaut celui de kerbSpec), variant (variante de bordure), caps (fermer les extrémités, vrai par défaut), scale (hauteur de bordure par station, 0 = bordure supprimée), uvs (nombre de dalles au mètre), worldUv (poser le pavage depuis x,y monde), uRail (rail sur lequel mesurer les UV en long), bury (profondeur enterrée), back (faux pour ne pas fermer le fond).
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:73
---@param inner table Rail intérieur, liste de { x, y, z } (ligne de bordure).
---@param outer table Rail extérieur, liste de { x, y, z } (fond du pavage).
---@param opts table Options décrites ci-dessus ; opts.parts requis.
---@return integer  Nombre de triangles écrits (0 si rien).
function editor_toolUtilities_walkRibbon.build(inner, outer, opts) end

--- Densifie inner/outer dans la bande de chaque passage (environ tous les 0.4 m) et renvoie les rails densifiés avec le multiplicateur d'abaissement par station. Les centres des passages sont projetés sur le rail à partir de la position t le long de la ligne centrale. Renvoie les rails d'ORIGINE et nil si la route n'a pas de passage ou de ligne centrale.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:261
---@param crossings table|nil Passages de la route, liste de { t (0..1, 0.5 par défaut), depthM }.
---@param div table Ligne centrale de la route (liste de points).
---@param inner table Rail intérieur.
---@param outer table Rail extérieur.
---@return table  Rail intérieur (densifié ou d'origine).
---@return table  Rail extérieur.
---@return number[]|nil  Multiplicateur par station, nil s'il n'y a pas de passage.
function editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer) end

--- Multiplicateur de hauteur de bordure par station pour un trottoir traversé par des passages piétons : 0 (à ras) sur chaque passage, rampe de part et d'autre, 1 ailleurs. `cum`, `centres` et `depths` sont des abscisses curvilignes sur le rail. nil si aucun passage n'atteint le trottoir.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:190
---@param cum number[] Abscisse curviligne cumulée de chaque station.
---@param centres number[] Abscisse du centre de chaque passage.
---@param depths number[]|nil Profondeur (m) de chaque passage ; 3.5 par défaut.
---@return number[]|nil  Un multiplicateur par station entre 0 et 1.
function editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths) end

--- Hauteur de la surface de marche au-dessus de la route sur laquelle repose le rail intérieur (kerbH de kerbSpec).
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:320
---@return number  Hauteur en mètres.
function editor_toolUtilities_walkRibbon.rise() end

--- Distance dont le rail extérieur doit s'écarter de l'intérieur : la bordure plus une dalle (kerbW + slabW de kerbSpec).
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:315
---@return number  Largeur en mètres.
function editor_toolUtilities_walkRibbon.width() end

