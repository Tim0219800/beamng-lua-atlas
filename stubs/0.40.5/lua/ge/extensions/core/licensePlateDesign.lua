---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/licensePlateDesign.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_licensePlateDesign` : charge la définition d'un design de plaque d'immatriculation et la convertit au format actuel (version 3, type 'licenseplate', fichiers *.sktemplate.json). Elle traduit aussi les anciens formats JSON (versions 0 à 2, avec des champs diffuse/bump/text/characterLayout et des motifs de type printf %d %c %l) vers des arbres de texte avec variables {plate}, {line1}, {seg1}... Un moddeur s'en sert pour lire un design de plaque, qu'il soit ancien ou nouveau.
--- Accès : extension `core_licensePlateDesign` : `extensions.load("core_licensePlateDesign")`, puis la globale `core_licensePlateDesign`
---@class core_licensePlateDesign
core_licensePlateDesign = {}

--- Charge un design de plaque depuis un fichier JSON (ancien ou *.sktemplate.json) et renvoie une table au format version 3 : { name, version = 3, type = 'licenseplate', format = { [clé] = { size, background, emboss, finish, root, segments/limit/limit2, normal } }, vars = { plate = {...} } }. Les anciens formats sont convertis, les nouveaux sont complétés avec les formats de l'ancien fichier s'il existe.
---Source : lua/ge/extensions/core/licensePlateDesign.lua:279
---@param path string|nil Chemin virtuel du fichier de design ; nil ou chaîne vide renvoie nil.
---@return table|nil  Design version 3, ou nil si le fichier est introuvable ou illisible (avertissement dans le log).
function core_licensePlateDesign.loadDesign(path) end

