---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade unique entre l'interface (UI Vue) et les sélecteurs en grille (véhicules, gameplay, apps, freeroam, course rapide, light runner, lignes de bus). Chaque appel reçoit le nom du backend en premier argument et est redirigé (dispatch) vers l'extension `ui_<nom>_general` correspondante. Le module normalise les chemins, les groupes de tuiles, les filtres, les données d'affichage, l'en-tête et les détails de gestion avant de les renvoyer à l'UI, et fournit des valeurs de repli pour les méthodes optionnelles absentes d'un backend.
--- Accès : extension `ui_gridSelector` : `extensions.load("ui_gridSelector")`, puis la globale `ui_gridSelector`
---@class ui_gridSelector
---@field BackendContract table Décrit le contrat attendu des backends : `requiredMethods` (liste de noms) et `optionalMethods` (liste de noms).
---@field dependencies table<integer, string> Extensions backend chargées avant ce module (les sept `ui_*Selector_general`).
ui_gridSelector = {}

--- Efface tous les filtres (optionnel, repli : false).
---Source : lua/ge/extensions/ui/gridSelector.lua:415
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return boolean|any  false si non implémenté.
function ui_gridSelector.clearAllFilters(backendName, ...) end

--- Notifie le backend que l'écran a été fermé depuis l'UI (optionnel, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:428
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.closedFromUI(backendName, ...) end

--- Exécute un bouton d'action du panneau de détails (optionnel, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:432
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.executeButton(backendName, ...) end

--- Exécute l'action de double-clic sur une tuile (optionnel, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:435
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.executeDoubleClick(backendName, ...) end

--- Appelle exitCallback du backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:434
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.exitCallback(backendName, ...) end

--- Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder).
---Source : lua/ge/extensions/ui/gridSelector.lua:495
---@param _backendName string Ignoré.
---@param path string Chemin du dossier.
function ui_gridSelector.exploreFolder(_backendName, path) end

--- Renvoie les filtres actifs du backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:410
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return any  Filtres actifs.
function ui_gridSelector.getActiveFilters(backendName, ...) end

--- Renvoie la table de l'extension backend associée au nom donné, ou nil si le nom est inconnu.
---Source : lua/ge/extensions/ui/gridSelector.lua:64
---@param backendName string vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector ou busRouteSelector
---@return table|nil  Le module backend (ex. ui_vehicleSelector_general).
function ui_gridSelector.getBackendByName(backendName) end

--- Renvoie les détails de l'élément sélectionné (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:430
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return any  Détails fournis par le backend.
function ui_gridSelector.getDetails(backendName, ...) end

--- Renvoie les options d'affichage (tri, regroupement, etc.) du backend (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:419
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return table  Options d'affichage.
function ui_gridSelector.getDisplayDataOptions(backendName, ...) end

--- Renvoie les filtres du backend (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:409
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return table  Données de filtres du backend.
function ui_gridSelector.getFilters(backendName, ...) end

--- Alias de getSelectorSnapshot.
---Source : lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName string Nom du backend.
---@param path table|nil Chemin.
---@return table  Instantané complet.
function ui_gridSelector.getInitialData(backendName, path) end

--- Renvoie les boutons/détails de gestion (optionnel, repli : { buttons = {} }).
---Source : lua/ge/extensions/ui/gridSelector.lua:433
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return table  { buttons = {...}, ... }.
function ui_gridSelector.getManagementDetails(backendName, ...) end

--- Renvoie le titre et les segments de chemin de l'en-tête d'écran pour le chemin donné (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:423
---@param backendName string Nom du backend.
---@param path table|nil Chemin à normaliser.
---@param ... any Arguments transmis.
---@return table  { title, pathSegments }.
function ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...) end

--- Renvoie le texte de recherche courant du backend (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:416
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return string  Texte de recherche.
function ui_gridSelector.getSearchText(backendName, ...) end

--- Alias de getSelectorSnapshotSlices.
---Source : lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName string Nom du backend.
---@param path table|nil Chemin.
---@param options table|nil Tranches.
---@return table  Voir getSelectorSnapshotSlices.
function ui_gridSelector.getSelectorRefresh(backendName, path, options) end

--- Renvoie un instantané complet (toutes les tranches) du sélecteur pour un chemin.
---Source : lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName string Nom du backend.
---@param path table|nil Chemin.
---@return table  Voir getSelectorSnapshotSlices. La tuile par défaut (forceAutoFocus ou isDefaultSelected) donne defaultFocusKey.
function ui_gridSelector.getSelectorSnapshot(backendName, path) end

--- Construit une charge utile contenant seulement les tranches demandées : tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. Si aucune tranche n'est activée, toutes le sont.
---Source : lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName string Nom du backend.
---@param path table|nil Chemin à normaliser.
---@param options table<string, boolean>|nil Tranches à inclure (clé = true).
---@return table  { backendName, path, groups?, defaultFocusKey?, filters?, displayData?, searchText?, managementDetails?, header? }.
function ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options) end

--- Demande les tuiles au backend pour un chemin et renvoie un tableau de groupes normalisé (groupes et tuiles non-tables ignorés, copie superficielle, clé générée si manquante).
---Source : lua/ge/extensions/ui/gridSelector.lua:399
---@param backendName string Nom du backend.
---@param path table|nil Chemin { keys = {...} } ou tableau de segments.
---@param ... any Arguments supplémentaires transmis au backend.
---@return table[]  Liste de groupes { tiles = {...}, ... }.
function ui_gridSelector.getTiles(backendName, path, ...) end

--- Navigue l'UI vers la page de détails d'un mod (route menu.mods.details).
---Source : lua/ge/extensions/ui/gridSelector.lua:499
---@param _backendName string Ignoré.
---@param modId string Identifiant du mod.
function ui_gridSelector.goToMod(_backendName, modId) end

--- Notifie le backend de la fin d'un profilage (optionnel, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:427
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.profilerFinish(backendName, ...) end

--- Demande au backend les tuiles d'un cluster (méthode optionnelle, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:404
---@param backendName string Nom du backend.
---@param path table|nil Chemin à normaliser.
---@param ... any Arguments transmis.
---@return any  Résultat du backend.
function ui_gridSelector.requestClusterTiles(backendName, path, ...) end

--- Demande au backend de préparer les détails d'un élément (optionnel, repli : nil).
---Source : lua/ge/extensions/ui/gridSelector.lua:431
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.requestDetails(backendName, ...) end

--- Remet les options d'affichage aux valeurs par défaut (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:421
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.resetDisplayDataToDefaults(backendName, ...) end

--- Réinitialise un filtre de plage côté backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:413
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.resetRangeFilter(backendName, ...) end

--- Réinitialise un filtre à ensemble de valeurs côté backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:414
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.resetSetFilter(backendName, ...) end

--- Modifie une option d'affichage du backend (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:420
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.setDisplayDataOption(backendName, ...) end

--- Définit le texte de recherche du backend (requis).
---Source : lua/ge/extensions/ui/gridSelector.lua:417
---@param backendName string Nom du backend.
---@param ... any Arguments transmis (texte).
function ui_gridSelector.setSearchText(backendName, ...) end

--- Bascule l'état favori d'un élément (optionnel, repli : false).
---Source : lua/ge/extensions/ui/gridSelector.lua:438
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
---@return boolean|any  false si non implémenté.
function ui_gridSelector.toggleFavourite(backendName, ...) end

--- Active ou désactive un filtre côté backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:411
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.toggleFilter(backendName, ...) end

--- Met à jour un filtre de plage côté backend (sans repli).
---Source : lua/ge/extensions/ui/gridSelector.lua:412
---@param backendName string Nom du backend.
---@param ... any Arguments transmis.
function ui_gridSelector.updateRangeFilter(backendName, ...) end

