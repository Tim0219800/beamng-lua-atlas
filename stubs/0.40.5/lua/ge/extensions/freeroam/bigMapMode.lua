---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode « grande carte » (big map) du jeu : ouvre et ferme la carte du niveau vue de dessus avec une transition de caméra, bascule la caméra 'bigMap', met le jeu en pause (pushPauseRequest 'bigMap'), modifie temporairement brouillard, nuages, heure, distance de vue et profondeur de champ, affiche les marqueurs de POI (via freeroam_bigMapMarkers), gère la sélection/survol de POI, le calcul et l'aperçu d'itinéraires (core_groundMarkers), le téléport rapide vers un POI et les commandes clavier/manette. L'interface Vue de la grande carte l'appelle pour la sélection (selectPoi, poiHovered…). Un moddeur s'en sert pour ouvrir la carte (enterBigMap, enterBigMapWithCustomPOIs), choisir un POI ou fixer une destination (setNavFocus).
--- Accès : extension `freeroam_bigMapMode` : `extensions.load("freeroam_bigMapMode")`, puis la globale `freeroam_bigMapMode`
---@class freeroam_bigMapMode
---@field clusterMergeRadius number Rayon de regroupement des marqueurs de POI en mètres (10 au départ ; recalculé par updateMergeRadius).
---@field dependencies string[] gameplay_rawPois, core_groundMarkers, core_camera, core_terrain, freeroam_bigMapMarkers, ui_pause_camera.
---@field hoveredListItem string|nil Id du POI survolé dans la liste de l'interface (défini par poiHovered).
---@field hoveredPoiId string|nil Id du POI survolé sur la carte (mis à jour pendant onUpdate).
---@field selectedPoiId string|nil Id du POI sélectionné (selectPoi/deselect).
freeroam_bigMapMode = {}

--- Indique si la grande carte est ouverte.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1223
---@return boolean  true si ouverte.
function freeroam_bigMapMode.bigMapActive() end

--- Déplace la caméra de la carte avec un stick de manette (valeur élevée au carré avec le signe conservé). Un mouvement > 0,01 rend le focus à la carte et envoie BigmapCameraMove à l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1648
---@param upDown boolean true = avant/arrière, false = gauche/droite.
---@param value number Valeur de l'axe (-1 à 1).
function freeroam_bigMapMode.camMoveController(upDown, value) end

--- Déplace la caméra de la carte avec les touches directionnelles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1668
---@param value number Valeur de la touche (1 appuyée, 0 relâchée).
---@param direction integer 1 avant, 2 arrière, 3 gauche, autre valeur = droite.
function freeroam_bigMapMode.camMoveKey(value, direction) end

--- Supprime l'aperçu d'itinéraire dessiné sur la carte.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1437
function freeroam_bigMapMode.clearRoutePreview() end

--- Zoom avec la manette : transmet directement la valeur à core_camera.cameraZoom (le paramètre zoomIn est ignoré).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1293
---@param value number Valeur de zoom.
---@param zoomIn boolean Non utilisé.
function freeroam_bigMapMode.controllerZoom(value, zoomIn) end

--- Désélectionne le POI courant : envoie onReducedPoiList vide à l'interface, émet onPoiSelectedFromBigmap(nil), efface l'aperçu de route et appelle le callback de sélection avec nil.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1492
function freeroam_bigMapMode.deselect() end

--- Active ou désactive les contrôles de la carte : pousse/retire l'action map « BigMap » et bloque/débloque les actions de jeu de la liste blockedInputActions ainsi que les actions d'interface.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:889
---@param enable boolean true pour activer les contrôles de la carte.
function freeroam_bigMapMode.enableBigMapControls(enable) end

--- Ouvre la grande carte. Ne fait rien si une tâche de mission démarre/s'arrête, si la carte est déjà ouverte ou en cours d'ouverture, ou s'il n'y a pas de niveau chargé. Voir les notes pour les options.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1102
---@param options table|nil Options : instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode, suppressUI (utilisé par enterBigMapWithCustomPOIs).
function freeroam_bigMapMode.enterBigMap(options) end

--- Ouvre la grande carte en ne montrant que les POI donnés ; le callback est appelé avec l'id du POI sélectionné (ou nil à la désélection). Avec options.suppressUI, le callback est remplacé par nop (pas d'interface de sélection).
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1854
---@param poiIds string[] Ids de POI à afficher.
---@param callback function|nil Appelé avec l'id sélectionné ou nil.
---@param options table|nil Mêmes options que enterBigMap, plus suppressUI.
function freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options) end

--- Ferme la grande carte, avec transition de caméra sauf en mode instantané, en caméra ortho, en VR ou si la caméra libre était active. Restaure l'environnement et la caméra, arrête l'ambiance sonore et efface les icônes.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1172
---@param instant boolean|nil true pour fermer sans transition.
---@param closeEscMenu boolean|nil true pour naviguer vers la route UI 'play'.
---@param forceGameCam boolean|nil true pour revenir à la caméra orbit si le joueur était en caméra libre.
function freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam) end

--- Cadre la caméra de la carte sur l'itinéraire actif (pan + zoom pour que le trajet tienne dans l'écran hors barre latérale et barre d'infos). Ne fait rien en caméra ortho, si la carte est fermée, sans itinéraire, ou pendant une sélection automatique de POI.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:812
---@param sidebarFraction number Fraction de l'écran occupée par la barre latérale (0 à 1).
---@param infobarFraction number Fraction de l'écran occupée par la barre d'infos (0 à 1).
function freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction) end

--- Renvoie puis efface l'id demandé par enterBigMap({autoSelectPoiId = ...}) pour que l'interface Vue le sélectionne une fois montée (évite une course au montage).
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1589
---@return string|nil  Id de POI en attente, nil si aucun.
function freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId() end

--- Hauteur de la fenêtre en pixels, lue à l'ouverture de la carte (1080 par défaut).
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1803
---@return integer  Résolution verticale.
function freeroam_bigMapMode.getVerticalResolution() end

--- Indique si une transition d'ouverture ou de fermeture est en cours.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1227
---@return boolean  true pendant la transition (en interne 1 = vers la carte, 2 = depuis la carte).
function freeroam_bigMapMode.isTransitionActive() end

--- Indique si la caméra orthogonale est utilisée (constante, false dans cette version).
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1863
---@return boolean  false.
function freeroam_bigMapMode.isUsingOrthoCamera() end

--- Définit la destination de navigation vers le POI donné (cherche d'abord dans les clusters de playmodeMarkers, puis dans les POI bruts avec bigmapMarker, éventuellement via customNavigationFunction) et émet onNavigateToMission. Sans trouvé ou avec nil, efface la navigation. Ne fait rien en test de conduite de carrière.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1509
---@param poiId string|nil Id du POI cible ; nil pour annuler la navigation.
---@return table|nil  Marqueur trouvé dans les clusters de playmodeMarkers, sinon nil (voir notes).
function freeroam_bigMapMode.navigateToMission(poiId) end

--- Hook appelé avant le rendu de la caméra : positionne les icônes du réticule de manette et du marqueur de navigation selon la caméra de la carte. Ne fait rien si la carte est fermée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1301
---@param camData table Données de caméra (camData.res.pos, rot, fov).
function freeroam_bigMapMode.onCameraPreRender(camData) end

--- Hook appelé par l'action d'entrée de changement de filtre : avec hystérésis (déclenche à plus de 0,65, réarme sous 0,35) envoie onChangeBigmapFilterIndex avec {change = dir} à l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1842
---@param value number Valeur de l'entrée analogique.
---@param dir integer Direction de changement (par ex. -1 ou 1, déduit du code).
function freeroam_bigMapMode.onChangeUiFilter(value, dir) end

--- Hook appelé à la fin du niveau : efface le cache des cylindres de bordure, désélectionne et supprime le son d'ambiance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1824
---@param levelPath string Chemin du niveau quitté (non utilisé).
function freeroam_bigMapMode.onClientEndMission(levelPath) end

--- Hook appelé au démarrage du niveau : désactive le mode carte et crée la source sonore d'ambiance (event:>UI>Bigmap>Ambience).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1807
---@param levelPath string Chemin du niveau (non utilisé).
function freeroam_bigMapMode.onClientStartMission(levelPath) end

--- Hook appelé quand le joueur appuie sur « sélection » à la manette : simule un clic sur la carte si la souris n'a pas bougé et que l'interface n'a pas le focus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1742
function freeroam_bigMapMode.onControllerSelect() end

--- Hook appelé après un rechargement des extensions : rouvre la carte (si elle l'était) et rétablit la destination de navigation (hors carrière), après un délai de 0,1 s dans un job.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1778
---@param v table Données de onSerialize : bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData.
function freeroam_bigMapMode.onDeserialized(v) end

--- Hook appelé au déchargement : supprime la source sonore d'ambiance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1830
function freeroam_bigMapMode.onExtensionUnloaded() end

--- Hook appelé quand le joueur navigue dans les menus : redonne le focus à l'interface (setUiNavigationActive(true)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1583
function freeroam_bigMapMode.onMenuItemNavigation() end

--- Hook appelé aux clics de la souris sur la carte : au relâchement sans glisser, traite un clic (sélection de POI, destination, désélection) puis transmet l'évènement à la caméra de la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1731
---@param buttonDown boolean true à l'appui, false au relâchement.
function freeroam_bigMapMode.onMouseButton(buttonDown) end

--- Hook appelé quand le graphe de navigation est rechargé : ferme et rouvre la carte instantanément si elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1834
function freeroam_bigMapMode.onNavgraphReloaded() end

--- Hook appelé quand le véhicule atteint la destination : efface la navigation (setNavFocus(nil)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:413
function freeroam_bigMapMode.onReachedTargetPos() end

--- Hook appelé avant un rechargement des extensions : ferme la carte si ouverte (instantanément), vide le cache de cylindres et renvoie l'état à restaurer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1762
---@return table  {bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData}
function freeroam_bigMapMode.onSerialize() end

--- Déplace en douceur la caméra pour centrer un POI, sans changer la sélection ni la navigation. Applique une seule fois le zoom autoSelectZoomFactor s'il a été demandé à l'ouverture.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1543
---@param poiId string Id du POI ; les valeurs vides, 'null' et 'undefined' sont ignorées.
function freeroam_bigMapMode.panToPoi(poiId) end

--- Appelé par l'interface quand un POI de la liste est survolé : affiche l'aperçu d'itinéraire de la mission (si c'est une mission) ou rétablit celui du POI sélectionné.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1478
---@param poiIdInCluster string Id du POI.
---@param hovered boolean true au survol, false à la sortie.
function freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered) end

--- Recalcule le chemin simplifié affiché à partir de core_groundMarkers (ou cache le marqueur de navigation s'il n'y a plus de cible) et relance l'animation de l'itinéraire.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:384
function freeroam_bigMapMode.resetRoute() end

--- Appelée par l'interface : sélectionne un POI (aperçu de route de mission, hook onPoiSelectedFromBigmap, callback de sélection). Une valeur vide, 'null' ou 'undefined' équivaut à deselect().
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1596
---@param poiIdInCluster string|nil Id du POI.
function freeroam_bigMapMode.selectPoi(poiIdInCluster) end

--- Fonction vide, réservée à des tests d'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1868
---@param windowSize any Non utilisé.
---@param mapSize any Non utilisé.
function freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize) end

--- Définit (ou efface avec nil) la destination de navigation de la carte via core_groundMarkers.setPath, avec effacement du chemin à l'arrivée. Émet d'abord le hook onSetBigmapNavFocus(pos). Sans véhicule joueur, la position est ignorée.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:396
---@param pos vec3|nil Destination dans le monde ; nil pour annuler.
---@param options table|nil options.async = true calcule le chemin en asynchrone (resetRoute à la fin).
function freeroam_bigMapMode.setNavFocus(pos, options) end

--- Limite l'affichage aux POI de la liste : mémorise la liste, recalcule le rayon de fusion à facteur 1 et reconfigure le filtre de freeroam_bigMapMarkers.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:357
---@param list string[]|nil Ids de POI visibles (liste vide si nil).
function freeroam_bigMapMode.setOnlyIdsVisible(list) end

--- Affiche un aperçu d'itinéraire sur la carte à partir d'un chemin non simplifié (liste de points avec .pos) ; nil l'efface.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1439
---@param unsimplifiedRoute table|nil Chemin issu d'un planificateur de route.
function freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute) end

--- Calcule une route dans le monde entre deux positions (gameplay/route/route) et l'affiche en aperçu.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1447
---@param from vec3 Départ.
---@param to vec3 Arrivée.
function freeroam_bigMapMode.setRoutePreviewSimple(from, to) end

--- Donne ou retire le focus à l'interface (bloque ou débloque les actions d'interface). Ne fait rien si la carte est fermée.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1574
---@param active boolean true si l'interface doit avoir le focus.
function freeroam_bigMapMode.setUiNavigationActive(active) end

--- Téléporte le véhicule du joueur vers un POI (via quickTravelPosRotFunction de son bigmapMarker), ferme la carte (exitBigMap(false, true, true)), recentre la caméra et émet teleportedFromBigmap. Marque aussi le cluster comme cible (hook onNavigateToMission). En carrière, le téléport est « sûr » sans resetBrokenFlexMesh.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1625
---@param poiId string Id du POI cible.
function freeroam_bigMapMode.teleportToPoi(poiId) end

--- Ouvre ou ferme la carte (action d'entrée de la touche carte) : termine une transition en cours, refuse l'ouverture depuis une route UI autre que play/pause, pendant un pas de mission ou pendant une navigation UI protégée. Avec taxi ou livraison actifs, ouvre le dialogue correspondant au lieu de la carte.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1233
function freeroam_bigMapMode.toggleBigMap() end

--- Recalcule le rayon de fusion des marqueurs entre un minimum et un maximum proportionnels à la hauteur de caméra et au champ de vision, puis reconfigure le filtre des marqueurs.
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1749
---@param factor number Facteur d'interpolation de 0 (rayon minimal) à 1 (maximal).
function freeroam_bigMapMode.updateMergeRadius(factor) end

--- Zoom de la caméra de la carte (appelle camMode:zoom).
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1275
---@param value number Valeur de zoom.
function freeroam_bigMapMode.zoom(value) end

--- Zoom par touches : mémorise séparément les valeurs de zoom avant (négative) et arrière, puis envoie leur somme à core_camera.cameraZoom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/bigMapMode.lua:1284
---@param value number Valeur de la touche.
---@param zoomIn boolean true pour zoom avant, false pour arrière.
function freeroam_bigMapMode.zoomInOut(value, zoomIn) end

