---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exporte des surfaces de rubans (splines) sous forme de masque PNG 16 bits (GFXFormatR16) à la taille de la grille du terrain. Chaque texel vaut 65535 si son centre monde est dans un quadrilatère, 0 sinon. Sert aux outils de splines pour fabriquer un masque utilisable par l'éditeur de terrain (peinture). Nécessite un terrain chargé et l'extension editor_terrainEditor.
--- Accès : extension `editor_toolUtilities_splineMaskExport` : `extensions.load("editor_toolUtilities_splineMaskExport")`, puis la globale `editor_toolUtilities_splineMaskExport`
---@class editor_toolUtilities_splineMaskExport
editor_toolUtilities_splineMaskExport = {}

--- Construit un kd-tree des quadrilatères des sources (agrandis de `margin`), rasterise un bitmap de la taille du terrain et l'enregistre en PNG.
---Source : lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua:19
---@param filepath string Chemin du fichier .png à écrire.
---@param sources table Table de tables de quadrilatères représentant les surfaces de rubans.
---@param margin number|nil Marge ajoutée autour des quadrilatères (0 par défaut), en mètres (déduit du code).
function editor_toolUtilities_splineMaskExport.export(filepath, sources, margin) end

