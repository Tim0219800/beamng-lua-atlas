---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/freeroamSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend « freeroamSelector » du sélecteur en grille (gridSelector) : l'écran où l'on choisit un niveau et un point d'apparition pour le mode libre. Il collecte les tuiles via le hook onGameplaySelectorGetTiles (en gardant celles dont validBackends contient freeroamSelector), gère filtres (source, taille de carte, région), recherche, favoris, récents et options d'affichage (sauvegardées dans /settings/freeroamSelectorData.json), construit les détails des tuiles via onGameplaySelectorGetDetails et renvoie des instantanés à l'interface par guihooks. Il connaît aussi les routes de l'assistant freeroam (niveau, véhicule, options, multijoueur) en menu et en pause.
--- Accès : extension `ui_freeroamSelector_general` : `extensions.load("ui_freeroamSelector_general")`, puis la globale `ui_freeroamSelector_general`
---@class ui_freeroamSelector_general
---@field backendName string Nom du backend : « freeroamSelector ».
---@field dependencies string[] Extensions chargées avant celle-ci : ui_gameplaySelector_tiles et core_locales.
ui_freeroamSelector_general = {}

--- Efface tous les filtres. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:446
---@param requestId any|nil Identifiant de requête de l'interface.
function ui_freeroamSelector_general.clearAllFilters(requestId) end

--- Appelé quand l'interface ferme le sélecteur : vide les boutons de détails personnalisés et le chemin racine personnalisé, puis émet le hook onFreeroamSelectorClosed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:643
function ui_freeroamSelector_general.closedFromUI() end

--- Reconstruit l'instantané de la vue courante (ui_gridSelector.getSelectorSnapshot, sous pcall) et l'envoie à l'interface par l'évènement freeroamSelectorDisplayDataSnapshot avec le requestId. Journalise une erreur et renvoie false en cas d'échec.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:733
---@param requestId any Identifiant de requête de l'interface.
---@return boolean  true si l'évènement a été envoyé.
function ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId) end

--- Exécute le bouton de détails d'identifiant donné via le buttonModule.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:758
---@param buttonId any Identifiant du bouton.
---@param additionalData any Données supplémentaires passées au callback.
---@return any  Résultat de buttonInstance.executeButton.
function ui_freeroamSelector_general.executeButton(buttonId, additionalData) end

--- Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:770
---@param item table Données showDetails de la tuile.
function ui_freeroamSelector_general.executeDoubleClick(item) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:767
function ui_freeroamSelector_general.exitCallback() end

--- Journalise seulement le chemin (non implémenté).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:783
---@param path string Chemin de dossier.
function ui_freeroamSelector_general.exploreFolder(path) end

--- Renvoie les filtres actifs.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:488
---@return table  Filtres actifs.
function ui_freeroamSelector_general.getActiveFilters() end

--- Renvoie les boutons de détails personnalisés (utilisé par levelTiles).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:754
---@return table  Liste de boutons, vide par défaut.
function ui_freeroamSelector_general.getCustomDetailsButtons() end

--- Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails (les générateurs de tuiles y ajoutent leur bloc) et renvoie le premier bloc.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:652
---@param item table Données showDetails de la tuile.
---@return table|nil  Bloc de détails, nil si aucun générateur n'a répondu.
function ui_freeroamSelector_general.getDetails(item) end

--- Renvoie les options d'affichage courantes (crée les instances si besoin).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:429
---@return table  Valeurs d'options par clé.
function ui_freeroamSelector_general.getDisplayData() end

--- Renvoie la définition des options d'affichage. Les instances doivent déjà exister.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:544
---@return table  Options d'affichage.
function ui_freeroamSelector_general.getDisplayDataOptions() end

--- Renvoie la définition des filtres (liste, filtres verrouillés) après avoir chargé les données.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:483
---@return table  Résultat de filterInstance.getFilters().
function ui_freeroamSelector_general.getFilters() end

--- Renvoie les données du sélecteur (tuiles filtrées par validBackends, filtres, options d'affichage), les recalcule si les mods, les réglages ou la langue ont changé, et les crée à la première demande.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:382
---@return table  Table items, filterList, activeFilters, lockedFiltersByProp, displayData.
function ui_freeroamSelector_general.getGameplayData() end

--- Renvoie toujours { buttons = {} } (TODO dans le code).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:762
---@return table  Table avec buttons vide.
function ui_freeroamSelector_general.getManagementDetails() end

--- Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur freeroam, éventuel segment de filtres ou recherche, niveau ou groupe courant). Utilise customRootPath s'il a été défini par openFreeroamSelectorForFreeroamConfigurator.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:566
---@param path table Chemin courant { keys = {...} }.
---@return table  Table title, isFiltered, pathSegments.
function ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path) end

--- Renvoie le texte de recherche courant.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:531
---@return string|nil  Texte saisi.
function ui_freeroamSelector_general.getSearchText() end

--- Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles. Efface le libellé du premier groupe s'il vaut « freeroam ».
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:403
---@param path table Chemin de navigation { keys = {...} }.
---@return table[]  Groupes de tuiles.
function ui_freeroamSelector_general.getTiles(path) end

--- Renvoie les données du sélecteur : items, displayData, filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:330
---@return table  Table de données d'interface.
function ui_freeroamSelector_general.getUiData() end

--- Journalise seulement l'id du mod (non implémenté).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:788
---@param modId string Identifiant du mod.
function ui_freeroamSelector_general.goToMod(modId) end

--- Indique si une tuile est en favori.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:455
---@param itemKey string Clé de la tuile.
---@return boolean  true si favori.
function ui_freeroamSelector_general.isFavourite(itemKey) end

--- Indique si une tuile fait partie des éléments récents.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:469
---@param itemKey string Clé de la tuile.
---@return boolean  true si récente.
function ui_freeroamSelector_general.isRecent(itemKey) end

--- Hook appelé quand la langue change : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:400
function ui_freeroamSelector_general.onLanguageChanged() end

--- Hook appelé quand un mod est activé : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:396
function ui_freeroamSelector_general.onModActivated() end

--- Hook appelé quand un mod est désactivé : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:395
function ui_freeroamSelector_general.onModDeactivated() end

--- Hook appelé quand le gestionnaire de mods est prêt : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:397
function ui_freeroamSelector_general.onModManagerReady() end

--- Hook appelé quand l'état du gestionnaire de mods change : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:398
function ui_freeroamSelector_general.onModManagerStateChanged() end

--- Hook appelé quand les réglages changent : marque les données comme à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:399
function ui_freeroamSelector_general.onSettingsChanged() end

--- Efface les filtres, règle groupMode sur « system » et clusterMode sur « automatic », active le filtre système « freeroam » et navigue vers la route « menu.gameplay ».
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:794
function ui_freeroamSelector_general.openFreeroamSelector() end

--- Ouvre le sélecteur pour choisir un point d'apparition : installe un bouton « Select spawnpoint » dont le callback reçoit (levelName, spawnPointName), définit un fil d'Ariane propre, navigue vers « menu.freeroamselector » et émet le hook onFreeroamSelectorOpen.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:817
---@param callback function Fonction appelée avec levelName et spawnPointName lors du choix.
function ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback) end

--- Ouvre l'assistant freeroam depuis le menu pause, sur l'étape configurée dans le réglage freeroamSetupDefaultStep (level par défaut ; level, vehicle, options ou multiplayer), avec returnRoute = « pause ».
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:809
function ui_freeroamSelector_general.openFromPause() end

--- Indique si une tuile passe les filtres, la recherche et l'option showAuxContent ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:413
---@param item table Tuile testée.
---@return boolean  true si la tuile est affichée.
function ui_freeroamSelector_general.passesFilters(item) end

--- Ne fait rien (TODO dans le code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:639
function ui_freeroamSelector_general.profilerFinish() end

--- Construit les détails d'une tuile et les envoie à l'interface par l'évènement freeroamSelectorDetails, avec backendName, requestId, item et details.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:665
---@param item table Données showDetails de la tuile.
---@param requestId any Identifiant de requête de l'interface.
---@return table  Le payload envoyé.
function ui_freeroamSelector_general.requestDetails(item, requestId) end

--- Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:556
---@param requestId any|nil Identifiant de requête.
---@return table  Données d'affichage.
function ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId) end

--- Réinitialise un filtre de plage. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:515
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.resetRangeFilter.
function ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId) end

--- Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:523
---@param filterKey string Nom du filtre.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.resetSetFilter.
function ui_freeroamSelector_general.resetSetFilter(filterKey, requestId) end

--- Renvoie le chemin de la vue courante, ou le chemin racine par défaut { keys = {"allFreeroam"} } si aucun n'a été mémorisé.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:719
---@return table  Copie du chemin.
function ui_freeroamSelector_general.resolveCurrentSelectorPath() end

--- Mémorise le chemin de la vue visible, pour que emitDisplayDataSnapshot reconstruise l'instantané sur le bon chemin. Un chemin invalide est ignoré ; nil revient au chemin racine.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:705
---@param path table|nil Chemin { keys = {...} } (clés chaînes non vides).
function ui_freeroamSelector_general.setCurrentSelectorPath(path) end

--- Remplace les boutons de détails par une liste personnalisée (nil la vide). Chaque bouton a callback(levelName, spawnPointName, key) et meta (label, icon, primary, isDoubleClickAction, trackRecent).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:750
---@param buttons table|nil Liste de boutons.
function ui_freeroamSelector_general.setCustomDetailsButtons(buttons) end

--- Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni. Utilisé par exemple par levelTiles.setAlwaysShowDialogue.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:548
---@param key string Clé de l'option.
---@param value any Valeur.
---@param requestId any|nil Identifiant de requête.
---@return table  Données d'affichage.
function ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId) end

--- Définit le texte de recherche. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:535
---@param text string Texte de recherche.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.setSearchText.
function ui_freeroamSelector_general.setSearchText(text, requestId) end

--- Bascule le statut de favori d'une tuile et renvoie le nouvel état.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:461
---@param itemDetails table Table avec le champ key.
---@return boolean  Nouvel état de favori.
function ui_freeroamSelector_general.toggleFavourite(itemDetails) end

--- Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:499
---@param filterKey string Nom du filtre.
---@param value any Valeur de l'option.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.toggleFilter.
function ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId) end

--- Enregistre une tuile comme récemment utilisée.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:475
---@param itemKey string Clé de la tuile.
function ui_freeroamSelector_general.trackRecent(itemKey) end

--- Modifie une option d'affichage (displayDataInstance.setDisplayDataOption).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:435
---@param key string Clé de l'option.
---@param value any Nouvelle valeur.
function ui_freeroamSelector_general.updateDisplayData(key, value) end

--- Met à jour une donnée interne du module de filtres (filterInstance.updateData).
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:441
---@param key string Clé de donnée.
---@param value any Valeur.
function ui_freeroamSelector_general.updateFilterData(key, value) end

--- Applique directement une table complète filterByProp, par exemple pour restaurer l'état sauvegardé de l'assistant sans rejouer les clics. Les filtres verrouillés sont conservés.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:495
---@param newFilters table Forme filterByProp.
---@return any  Résultat de filterInstance.updateFilters.
function ui_freeroamSelector_general.updateFilters(newFilters) end

--- Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:507
---@param filterKey string Nom du filtre.
---@param min number Borne basse.
---@param max number Borne haute.
---@param requestId any|nil Identifiant de requête.
---@return any  Résultat de filterInstance.updateRangeFilter.
function ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

