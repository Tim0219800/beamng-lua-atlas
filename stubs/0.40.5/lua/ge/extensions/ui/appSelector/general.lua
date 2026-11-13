---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend (`backendName = "appSelector"`) du sélecteur d'apps de l'interface, branché sur le composant générique GridSelector. Il liste les apps connues de `ui_apps.getUIAppsData()` sous forme de tuiles groupées par catégorie (Dashboard, Telemetry, General, Gameplay, Debug, puis les autres par ordre alphabétique), gère la recherche, le filtre par type, les options d'affichage (taille, contenu auxiliaire, enregistrées dans `/settings/appSelectorData.json`) et la fiche de détails avec le bouton « Ajouter au layout ». Utile pour comprendre comment l'écran d'édition des apps est alimenté ; peu utile directement à un moddeur.
--- Accès : extension `ui_appSelector_general` : `extensions.load("ui_appSelector_general")`, puis la globale `ui_appSelector_general`
---@class ui_appSelector_general
---@field backendName string Nom du backend : "appSelector".
---@field dependencies table<integer, string> Extensions chargées avant : `{'ui_apps'}`.
ui_appSelector_general = {}

--- Efface tous les filtres.
---Source : lua/ge/extensions/ui/appSelector/general.lua:487
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.clearAllFilters(requestId) end

--- Fonction vide, présente pour l'API de GridSelector.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:756
function ui_appSelector_general.closedFromUI() end

--- Reconstruit l'instantané complet (tuiles, filtres, options, en-tête) et l'envoie à l'UI par `appSelectorDisplayDataSnapshot`.
---Source : lua/ge/extensions/ui/appSelector/general.lua:736
---@param requestId any Identifiant de requête côté UI.
---@return boolean  true si envoyé, false si la construction a échoué (erreur loggée).
function ui_appSelector_general.emitDisplayDataSnapshot(requestId) end

--- Exécute le callback d'un bouton de la fiche via le module de boutons.
---Source : lua/ge/extensions/ui/appSelector/general.lua:665
---@param buttonId any Identifiant du bouton.
---@param data any Données transmises au callback.
---@return any  Retour du callback.
function ui_appSelector_general.executeButton(buttonId, data) end

--- Sur double-clic d'une tuile, exécute le bouton « Ajouter au layout » de l'app.
---Source : lua/ge/extensions/ui/appSelector/general.lua:690
---@param details table Table contenant `appName`.
function ui_appSelector_general.executeDoubleClick(details) end

--- Sans effet : écrit seulement un message dans le log.
---Source : lua/ge/extensions/ui/appSelector/general.lua:680
---@param path any Chemin (loggé).
function ui_appSelector_general.exploreFolder(path) end

--- Renvoie les filtres actuellement actifs.
---Source : lua/ge/extensions/ui/appSelector/general.lua:446
---@return table  Filtres actifs.
function ui_appSelector_general.getActiveFilters() end

--- Renvoie les données du sélecteur (apps, instance de filtres, liste de filtres, options d'affichage), en les (ré)initialisant si nécessaire.
---Source : lua/ge/extensions/ui/appSelector/general.lua:287
---@return table  Table avec `apps`, `filterInstance`, `filterList`, `activeFilters`, `lockedFiltersByProp`, `displayData`.
function ui_appSelector_general.getAppData() end

--- Construit la fiche d'une app : titre, aperçu, description, spécifications (interactivité, version, types, dossier hors build shipping) et bouton « Ajouter au layout ». Renvoie un titre de secours si l'app est inconnue.
---Source : lua/ge/extensions/ui/appSelector/general.lua:565
---@param details table Table contenant `appName`.
---@return table  `{headerTitle, preview, description, specifications, buttonInfo, appName}`.
function ui_appSelector_general.getDetails(details) end

--- Renvoie les options d'affichage (taille des tuiles : list/tiny/small/medium/large/huge ; inclusion du contenu auxiliaire).
---Source : lua/ge/extensions/ui/appSelector/general.lua:496
---@return table  Options d'affichage.
function ui_appSelector_general.getDisplayDataOptions() end

--- Renvoie les filtres disponibles (filtre de type « set » sur les types d'apps).
---Source : lua/ge/extensions/ui/appSelector/general.lua:441
---@return table  Filtres du module de filtres.
function ui_appSelector_general.getFilters() end

--- Fonction facultative de l'API GridSelector : renvoie toujours `{buttons = {}}`.
---Source : lua/ge/extensions/ui/appSelector/general.lua:671
---@return table  `{buttons = {}}`.
function ui_appSelector_general.getManagementDetails() end

--- Construit le titre et le fil d'Ariane de l'écran (Menu, Édition des apps, Apps, puis « Filtré »/« Recherche : … » si besoin).
---Source : lua/ge/extensions/ui/appSelector/general.lua:530
---@param path table Chemin courant (non utilisé).
---@return table  `{title, pathSegments, isFiltered}`.
function ui_appSelector_general.getScreenHeaderTitleAndPath(path) end

--- Renvoie le texte de recherche courant.
---Source : lua/ge/extensions/ui/appSelector/general.lua:516
---@return string|nil  Texte de recherche.
function ui_appSelector_general.getSearchText() end

--- Construit les groupes de tuiles d'apps (filtrés, triés : non auxiliaires d'abord puis par nom, groupés par catégorie).
---Source : lua/ge/extensions/ui/appSelector/general.lua:354
---@param path table Chemin de navigation (non utilisé pour le contenu).
---@return table<integer, table>  Liste de `{label, tiles}`.
function ui_appSelector_general.getTiles(path) end

--- Sans effet : écrit seulement un message dans le log.
---Source : lua/ge/extensions/ui/appSelector/general.lua:685
---@param modId any Id du mod (loggé).
function ui_appSelector_general.goToMod(modId) end

--- Hook appelé quand un mod est activé : force le rechargement des données au prochain accès.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:301
function ui_appSelector_general.onModActivated() end

--- Hook appelé quand un mod est désactivé : force le rechargement des données au prochain accès.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:300
function ui_appSelector_general.onModDeactivated() end

--- Hook appelé quand le gestionnaire de mods est prêt : force le rechargement des données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:302
function ui_appSelector_general.onModManagerReady() end

--- Hook appelé par le routeur UI au montage de la route : attache à `data.appSelector` un instantané du sélecteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:751
---@param context any Contexte de la route (non utilisé).
---@param toRoute any Route d'arrivée (non utilisé).
---@param fromRoute any Route de départ (non utilisé).
---@param data table Données de route auxquelles l'instantané est ajouté.
function ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data) end

--- Fonction vide, présente pour l'API de GridSelector.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appSelector/general.lua:755
function ui_appSelector_general.profilerFinish() end

--- Calcule la fiche d'une app et l'envoie à l'UI par le hook `appSelectorDetails`.
---Source : lua/ge/extensions/ui/appSelector/general.lua:653
---@param item table Élément sélectionné (avec `appName`).
---@param requestId any Identifiant de requête côté UI.
---@return table  Charge envoyée : `{backendName, requestId, item, details}`.
function ui_appSelector_general.requestDetails(item, requestId) end

--- Remet les options d'affichage à leurs valeurs par défaut.
---Source : lua/ge/extensions/ui/appSelector/general.lua:508
---@param requestId any|nil Identifiant de requête côté UI.
---@return table  Données d'affichage à jour.
function ui_appSelector_general.resetDisplayDataToDefaults(requestId) end

--- Réinitialise un filtre par intervalle.
---Source : lua/ge/extensions/ui/appSelector/general.lua:469
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.resetRangeFilter(filterKey, requestId) end

--- Réinitialise un filtre de type « set ».
---Source : lua/ge/extensions/ui/appSelector/general.lua:478
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.resetSetFilter(filterKey, requestId) end

--- Renvoie le chemin par défaut du sélecteur : `{keys = {"allApps"}}`.
---Source : lua/ge/extensions/ui/appSelector/general.lua:732
---@return table  Chemin normalisé.
function ui_appSelector_general.resolveCurrentSelectorPath() end

--- Modifie une option d'affichage et la sauvegarde.
---Source : lua/ge/extensions/ui/appSelector/general.lua:500
---@param key string Clé de l'option (displaySize, includeAuxContent).
---@param value any Nouvelle valeur.
---@param requestId any|nil Identifiant de requête côté UI.
---@return table  Données d'affichage à jour.
function ui_appSelector_general.setDisplayDataOption(key, value, requestId) end

--- Définit le texte de recherche (comparé en minuscules au nom, au nom d'app et à la description traduits).
---Source : lua/ge/extensions/ui/appSelector/general.lua:521
---@param val string Texte recherché.
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.setSearchText(val, requestId) end

--- Sans effet : les apps n'ont pas de favoris. Renvoie false.
---Source : lua/ge/extensions/ui/appSelector/general.lua:675
---@param itemDetails table Non utilisé.
---@return boolean  Toujours false.
function ui_appSelector_general.toggleFavourite(itemDetails) end

--- Active ou désactive une valeur d'un filtre. Si `requestId` est fourni, renvoie aussi un instantané à l'UI.
---Source : lua/ge/extensions/ui/appSelector/general.lua:451
---@param filterKey string Nom du filtre (par exemple "Type").
---@param value any Valeur à basculer.
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.toggleFilter(filterKey, value, requestId) end

--- Met à jour un filtre par intervalle (non utilisé par les filtres actuels, qui sont tous de type « set »).
---Source : lua/ge/extensions/ui/appSelector/general.lua:460
---@param filterKey string Nom du filtre.
---@param min number Minimum.
---@param max number Maximum.
---@param requestId any|nil Identifiant de requête côté UI.
---@return any  Résultat du module de filtres.
function ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

