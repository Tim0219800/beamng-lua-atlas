---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/profileSweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Balayage de profil : des bandes 2D ouvertes (latéral y, hauteur z) sont balayées le long d'une suite de stations portant chacune leur repère, pour produire un maillage unique par matériau. Contrairement à deckSweep, le repère est fourni par l'appelant (binormale inclinée et normale d'une route), donc la section tourne avec la route. Les stations sont décimées selon une tolérance de corde sur le centre et deux points clés de la section (meshRefine.decimateStations).
--- Accès : extension `editor_toolUtilities_profileSweep` : `extensions.load("editor_toolUtilities_profileSweep")`, puis la globale `editor_toolUtilities_profileSweep`
---@class editor_toolUtilities_profileSweep
editor_toolUtilities_profileSweep = {}

--- Point monde du point de section (y, z) à la station a : a.pos + a.b * y + a.n * z.
---Source : lua/ge/extensions/editor/toolUtilities/profileSweep.lua:22
---@param a table Station avec x,y,z, bx,by,bz (vecteur transversal) et nx,ny,nz (vecteur haut).
---@param y number Décalage latéral dans la section.
---@param z number Hauteur dans la section.
---@return table  Point {x,y,z}.
function editor_toolUtilities_profileSweep.at(a, y, z) end

--- Balaye les bandes le long des stations. Chaque station : { x,y,z, bx,by,bz (transversal), nx,ny,nz (haut), s (abscisse) }. Chaque bande : { pts = {{y,z},...}, nrm = {{ny,nz},...} (normales unitaires vers la face visible), mat }. Les faces quadrangulaires sont générées par meshPart.face4n.
---Source : lua/ge/extensions/editor/toolUtilities/profileSweep.lua:45
---@param st table Liste de stations.
---@param strips table Liste de bandes de profil.
---@param opts table { tol, tolZ, maxSeg } pour la décimation, keyL et keyR = points de section {y,z} surveillés.
---@return table|nil  Parts (une par matériau) ; nil si moins de 2 stations.
---@return table  Indices des stations conservées.
function editor_toolUtilities_profileSweep.build(st, strips, opts) end

