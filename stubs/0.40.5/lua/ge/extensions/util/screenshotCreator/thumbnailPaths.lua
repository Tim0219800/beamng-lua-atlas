---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul des chemins de sortie des vignettes de véhicules pour le compositeur de vignettes. Tous les fichiers vont dans vehicles/<modelKey>/ au format .jpg ; la vignette d'une config s'appelle <config>.jpg, et default.jpg pour la config par défaut en mode « defaults ». Les noms sont assainis (caractères autres que lettres, chiffres, _, . et - remplacés par _).
--- Accès : extension `util_screenshotCreator_thumbnailPaths` : `extensions.load("util_screenshotCreator_thumbnailPaths")`, puis la globale `util_screenshotCreator_thumbnailPaths`
---@class util_screenshotCreator_thumbnailPaths
util_screenshotCreator_thumbnailPaths = {}

--- Calcule le chemin final d'une vignette et son dossier.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:12
---@param item table Élément {modelKey, configName, isDefaultConfig}.
---@param captureMode string « defaults » ou « all ».
---@return string  Chemin du fichier, ex. vehicles/pickup/d15_4wd.jpg.
---@return string  Dossier de sortie, ex. vehicles/pickup/.
function util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode) end

--- Indique si une vignette (.jpg ou .png) existe déjà pour l'élément.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:19
---@param item table Élément {modelKey, configName}.
---@return boolean  true si le fichier existe.
function util_screenshotCreator_thumbnailPaths.hasThumbnail(item) end

--- Crée le dossier de sortie et renvoie les chemins à utiliser pour la capture.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:24
---@param item table Élément {modelKey, configName, isDefaultConfig}.
---@param captureMode string « defaults » ou « all ».
---@return table  {outputFolder, final, defaultFinal = chemin default.jpg à copier (mode « all », config par défaut)}.
function util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode) end

--- Assainit un morceau de nom de fichier : remplace tout caractère hors [A-Za-z0-9_.-] par _ ; renvoie « unknown » si le résultat est vide.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:7
---@param value any Valeur convertie en chaîne.
---@return string  Nom sûr.
function util_screenshotCreator_thumbnailPaths.safePathPart(value) end

