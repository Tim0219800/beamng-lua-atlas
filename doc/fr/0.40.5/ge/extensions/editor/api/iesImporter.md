# `editor_api_iesImporter`

*Fichier : `lua/ge/extensions/editor/api/iesImporter.lua` · VM : Game Engine (GE) · 1318 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_iesImporter` : `extensions.load("editor_api_iesImporter")`, puis la globale `editor_api_iesImporter`

Convertisseur de fichiers photométriques IES (profil de distribution lumineuse d'un luminaire) en texture « cookie » PNG pour les SpotLight de l'éditeur. Le module parse l'en-tête et les données IES (angles verticaux/horizontaux, candela, tilt), échantillonne l'intensité, génère une image carrée en niveaux de gris (projection perspective ou linéaire, rotation, recentrage, adoucissement des bords), l'enregistre en PNG et écrit un fichier annexe `.cookie.json` (nom, photométrie, angle de spot, lumens, watts, température de couleur). Le point d'entrée pratique est `generateToFile`.

## Exemple

```lua
local ok, info = editor_api_iesImporter.generateToFile("/art/lights/mylamp.ies", "/art/lights/mylamp.color.png", {size = 512, autoCenter = true})
if ok then print(info.metadataPath) end
```

## Remarques

- Les angles sont en degrés ; theta = angle vertical depuis l'axe, phi = angle horizontal, 0-360.
- Options de generateCookie : size (1024), projection "perspective"|"linear" (autre valeur = erreur), angle (demi-angle max, défaut min(angle vertical max, 90)), rotate (degrés), centerTheta/centerPhi, edgeFeather (0 = bord net).
- Options de saveImage : percentile (100, normalise par ce percentile des valeurs non nulles), gamma (1), scale (1), invert (false), writeMetadata (false pour ne pas écrire le .cookie.json). Image sauvée en PNG 8 bits gris.
- Dans le JSON annexe, `outerAngle` est l'angle COMPLET du spot (2 x demi-angle, 0.01 à 180) et `innerAngle` vaut 90 % de outerAngle.
- parseIES déclenche error() (à protéger par pcall) si aucune ligne TILT= n'est trouvée ou si les données sont invalides.
- Les chemins sans slash initial sont préfixés par "/" si le fichier/dossier existe ainsi (normalizePath).
- `getPeakDirection` renvoie 5 valeurs : theta, phi, candela max, indice horizontal, indice vertical (1-based).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo)` | Construit la table de métadonnées (type "IESLightImport" version 1) : source, noms (suggestedObjectName nettoyé), assets, paramètres SpotLight (outerAngle, innerAngle, candela, lumens, watts, température de couleur), photométrie (pic, lumens, W, efficacité lm/W) et paramètres de conversion. | 1107 |
| `editor_api_iesImporter.generateCookie(ies, opts)` | Génère l'image cookie : pour chaque pixel d'une image size x size, calcule la direction de lumière (projection perspective ou linéaire, rotation, base centrée sur centerTheta/centerPhi), échantillonne l'IES et applique un masque circulaire (avec adoucissement edgeFeather). | 663 |
| `editor_api_iesImporter.generateToFile(iesPath, outPath, opts)` | Pipeline complet : parse l'IES, (autoCenter : centre sur le pic), génère le cookie, sauvegarde le PNG et le .cookie.json. | 1241 |
| `editor_api_iesImporter.getCookieMetadataPath(outPath)` | Donne le chemin du fichier annexe : remplace `.color.png` ou `.png` par `.cookie.json`, sinon ajoute `.cookie.json`. | 983 |
| `editor_api_iesImporter.getHeaderValue(meta, keys, fallback)` | Renvoie la première valeur non vide de l'en-tête parmi une liste de clés (insensible à la casse). | 269 |
| `editor_api_iesImporter.getPeakDirection(ies)` | Cherche la direction d'intensité maximale dans les données IES. | 458 |
| `editor_api_iesImporter.inferCookiePathFromIES(iesPath)` | Déduit le chemin de sortie par défaut : même dossier et même nom que l'IES avec l'extension `.color.png`. Renvoie "" si le chemin est vide ou finit par /. | 1308 |
| `editor_api_iesImporter.parseHeaderMetadata(path)` | Lit l'en-tête d'un fichier IES (avant la ligne TILT=) : version, entrées [CLÉ] valeur, table `map` clé -> valeur (clés en majuscules, valeurs multiples jointes par \n, [MORE] concatène à la clé précédente) et liste `more`. | 209 |
| `editor_api_iesImporter.parseIES(path)` | Parse un fichier IES complet : en-tête, tilt, nombre de lampes, lumens, multiplicateur de candela, type photométrique, unités, dimensions, angles et tableau candela[ih][iv] (multiplié par le multiplicateur et par les facteurs de tilt si TILT=INCLUDE). | 332 |
| `editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela)` | Trie les angles horizontaux avec leurs lignes de candela et, si les données couvrent plus de 180° sans atteindre 360°, ajoute une ligne à 360° copiée de la première pour le bouclage. | 501 |
| `editor_api_iesImporter.printIESInfo(ies)` | Écrit dans le log un résumé de l'IES (nombre et plage d'angles, type photométrique, watts, pic de candela et sa direction). | 484 |
| `editor_api_iesImporter.sampleIES(theta, phi, ies, prepared)` | Interpole l'intensité (candela) pour une direction (theta, phi) en tenant compte de la symétrie horizontale. Renvoie 0 si theta est hors de la plage verticale ou si les données sont vides. | 563 |
| `editor_api_iesImporter.saveImage(img, outPath, opts)` | Normalise l'image (percentile, scale, gamma, inversion éventuelle), l'écrit en PNG via GBitmap puis, sauf writeMetadata == false, écrit le fichier annexe .cookie.json. | 869 |
| `editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo)` | Construit les métadonnées et les écrit dans le .cookie.json (jsonWriteFile). | 1230 |

### Détail des paramètres

#### `editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo)`

Construit la table de métadonnées (type "IESLightImport" version 1) : source, noms (suggestedObjectName nettoyé), assets, paramètres SpotLight (outerAngle, innerAngle, candela, lumens, watts, température de couleur), photométrie (pic, lumens, W, efficacité lm/W) et paramètres de conversion.

- `ies` (*table*) : résultat de parseIES
- `outPath` (*string*) : chemin du PNG
- `opts` (*table|nil*) : options de génération/sauvegarde
- `saveInfo` (*table|nil*) : saveInfo de saveImage
- **renvoie** : table métadonnées

#### `editor_api_iesImporter.generateCookie(ies, opts)`

Génère l'image cookie : pour chaque pixel d'une image size x size, calcule la direction de lumière (projection perspective ou linéaire, rotation, base centrée sur centerTheta/centerPhi), échantillonne l'IES et applique un masque circulaire (avec adoucissement edgeFeather).

- `ies` (*table*) : résultat de parseIES
- `opts` (*table|nil*) : {size, projection, rotate, centerTheta, centerPhi, angle, edgeFeather}
- **renvoie** : table {width, height, data (valeurs brutes, index y*size+x+1), _ies, generation = {size, angle, projection, rotate, centerTheta, centerPhi, edgeFeather}}

#### `editor_api_iesImporter.generateToFile(iesPath, outPath, opts)`

Pipeline complet : parse l'IES, (autoCenter : centre sur le pic), génère le cookie, sauvegarde le PNG et le .cookie.json.

- `iesPath` (*string*) : fichier .ies source
- `outPath` (*string*) : PNG de sortie
- `opts` (*table|nil*) : {size, angle, projection, rotate, centerTheta, centerPhi, autoCenter, edgeFeather, percentile, gamma, scale, invert, writeMetadata, noInfo}
- **renvoie** : boolean true si l'image est sauvegardée
- **renvoie** : table {imagePath, metadataPath, metadataWritten, saveInfo}

#### `editor_api_iesImporter.getCookieMetadataPath(outPath)`

Donne le chemin du fichier annexe : remplace `.color.png` ou `.png` par `.cookie.json`, sinon ajoute `.cookie.json`.

- `outPath` (*string*) : chemin du PNG
- **renvoie** : string chemin du .cookie.json

#### `editor_api_iesImporter.getHeaderValue(meta, keys, fallback)`

Renvoie la première valeur non vide de l'en-tête parmi une liste de clés (insensible à la casse).

- `meta` (*table*) : résultat de parseHeaderMetadata
- `keys` (*string[]*) : clés à essayer dans l'ordre (ex. {"MANUFAC"})
- `fallback` (*string|nil*) : valeur par défaut ("" sinon)
- **renvoie** : string valeur trouvée ou fallback

#### `editor_api_iesImporter.getPeakDirection(ies)`

Cherche la direction d'intensité maximale dans les données IES.

- `ies` (*table*) : résultat de parseIES
- **renvoie** : number theta du pic (degrés)
- **renvoie** : number phi du pic (degrés)
- **renvoie** : number candela au pic
- **renvoie** : integer indice horizontal
- **renvoie** : integer indice vertical

#### `editor_api_iesImporter.inferCookiePathFromIES(iesPath)`

Déduit le chemin de sortie par défaut : même dossier et même nom que l'IES avec l'extension `.color.png`. Renvoie "" si le chemin est vide ou finit par /.

- `iesPath` (*string*) : chemin du .ies
- **renvoie** : string chemin du PNG

#### `editor_api_iesImporter.parseHeaderMetadata(path)`

Lit l'en-tête d'un fichier IES (avant la ligne TILT=) : version, entrées [CLÉ] valeur, table `map` clé -> valeur (clés en majuscules, valeurs multiples jointes par \n, [MORE] concatène à la clé précédente) et liste `more`.

- `path` (*string*) : chemin du fichier .ies
- **renvoie** : table {version, entries = {{key, value}}, map, more}

#### `editor_api_iesImporter.parseIES(path)`

Parse un fichier IES complet : en-tête, tilt, nombre de lampes, lumens, multiplicateur de candela, type photométrique, unités, dimensions, angles et tableau candela[ih][iv] (multiplié par le multiplicateur et par les facteurs de tilt si TILT=INCLUDE).

- `path` (*string*) : chemin du .ies
- **renvoie** : table {path, metadata, tilt, verticalAngles, horizontalAngles, candela, numLamps, lumensPerLamp, candelaMultiplier, photometricType, unitsType, width, length, height, ballastFactor, futureUse, inputWatts}

#### `editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela)`

Trie les angles horizontaux avec leurs lignes de candela et, si les données couvrent plus de 180° sans atteindre 360°, ajoute une ligne à 360° copiée de la première pour le bouclage.

- `horizontalAngles` (*number[]*) : angles horizontaux
- `candela` (*table*) : candela[ih][iv]
- **renvoie** : table {h = angles triés, c = lignes de candela}

#### `editor_api_iesImporter.printIESInfo(ies)`

Écrit dans le log un résumé de l'IES (nombre et plage d'angles, type photométrique, watts, pic de candela et sa direction).

- `ies` (*table*) : résultat de parseIES

#### `editor_api_iesImporter.sampleIES(theta, phi, ies, prepared)`

Interpole l'intensité (candela) pour une direction (theta, phi) en tenant compte de la symétrie horizontale. Renvoie 0 si theta est hors de la plage verticale ou si les données sont vides.

- `theta` (*number*) : angle vertical en degrés
- `phi` (*number*) : angle horizontal en degrés
- `ies` (*table*) : résultat de parseIES
- `prepared` (*table|nil*) : résultat de prepareHorizontalData (calculé si absent ; à fournir pour accélérer)
- **renvoie** : number intensité interpolée

#### `editor_api_iesImporter.saveImage(img, outPath, opts)`

Normalise l'image (percentile, scale, gamma, inversion éventuelle), l'écrit en PNG via GBitmap puis, sauf writeMetadata == false, écrit le fichier annexe .cookie.json.

- `img` (*table*) : résultat de generateCookie
- `outPath` (*string*) : chemin du PNG
- `opts` (*table|nil*) : {percentile, gamma, scale, invert, writeMetadata}
- **renvoie** : boolean true si le PNG a été écrit
- **renvoie** : table saveInfo : path, width, height, format, percentile, gamma, scale, invert, maxValue, nonzeroPixels, normalizationValue, metadataWritten, metadataPath

#### `editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo)`

Construit les métadonnées et les écrit dans le .cookie.json (jsonWriteFile).

- `ies` (*table*) : résultat de parseIES
- `outPath` (*string*) : chemin du PNG
- `opts` (*table|nil*) : options
- `saveInfo` (*table|nil*) : saveInfo
- **renvoie** : boolean toujours true
- **renvoie** : string chemin du .cookie.json
- **renvoie** : table métadonnées écrites

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/iesImporter.lua`.*
