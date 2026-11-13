---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend « gameplaySelector » du sélecteur en grille : l'écran qui liste missions, scénarios, campagnes, expériences de démarrage rapide et sélecteurs de rallye. Il collecte les tuiles par le hook onGameplaySelectorGetTiles (validBackends doit contenir gameplaySelector), gère filtres, recherche, favoris, récents et options d'affichage (sauvegardées dans /settings/gameplaySelectorData.json), construit les détails via onGameplaySelectorGetDetails et envoie à l'interface des instantanés (GameplaySelectorDataLoaded, gameplaySelectorDisplayDataSnapshot, gameplaySelectorDetails). Il applique aussi des préréglages selon la route (menu.gameplay, menu.rallySelector, menu.experiencesSelector) et gère la navigation vers les « clusters ».
--- Accès : extension `ui_gameplaySelector_general` : `extensions.load("ui_gameplaySelector_general")`, puis la globale `ui_gameplaySelector_general`
---@class ui_gameplaySelector_general
---@field backendName string Nom du backend : « gameplaySelector ».
---@field dependencies string[] Extensions chargées avant celle-ci : ui_gameplaySelector_tiles et core_locales.
ui_gameplaySelector_general = {}

--- Hook de fin du chargement asynchrone (util_asyncBulkLoader). Émet l'instantané GameplaySelectorDataLoaded de la route en attente, sauf si l'utilisateur a changé de route entre-temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1070
function ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete() end

--- Efface tous les filtres.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:641
function ui_gameplaySelector_general.clearAllFilters() end

--- Appelé quand l'interface ferme le sélecteur. Ne fait rien pour l'instant (TODO).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:821
function ui_gameplaySelector_general.closedFromUI() end

--- Reconstruit l'instantané de la vue courante (groupes, filtres, options d'affichage, détails de gestion, texte de recherche, en-tête) et l'envoie par l'évènement gameplaySelectorDisplayDataSnapshot avec le requestId. Renvoie false et journalise une erreur en cas d'échec.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1107
---@param requestId any Identifiant de requête de l'interface.
---@return boolean  true si l'évènement a été envoyé.
function ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId) end

--- Exécute le bouton de détails d'identifiant donné via le buttonModule.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:837
---@param buttonId any Identifiant du bouton.
---@param additionalData any Données supplémentaires passées au callback.
---@return any  Résultat de buttonInstance.executeButton.
function ui_gameplaySelector_general.executeButton(buttonId, additionalData) end

--- Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:850
---@param item table Données showDetails de la tuile.
function ui_gameplaySelector_general.executeDoubleClick(item) end

--- Ne fait rien (TODO).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:846
function ui_gameplaySelector_general.exitCallback() end

--- Journalise seulement le chemin (non implémenté).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:862
---@param path string Chemin de dossier.
function ui_gameplaySelector_general.exploreFolder(path) end

--- Renvoie les filtres actifs.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:676
---@return table  Filtres actifs.
function ui_gameplaySelector_general.getActiveFilters() end

--- Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails et renvoie le premier bloc.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:827
---@param item table Données showDetails de la tuile.
---@return table|nil  Bloc de détails, nil si aucun générateur n'a répondu.
function ui_gameplaySelector_general.getDetails(item) end

--- Renvoie les options d'affichage effectives, adaptées à la route (rallye ou expériences).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:626
---@param routeName string|nil Nom de la route.
---@return table  Valeurs d'options par clé.
function ui_gameplaySelector_general.getDisplayData(routeName) end

--- Renvoie la définition des options d'affichage adaptée à la route : masque groupMode et clusterMode en mode rallye ou expériences, et masque groupModeRally et clusterModeRally ailleurs.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:725
---@param routeName string|nil Nom de la route (par défaut la route active).
---@return table[]  Options visibles.
function ui_gameplaySelector_general.getDisplayDataOptions(routeName) end

--- Renvoie la définition des filtres après avoir chargé les données.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:671
---@return table  Résultat de filterInstance.getFilters().
function ui_gameplaySelector_general.getFilters() end

--- Renvoie les données du sélecteur (tuiles dont validBackends contient gameplaySelector, filtres, options d'affichage), les recalcule si les mods ou les réglages ont changé, et les crée à la première demande.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:487
---@return table  Table items, filterList, activeFilters, lockedFiltersByProp, displayData.
function ui_gameplaySelector_general.getGameplayData() end

--- Renvoie toujours { buttons = {} } (TODO dans le code).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:841
---@return table  Table avec buttons vide.
function ui_gameplaySelector_general.getManagementDetails() end

--- Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur de gameplay, segment de filtres ou recherche, cluster ou page découverte). Ajoute « (filtré) » au titre si des filtres ou une recherche sont actifs.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:746
---@param path table Chemin courant { keys = {...} }.
---@return table  Table title, isFiltered, pathSegments.
function ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path) end

--- Renvoie le texte de recherche courant.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:712
---@return string|nil  Texte saisi.
function ui_gameplaySelector_general.getSearchText() end

--- Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:510
---@param path table Chemin de navigation { keys = {...} }.
---@param routeName string|nil Nom de la route.
---@return table[]  Groupes de tuiles.
function ui_gameplaySelector_general.getTiles(path, routeName) end

--- Renvoie les données du sélecteur : items, displayData (adaptées à la route : rallye ou expériences), filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:440
---@param routeName string|nil Nom de la route, pour adapter groupMode et clusterMode.
---@return table  Table de données d'interface.
function ui_gameplaySelector_general.getUiData(routeName) end

--- Journalise seulement l'id du mod (non implémenté).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:867
---@param modId string Identifiant du mod.
function ui_gameplaySelector_general.goToMod(modId) end

--- Indique si une tuile est en favori.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:647
---@param itemKey string Clé de la tuile.
---@return boolean  true si favori.
function ui_gameplaySelector_general.isFavourite(itemKey) end

--- Indique si les données ont déjà été construites et sont à jour.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:498
---@return boolean|nil  Vrai si chargées et non invalidées (nil ou false sinon).
function ui_gameplaySelector_general.isGameplayDataLoaded() end

--- Indique si une tuile fait partie des éléments récents.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:659
---@param itemKey string Clé de la tuile.
---@return boolean  true si récente.
function ui_gameplaySelector_general.isRecent(itemKey) end

--- Prépare puis ouvre l'écran d'un cluster de tuiles. Calcule les clés du chemin (gotoPath, keys ou la table elle-même) et un titre, mémorise la sélection en attente et navigue vers menu.gameplay.type (ou menu.experiencesSelector.type depuis le sélecteur d'expériences).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:582
---@param input table Table de tuile ou de chemin : gotoPath, keys, ou liste de clés ; name, label ou title pour le titre.
---@return any  Résultat de ui_router.navigate.
function ui_gameplaySelector_general.navigateToCluster(input) end

--- Hook de route appelé à l'entrée dans une route de cluster. Promeut la sélection préparée par navigateToCluster, sinon retombe sur le cluster par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1130
---@param context any Contexte du routeur.
---@param toRoute table Route d'arrivée.
---@param fromRoute table|nil Route de départ.
---@param data table Données de route.
function ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data) end

--- Hook de route appelé au montage d'une route de cluster. Démarre le chargement asynchrone avec les clés et le titre du cluster actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1142
---@param context any Contexte du routeur.
---@param toRoute table Route d'arrivée (name utilisé).
---@param fromRoute table|nil Route de départ.
---@param data table Données de route.
function ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data) end

--- Hook appelé quand un mod est activé : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:504
function ui_gameplaySelector_general.onModActivated() end

--- Hook appelé quand un mod est désactivé : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:503
function ui_gameplaySelector_general.onModDeactivated() end

--- Hook appelé quand le gestionnaire de mods est prêt : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:505
function ui_gameplaySelector_general.onModManagerReady() end

--- Hook appelé quand l'état du gestionnaire de mods change : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:506
function ui_gameplaySelector_general.onModManagerStateChanged() end

--- Hook de route appelé au montage d'une route racine du sélecteur. Réinitialise la sélection de cluster, mémorise la route active et démarre le chargement asynchrone avec le chemin allGameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1122
---@param context any Contexte du routeur.
---@param toRoute table Route d'arrivée (name utilisé).
---@param fromRoute table|nil Route de départ.
---@param data table Données de route (non utilisées).
function ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook appelé quand les réglages changent : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:507
function ui_gameplaySelector_general.onSettingsChanged() end

--- Ouvre menu.experiencesSelector avec le filtre système quickStartExperiences.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1184
function ui_gameplaySelector_general.openExperiencesSelector() end

--- Applique le préréglage de la route menu.gameplay (efface filtres et recherche) puis y navigue.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1176
function ui_gameplaySelector_general.openGameplaySelector() end

--- Ouvre menu.rallySelector avec les filtres de type rallyStage et rallyLoop.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1180
function ui_gameplaySelector_general.openRallySelector() end

--- Indique si une tuile passe les filtres et la recherche ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:610
---@param item table Tuile testée.
---@return boolean  true si la tuile est affichée.
function ui_gameplaySelector_general.passesFilters(item) end

--- Ne fait rien (TODO dans le code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:817
function ui_gameplaySelector_general.profilerFinish() end

--- Construit les détails d'une tuile et les envoie à l'interface par l'évènement gameplaySelectorDetails avec backendName, requestId, item et details.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:596
---@param item table Données showDetails de la tuile.
---@param requestId any Identifiant de requête de l'interface.
---@return table  Le payload envoyé.
function ui_gameplaySelector_general.requestDetails(item, requestId) end

--- Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:737
---@param requestId any|nil Identifiant de requête.
---@return table  Données d'affichage.
function ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId) end

--- Réinitialise un filtre de plage. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:696
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.resetRangeFilter.
function ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId) end

--- Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:704
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.resetSetFilter.
function ui_gameplaySelector_general.resetSetFilter(filterKey, requestId) end

--- Renvoie le titre du cluster actif, sinon clusterTitle s'il est une chaîne non vide, sinon nil.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1158
---@param clusterTitle string|nil Titre de repli.
---@return string|nil  Titre résolu.
function ui_gameplaySelector_general.resolveClusterTitle(clusterTitle) end

--- Renvoie le chemin de la vue courante : celui du cluster actif, sinon le chemin racine { keys = {"allGameplay"} }.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1092
---@return table  Chemin { keys = {...} }.
function ui_gameplaySelector_general.resolveCurrentSelectorPath() end

--- Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:729
---@param key string Clé de l'option.
---@param value any Valeur.
---@param requestId any|nil Identifiant de requête.
---@return table  Données d'affichage.
function ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId) end

--- Définit le texte de recherche. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:716
---@param text string Texte de recherche.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.setSearchText.
function ui_gameplaySelector_general.setSearchText(text, requestId) end

--- Bascule le statut de favori d'une tuile et renvoie le nouvel état.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:652
---@param itemDetails table Table avec le champ key.
---@return boolean  Nouvel état de favori.
function ui_gameplaySelector_general.toggleFavourite(itemDetails) end

--- Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:680
---@param filterKey string Nom du filtre.
---@param value any Valeur de l'option.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.toggleFilter.
function ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId) end

--- Enregistre une tuile comme récemment utilisée.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:664
---@param itemKey string Clé de la tuile.
function ui_gameplaySelector_general.trackRecent(itemKey) end

--- Modifie une option d'affichage (displayDataInstance.setDisplayDataOption).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:631
---@param key string Clé de l'option.
---@param value any Nouvelle valeur.
function ui_gameplaySelector_general.updateDisplayData(key, value) end

--- Met à jour une donnée interne du module de filtres (filterInstance.updateData).
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:636
---@param key string Clé de donnée.
---@param value any Valeur.
function ui_gameplaySelector_general.updateFilterData(key, value) end

--- Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:688
---@param filterKey string Nom du filtre.
---@param min number Borne basse.
---@param max number Borne haute.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.updateRangeFilter.
function ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId) end

