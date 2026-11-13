---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/meshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de profils de sections (cross-sections) prédéfinis du Track Builder : murs latéraux, murs inclinés et tubes. Chaque profil est une table {crossPoints, cap, uv, material, flipUVRight, [sharp]} destinée à être extrudée le long d'un segment de piste. Tous utilisent le matériau 'track_editor_border'. Le fichier retourne directement la table (pas de M) ; les noms indiquent la taille : sideWall10 = 1 m de haut, tube5m = rayon 5 m.
--- Accès : extension `util_trackBuilder_meshes` : `extensions.load("util_trackBuilder_meshes")`, puis la globale `util_trackBuilder_meshes`
---@class util_trackBuilder_meshes
---@field rotWall15 table Mur de 2 m incliné de 15° (pi/12).
---@field rotWall30 table Mur de 2 m incliné de 30° (pi/6).
---@field rotWall45 table Mur de 2 m incliné de 45° (pi/4).
---@field rotWall90 table Mur de 2 m incliné de 90° (pi/2).
---@field sideWall01 table Mur latéral de 0,1 m de haut.
---@field sideWall03 table Mur latéral de 0,3 m de haut.
---@field sideWall05 table Mur latéral de 0,5 m de haut.
---@field sideWall10 table Mur latéral de 1 m de haut.
---@field sideWall100 table Mur latéral de 10 m de haut.
---@field sideWall50 table Mur latéral de 5 m de haut.
---@field tube10m table Tube de rayon 10 m avec mur de 2 m.
---@field tube10mFull table Tube de rayon 10 m complet (20 pas).
---@field tube10mHigh table Tube de rayon 10 m avec mur de 10 m.
---@field tube5m table Tube de rayon 5 m avec mur de 1 m.
---@field tube5mFull table Tube de rayon 5 m complet (20 pas).
---@field tube5mHigh table Tube de rayon 5 m avec mur de 5 m.
util_trackBuilder_meshes = {}

