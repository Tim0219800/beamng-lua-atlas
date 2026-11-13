---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module central du sélecteur de véhicules (backend « vehicleSelector » de ui_gridSelector). Il construit les données UI (modèles, configs, filtres), gère les options d'affichage persistées (/settings/vehicleSelectorData.json), les filtres, la recherche, les favoris et véhicules récents, puis ouvre le sélecteur dans différents contextes (freeroam, garage, défi, configurateur, pause) en changeant les boutons et la racine du fil d'Ariane. Il pilote aussi le cycle de vie des routes pause/garage (liste racine et page détail d'un véhicule) et envoie les instantanés à l'interface. La plupart des fonctions de filtre et de détail délèguent à filterModule, displayDataModule, ui_vehicleSelector_tiles et ui_vehicleSelector_detailsInteraction.
--- Accès : extension `ui_vehicleSelector_general` : `extensions.load("ui_vehicleSelector_general")`, puis la globale `ui_vehicleSelector_general`
---@class ui_vehicleSelector_general
---@field dependencies string[] core_vehicles, ui_vehicleSelector_detailsInteraction, ui_vehicleSelector_tiles, core_locales.
---@field p table Profileur factice (emptyProfiler) avec start, add et finish sans effet.
ui_vehicleSelector_general = {}

--- Hook appelé par util_asyncBulkLoader quand le chargement asynchrone des véhicules est fini : construit et émet l'instantané en attente (VehicleSelectorDataLoaded), sauf si la route a changé entre-temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1819
function ui_vehicleSelector_general.asyncVehicleLoadComplete() end

--- Recalcule la liste des filtres actifs (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:934
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.calculateActiveFilters(...) end

--- Efface tous les filtres non verrouillés.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:925
---@param ... any Transmis à filterInstance.clearAllFilters.
function ui_vehicleSelector_general.clearAllFilters(...) end

--- Force la reconstruction des données UI et des options d'affichage au prochain accès.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:747
function ui_vehicleSelector_general.clearCache() end

--- Réinitialise la sélection de véhicule en attente ou active et le chemin posé par setCurrentSelectorPath, pour qu'un nouvel instantané ne se reconstruise pas sur un ancien véhicule.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1491
function ui_vehicleSelector_general.clearDrilldownSelectorState() end

--- Supprime tous les verrous de filtres.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:933
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.clearLockedFilters(...) end

--- À appeler à la fermeture du sélecteur : réinitialise racine du fil d'Ariane, spawn-only, état du détail, filtres verrouillés, boutons, callback de sortie, puis émet le hook onVehicleSelectorClosed.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:832
function ui_vehicleSelector_general.closedFromUI() end

--- Renvoie puis remet à false l'indicateur « focaliser la recherche à l'ouverture » posé par openFromPause.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1377
---@return boolean  true si la recherche doit être focalisée.
function ui_vehicleSelector_general.consumeFocusSearchOnOpen() end

--- Construit la liste des filtres UI (types range ou set) à partir d'une liste de configs, selon la liste blanche de propriétés.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:937
---@param ... table Liste de configs (premier argument), transmise à createVehicleFilters.
---@return table[]  Données de filtres pour l'UI.
---@return table  Valeurs trouvées par propriété.
function ui_vehicleSelector_general.createFilters(...) end

--- Reconstruit l'instantané du sélecteur pour le chemin courant et l'envoie par 'vehicleSelectorDisplayDataSnapshot'.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2020
---@param requestId any|nil Identifiant renvoyé dans le payload.
---@return boolean  false si la reconstruction a échoué.
function ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId) end

--- Crée un faux profileur dont start, add et finish ne font rien.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:588
---@return table  Objet {start, add, finish}.
function ui_vehicleSelector_general.emptyProfiler() end

--- Délègue à detailsInteraction.executeButton.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:972
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.executeButton(...) end

--- Délègue à detailsInteraction.executeDoubleClick.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:973
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.executeDoubleClick(...) end

--- Délègue au module de filtres : renvoie les filtres actifs.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:850
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.getActiveFilters(...) end

--- Lit et met en cache settings/default.pc (véhicule par défaut hérité).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:766
---@return table|nil  Contenu du fichier, ou nil s'il est absent ou illisible.
function ui_vehicleSelector_general.getDefaultVehicleInfo() end

--- Construit la tuile du « Legacy default.pc » pour la grille, à partir du modèle indiqué par settings/default.pc.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:780
---@return table|nil  Tuile, ou nil si fichier ou modèle introuvable.
function ui_vehicleSelector_general.getDefaultVehicleTile() end

--- Délègue à detailsInteraction.getDetails : détails et boutons d'un élément.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:970
---@param ... any itemDetails.
function ui_vehicleSelector_general.getDetails(...) end

--- Renvoie les options d'affichage effectives. En contexte freeroam, showRecentMode prend la valeur de showRecentModeFreeroamSelector.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:860
---@param ... any
---@return table  Table des options d'affichage (groupMode, sortMode, clusterMode, expandGroups, displaySize, ...).
function ui_vehicleSelector_general.getDisplayData(...) end

--- Renvoie la liste des options d'affichage proposées à l'UI, en masquant showRecentMode ou showRecentModeFreeroamSelector selon le contexte.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:863
---@param ... any
---@return table[]  Définitions d'options (key, label, type, options...).
function ui_vehicleSelector_general.getDisplayDataOptions(...) end

--- Initialise les données UI si besoin puis renvoie les filtres (filterList, filterByProp, lockedFiltersByProp).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:849
---@param ... any Transmis à filterInstance.getFilters.
---@return table  Données de filtres.
function ui_vehicleSelector_general.getFilters(...) end

--- Délègue à detailsInteraction.getManagementDetails.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:971
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.getManagementDetails(...) end

--- Renvoie la liste des véhicules récents.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:955
---@return table[]  Liste de {model, config}.
function ui_vehicleSelector_general.getRecentVehicles() end

--- Calcule le titre d'en-tête et les segments du fil d'Ariane selon le chemin courant, les filtres actifs et la recherche. Les titres sont suffixés « (filtré) » si un filtre ou une recherche est actif, et remplacés par « Spawn Vehicle » en mode spawn-only.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:979
---@param path table|nil Chemin {keys = {...}} ; keys[1] vaut allModels, configsForModel ou configsForBrandSubModelOrModel.
---@return table  {title, isFiltered, pathSegments}.
function ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path) end

--- Renvoie le texte de recherche courant (module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:851
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.getSearchText(...) end

--- Délègue à ui_vehicleSelector_tiles.getTiles.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:859
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.getTiles(...) end

--- Renvoie les données UI du sélecteur (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), en les recalculant si nécessaire.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:818
---@return table  Données UI.
function ui_vehicleSelector_general.getUiData() end

--- Renvoie les filtres valides préparés (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:936
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.getValidFilters(...) end

--- Délègue à detailsInteraction.goToMod : ouvre la page du mod.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:969
---@param ... any modId.
function ui_vehicleSelector_general.goToMod(...) end

--- Indique si le couple modèle/config est en favori.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:940
---@param model string Clé du modèle.
---@param config string Clé de la config.
---@return boolean  true si favori.
function ui_vehicleSelector_general.isFavourite(model, config) end

--- Indique si un filtre est verrouillé.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:930
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.isFilterLocked(...) end

--- Vrai si la route UI courante est l'un des écrans du sélecteur de véhicules du freeroam ou de l'assistant freeroam (freeroamLevels.vehicles, freeroamWizard.vehicles et variantes menu./pause.).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:632
---@return boolean  true en contexte freeroam.
function ui_vehicleSelector_general.isFreeroamVehicleSelectorContext() end

--- Indique si le sélecteur a été ouvert depuis le garage.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1098
---@return boolean  true depuis le garage.
function ui_vehicleSelector_general.isOpenedFromGarage() end

--- Indique si le couple modèle/config figure parmi les véhicules récents.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:945
---@param model string Clé du modèle.
---@param config string Clé de la config.
---@return boolean  true si récent.
function ui_vehicleSelector_general.isRecentVehicle(model, config) end

--- Indique si le mode spawn-only est actif.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:46
---@return boolean  État du mode.
function ui_vehicleSelector_general.isSpawnOnly() end

--- Verrouille un filtre pour que l'utilisateur ne puisse pas le modifier (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:928
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.lockFilter(...) end

--- Verrouille un filtre en mode inclusion (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:931
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.lockFilterMode(...) end

--- Verrouille un filtre en mode exclusif avec la liste de valeurs autorisées (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:932
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.lockFilterModeExclusive(...) end

--- Passe de la grille à la page détail d'un véhicule : mémorise la sélection (chemin, titre, modèle, config) et navigue vers la route enfant correspondant à la route racine courante (pause ou garage).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1843
---@param tile table Tuile cliquée (config ou cluster).
---@param options table|nil Transmis à ui_router.navigate (par ex. {preferredScope = 'auxillary'}).
function ui_vehicleSelector_general.navigateToVehicle(tile, options) end

--- Hook : la langue change ; force le rechargement (libellés traduits).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:751
function ui_vehicleSelector_general.onLanguageChanged() end

--- Hook : un mod est activé ; force le rechargement des données du sélecteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:735
function ui_vehicleSelector_general.onModActivated() end

--- Hook : un mod est désactivé ; force le rechargement des données du sélecteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:731
function ui_vehicleSelector_general.onModDeactivated() end

--- Hook : le gestionnaire de mods est prêt ; force le rechargement des données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:739
function ui_vehicleSelector_general.onModManagerReady() end

--- Hook : l'état du gestionnaire de mods a changé ; force le rechargement des données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:743
function ui_vehicleSelector_general.onModManagerStateChanged() end

--- Hook de route : entrée dans un écran racine du sélecteur (pause, garage) ; efface l'état de détail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1936
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data) end

--- Hook de route : sortie d'un écran racine ; remet spawn-only à false hors de la famille, et si ouvert depuis le garage efface verrous et filtres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1972
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data) end

--- Hook de route : montage d'un écran racine ; lance le chargement asynchrone puis l'émission de l'instantané pour le chemin de la route (par défaut allModels).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1941
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data) end

--- Hook de route : entrée dans la page détail d'un véhicule. Promeut la sélection en attente en sélection active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1904
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data) end

--- Hook de route : sortie de la page détail ; remet spawn-only à false si la destination est hors de la famille du sélecteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1967
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data) end

--- Hook de route : montage de la page détail ; lance le chargement asynchrone puis l'émission de l'instantané du chemin de la sélection active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1915
---@param context any Contexte de cycle de vie.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de route.
function ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data) end

--- Hook de surveillance de fichiers : oublie le cache de settings/default.pc quand ce fichier change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:759
---@param filename string Fichier modifié.
---@param type string Type de changement.
function ui_vehicleSelector_general.onfilechanged(filename, type) end

--- Ouvre le sélecteur depuis le menu pause. Refusé (renvoie false) si une session de première conduite active n'autorise pas vehicleManagement.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1345
---@param routeName string|nil Route à ouvrir, par défaut 'pause.vehicleSelector'.
---@param options table|nil options.spawnOnly (booléen) et options.focusSearch (focalise la recherche à l'ouverture).
---@return boolean  false si refusé, sinon true.
function ui_vehicleSelector_general.openFromPause(routeName, options) end

--- Ouvre le sélecteur pour choisir un véhicule adverse. Sauf options.unrestricted, props et remorques sont exclus par un verrou sur le filtre Type. Le callback reçoit (model, config, additionalData) à la sélection, et aucun argument à la sortie.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1258
---@param callback function|nil Fonction appelée avec la sélection ou sans argument si on quitte.
---@param routeName string|nil Route UI à ouvrir, par défaut 'mission.control.vehicleSelector'.
---@param options table|nil options.unrestricted = true pour effacer tous les filtres.
function ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options) end

--- Ouvre le sélecteur plein écran du menu (route 'menu.vehiclesnew') avec boutons de gestion et boutons freeroam, puis émet onVehicleSelectorOpen.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1103
function ui_vehicleSelector_general.openVehicleSelectorForFreeroam() end

--- Ouvre le sélecteur pour le configurateur freeroam (route 'menu.vehiclesnew'). Le callback reçoit (model, config, additionalData) et le véhicule est enregistré comme récent.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1315
---@param callback function Appelée avec la sélection.
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback) end

--- Ouvre le sélecteur en mode « modal » : un bouton « Select Vehicle » (et la sortie) renvoient vers 'menu.freeroamselector'. Boutons de gestion désactivés.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1228
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal() end

--- Comme openVehicleSelectorForFreeroam, mais filtre la source sur un mod donné.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1119
---@param modId string Identifiant du mod (via getModById).
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId) end

--- Ouvre le sélecteur depuis le garage (routes 'garage.mycars' ou 'garage.vehicles'). Un bouton « Charger » remplace le véhicule actuel (ou entre dans un véhicule d'inventaire de carrière), enregistre le récent, puis revient au garage. Verrouille la source (Custom, Mod, Career ou BeamNG - Official).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1137
---@param showOwnedOnly boolean|nil true pour n'afficher que les véhicules possédés (Custom, Mod, Career).
function ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly) end

--- Indique si un élément passe les filtres et la recherche (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:938
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.passesFilters(...) end

--- Termine ou marque une étape du profileur M.p. Sans effet avec le faux profileur par défaut.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1087
---@param tag string|nil Étiquette de l'étape ; vide ou 'undefined' = fin.
function ui_vehicleSelector_general.profilerFinish(tag) end

--- Calcule les détails d'une tuile (via getDetails) et les envoie à l'UI par 'vehicleSelectorDetails'. Les tuiles de cluster sans showDetails sont ignorées (avertissement loggé).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1647
---@param item table Tuile avec showDetails = {model, config}, ou directement {model, config}.
---@param requestId any|nil Identifiant de requête renvoyé dans le payload.
---@return table|nil  Payload {backendName, requestId, item, details}, ou nil.
function ui_vehicleSelector_general.requestDetails(item, requestId) end

--- Remet les options d'affichage à leurs valeurs par défaut.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:874
---@param requestId any|nil Identifiant pour l'instantané de retour.
---@return table  Options d'affichage après remise à zéro.
function ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId) end

--- Remet un filtre de plage à ses bornes complètes ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:911
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant pour l'instantané de retour.
function ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId) end

--- Remet un filtre de type ensemble à son état par défaut ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:918
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant pour l'instantané de retour.
function ui_vehicleSelector_general.resetSetFilter(filterKey, requestId) end

--- Renvoie le chemin courant : chemin posé par setCurrentSelectorPath, sinon celui de la sélection active, sinon {keys = {'allModels'}}.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2004
---@return table  {keys = string[]}.
function ui_vehicleSelector_general.resolveCurrentSelectorPath() end

--- Renvoie le titre du véhicule sélectionné (sélection active) pour le titre dynamique de la route, sinon le titre passé en paramètre.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2036
---@param paramTitle string|nil Titre de repli.
---@return string|nil  Titre trouvé.
function ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle) end

--- Enregistre un chemin de sélecteur choisi par un assistant, utilisé par emitDisplayDataSnapshot. nil l'efface ; accepte {keys = {...}} ou une liste directe.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1982
---@param path table|nil Chemin.
function ui_vehicleSelector_general.setCurrentSelectorPath(path) end

--- Délègue à detailsInteraction.setCustomDetailsButtons.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:976
---@param ... any Liste de boutons personnalisés.
function ui_vehicleSelector_general.setCustomDetailsButtons(...) end

--- Délègue à detailsInteraction.setDetailsButtonForFreeroam.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:975
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.setDetailsButtonForFreeroam(...) end

--- Modifie une option d'affichage (persistée si save=true) ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:866
---@param key string Clé de l'option.
---@param value any Nouvelle valeur.
---@param requestId any|nil Identifiant de requête UI pour l'instantané de retour.
---@return table  Options d'affichage après modification.
function ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId) end

--- Délègue à detailsInteraction.setManagementButtonsEnabled.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:974
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.setManagementButtonsEnabled(...) end

--- Définit le texte de recherche ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:852
---@param text string Texte recherché.
---@param requestId any|nil Identifiant pour l'instantané de retour.
function ui_vehicleSelector_general.setSearchText(text, requestId) end

--- Active le mode « faire apparaître seulement » ; toute valeur autre que true le désactive.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:41
---@param value boolean|nil true pour activer.
function ui_vehicleSelector_general.setSpawnOnly(value) end

--- Définit une restriction dure de type de véhicule appliquée en plus des filtres : 'lightRunner', 'busRoute' ou nil (aucune).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:35
---@param restrictionMode string|nil 'lightRunner', 'busRoute' ou nil.
function ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode) end

--- Prépare la liste des filtres valides pour un passage de filtrage (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:935
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.setupValidFilters(...) end

--- Ajoute ou retire un véhicule des favoris (clé 'modèle/config'). Pour settings/default.pc, bascule plutôt l'option includeDefaultConfigInFavourites.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:882
---@param itemDetails table Table avec les champs model et config.
---@return boolean  true si l'élément est maintenant favori.
function ui_vehicleSelector_general.toggleFavourite(itemDetails) end

--- Active ou désactive une valeur d'un filtre de type ensemble ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:897
---@param filterKey string Nom du filtre.
---@param value any Valeur à basculer.
---@param requestId any|nil Identifiant pour l'instantané de retour.
function ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId) end

--- Enregistre le couple modèle/config comme véhicule récent.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:950
---@param model string Clé du modèle.
---@param config string Clé de la config.
function ui_vehicleSelector_general.trackRecentVehicle(model, config) end

--- Déverrouille un filtre (délègue au module de filtres).
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:929
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.unlockFilter(...) end

--- Délègue à filterInstance.updateFilters.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:896
---@param ... any Transmis tels quels.
function ui_vehicleSelector_general.updateFilters(...) end

--- Définit les bornes d'un filtre de plage ; émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:904
---@param filterKey string Nom du filtre.
---@param min number Borne basse.
---@param max number Borne haute.
---@param requestId any|nil Identifiant pour l'instantané de retour.
function ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

