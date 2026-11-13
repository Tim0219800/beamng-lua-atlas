---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/iesImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Convertisseur de fichiers photométriques IES (profil de distribution lumineuse d'un luminaire) en texture « cookie » PNG pour les SpotLight de l'éditeur. Le module parse l'en-tête et les données IES (angles verticaux/horizontaux, candela, tilt), échantillonne l'intensité, génère une image carrée en niveaux de gris (projection perspective ou linéaire, rotation, recentrage, adoucissement des bords), l'enregistre en PNG et écrit un fichier annexe `.cookie.json` (nom, photométrie, angle de spot, lumens, watts, température de couleur). Le point d'entrée pratique est `generateToFile`.
--- Accès : extension `editor_api_iesImporter` : `extensions.load("editor_api_iesImporter")`, puis la globale `editor_api_iesImporter`
---@class editor_api_iesImporter
editor_api_iesImporter = {}

--- Construit la table de métadonnées (type "IESLightImport" version 1) : source, noms (suggestedObjectName nettoyé), assets, paramètres SpotLight (outerAngle, innerAngle, candela, lumens, watts, température de couleur), photométrie (pic, lumens, W, efficacité lm/W) et paramètres de conversion.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:1107
---@param ies table résultat de parseIES
---@param outPath string chemin du PNG
---@param opts table|nil options de génération/sauvegarde
---@param saveInfo table|nil saveInfo de saveImage
---@return table  métadonnées
function editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo) end

--- Génère l'image cookie : pour chaque pixel d'une image size x size, calcule la direction de lumière (projection perspective ou linéaire, rotation, base centrée sur centerTheta/centerPhi), échantillonne l'IES et applique un masque circulaire (avec adoucissement edgeFeather).
---Source : lua/ge/extensions/editor/api/iesImporter.lua:663
---@param ies table résultat de parseIES
---@param opts table|nil {size, projection, rotate, centerTheta, centerPhi, angle, edgeFeather}
---@return table  {width, height, data (valeurs brutes, index y*size+x+1), _ies, generation = {size, angle, projection, rotate, centerTheta, centerPhi, edgeFeather}}
function editor_api_iesImporter.generateCookie(ies, opts) end

--- Pipeline complet : parse l'IES, (autoCenter : centre sur le pic), génère le cookie, sauvegarde le PNG et le .cookie.json.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:1241
---@param iesPath string fichier .ies source
---@param outPath string PNG de sortie
---@param opts table|nil {size, angle, projection, rotate, centerTheta, centerPhi, autoCenter, edgeFeather, percentile, gamma, scale, invert, writeMetadata, noInfo}
---@return boolean  true si l'image est sauvegardée
---@return table  {imagePath, metadataPath, metadataWritten, saveInfo}
function editor_api_iesImporter.generateToFile(iesPath, outPath, opts) end

--- Donne le chemin du fichier annexe : remplace `.color.png` ou `.png` par `.cookie.json`, sinon ajoute `.cookie.json`.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:983
---@param outPath string chemin du PNG
---@return string  chemin du .cookie.json
function editor_api_iesImporter.getCookieMetadataPath(outPath) end

--- Renvoie la première valeur non vide de l'en-tête parmi une liste de clés (insensible à la casse).
---Source : lua/ge/extensions/editor/api/iesImporter.lua:269
---@param meta table résultat de parseHeaderMetadata
---@param keys string[] clés à essayer dans l'ordre (ex. {"MANUFAC"})
---@param fallback string|nil valeur par défaut ("" sinon)
---@return string  valeur trouvée ou fallback
function editor_api_iesImporter.getHeaderValue(meta, keys, fallback) end

--- Cherche la direction d'intensité maximale dans les données IES.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:458
---@param ies table résultat de parseIES
---@return number  theta du pic (degrés)
---@return number  phi du pic (degrés)
---@return number  candela au pic
---@return integer  indice horizontal
---@return integer  indice vertical
function editor_api_iesImporter.getPeakDirection(ies) end

--- Déduit le chemin de sortie par défaut : même dossier et même nom que l'IES avec l'extension `.color.png`. Renvoie "" si le chemin est vide ou finit par /.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:1308
---@param iesPath string chemin du .ies
---@return string  chemin du PNG
function editor_api_iesImporter.inferCookiePathFromIES(iesPath) end

--- Lit l'en-tête d'un fichier IES (avant la ligne TILT=) : version, entrées [CLÉ] valeur, table `map` clé -> valeur (clés en majuscules, valeurs multiples jointes par \n, [MORE] concatène à la clé précédente) et liste `more`.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:209
---@param path string chemin du fichier .ies
---@return table  {version, entries = {{key, value}}, map, more}
function editor_api_iesImporter.parseHeaderMetadata(path) end

--- Parse un fichier IES complet : en-tête, tilt, nombre de lampes, lumens, multiplicateur de candela, type photométrique, unités, dimensions, angles et tableau candela[ih][iv] (multiplié par le multiplicateur et par les facteurs de tilt si TILT=INCLUDE).
---Source : lua/ge/extensions/editor/api/iesImporter.lua:332
---@param path string chemin du .ies
---@return table  {path, metadata, tilt, verticalAngles, horizontalAngles, candela, numLamps, lumensPerLamp, candelaMultiplier, photometricType, unitsType, width, length, height, ballastFactor, futureUse, inputWatts}
function editor_api_iesImporter.parseIES(path) end

--- Trie les angles horizontaux avec leurs lignes de candela et, si les données couvrent plus de 180° sans atteindre 360°, ajoute une ligne à 360° copiée de la première pour le bouclage.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:501
---@param horizontalAngles number[] angles horizontaux
---@param candela table candela[ih][iv]
---@return table  {h = angles triés, c = lignes de candela}
function editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela) end

--- Écrit dans le log un résumé de l'IES (nombre et plage d'angles, type photométrique, watts, pic de candela et sa direction).
---Source : lua/ge/extensions/editor/api/iesImporter.lua:484
---@param ies table résultat de parseIES
function editor_api_iesImporter.printIESInfo(ies) end

--- Interpole l'intensité (candela) pour une direction (theta, phi) en tenant compte de la symétrie horizontale. Renvoie 0 si theta est hors de la plage verticale ou si les données sont vides.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:563
---@param theta number angle vertical en degrés
---@param phi number angle horizontal en degrés
---@param ies table résultat de parseIES
---@param prepared table|nil résultat de prepareHorizontalData (calculé si absent ; à fournir pour accélérer)
---@return number  intensité interpolée
function editor_api_iesImporter.sampleIES(theta, phi, ies, prepared) end

--- Normalise l'image (percentile, scale, gamma, inversion éventuelle), l'écrit en PNG via GBitmap puis, sauf writeMetadata == false, écrit le fichier annexe .cookie.json.
---Source : lua/ge/extensions/editor/api/iesImporter.lua:869
---@param img table résultat de generateCookie
---@param outPath string chemin du PNG
---@param opts table|nil {percentile, gamma, scale, invert, writeMetadata}
---@return boolean  true si le PNG a été écrit
---@return table  saveInfo : path, width, height, format, percentile, gamma, scale, invert, maxValue, nonzeroPixels, normalizationValue, metadataWritten, metadataPath
function editor_api_iesImporter.saveImage(img, outPath, opts) end

--- Construit les métadonnées et les écrit dans le .cookie.json (jsonWriteFile).
---Source : lua/ge/extensions/editor/api/iesImporter.lua:1230
---@param ies table résultat de parseIES
---@param outPath string chemin du PNG
---@param opts table|nil options
---@param saveInfo table|nil saveInfo
---@return boolean  toujours true
---@return string  chemin du .cookie.json
---@return table  métadonnées écrites
function editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo) end

