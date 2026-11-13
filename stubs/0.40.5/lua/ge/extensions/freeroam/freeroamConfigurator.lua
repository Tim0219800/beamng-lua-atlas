---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/freeroamConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configurateur de la partie freeroam (assistant « Wizard » de l'UI) : mémorise le niveau, le point de départ, le véhicule (modèle, config, peintures) et les options de partie (heure, date, trafic…) ; les persiste dans `settings/freeroamConfigurator.json` ; fournit à l'UI les tuiles de sélection (point de départ, véhicule), les boutons de démarrage et les données des routes du wizard (recherche/filtres par étape, instantanés de sélecteur, chargements asynchrones) ; puis lance la partie via freeroam_freeroam.startFreeroamByName. Les options viennent d'autres extensions via le hook onFreeroamConfiguratorGetOptions : toutes les extensions `lua/ge/extensions/freeroam/configuratorOptions/*.lua` (nom `freeroam_configuratorOptions_<fichier>`) sont ajoutées aux dépendances. Global : freeroam_freeroamConfigurator.
--- Accès : extension `freeroam_freeroamConfigurator` : `extensions.load("freeroam_freeroamConfigurator")`, puis la globale `freeroam_freeroamConfigurator`
---@class freeroam_freeroamConfigurator
---@field dependencies string[] Noms d'extensions freeroam_configuratorOptions_* découverts dynamiquement dans lua/ge/extensions/freeroam/configuratorOptions/.
freeroam_freeroamConfigurator = {}

--- Hook appelé quand le chargeur asynchrone des niveaux a fini : émet l'instantané FreeroamSelectorDataLoaded('level') si la route en attente est toujours courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1572
function freeroam_freeroamConfigurator.asyncLevelLoadComplete() end

--- Idem pour les véhicules (appelé depuis util_asyncBulkLoader.loadVehicles via extensions.hook).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1592
function freeroam_freeroamConfigurator.asyncVehicleLoadComplete() end

--- Efface les filtres d'une étape.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:796
---@param step string Étape.
---@return boolean  Succès.
function freeroam_freeroamConfigurator.clearWizardFiltersForStep(step) end

--- Vide la recherche de l'étape.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:766
---@param step string Étape.
---@return boolean  Succès.
function freeroam_freeroamConfigurator.clearWizardSearchForStep(step) end

--- Gestionnaire de double-clic : fait seulement dump(item).
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:735
---@param item any Élément cliqué.
function freeroam_freeroamConfigurator.doubleClickOverride(item) end

--- Construit le bouton de démarrage (« Start freeroam », priorité 1), laisse les extensions le surcharger (onFreeroamConfiguratorOverrideStartButton) et renvoie celui de plus haute priorité.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:703
---@return table|nil  Infos du bouton.
function freeroam_freeroamConfigurator.getButtons() end

--- Renvoie à l'UI la configuration : options (groupes collectés par le hook onFreeroamConfiguratorGetOptions, triés par `order`, valeurs remplies depuis la configuration courante ou leur valeur par défaut), currentSpawnPoint (tuile) et currentVehicle (tuile). Charge le fichier de configuration au premier appel.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:659
---@return table  {options, currentSpawnPoint, currentVehicle}
function freeroam_freeroamConfigurator.getConfiguration() end

--- Tuile « récent » de la sélection courante pour l'étape donnée.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:579
---@param step string 'level' ou 'vehicle'.
---@return table|nil  Tuile.
function freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step) end

--- Tuile du point de départ courant. Si ses fichiers n'existent plus ou si la tuile manque, recharge ou retombe sur le niveau/point par défaut.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1763
---@return table|nil  Tuile.
function freeroam_freeroamConfigurator.getCurrentSpawnPointTile() end

--- Véhicule courant de la configuration.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1893
---@return table  {model, config, additionalData}
function freeroam_freeroamConfigurator.getCurrentVehicle() end

--- Tuile du véhicule courant, avec repli sur le véhicule par défaut si invalide.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1820
---@return table|nil  Tuile.
function freeroam_freeroamConfigurator.getCurrentVehicleTile() end

--- Renvoie une copie des filtres mémorisés d'une étape.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:787
---@param step string Étape.
---@return table|nil  Filtres.
function freeroam_freeroamConfigurator.getWizardFiltersForStep(step) end

--- Lit le texte de recherche mémorisé.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:757
---@param step string Étape.
---@return string|nil  Texte, nil si étape non supportée.
function freeroam_freeroamConfigurator.getWizardSearchForStep(step) end

--- Indique si les détails correspondent à la sélection courante (level : levelName + spawnPointObjectName ; vehicle : model + config).
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:585
---@param step string 'level' ou 'vehicle'.
---@param details table Détails de la tuile.
---@return boolean  Vrai si identique.
function freeroam_freeroamConfigurator.isCurrentSelection(step, details) end

--- Après rechargement Lua : restaure la configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1927
---@param data table Table renvoyée par onSerialize.
function freeroam_freeroamConfigurator.onDeserialized(data) end

--- Hook de changement de langue : efface les tuiles en cache (elles contiennent des textes traduits).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1913
function freeroam_freeroamConfigurator.onLanguageChanged() end

--- Hook de fin de fondu de l'écran de chargement : si un démarrage a été lancé, navigue une seule fois vers l'écran « play ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1966
function freeroam_freeroamConfigurator.onLoadingScreenFadeout() end

--- Avant rechargement Lua : sauvegarde la configuration si modifiée et la renvoie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1920
---@return table  La configuration courante.
function freeroam_freeroamConfigurator.onSerialize() end

--- Clic sur la tuile de point de départ : ouvre le sélecteur de freeroam ; au choix, appelle setSpawnPoint et revient à menu.freeroamconfigurator.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1898
function freeroam_freeroamConfigurator.onSpawnPointTileClick() end

--- Clic sur la tuile de véhicule : ouvre le sélecteur de véhicule ; au choix, appelle setVehicle et revient à menu.freeroamconfigurator.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1906
function freeroam_freeroamConfigurator.onVehicleTileClick() end

--- Idem pour la route de détail d'un niveau (points de départ du niveau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1103
---@param context any Contexte.
---@param toRoute table Route cible.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data) end

--- Idem pour le détail d'un niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1685
---@param context any Contexte.
---@param toRoute table Route.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data) end

--- Hook d'entrée sur la route des niveaux du wizard : prépare les données de route (chemin de niveau par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1091
---@param context any Contexte du routeur.
---@param toRoute table Route cible.
---@param fromRoute table Route d'origine.
---@param data table Données de route à compléter.
function freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data) end

--- Hook de montage de la route des niveaux : prépare les données et attache ou diffère l'instantané du sélecteur (chargement asynchrone si la liste n'est pas chargée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1677
---@param context any Contexte.
---@param toRoute table Route.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data) end

--- Hook générique d'entrée sur une route du wizard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1119
---@param context any Contexte.
---@param toRoute table Route cible.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data) end

--- Idem pour la route de détail d'un véhicule (configs d'un modèle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1109
---@param context any Contexte.
---@param toRoute table Route cible.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data) end

--- Idem pour le détail d'un véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1701
---@param context any Contexte.
---@param toRoute table Route.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data) end

--- Idem pour la route des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1097
---@param context any Contexte.
---@param toRoute table Route cible.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data) end

--- Idem pour la liste des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1693
---@param context any Contexte.
---@param toRoute table Route.
---@param fromRoute table Route d'origine.
---@param data table Données.
function freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data) end

--- Titre du fil d'Ariane pour le niveau : d'abord le niveau de la route de détail (spawnPointsForLevel), sinon le niveau choisi (tuile ou nom).
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1171
---@param params table Paramètres de la route (params.path.keys).
---@return string|nil  Titre.
function freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params) end

--- Titre du fil d'Ariane pour le véhicule : modèle de la route (configsForModel / configsForBrandSubModelOrModel), sinon la tuile véhicule, sinon le nom dérivé du modèle choisi.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1191
---@param params table Paramètres de la route.
---@return string|nil  Titre.
function freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params) end

--- Choisit le niveau et le point de départ : résout un point de repli si besoin (resolveSpawnPointNameForLevel), met à jour la date d'environnement par défaut du niveau si elle n'avait pas été modifiée, charge et met en cache la tuile, marque la configuration modifiée et navigue vers routeName si fourni.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1715
---@param levelName string Nom du niveau.
---@param spawnPointName string|nil Nom de l'objet de départ ('undefined' ou nil = point par défaut).
---@param key string|nil Clé de tuile (non utilisée dans le corps).
---@param routeName string|nil Route UI vers laquelle naviguer.
function freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName) end

--- Choisit le véhicule : résout la config (repli sur une config existante du modèle), garde les additionalData existantes si c'est le même véhicule sans données, met en cache la tuile.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1868
---@param model string Clé du modèle.
---@param config string Clé de la config.
---@param additionalData table|nil Données (paint, paint2, paint3 : noms de peintures).
---@param key string|nil Non utilisé dans le corps.
function freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key) end

--- Mémorise les filtres d'une étape (charge normalisée).
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:776
---@param step string Étape.
---@param filtersPayload table Filtres.
---@return boolean  Succès.
function freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload) end

--- Mémorise le texte de recherche d'une étape (normalisé).
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:746
---@param step string 'level' ou 'vehicle'.
---@param searchText string Texte.
---@return boolean  false si étape non supportée.
function freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText) end

--- Démarre la partie : résout les peintures du véhicule, appelle freeroam_freeroam.startFreeroamByName(niveau, point de départ, nil, {modèle, options}), enregistre les récents (point de départ et véhicule) et vide les filtres du wizard.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1933
---@param configuration table Configuration complète {levelName, spawnPointName, vehicle={model, config, additionalData}, spawnPointTile…}.
function freeroam_freeroamConfigurator.startFreeroam(configuration) end

--- Exécute un bouton : sauvegarde la configuration si modifiée, notifie onFreeroamConfiguratorApplyOptions puis déclenche le bouton.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:725
---@param buttonId any Id du bouton (déduit du code : buttonModule.executeButton).
---@param ... any Arguments supplémentaires (non utilisés ici).
function freeroam_freeroamConfigurator.triggerButton(buttonId, ...) end

--- Enregistre la valeur d'une option de partie et marque la configuration comme modifiée.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:741
---@param key string Clé de l'option (ex. traffic_trafficMode).
---@param value any Valeur.
function freeroam_freeroamConfigurator.updateOption(key, value) end

--- Vérifie que des fichiers (motif nom.ext) ou dossiers existent (FS:fileExists / FS:directoryExists) ; vrai si la liste est nil.
---Source : lua/ge/extensions/freeroam/freeroamConfigurator.lua:1743
---@param validationFiles string[]|nil Chemins à valider.
---@return boolean  Vrai si tous existent.
function freeroam_freeroamConfigurator.validateFiles(validationFiles) end

