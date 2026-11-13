---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/edgeHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire d'outils d'éditeur pour des poignées « portes » (gates) déplaçables le long du contour d'un polygone (ring : liste de points {x,y}). Une porte est { edge, t, id } : indice d'arête et position t (0..1) sur cette arête. Fournit l'accrochage au contour, les portes par défaut (extrémités du grand axe), la géométrie d'une poignée flottante hors du bord et son dessin via debugDraw.
--- Accès : extension `editor_toolUtilities_edgeHandles` : `extensions.load("editor_toolUtilities_edgeHandles")`, puis la globale `editor_toolUtilities_edgeHandles`
---@class editor_toolUtilities_edgeHandles
editor_toolUtilities_edgeHandles = {}

--- Deux portes par défaut aux extrémités opposées du grand axe du ring (entrée, sortie).
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:99
---@param ring table Liste de points {x,y}
---@return table  Porte d'entrée { edge, t }
---@return table  Porte de sortie { edge, t }
function editor_toolUtilities_edgeHandles.defaultGates(ring) end

--- Dessine la poignée (points de handleGeom) : tige du bord à la barre, barre avec points d'extrémité, bouton central qui pulse au survol.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:127
---@param gp vec3 Point sur le bord
---@param cp vec3 Centre de la barre
---@param e1 vec3 Extrémité 1
---@param e2 vec3 Extrémité 2
---@param base integer Couleur de base (packée)
---@param glow integer Couleur de halo (packée)
---@param hovered boolean true si survolée
function editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered) end

--- Position monde d'une porte et normale unitaire sortante de son arête (à l'opposé du centre du ring).
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:84
---@param ring table Liste de points {x,y}
---@param gate table { edge, t }
---@return number  wx
---@return number  wy
---@return number  nx (normale sortante)
---@return number  ny (normale sortante)
function editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate) end

--- Géométrie de la poignée saisissable d'une porte : la barre flotte à outDist mètres hors du bord et s'étend de halfWidth mètres de chaque côté.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:115
---@param ring table Liste de points {x,y}
---@param gate table|nil { edge, t }
---@param outDist number Distance de la barre au bord (m)
---@param halfWidth number Demi-largeur de la barre (m)
---@param liftFn function|nil function(x,y) -> vec3 qui pose un point sur le terrain ; plan z=0 par défaut.
---@return vec3|nil  Point sur le bord
---@return vec3  Centre de la barre (bouton de saisie)
---@return vec3  Extrémité 1 de la barre
---@return vec3  Extrémité 2 de la barre
function editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn) end

--- Accroche un point du monde (px,py) à la porte la plus proche sur le contour.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:68
---@param ring table Liste de points {x=,y=}
---@param px number x monde
---@param py number y monde
---@return table  { edge = indice d'arête, t = position 0..1 }
function editor_toolUtilities_edgeHandles.nearestGate(ring, px, py) end

--- Donne un id unique (Engine.generateUUID) à chaque porte qui n'en a pas, puis renvoie la liste. Une porte n'est sinon repérée que par sa position dans la liste, qui change quand une porte précédente est retirée.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:60
---@param gates table|nil Liste de portes { edge, t, id? }
---@return table|nil  La même liste, portes nommées.
function editor_toolUtilities_edgeHandles.tagGates(gates) end

