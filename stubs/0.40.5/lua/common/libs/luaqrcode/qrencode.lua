---@meta
-- tim19Atlas stub generated from lua/common/libs/luaqrcode/qrencode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luaqrcode (Patrick Gundlach / speedata, licence BSD 3 clauses) : générateur de QR codes en Lua pur. Il choisit la plus petite version (1 à 40) et le mode (numérique, alphanumérique, binaire), encode les données, calcule la correction d'erreur Reed-Solomon, génère les 8 masques et garde celui dont la pénalité est la plus faible. Il ne dessine rien : il renvoie une matrice de modules que le moddeur affiche lui-même (par exemple en UI ou texture).
--- Accès : `require("libs/luaqrcode/qrencode")`
---@class libs_luaqrcode_qrencode
local libs_luaqrcode_qrencode = {}

--- Génère le QR code d'une chaîne : détermine version, niveau de correction et mode, encode les données, ajoute la correction d'erreur, puis choisit le masque de moindre pénalité.
---Source : lua/common/libs/luaqrcode/qrencode.lua:1220
---@param str string Texte à encoder.
---@param ec_level integer|nil Niveau de correction demandé, 1 à 4 (L, M, Q, H). Facultatif.
---@param mode integer|nil Non implémenté : ne pas fournir (provoque une assertion).
---@return boolean  true si la génération a réussi.
---@return table<integer, table<integer, integer>>|string  Matrice [x][y] des modules (positif = noir), ou message d'erreur si le premier retour est false.
function libs_luaqrcode_qrencode.qrcode(str, ec_level, mode) end

return libs_luaqrcode_qrencode
