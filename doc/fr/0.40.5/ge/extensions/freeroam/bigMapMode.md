# `freeroam_bigMapMode`

*Fichier : `lua/ge/extensions/freeroam/bigMapMode.lua` · VM : Game Engine (GE) · 1915 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_bigMapMode` : `extensions.load("freeroam_bigMapMode")`, puis la globale `freeroam_bigMapMode`

Mode « grande carte » (big map) du jeu : ouvre et ferme la carte du niveau vue de dessus avec une transition de caméra, bascule la caméra 'bigMap', met le jeu en pause (pushPauseRequest 'bigMap'), modifie temporairement brouillard, nuages, heure, distance de vue et profondeur de champ, affiche les marqueurs de POI (via freeroam_bigMapMarkers), gère la sélection/survol de POI, le calcul et l'aperçu d'itinéraires (core_groundMarkers), le téléport rapide vers un POI et les commandes clavier/manette. L'interface Vue de la grande carte l'appelle pour la sélection (selectPoi, poiHovered…). Un moddeur s'en sert pour ouvrir la carte (enterBigMap, enterBigMapWithCustomPOIs), choisir un POI ou fixer une destination (setNavFocus).

## Exemple

```lua
-- ouvrir la grande carte avec uniquement deux POI, et recevoir le choix du joueur
freeroam_bigMapMode.enterBigMapWithCustomPOIs({'poiA', 'poiB'}, function(poiId)
  log('I', 'mod', 'POI choisi : ' .. tostring(poiId))
end, {instant = true})
-- fermer
freeroam_bigMapMode.exitBigMap(true, true)
```

## Remarques

- Constantes internes : useVueBigMap = true, useOrthoCamera = false (caméra 'bigMap' et non 'bigMapOrtho'), zoom minimal 20000 (facteur), simplification d'itinéraire 200, padding de cadrage 1,35.
- M.onUpdate n'existe que pendant que la grande carte est active (setActive l'ajoute/le retire puis appelle extensions.hookUpdate('onUpdate')) : onUpdate n'est donc pas appelé quand la carte est fermée.
- Pendant l'ouverture, les valeurs précédentes (brouillard, nuages, heure, distance de vue, interface, profondeur de champ, caméra, caméra libre) sont mémorisées puis restaurées par deactivateBigMapCallback.
- Les actions d'entrée de la liste blockedInputActions (gameCam, freeCam, pause, photoMode, aiControls, resetPhysics, miniMap…) sont bloquées tant que la carte est ouverte.
- Ordre des hooks à l'ouverture : onBeforeBigMapActivated, (transition : onBigmapStartTransition), onActivateBigMapCallback + UI bigmapTransitionFinished, onBigMapActivated. À la fermeture : onDeactivateBigMapCallback.
- Options de enterBigMap : instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode. Une route déjà définie ou la caméra ortho/VR force instant.
- Les rayons de fusion des marqueurs (clusterMergeRadius) sont recalculés par updateMergeRadius selon la hauteur de caméra et le champ de vision.
- Bug : dans enterBigMap, `options.instant = true` est exécuté avant `options = options or {}` ; si la caméra de pause était active et que options vaut nil, erreur Lua.
- Bug : navigateToMission retourne `marker` dans la boucle sur les POI bruts alors que cette variable n'est pas définie dans cette portée (vaut nil ; globale non déclarée).
- setBigmapScreenBounds est une fonction vide (« testing for UI »). getAndClearPendingAutoSelectPoiId existe pour éviter une course avec le montage de l'UI.
- navigateToMission(nil) efface la navigation (déclenche onNavigateToMission avec nil) ; utilisé par clickOnMap pour retirer l'itinéraire.

**Dépendances (chargées avant) :** `gameplay_rawPois`, `core_groundMarkers`, `core_camera`, `core_terrain`, `freeroam_bigMapMarkers`, `ui_pause_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_bigMapMode.bigMapActive()` | Indique si la grande carte est ouverte. | 1223 |
| `freeroam_bigMapMode.camMoveController(upDown, value)` | Déplace la caméra de la carte avec un stick de manette (valeur élevée au carré avec le signe conservé). Un mouvement > 0,01 rend le focus à la carte et envoie BigmapCameraMove à l'interface. *(interne)* | 1648 |
| `freeroam_bigMapMode.camMoveKey(value, direction)` | Déplace la caméra de la carte avec les touches directionnelles. *(interne)* | 1668 |
| `freeroam_bigMapMode.clearRoutePreview()` | Supprime l'aperçu d'itinéraire dessiné sur la carte. | 1437 |
| `freeroam_bigMapMode.controllerZoom(value, zoomIn)` | Zoom avec la manette : transmet directement la valeur à core_camera.cameraZoom (le paramètre zoomIn est ignoré). *(interne)* | 1293 |
| `freeroam_bigMapMode.deselect()` | Désélectionne le POI courant : envoie onReducedPoiList vide à l'interface, émet onPoiSelectedFromBigmap(nil), efface l'aperçu de route et appelle le callback de sélection avec nil. | 1492 |
| `freeroam_bigMapMode.enableBigMapControls(enable)` | Active ou désactive les contrôles de la carte : pousse/retire l'action map « BigMap » et bloque/débloque les actions de jeu de la liste blockedInputActions ainsi que les actions d'interface. | 889 |
| `freeroam_bigMapMode.enterBigMap(options)` | Ouvre la grande carte. Ne fait rien si une tâche de mission démarre/s'arrête, si la carte est déjà ouverte ou en cours d'ouverture, ou s'il n'y a pas de niveau chargé. Voir les notes pour les options. | 1102 |
| `freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options)` | Ouvre la grande carte en ne montrant que les POI donnés ; le callback est appelé avec l'id du POI sélectionné (ou nil à la désélection). Avec options.suppressUI, le callback est remplacé par nop (pas d'interface de sélection). | 1854 |
| `freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam)` | Ferme la grande carte, avec transition de caméra sauf en mode instantané, en caméra ortho, en VR ou si la caméra libre était active. Restaure l'environnement et la caméra, arrête l'ambiance sonore et efface les icônes. | 1172 |
| `freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction)` | Cadre la caméra de la carte sur l'itinéraire actif (pan + zoom pour que le trajet tienne dans l'écran hors barre latérale et barre d'infos). Ne fait rien en caméra ortho, si la carte est fermée, sans itinéraire, ou pendant une sélection automatique de POI. | 812 |
| `freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId()` | Renvoie puis efface l'id demandé par enterBigMap({autoSelectPoiId = ...}) pour que l'interface Vue le sélectionne une fois montée (évite une course au montage). | 1589 |
| `freeroam_bigMapMode.getVerticalResolution()` | Hauteur de la fenêtre en pixels, lue à l'ouverture de la carte (1080 par défaut). | 1803 |
| `freeroam_bigMapMode.isTransitionActive()` | Indique si une transition d'ouverture ou de fermeture est en cours. | 1227 |
| `freeroam_bigMapMode.isUsingOrthoCamera()` | Indique si la caméra orthogonale est utilisée (constante, false dans cette version). | 1863 |
| `freeroam_bigMapMode.navigateToMission(poiId)` | Définit la destination de navigation vers le POI donné (cherche d'abord dans les clusters de playmodeMarkers, puis dans les POI bruts avec bigmapMarker, éventuellement via customNavigationFunction) et émet onNavigateToMission. Sans trouvé ou avec nil, efface la navigation. Ne fait rien en test de conduite de carrière. | 1509 |
| `freeroam_bigMapMode.onCameraPreRender(camData)` | Hook appelé avant le rendu de la caméra : positionne les icônes du réticule de manette et du marqueur de navigation selon la caméra de la carte. Ne fait rien si la carte est fermée. *(interne)* *(hook)* | 1301 |
| `freeroam_bigMapMode.onChangeUiFilter(value, dir)` | Hook appelé par l'action d'entrée de changement de filtre : avec hystérésis (déclenche à plus de 0,65, réarme sous 0,35) envoie onChangeBigmapFilterIndex avec {change = dir} à l'interface. *(interne)* *(hook)* | 1842 |
| `freeroam_bigMapMode.onClientEndMission(levelPath)` | Hook appelé à la fin du niveau : efface le cache des cylindres de bordure, désélectionne et supprime le son d'ambiance. *(interne)* *(hook)* | 1824 |
| `freeroam_bigMapMode.onClientStartMission(levelPath)` | Hook appelé au démarrage du niveau : désactive le mode carte et crée la source sonore d'ambiance (event:>UI>Bigmap>Ambience). *(interne)* *(hook)* | 1807 |
| `freeroam_bigMapMode.onControllerSelect()` | Hook appelé quand le joueur appuie sur « sélection » à la manette : simule un clic sur la carte si la souris n'a pas bougé et que l'interface n'a pas le focus. *(interne)* *(hook)* | 1742 |
| `freeroam_bigMapMode.onDeserialized(v)` | Hook appelé après un rechargement des extensions : rouvre la carte (si elle l'était) et rétablit la destination de navigation (hors carrière), après un délai de 0,1 s dans un job. *(interne)* *(hook)* | 1778 |
| `freeroam_bigMapMode.onExtensionUnloaded()` | Hook appelé au déchargement : supprime la source sonore d'ambiance. *(interne)* *(hook)* | 1830 |
| `freeroam_bigMapMode.onMenuItemNavigation()` | Hook appelé quand le joueur navigue dans les menus : redonne le focus à l'interface (setUiNavigationActive(true)). *(interne)* *(hook)* | 1583 |
| `freeroam_bigMapMode.onMouseButton(buttonDown)` | Hook appelé aux clics de la souris sur la carte : au relâchement sans glisser, traite un clic (sélection de POI, destination, désélection) puis transmet l'évènement à la caméra de la carte. *(interne)* *(hook)* | 1731 |
| `freeroam_bigMapMode.onNavgraphReloaded()` | Hook appelé quand le graphe de navigation est rechargé : ferme et rouvre la carte instantanément si elle est ouverte. *(interne)* *(hook)* | 1834 |
| `freeroam_bigMapMode.onReachedTargetPos()` | Hook appelé quand le véhicule atteint la destination : efface la navigation (setNavFocus(nil)). *(interne)* *(hook)* | 413 |
| `freeroam_bigMapMode.onSerialize()` | Hook appelé avant un rechargement des extensions : ferme la carte si ouverte (instantanément), vide le cache de cylindres et renvoie l'état à restaurer. *(interne)* *(hook)* | 1762 |
| `freeroam_bigMapMode.panToPoi(poiId)` | Déplace en douceur la caméra pour centrer un POI, sans changer la sélection ni la navigation. Applique une seule fois le zoom autoSelectZoomFactor s'il a été demandé à l'ouverture. | 1543 |
| `freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered)` | Appelé par l'interface quand un POI de la liste est survolé : affiche l'aperçu d'itinéraire de la mission (si c'est une mission) ou rétablit celui du POI sélectionné. | 1478 |
| `freeroam_bigMapMode.resetRoute()` | Recalcule le chemin simplifié affiché à partir de core_groundMarkers (ou cache le marqueur de navigation s'il n'y a plus de cible) et relance l'animation de l'itinéraire. | 384 |
| `freeroam_bigMapMode.selectPoi(poiIdInCluster)` | Appelée par l'interface : sélectionne un POI (aperçu de route de mission, hook onPoiSelectedFromBigmap, callback de sélection). Une valeur vide, 'null' ou 'undefined' équivaut à deselect(). | 1596 |
| `freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize)` | Fonction vide, réservée à des tests d'interface. *(interne)* | 1868 |
| `freeroam_bigMapMode.setNavFocus(pos, options)` | Définit (ou efface avec nil) la destination de navigation de la carte via core_groundMarkers.setPath, avec effacement du chemin à l'arrivée. Émet d'abord le hook onSetBigmapNavFocus(pos). Sans véhicule joueur, la position est ignorée. | 396 |
| `freeroam_bigMapMode.setOnlyIdsVisible(list)` | Limite l'affichage aux POI de la liste : mémorise la liste, recalcule le rayon de fusion à facteur 1 et reconfigure le filtre de freeroam_bigMapMarkers. | 357 |
| `freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute)` | Affiche un aperçu d'itinéraire sur la carte à partir d'un chemin non simplifié (liste de points avec .pos) ; nil l'efface. | 1439 |
| `freeroam_bigMapMode.setRoutePreviewSimple(from, to)` | Calcule une route dans le monde entre deux positions (gameplay/route/route) et l'affiche en aperçu. | 1447 |
| `freeroam_bigMapMode.setUiNavigationActive(active)` | Donne ou retire le focus à l'interface (bloque ou débloque les actions d'interface). Ne fait rien si la carte est fermée. | 1574 |
| `freeroam_bigMapMode.teleportToPoi(poiId)` | Téléporte le véhicule du joueur vers un POI (via quickTravelPosRotFunction de son bigmapMarker), ferme la carte (exitBigMap(false, true, true)), recentre la caméra et émet teleportedFromBigmap. Marque aussi le cluster comme cible (hook onNavigateToMission). En carrière, le téléport est « sûr » sans resetBrokenFlexMesh. | 1625 |
| `freeroam_bigMapMode.toggleBigMap()` | Ouvre ou ferme la carte (action d'entrée de la touche carte) : termine une transition en cours, refuse l'ouverture depuis une route UI autre que play/pause, pendant un pas de mission ou pendant une navigation UI protégée. Avec taxi ou livraison actifs, ouvre le dialogue correspondant au lieu de la carte. | 1233 |
| `freeroam_bigMapMode.updateMergeRadius(factor)` | Recalcule le rayon de fusion des marqueurs entre un minimum et un maximum proportionnels à la hauteur de caméra et au champ de vision, puis reconfigure le filtre des marqueurs. | 1749 |
| `freeroam_bigMapMode.zoom(value)` | Zoom de la caméra de la carte (appelle camMode:zoom). | 1275 |
| `freeroam_bigMapMode.zoomInOut(value, zoomIn)` | Zoom par touches : mémorise séparément les valeurs de zoom avant (négative) et arrière, puis envoie leur somme à core_camera.cameraZoom. *(interne)* | 1284 |

### Détail des paramètres

#### `freeroam_bigMapMode.bigMapActive()`

Indique si la grande carte est ouverte.

- **renvoie** : boolean true si ouverte.

#### `freeroam_bigMapMode.camMoveController(upDown, value)`

Déplace la caméra de la carte avec un stick de manette (valeur élevée au carré avec le signe conservé). Un mouvement > 0,01 rend le focus à la carte et envoie BigmapCameraMove à l'interface.

- `upDown` (*boolean*) : true = avant/arrière, false = gauche/droite.
- `value` (*number*) : Valeur de l'axe (-1 à 1).

#### `freeroam_bigMapMode.camMoveKey(value, direction)`

Déplace la caméra de la carte avec les touches directionnelles.

- `value` (*number*) : Valeur de la touche (1 appuyée, 0 relâchée).
- `direction` (*integer*) : 1 avant, 2 arrière, 3 gauche, autre valeur = droite.

#### `freeroam_bigMapMode.controllerZoom(value, zoomIn)`

Zoom avec la manette : transmet directement la valeur à core_camera.cameraZoom (le paramètre zoomIn est ignoré).

- `value` (*number*) : Valeur de zoom.
- `zoomIn` (*boolean*) : Non utilisé.

#### `freeroam_bigMapMode.enableBigMapControls(enable)`

Active ou désactive les contrôles de la carte : pousse/retire l'action map « BigMap » et bloque/débloque les actions de jeu de la liste blockedInputActions ainsi que les actions d'interface.

- `enable` (*boolean*) : true pour activer les contrôles de la carte.

#### `freeroam_bigMapMode.enterBigMap(options)`

Ouvre la grande carte. Ne fait rien si une tâche de mission démarre/s'arrête, si la carte est déjà ouverte ou en cours d'ouverture, ou s'il n'y a pas de niveau chargé. Voir les notes pour les options.

- `options` (*table|nil*) : Options : instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode, suppressUI (utilisé par enterBigMapWithCustomPOIs).

#### `freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options)`

Ouvre la grande carte en ne montrant que les POI donnés ; le callback est appelé avec l'id du POI sélectionné (ou nil à la désélection). Avec options.suppressUI, le callback est remplacé par nop (pas d'interface de sélection).

- `poiIds` (*string[]*) : Ids de POI à afficher.
- `callback` (*function|nil*) : Appelé avec l'id sélectionné ou nil.
- `options` (*table|nil*) : Mêmes options que enterBigMap, plus suppressUI.

#### `freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam)`

Ferme la grande carte, avec transition de caméra sauf en mode instantané, en caméra ortho, en VR ou si la caméra libre était active. Restaure l'environnement et la caméra, arrête l'ambiance sonore et efface les icônes.

- `instant` (*boolean|nil*) : true pour fermer sans transition.
- `closeEscMenu` (*boolean|nil*) : true pour naviguer vers la route UI 'play'.
- `forceGameCam` (*boolean|nil*) : true pour revenir à la caméra orbit si le joueur était en caméra libre.

#### `freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction)`

Cadre la caméra de la carte sur l'itinéraire actif (pan + zoom pour que le trajet tienne dans l'écran hors barre latérale et barre d'infos). Ne fait rien en caméra ortho, si la carte est fermée, sans itinéraire, ou pendant une sélection automatique de POI.

- `sidebarFraction` (*number*) : Fraction de l'écran occupée par la barre latérale (0 à 1).
- `infobarFraction` (*number*) : Fraction de l'écran occupée par la barre d'infos (0 à 1).

#### `freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId()`

Renvoie puis efface l'id demandé par enterBigMap({autoSelectPoiId = ...}) pour que l'interface Vue le sélectionne une fois montée (évite une course au montage).

- **renvoie** : string|nil Id de POI en attente, nil si aucun.

#### `freeroam_bigMapMode.getVerticalResolution()`

Hauteur de la fenêtre en pixels, lue à l'ouverture de la carte (1080 par défaut).

- **renvoie** : integer Résolution verticale.

#### `freeroam_bigMapMode.isTransitionActive()`

Indique si une transition d'ouverture ou de fermeture est en cours.

- **renvoie** : boolean true pendant la transition (en interne 1 = vers la carte, 2 = depuis la carte).

#### `freeroam_bigMapMode.isUsingOrthoCamera()`

Indique si la caméra orthogonale est utilisée (constante, false dans cette version).

- **renvoie** : boolean false.

#### `freeroam_bigMapMode.navigateToMission(poiId)`

Définit la destination de navigation vers le POI donné (cherche d'abord dans les clusters de playmodeMarkers, puis dans les POI bruts avec bigmapMarker, éventuellement via customNavigationFunction) et émet onNavigateToMission. Sans trouvé ou avec nil, efface la navigation. Ne fait rien en test de conduite de carrière.

- `poiId` (*string|nil*) : Id du POI cible ; nil pour annuler la navigation.
- **renvoie** : table|nil Marqueur trouvé dans les clusters de playmodeMarkers, sinon nil (voir notes).

#### `freeroam_bigMapMode.onCameraPreRender(camData)`

Hook appelé avant le rendu de la caméra : positionne les icônes du réticule de manette et du marqueur de navigation selon la caméra de la carte. Ne fait rien si la carte est fermée.

- `camData` (*table*) : Données de caméra (camData.res.pos, rot, fov).

#### `freeroam_bigMapMode.onChangeUiFilter(value, dir)`

Hook appelé par l'action d'entrée de changement de filtre : avec hystérésis (déclenche à plus de 0,65, réarme sous 0,35) envoie onChangeBigmapFilterIndex avec {change = dir} à l'interface.

- `value` (*number*) : Valeur de l'entrée analogique.
- `dir` (*integer*) : Direction de changement (par ex. -1 ou 1, déduit du code).

#### `freeroam_bigMapMode.onClientEndMission(levelPath)`

Hook appelé à la fin du niveau : efface le cache des cylindres de bordure, désélectionne et supprime le son d'ambiance.

- `levelPath` (*string*) : Chemin du niveau quitté (non utilisé).

#### `freeroam_bigMapMode.onClientStartMission(levelPath)`

Hook appelé au démarrage du niveau : désactive le mode carte et crée la source sonore d'ambiance (event:>UI>Bigmap>Ambience).

- `levelPath` (*string*) : Chemin du niveau (non utilisé).

#### `freeroam_bigMapMode.onDeserialized(v)`

Hook appelé après un rechargement des extensions : rouvre la carte (si elle l'était) et rétablit la destination de navigation (hors carrière), après un délai de 0,1 s dans un job.

- `v` (*table*) : Données de onSerialize : bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData.

#### `freeroam_bigMapMode.onMouseButton(buttonDown)`

Hook appelé aux clics de la souris sur la carte : au relâchement sans glisser, traite un clic (sélection de POI, destination, désélection) puis transmet l'évènement à la caméra de la carte.

- `buttonDown` (*boolean*) : true à l'appui, false au relâchement.

#### `freeroam_bigMapMode.onSerialize()`

Hook appelé avant un rechargement des extensions : ferme la carte si ouverte (instantanément), vide le cache de cylindres et renvoie l'état à restaurer.

- **renvoie** : table {bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData}

#### `freeroam_bigMapMode.panToPoi(poiId)`

Déplace en douceur la caméra pour centrer un POI, sans changer la sélection ni la navigation. Applique une seule fois le zoom autoSelectZoomFactor s'il a été demandé à l'ouverture.

- `poiId` (*string*) : Id du POI ; les valeurs vides, 'null' et 'undefined' sont ignorées.

#### `freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered)`

Appelé par l'interface quand un POI de la liste est survolé : affiche l'aperçu d'itinéraire de la mission (si c'est une mission) ou rétablit celui du POI sélectionné.

- `poiIdInCluster` (*string*) : Id du POI.
- `hovered` (*boolean*) : true au survol, false à la sortie.

#### `freeroam_bigMapMode.selectPoi(poiIdInCluster)`

Appelée par l'interface : sélectionne un POI (aperçu de route de mission, hook onPoiSelectedFromBigmap, callback de sélection). Une valeur vide, 'null' ou 'undefined' équivaut à deselect().

- `poiIdInCluster` (*string|nil*) : Id du POI.

#### `freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize)`

Fonction vide, réservée à des tests d'interface.

- `windowSize` (*any*) : Non utilisé.
- `mapSize` (*any*) : Non utilisé.

#### `freeroam_bigMapMode.setNavFocus(pos, options)`

Définit (ou efface avec nil) la destination de navigation de la carte via core_groundMarkers.setPath, avec effacement du chemin à l'arrivée. Émet d'abord le hook onSetBigmapNavFocus(pos). Sans véhicule joueur, la position est ignorée.

- `pos` (*vec3|nil*) : Destination dans le monde ; nil pour annuler.
- `options` (*table|nil*) : options.async = true calcule le chemin en asynchrone (resetRoute à la fin).

#### `freeroam_bigMapMode.setOnlyIdsVisible(list)`

Limite l'affichage aux POI de la liste : mémorise la liste, recalcule le rayon de fusion à facteur 1 et reconfigure le filtre de freeroam_bigMapMarkers.

- `list` (*string[]|nil*) : Ids de POI visibles (liste vide si nil).

#### `freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute)`

Affiche un aperçu d'itinéraire sur la carte à partir d'un chemin non simplifié (liste de points avec .pos) ; nil l'efface.

- `unsimplifiedRoute` (*table|nil*) : Chemin issu d'un planificateur de route.

#### `freeroam_bigMapMode.setRoutePreviewSimple(from, to)`

Calcule une route dans le monde entre deux positions (gameplay/route/route) et l'affiche en aperçu.

- `from` (*vec3*) : Départ.
- `to` (*vec3*) : Arrivée.

#### `freeroam_bigMapMode.setUiNavigationActive(active)`

Donne ou retire le focus à l'interface (bloque ou débloque les actions d'interface). Ne fait rien si la carte est fermée.

- `active` (*boolean*) : true si l'interface doit avoir le focus.

#### `freeroam_bigMapMode.teleportToPoi(poiId)`

Téléporte le véhicule du joueur vers un POI (via quickTravelPosRotFunction de son bigmapMarker), ferme la carte (exitBigMap(false, true, true)), recentre la caméra et émet teleportedFromBigmap. Marque aussi le cluster comme cible (hook onNavigateToMission). En carrière, le téléport est « sûr » sans resetBrokenFlexMesh.

- `poiId` (*string*) : Id du POI cible.

#### `freeroam_bigMapMode.updateMergeRadius(factor)`

Recalcule le rayon de fusion des marqueurs entre un minimum et un maximum proportionnels à la hauteur de caméra et au champ de vision, puis reconfigure le filtre des marqueurs.

- `factor` (*number*) : Facteur d'interpolation de 0 (rayon minimal) à 1 (maximal).

#### `freeroam_bigMapMode.zoom(value)`

Zoom de la caméra de la carte (appelle camMode:zoom).

- `value` (*number*) : Valeur de zoom.

#### `freeroam_bigMapMode.zoomInOut(value, zoomIn)`

Zoom par touches : mémorise séparément les valeurs de zoom avant (négative) et arrière, puis envoie leur somme à core_camera.cameraZoom.

- `value` (*number*) : Valeur de la touche.
- `zoomIn` (*boolean*) : true pour zoom avant, false pour arrière.

## Champs

| Champ | Type | Description |
|---|---|---|
| `clusterMergeRadius` | number | Rayon de regroupement des marqueurs de POI en mètres (10 au départ ; recalculé par updateMergeRadius). |
| `dependencies` | string[] | gameplay_rawPois, core_groundMarkers, core_camera, core_terrain, freeroam_bigMapMarkers, ui_pause_camera. |
| `hoveredListItem` | string|nil | Id du POI survolé dans la liste de l'interface (défini par poiHovered). |
| `hoveredPoiId` | string|nil | Id du POI survolé sur la carte (mis à jour pendant onUpdate). |
| `selectedPoiId` | string|nil | Id du POI sélectionné (selectPoi/deselect). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActivateBigMapCallback` — écouté par 1 module(s)
- `onBeforeBigMapActivated` — écouté par 2 module(s)
- `onBigMapActivated` — écouté par 2 module(s)
- `onBigmapHoveredPoiIdChanged` — écouté par 1 module(s)
- `onBigmapStartTransition`
- `onDeactivateBigMapCallback` — écouté par 3 module(s)
- `onNavigateToMission` — écouté par 1 module(s)
- `onPoiSelectedFromBigmap` — écouté par 2 module(s)
- `onSetBigmapNavFocus` — écouté par 4 module(s)
- `onUpdate` — écouté par 186 module(s)
- `teleportedFromBigmap`

**Évènements UI (guihooks.trigger) :** `BigmapCameraMove`, `BigmapHoveredPoiChanged`, `BigmapMouseOverMap`, `MenuOpenModule`, `bigmapTransitionFinished`, `onChangeBigmapFilterIndex`, `onReducedPoiList`

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `core_environment.` `getCloudCover`, `getFogDensity`, `getTimeOfDay`, `setCloudCover`, `setFogDensity`, `setTimeOfDay`
- `debugDrawer:` `drawCylinder`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/bigMapMode.lua`.*
