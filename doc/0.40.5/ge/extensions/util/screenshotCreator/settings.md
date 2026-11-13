# `util_screenshotCreator_settings`

*Fichier : `lua/ge/extensions/util/screenshotCreator/settings.lua` · VM : Game Engine (GE) · 1055 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_settings` : `extensions.load("util_screenshotCreator_settings")`, puis la globale `util_screenshotCreator_settings`

Réglages et fenêtre de paramètres du créateur de captures/vignettes. Il conserve dans des pointeurs ImGui (getControls) tous les réglages : destination de sortie, résolution (préréglages thumbnail 800x448, 720p, 1080p, 4k, 8k…), supersampling, FOV, hauteur de caméra, marges de cadrage, qualité des réflexions dynamiques, exposition, feux de croisement, délai de stabilisation, gel de la physique, rig d'éclairage, SSAO. Il fabrique les contextes (getFramingContext, getCaptureContext, getJobSettings) consommés par job.lua, les modes de cadrage et la capture, applique/restaure l'environnement du showroom (exposition locale, réflexions, plaques, occupants de sièges) et dessine les surcouches de marges dans la vue 3D.

## Remarques

- Les valeurs par défaut : destination « Vehicle thumbnails » (vehicles/), résolution 800x448, supersampling 3, FOV 20, hauteur de caméra 1,1 m, marge horizontale 32 px, exposition manuelle 8,3 EV, réflexions Ultra, délai de stabilisation 2 s, physique gelée, configs livrées uniquement.
- ctrls.resolution est un index de préréglage avec 0 = « custom » ; les indices d'interface vont de 1 à 9 (getResolutions est indexé à partir de 1). outputDestination et selectedMargin sont indexés à partir de 0.
- Les marges de sécurité sont définies pour la résolution de référence 500x281 (cibles tiny, small, medium, large, huge, list, minimal) puis mises à l'échelle (scaleMargin). La cible « minimal » est le maximum de toutes les autres. L'indice par défaut safeMargins.defaultTargetIndex vaut 6, ce qui désigne la 7e cible (« minimal ») puisque getMarginTarget ajoute 1.
- applyEnvironment, applyReflections et applyLicensePlates n'agissent que dans les niveaux showroom_v2_lighting et showroom_v2_lighting_simple ; ailleurs ils ne font rien (applyReflections/applyLicensePlates renvoient false). L'exposition fixe n'est appliquée que dans le showroom.
- L'environnement d'origine (plaques, réflexions dynamiques VariableRegistry, exposition PostEffectLocalExposureObject, occupants de sièges) est mémorisé au premier applyEnvironment et rétabli par restoreEnvironment/finishWork ; en cas d'échec de restauration, l'état mémorisé est conservé.
- applyLowBeams n'allume les feux que si enabled est vrai ; il ne les éteint jamais.
- Incohérence mineure : le curseur « Procedural camera height » est décrit comme « hauteur au-dessus du nœud activé le plus bas », alors que framing/procedural place le rail à groundHeight + cameraHeight.
- deserialize accepte d'anciens états (resolutionPtr, selectedCameraOverlayMargin, cameraCompositionOverlayEnabled, dynamicReflectionsEnabled) et migre l'ancienne numérotation de qualité de réflexion (version de sérialisation 2).

**Dépendances (chargées avant) :** `ui_imgui`, `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_settings.addVehicleMargin(margin)` | Ajoute à une cible de marge la marge horizontale réglée par l'utilisateur (gauche et droite) et les marges véhicule (haut +4, bas +2). | 205 |
| `util_screenshotCreator_settings.applyEnvironment(options)` | Mémorise l'environnement actuel puis applique celui des captures : exposition, réflexions, plaques non générées, occupants de sièges désactivés. Ne fait rien hors showroom. | 429 |
| `util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot)` | Réapplique un instantané d'environnement en vérifiant chaque valeur ; journalise une erreur pour chaque réglage non restauré. | 441 |
| `util_screenshotCreator_settings.applyExposure()` | Écrit l'exposition (auto ou manuelle en EV) dans l'objet PostEffectLocalExposureObject de la scène. | 375 |
| `util_screenshotCreator_settings.applyLicensePlates()` | Active le réglage SkipGenerateLicencePlate (showroom uniquement). | 388 |
| `util_screenshotCreator_settings.applyLowBeams(vehicle, enabled)` | Allume les feux de croisement du véhicule (electrics.setLightsState(1)) si activé ; ne fait rien sinon. | 949 |
| `util_screenshotCreator_settings.applyReflections()` | Applique la qualité de réflexion dynamique choisie via dynCaptureQuality (showroom uniquement). | 382 |
| `util_screenshotCreator_settings.beginWork(options)` | Début d'un travail de capture : appelle applyEnvironment. | 612 |
| `util_screenshotCreator_settings.deserialize(data)` | Restaure les réglages depuis une table (valeurs bornées, anciens formats acceptés), puis applique exposition et réflexions si on est dans le showroom (alias onDeserialized). | 875 |
| `util_screenshotCreator_settings.drawCameraOverlay(fovOverride)` | Dessine dans la vue 3D, devant la caméra courante, le cadre de l'image finale (rouge), les marges de sécurité (vert), les marges véhicule (bleu) et optionnellement la grille de composition (tiers et centre). À appeler à chaque frame. | 782 |
| `util_screenshotCreator_settings.drawLightingControls()` | Dessine les contrôles ImGui d'éclairage : couleur du cyclorama (matériau showroom_v2_lighting_backdrop), rig relatif à la caméra, ombres et intensité par rôle, correction d'exposition, marquage de parking, mode SSAO. | 340 |
| `util_screenshotCreator_settings.drawOutput(options)` | Alias de drawOutputControls. | 646 |
| `util_screenshotCreator_settings.drawOutputControls(options)` | Dessine les contrôles ImGui de sortie : bouton « Restore thumbnail defaults », destination, FOV et hauteur de caméra procéduraux, marge horizontale, résolutions, supersampling, réflexions, exposition, feux, délai de stabilisation, gel de la physique, et un résumé de la taille d'image. | 646 |
| `util_screenshotCreator_settings.drawOverlayControls()` | Dessine les contrôles ImGui des surcouches : marges, boîte de cadrage, OOBB, entrées de cadrage, composition, ainsi que les cases Sample et Comparison. | 760 |
| `util_screenshotCreator_settings.drawOverlays(fovOverride)` | Alias de drawCameraOverlay. | 782 |
| `util_screenshotCreator_settings.finishWork()` | Fin d'un travail de capture : appelle restoreEnvironment. | 616 |
| `util_screenshotCreator_settings.getCaptureContext()` | Construit le contexte de capture : destination, extension de fichier, résolution, superSampling (et supersampling), internalResolution (résolution × supersampling), qualité des réflexions, feux, délai, gel de la physique, exposition, options sample/comparison. | 545 |
| `util_screenshotCreator_settings.getControls()` | Renvoie la table de tous les pointeurs ImGui des réglages (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifier ces pointeurs modifie directement les réglages. | 980 |
| `util_screenshotCreator_settings.getCurrentResolution()` | Renvoie la résolution finale choisie : celle du préréglage sélectionné, ou la résolution personnalisée si « custom ». | 239 |
| `util_screenshotCreator_settings.getDefaults()` | Renvoie une copie des valeurs par défaut des réglages. | 1005 |
| `util_screenshotCreator_settings.getDynamicReflectionQualities()` | Renvoie les niveaux de qualité des réflexions : Lowest, Low, Normal, High, Ultra. | 1012 |
| `util_screenshotCreator_settings.getEnvironmentSnapshot()` | Renvoie une copie de l'environnement mémorisé (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants). | 486 |
| `util_screenshotCreator_settings.getFramingContext(resolution)` | Construit le contexte transmis aux modes de cadrage : fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin et debug {drawBounds, drawOobb, drawInputs}. L'appelant ajoute vehicle, configName, etc. | 524 |
| `util_screenshotCreator_settings.getFramingDefaults()` | Renvoie une copie des défauts de cadrage : {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}. | 1007 |
| `util_screenshotCreator_settings.getFramingMargin(resolution)` | Calcule la marge de cadrage finale pour une résolution : cible choisie + marges véhicule, mise à l'échelle. Renvoie une marge nulle si « useFramingMargins » est décoché. | 517 |
| `util_screenshotCreator_settings.getJobSettings(options)` | Fusionne contexte de cadrage et de capture en un seul tableau de réglages de travail (outputFolder, resolution, fov, margin, captureTimeout min 0,1 s…). Les options remplacent certains réglages de l'interface. | 572 |
| `util_screenshotCreator_settings.getLightingRig()` | Renvoie les réglages du rig d'éclairage lus dans l'interface : enabled, exposureCorrection, ssaoMode (« on », « reduced » ou « off »), parkingMarkup, roles[id] = {intensity, shadows} pour key, fill, rim, top, groundFill, horizonFill. | 300 |
| `util_screenshotCreator_settings.getMarginTarget(index)` | Renvoie la cible de marge d'indice donné (base 0). La cible « minimal » est remplacée par le maximum de toutes les autres. Retombe sur la cible par défaut si l'indice est invalide. | 200 |
| `util_screenshotCreator_settings.getOutputControls()` | Renvoie le sous-ensemble des pointeurs de sortie : outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier. | 981 |
| `util_screenshotCreator_settings.getOutputDestinations()` | Renvoie les noms des destinations de sortie : « Vehicle thumbnails » et « Screenshot/showroom folder ». | 1008 |
| `util_screenshotCreator_settings.getRenderControls()` | Renvoie les pointeurs de rendu : superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure. | 991 |
| `util_screenshotCreator_settings.getResolutions()` | Renvoie les préréglages de résolution {nom, largeur, hauteur}. | 1009 |
| `util_screenshotCreator_settings.getSafeMargins()` | Renvoie la définition des marges de sécurité : {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}. | 1010 |
| `util_screenshotCreator_settings.getThumbnailConfig()` | Renvoie une copie de la config de vignette : {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}. | 1006 |
| `util_screenshotCreator_settings.getThumbnailResolution()` | Renvoie la résolution correcte d'une vignette de véhicule (préréglage « thumbnail », 800 x 448). | 234 |
| `util_screenshotCreator_settings.getVehicleSafeMargin()` | Renvoie la marge supplémentaire autour du véhicule : {top = 4, bottom = 2} (en pixels de référence). | 1011 |
| `util_screenshotCreator_settings.isDefaultConfig()` | Indique si les réglages de sortie/rendu principaux sont aux valeurs par défaut des vignettes. | 499 |
| `util_screenshotCreator_settings.isThumbnailConfigGood()` | Vérifie que, pour la destination « Vehicle thumbnails », la résolution est bien le préréglage vignette. | 512 |
| `util_screenshotCreator_settings.onClientEndMission()` | Hook de fin de niveau ; même fonction que onExtensionUnloaded. *(interne)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onClientPostStartMission()` | Hook appelé après le démarrage d'un niveau : dans le showroom, force les réflexions sur Ultra et applique l'environnement. *(interne)* *(hook)* | 961 |
| `util_screenshotCreator_settings.onDeserialized(data)` | Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize. *(interne)* *(hook)* | 875 |
| `util_screenshotCreator_settings.onExit()` | Hook de fermeture du jeu ; même fonction que onExtensionUnloaded. *(interne)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onExtensionLoaded()` | Hook : remet les réglages par défaut et applique l'environnement (showroom). *(interne)* *(hook)* | 956 |
| `util_screenshotCreator_settings.onExtensionUnloaded()` | Hook : rétablit la résolution de la fenêtre si l'aperçu était actif, puis restaure l'environnement. Aussi utilisé comme onClientEndMission et onExit. *(interne)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onSerialize()` | Hook de sérialisation avant rechargement des extensions ; identique à serialize. *(interne)* *(hook)* | 837 |
| `util_screenshotCreator_settings.resetToDefaults()` | Remet aux valeurs par défaut les réglages de sortie et de rendu (pas ceux de l'éclairage ni des surcouches). | 262 |
| `util_screenshotCreator_settings.restoreEnvironment()` | Restaure l'environnement mémorisé puis l'oublie. | 491 |
| `util_screenshotCreator_settings.scaleMargin(margin, resolution)` | Met à l'échelle une marge exprimée pour 500x281 vers la résolution donnée. | 219 |
| `util_screenshotCreator_settings.serialize()` | Renvoie tous les réglages sous forme de table sérialisable (alias onSerialize). | 837 |
| `util_screenshotCreator_settings.setImageResolution(width, height)` | Fixe la résolution personnalisée (arrondie, minimum 1) et sélectionne le préréglage correspondant s'il existe, sinon « custom ». | 247 |
| `util_screenshotCreator_settings.setPreviewResolution(enabled)` | Passe la fenêtre du jeu en mode sans bordure à la résolution finale choisie (aperçu), ou rétablit le mode vidéo d'origine. | 620 |

### Détail des paramètres

#### `util_screenshotCreator_settings.addVehicleMargin(margin)`

Ajoute à une cible de marge la marge horizontale réglée par l'utilisateur (gauche et droite) et les marges véhicule (haut +4, bas +2).

- `margin` (*table|nil*) : Cible de marge.
- **renvoie** : table|nil Nouvelle marge, ou nil si margin est nil.

#### `util_screenshotCreator_settings.applyEnvironment(options)`

Mémorise l'environnement actuel puis applique celui des captures : exposition, réflexions, plaques non générées, occupants de sièges désactivés. Ne fait rien hors showroom.

- `options` (*table|nil*) : {applyExposure = false} pour ne pas toucher à l'exposition.

#### `util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot)`

Réapplique un instantané d'environnement en vérifiant chaque valeur ; journalise une erreur pour chaque réglage non restauré.

- `snapshot` (*table*) : Instantané (voir getEnvironmentSnapshot).
- **renvoie** : boolean true si tout a été restauré.

#### `util_screenshotCreator_settings.applyExposure()`

Écrit l'exposition (auto ou manuelle en EV) dans l'objet PostEffectLocalExposureObject de la scène.

- **renvoie** : boolean true si l'objet existe et a pris les valeurs demandées.

#### `util_screenshotCreator_settings.applyLicensePlates()`

Active le réglage SkipGenerateLicencePlate (showroom uniquement).

- **renvoie** : boolean false hors showroom.

#### `util_screenshotCreator_settings.applyLowBeams(vehicle, enabled)`

Allume les feux de croisement du véhicule (electrics.setLightsState(1)) si activé ; ne fait rien sinon.

- `vehicle` (*table*) : Objet véhicule.
- `enabled` (*boolean|nil*) : Valeur imposée ; par défaut le réglage de l'interface.

#### `util_screenshotCreator_settings.applyReflections()`

Applique la qualité de réflexion dynamique choisie via dynCaptureQuality (showroom uniquement).

- **renvoie** : boolean false hors showroom.

#### `util_screenshotCreator_settings.beginWork(options)`

Début d'un travail de capture : appelle applyEnvironment.

- `options` (*table|nil*) : Passé à applyEnvironment.

#### `util_screenshotCreator_settings.deserialize(data)`

Restaure les réglages depuis une table (valeurs bornées, anciens formats acceptés), puis applique exposition et réflexions si on est dans le showroom (alias onDeserialized).

- `data` (*table|nil*) : État sérialisé ; ignoré si ce n'est pas une table.

#### `util_screenshotCreator_settings.drawCameraOverlay(fovOverride)`

Dessine dans la vue 3D, devant la caméra courante, le cadre de l'image finale (rouge), les marges de sécurité (vert), les marges véhicule (bleu) et optionnellement la grille de composition (tiers et centre). À appeler à chaque frame.

- `fovOverride` (*number|nil*) : FOV en degrés à utiliser à la place du FOV réglé.

#### `util_screenshotCreator_settings.drawOutput(options)`

Alias de drawOutputControls.

- `options` (*table|nil*) : Voir drawOutputControls.

#### `util_screenshotCreator_settings.drawOutputControls(options)`

Dessine les contrôles ImGui de sortie : bouton « Restore thumbnail defaults », destination, FOV et hauteur de caméra procéduraux, marge horizontale, résolutions, supersampling, réflexions, exposition, feux, délai de stabilisation, gel de la physique, et un résumé de la taille d'image.

- `options` (*table|nil*) : {drawToggleUiApps = function} dessiné à côté du bouton d'aperçu de résolution.

#### `util_screenshotCreator_settings.drawOverlays(fovOverride)`

Alias de drawCameraOverlay.

- `fovOverride` (*number|nil*) : Voir drawCameraOverlay.

#### `util_screenshotCreator_settings.getCaptureContext()`

Construit le contexte de capture : destination, extension de fichier, résolution, superSampling (et supersampling), internalResolution (résolution × supersampling), qualité des réflexions, feux, délai, gel de la physique, exposition, options sample/comparison.

- **renvoie** : table Contexte de capture.

#### `util_screenshotCreator_settings.getControls()`

Renvoie la table de tous les pointeurs ImGui des réglages (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifier ces pointeurs modifie directement les réglages.

- **renvoie** : table ctrls (im.BoolPtr, im.FloatPtr, im.IntPtr, im.ArrayInt…).

#### `util_screenshotCreator_settings.getCurrentResolution()`

Renvoie la résolution finale choisie : celle du préréglage sélectionné, ou la résolution personnalisée si « custom ».

- **renvoie** : integer[] {largeur, hauteur}.

#### `util_screenshotCreator_settings.getDefaults()`

Renvoie une copie des valeurs par défaut des réglages.

- **renvoie** : table Valeurs par défaut.

#### `util_screenshotCreator_settings.getDynamicReflectionQualities()`

Renvoie les niveaux de qualité des réflexions : Lowest, Low, Normal, High, Ultra.

- **renvoie** : string[] Niveaux de qualité.

#### `util_screenshotCreator_settings.getEnvironmentSnapshot()`

Renvoie une copie de l'environnement mémorisé (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants).

- **renvoie** : table|nil Instantané, nil si rien n'a été mémorisé.

#### `util_screenshotCreator_settings.getFramingContext(resolution)`

Construit le contexte transmis aux modes de cadrage : fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin et debug {drawBounds, drawOobb, drawInputs}. L'appelant ajoute vehicle, configName, etc.

- `resolution` (*integer[]|nil*) : {largeur, hauteur} ; défaut la résolution courante.
- **renvoie** : table Contexte de cadrage.

#### `util_screenshotCreator_settings.getFramingDefaults()`

Renvoie une copie des défauts de cadrage : {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}.

- **renvoie** : table Défauts de cadrage.

#### `util_screenshotCreator_settings.getFramingMargin(resolution)`

Calcule la marge de cadrage finale pour une résolution : cible choisie + marges véhicule, mise à l'échelle. Renvoie une marge nulle si « useFramingMargins » est décoché.

- `resolution` (*integer[]*) : {largeur, hauteur}.
- **renvoie** : table {left, right, top, bottom, extraBottom, ...}.

#### `util_screenshotCreator_settings.getJobSettings(options)`

Fusionne contexte de cadrage et de capture en un seul tableau de réglages de travail (outputFolder, resolution, fov, margin, captureTimeout min 0,1 s…). Les options remplacent certains réglages de l'interface.

- `options` (*table|nil*) : {resolution, outputFolder, lowBeamsEnabled, shippedConfigsOnly, sample, comparison, captureTimeout}.
- **renvoie** : table Réglages du travail.

#### `util_screenshotCreator_settings.getLightingRig()`

Renvoie les réglages du rig d'éclairage lus dans l'interface : enabled, exposureCorrection, ssaoMode (« on », « reduced » ou « off »), parkingMarkup, roles[id] = {intensity, shadows} pour key, fill, rim, top, groundFill, horizonFill.

- **renvoie** : table Réglages du rig.

#### `util_screenshotCreator_settings.getMarginTarget(index)`

Renvoie la cible de marge d'indice donné (base 0). La cible « minimal » est remplacée par le maximum de toutes les autres. Retombe sur la cible par défaut si l'indice est invalide.

- `index` (*integer|nil*) : Indice de cible, base 0 (défaut safeMargins.defaultTargetIndex).
- **renvoie** : table {name, left, right, top, bottom, extraBottom, color} en pixels de référence 500x281.

#### `util_screenshotCreator_settings.getOutputControls()`

Renvoie le sous-ensemble des pointeurs de sortie : outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier.

- **renvoie** : table Pointeurs ImGui.

#### `util_screenshotCreator_settings.getOutputDestinations()`

Renvoie les noms des destinations de sortie : « Vehicle thumbnails » et « Screenshot/showroom folder ».

- **renvoie** : string[] Destinations.

#### `util_screenshotCreator_settings.getRenderControls()`

Renvoie les pointeurs de rendu : superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure.

- **renvoie** : table Pointeurs ImGui.

#### `util_screenshotCreator_settings.getResolutions()`

Renvoie les préréglages de résolution {nom, largeur, hauteur}.

- **renvoie** : table[] Préréglages.

#### `util_screenshotCreator_settings.getSafeMargins()`

Renvoie la définition des marges de sécurité : {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}.

- **renvoie** : table Marges de référence.

#### `util_screenshotCreator_settings.getThumbnailConfig()`

Renvoie une copie de la config de vignette : {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}.

- **renvoie** : table Config de vignette.

#### `util_screenshotCreator_settings.getThumbnailResolution()`

Renvoie la résolution correcte d'une vignette de véhicule (préréglage « thumbnail », 800 x 448).

- **renvoie** : integer[] {largeur, hauteur}.

#### `util_screenshotCreator_settings.getVehicleSafeMargin()`

Renvoie la marge supplémentaire autour du véhicule : {top = 4, bottom = 2} (en pixels de référence).

- **renvoie** : table {top, bottom}.

#### `util_screenshotCreator_settings.isDefaultConfig()`

Indique si les réglages de sortie/rendu principaux sont aux valeurs par défaut des vignettes.

- **renvoie** : boolean true si tout est par défaut.

#### `util_screenshotCreator_settings.isThumbnailConfigGood()`

Vérifie que, pour la destination « Vehicle thumbnails », la résolution est bien le préréglage vignette.

- **renvoie** : boolean false si la taille ne convient pas pour des vignettes du jeu.

#### `util_screenshotCreator_settings.onDeserialized(data)`

Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize.

- `data` (*table|nil*) : État sérialisé.

#### `util_screenshotCreator_settings.onSerialize()`

Hook de sérialisation avant rechargement des extensions ; identique à serialize.

- **renvoie** : table État des réglages.

#### `util_screenshotCreator_settings.restoreEnvironment()`

Restaure l'environnement mémorisé puis l'oublie.

- **renvoie** : boolean true si tout est restauré ou si rien n'avait été mémorisé.

#### `util_screenshotCreator_settings.scaleMargin(margin, resolution)`

Met à l'échelle une marge exprimée pour 500x281 vers la résolution donnée.

- `margin` (*table*) : Marge de référence.
- `resolution` (*integer[]*) : {largeur, hauteur} cible.
- **renvoie** : table Marge en pixels de la résolution cible (renvoyée telle quelle si un argument est absent).

#### `util_screenshotCreator_settings.serialize()`

Renvoie tous les réglages sous forme de table sérialisable (alias onSerialize).

- **renvoie** : table État des réglages.

#### `util_screenshotCreator_settings.setImageResolution(width, height)`

Fixe la résolution personnalisée (arrondie, minimum 1) et sélectionne le préréglage correspondant s'il existe, sinon « custom ».

- `width` (*number*) : Largeur en pixels.
- `height` (*number*) : Hauteur en pixels.

#### `util_screenshotCreator_settings.setPreviewResolution(enabled)`

Passe la fenêtre du jeu en mode sans bordure à la résolution finale choisie (aperçu), ou rétablit le mode vidéo d'origine.

- `enabled` (*boolean*) : true pour activer l'aperçu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui et core_camera. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/settings.lua`.*
