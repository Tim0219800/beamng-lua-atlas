---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/vueBigMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend Lua de la grande carte (big map) en interface Vue : prépare pour l'UI la liste des points d'intérêt (POI : missions, garages, stations, concessions, dragstrips, points de départ, véhicule du joueur…), les filtres et les groupes de la liste latérale, l'état de jeu, et relaie les actions de l'UI (sélection, survol, navigation, panoramique, exécution d'actions de POI) vers freeroam_bigMapMode. Les données sont mises en cache à l'ouverture (enterBigMap) et libérées à la fermeture (exitBigMap). Les appels côté UI se font par bngApi.engineLua (voir le commentaire d'en-tête du fichier) ; Lua -> Vue passe par guihooks.trigger('showPoiDetails', {poiIds, ignoreReduction}). Dépend de gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_missions_missionScreen. Global : freeroam_vueBigMap.
--- Accès : extension `freeroam_vueBigMap` : `extensions.load("freeroam_vueBigMap")`, puis la globale `freeroam_vueBigMap`
---@class freeroam_vueBigMap
---@field actionFunctions table<integer, function> Callbacks des actions de POI, par identifiant.
---@field actionIdCounter integer Compteur d'identifiants d'actions de POI.
---@field dependencies string[] Extensions chargées avant.
freeroam_vueBigMap = {}

--- Enregistre un callback d'action et renvoie la table meta enrichie de actionId.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:134
---@param callback function Fonction à appeler.
---@param meta table|nil Métadonnées (label, etc.).
---@return table  meta avec actionId.
function freeroam_vueBigMap.addAction(callback, meta) end

--- Vide la table des actions.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:129
function freeroam_vueBigMap.clearActionFunctions() end

--- Ouvre la grande carte : délègue à freeroam_bigMapMode.enterBigMap (instant), génère les caches POI/filtres/groupes et applique la visibilité des POI.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:809
---@param options table|nil {controllerUsed?: boolean, isMenuBigmap?: boolean, ignoreUiStateChange?: boolean} ; ignoreUiStateChange vaut isMenuBigmap par défaut ; les action maps sont ignorées si controllerUsed et isMenuBigmap.
function freeroam_vueBigMap.enterBigMap(options) end

--- Exécute le callback d'une action ; log d'erreur si inconnue.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:144
---@param actionId integer Identifiant.
---@return string  'success' ou 'error'.
function freeroam_vueBigMap.executeAction(actionId) end

--- Exécute une action de POI enregistrée (voir executeAction).
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:992
---@param actionId integer Identifiant d'action.
function freeroam_vueBigMap.executePoiAction(actionId) end

--- Ferme la grande carte (freeroam_bigMapMode.exitBigMap(true)), vide les caches et les actions.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:830
function freeroam_vueBigMap.exitBigMap() end

--- Récupère puis vide l'id de POI à sélectionner automatiquement demandé à l'ouverture de la carte, depuis freeroam_bigMapMode.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:996
---@return string|nil  Id de POI.
function freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId() end

--- Sections de filtres, chaque groupe avec son état `visible` courant.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:850
---@return table[]  Sections de filtres.
function freeroam_vueBigMap.getFilters() end

--- Incrémente et renvoie un nouvel identifiant d'action.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:123
---@return integer  Identifiant.
function freeroam_vueBigMap.getFreeActionId() end

--- Informations d'état de jeu pour la liste de POI, avec poiListDisplayMode (réglage, 'tree' par défaut).
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:907
---@return table  État.
function freeroam_vueBigMap.getGameStateInfo() end

--- Groupes pour la liste de POI : sections et groupes visibles non vides.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:862
---@return table[]  Sections {key, icon, title, groups[{key, label, icon, elementIds, visible, openByDefault}]}.
function freeroam_vueBigMap.getGroups() end

--- Données complètes des POI par id (nom, aperçu, agrégats, actions disponibles), générées si le cache est invalide.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:843
---@return table  POI par id.
function freeroam_vueBigMap.getPoiData() end

--- Met en surbrillance le marqueur du POI survolé dans la liste.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:985
---@param poiId string Id du POI.
---@param active boolean Survol actif.
---@return string  'success'
---@return boolean  active
function freeroam_vueBigMap.hoverPoiFromList(poiId, active) end

--- Calcule un itinéraire vers le POI (freeroam_bigMapMode.navigateToMission).
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:951
---@param poiId string|nil Id du POI.
---@return string  'success'
function freeroam_vueBigMap.navigateToPoi(poiId) end

--- Appelé par la carte quand un POI y est sélectionné : envoie à l'UI showPoiDetails avec les ids de POI regroupés sous la souris (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) ou liste vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:967
---@param poiId string|nil Id du POI sélectionné.
function freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId) end

--- Centre la vue de la carte sur le POI.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:959
---@param poiId string|nil Id du POI.
---@return string  'success'
function freeroam_vueBigMap.panToPoi(poiId) end

--- Sélectionne un POI depuis la liste (freeroam_bigMapMode.selectPoi) ou désélectionne si id nul.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:935
---@param poiId string|nil Id du POI ('undefined'/'null' = aucun).
---@param isCollapsedMode boolean|nil Si faux, la prochaine réduction de groupe est ignorée.
---@return string  'success'
function freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode) end

--- Règle le mode d'affichage de la liste ('hidden', 'tree', 'simple') dans les réglages.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:1002
---@param mode string Mode.
---@return string  'success' ou 'invalid_mode'.
function freeroam_vueBigMap.setPoiListDisplayMode(mode) end

--- Calcule les ids de POI des groupes visibles et appelle freeroam_bigMapMode.setOnlyIdsVisible.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:918
function freeroam_vueBigMap.setVisibleIds() end

--- Affiche tous les groupes (sectionId 'everything') ou uniquement ceux de la section donnée.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:95
---@param sectionId string Clé de section ou 'everything'.
function freeroam_vueBigMap.toggleFilterSectionById(sectionId) end

--- Rend visibles uniquement les groupes dont les clés sont données (tous les autres sont masqués) et met à jour la visibilité sur la carte.
---Source : lua/ge/extensions/freeroam/vueBigMap.lua:85
---@param filterIds string[] Clés de groupes.
function freeroam_vueBigMap.toggleFiltersByIds(filterIds) end

