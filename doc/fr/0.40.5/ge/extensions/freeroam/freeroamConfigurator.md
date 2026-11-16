# `freeroam_freeroamConfigurator`

*Fichier : `lua/ge/extensions/freeroam/freeroamConfigurator.lua` · VM : Game Engine (GE) · 1975 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_freeroamConfigurator` : `extensions.load("freeroam_freeroamConfigurator")`, puis la globale `freeroam_freeroamConfigurator`

Configurateur de la partie freeroam (assistant « Wizard » de l'UI) : mémorise le niveau, le point de départ, le véhicule (modèle, config, peintures) et les options de partie (heure, date, trafic…) ; les persiste dans `settings/freeroamConfigurator.json` ; fournit à l'UI les tuiles de sélection (point de départ, véhicule), les boutons de démarrage et les données des routes du wizard (recherche/filtres par étape, instantanés de sélecteur, chargements asynchrones) ; puis lance la partie via freeroam_freeroam.startFreeroamByName. Les options viennent d'autres extensions via le hook onFreeroamConfiguratorGetOptions : toutes les extensions `lua/ge/extensions/freeroam/configuratorOptions/*.lua` (nom `freeroam_configuratorOptions_<fichier>`) sont ajoutées aux dépendances. Global : freeroam_freeroamConfigurator.

## Exemple

```lua
-- depuis l'UI (ou un autre module) :
freeroam_freeroamConfigurator.setSpawnPoint('west_coast_usa', 'spawns_industrial')
freeroam_freeroamConfigurator.setVehicle('pickup', 'd15_4wd_A', {paint = 'Sea Blue'})
freeroam_freeroamConfigurator.updateOption('traffic_trafficMode', 'enabled')
freeroam_freeroamConfigurator.startFreeroam(configuration)
```

## Remarques

- Valeurs par défaut : niveau west_coast_usa, point de départ spawns_industrial ; véhicule pickup/d15_4wd_A (peinture Sea Blue) ou, si la licence est valide (extensions.license.isValid()), etk800/854_190d_A (Mineral Green) ; options par défaut environment_timeOfDay='default', environment_date (défaut du niveau via freeroam_configuratorOptions_freeroamOptions, sinon le 20/06/2026 midi), environment_timePlay='disabled', traffic_trafficMode='disabled'.
- Le fichier de configuration est versionné (version 1) : une version différente est ignorée. Les tuiles en cache ne sont rechargées que si la langue sauvegardée (_language) est la langue courante ; onLanguageChanged vide les tuiles. La configuration n'est écrite que si elle est « sale » (_dirty) : au triggerButton et à onSerialize.
- Hooks émis : onFreeroamConfiguratorGetOptions(level, options) (les extensions ajoutent des groupes d'options {key, order, options[]…}), onFreeroamConfiguratorApplyOptions(options) (avant démarrage) et onFreeroamConfiguratorOverrideStartButton(buttonModule, configuration) (pour remplacer/ajouter un bouton ; le bouton de plus haute priorité est renvoyé). Événement UI émis : FreeroamSelectorDataLoaded.
- Étapes du wizard : « level » (sélecteur freeroamSelector, chemin par défaut {keys={'allFreeroam'}}) et « vehicle » (sélecteur vehicleSelector, chemin par défaut {keys={'allModels'}}).
- startFreeroam passe `{model, options}` (options = config + peintures résolues depuis les paints du modèle) en 4e argument (spawnVehicle) de freeroam_freeroam.startFreeroamByName ; trackRecent est appelé pour les récents ; le passage à l'écran « play » se fait dans onLoadingScreenFadeout.
- doubleClickOverride ne fait que dump(item) (reste de debug).
- Fichier volumineux (près de 2000 lignes) : l'essentiel de la logique interne (résolution des points de départ/configs de repli, construction des tuiles et des instantanés du wizard, routes de détail) est local et non exporté ; seules les fonctions M.* sont documentées ici.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_freeroamConfigurator.asyncLevelLoadComplete()` | Hook appelé quand le chargeur asynchrone des niveaux a fini : émet l'instantané FreeroamSelectorDataLoaded('level') si la route en attente est toujours courante. *(interne)* | 1572 |
| `freeroam_freeroamConfigurator.asyncVehicleLoadComplete()` | Idem pour les véhicules (appelé depuis util_asyncBulkLoader.loadVehicles via extensions.hook). *(interne)* | 1592 |
| `freeroam_freeroamConfigurator.clearWizardFiltersForStep(step)` | Efface les filtres d'une étape. | 796 |
| `freeroam_freeroamConfigurator.clearWizardSearchForStep(step)` | Vide la recherche de l'étape. | 766 |
| `freeroam_freeroamConfigurator.doubleClickOverride(item)` | Gestionnaire de double-clic : fait seulement dump(item). | 735 |
| `freeroam_freeroamConfigurator.getButtons()` | Construit le bouton de démarrage (« Start freeroam », priorité 1), laisse les extensions le surcharger (onFreeroamConfiguratorOverrideStartButton) et renvoie celui de plus haute priorité. | 703 |
| `freeroam_freeroamConfigurator.getConfiguration()` | Renvoie à l'UI la configuration : options (groupes collectés par le hook onFreeroamConfiguratorGetOptions, triés par `order`, valeurs remplies depuis la configuration courante ou leur valeur par défaut), currentSpawnPoint (tuile) et currentVehicle (tuile). Charge le fichier de configuration au premier appel. | 659 |
| `freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step)` | Tuile « récent » de la sélection courante pour l'étape donnée. | 579 |
| `freeroam_freeroamConfigurator.getCurrentSpawnPointTile()` | Tuile du point de départ courant. Si ses fichiers n'existent plus ou si la tuile manque, recharge ou retombe sur le niveau/point par défaut. | 1763 |
| `freeroam_freeroamConfigurator.getCurrentVehicle()` | Véhicule courant de la configuration. | 1893 |
| `freeroam_freeroamConfigurator.getCurrentVehicleTile()` | Tuile du véhicule courant, avec repli sur le véhicule par défaut si invalide. | 1820 |
| `freeroam_freeroamConfigurator.getWizardFiltersForStep(step)` | Renvoie une copie des filtres mémorisés d'une étape. | 787 |
| `freeroam_freeroamConfigurator.getWizardSearchForStep(step)` | Lit le texte de recherche mémorisé. | 757 |
| `freeroam_freeroamConfigurator.isCurrentSelection(step, details)` | Indique si les détails correspondent à la sélection courante (level : levelName + spawnPointObjectName ; vehicle : model + config). | 585 |
| `freeroam_freeroamConfigurator.onDeserialized(data)` | Après rechargement Lua : restaure la configuration. *(interne)* *(hook)* | 1927 |
| `freeroam_freeroamConfigurator.onLanguageChanged()` | Hook de changement de langue : efface les tuiles en cache (elles contiennent des textes traduits). *(interne)* *(hook)* | 1913 |
| `freeroam_freeroamConfigurator.onLoadingScreenFadeout()` | Hook de fin de fondu de l'écran de chargement : si un démarrage a été lancé, navigue une seule fois vers l'écran « play ». *(interne)* *(hook)* | 1966 |
| `freeroam_freeroamConfigurator.onSerialize()` | Avant rechargement Lua : sauvegarde la configuration si modifiée et la renvoie. *(interne)* *(hook)* | 1920 |
| `freeroam_freeroamConfigurator.onSpawnPointTileClick()` | Clic sur la tuile de point de départ : ouvre le sélecteur de freeroam ; au choix, appelle setSpawnPoint et revient à menu.freeroamconfigurator. *(interne)* *(hook)* | 1898 |
| `freeroam_freeroamConfigurator.onVehicleTileClick()` | Clic sur la tuile de véhicule : ouvre le sélecteur de véhicule ; au choix, appelle setVehicle et revient à menu.freeroamconfigurator. *(interne)* *(hook)* | 1906 |
| `freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data)` | Idem pour la route de détail d'un niveau (points de départ du niveau). *(interne)* *(hook)* | 1103 |
| `freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data)` | Idem pour le détail d'un niveau. *(interne)* *(hook)* | 1685 |
| `freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data)` | Hook d'entrée sur la route des niveaux du wizard : prépare les données de route (chemin de niveau par défaut). *(interne)* *(hook)* | 1091 |
| `freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data)` | Hook de montage de la route des niveaux : prépare les données et attache ou diffère l'instantané du sélecteur (chargement asynchrone si la liste n'est pas chargée). *(interne)* *(hook)* | 1677 |
| `freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data)` | Hook générique d'entrée sur une route du wizard. *(interne)* *(hook)* | 1119 |
| `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data)` | Idem pour la route de détail d'un véhicule (configs d'un modèle). *(interne)* *(hook)* | 1109 |
| `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data)` | Idem pour le détail d'un véhicule. *(interne)* *(hook)* | 1701 |
| `freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data)` | Idem pour la route des véhicules. *(interne)* *(hook)* | 1097 |
| `freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data)` | Idem pour la liste des véhicules. *(interne)* *(hook)* | 1693 |
| `freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params)` | Titre du fil d'Ariane pour le niveau : d'abord le niveau de la route de détail (spawnPointsForLevel), sinon le niveau choisi (tuile ou nom). | 1171 |
| `freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params)` | Titre du fil d'Ariane pour le véhicule : modèle de la route (configsForModel / configsForBrandSubModelOrModel), sinon la tuile véhicule, sinon le nom dérivé du modèle choisi. | 1191 |
| `freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName)` | Choisit le niveau et le point de départ : résout un point de repli si besoin (resolveSpawnPointNameForLevel), met à jour la date d'environnement par défaut du niveau si elle n'avait pas été modifiée, charge et met en cache la tuile, marque la configuration modifiée et navigue vers routeName si fourni. | 1715 |
| `freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key)` | Choisit le véhicule : résout la config (repli sur une config existante du modèle), garde les additionalData existantes si c'est le même véhicule sans données, met en cache la tuile. | 1868 |
| `freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload)` | Mémorise les filtres d'une étape (charge normalisée). | 776 |
| `freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText)` | Mémorise le texte de recherche d'une étape (normalisé). | 746 |
| `freeroam_freeroamConfigurator.startFreeroam(configuration)` | Démarre la partie : résout les peintures du véhicule, appelle freeroam_freeroam.startFreeroamByName(niveau, point de départ, nil, {modèle, options}), enregistre les récents (point de départ et véhicule) et vide les filtres du wizard. | 1933 |
| `freeroam_freeroamConfigurator.triggerButton(buttonId, ...)` | Exécute un bouton : sauvegarde la configuration si modifiée, notifie onFreeroamConfiguratorApplyOptions puis déclenche le bouton. | 725 |
| `freeroam_freeroamConfigurator.updateOption(key, value)` | Enregistre la valeur d'une option de partie et marque la configuration comme modifiée. | 741 |
| `freeroam_freeroamConfigurator.validateFiles(validationFiles)` | Vérifie que des fichiers (motif nom.ext) ou dossiers existent (FS:fileExists / FS:directoryExists) ; vrai si la liste est nil. | 1743 |

### Détail des paramètres

#### `freeroam_freeroamConfigurator.clearWizardFiltersForStep(step)`

Efface les filtres d'une étape.

- `step` (*string*) : Étape.
- **renvoie** : boolean Succès.

#### `freeroam_freeroamConfigurator.clearWizardSearchForStep(step)`

Vide la recherche de l'étape.

- `step` (*string*) : Étape.
- **renvoie** : boolean Succès.

#### `freeroam_freeroamConfigurator.doubleClickOverride(item)`

Gestionnaire de double-clic : fait seulement dump(item).

- `item` (*any*) : Élément cliqué.

#### `freeroam_freeroamConfigurator.getButtons()`

Construit le bouton de démarrage (« Start freeroam », priorité 1), laisse les extensions le surcharger (onFreeroamConfiguratorOverrideStartButton) et renvoie celui de plus haute priorité.

- **renvoie** : table|nil Infos du bouton.

#### `freeroam_freeroamConfigurator.getConfiguration()`

Renvoie à l'UI la configuration : options (groupes collectés par le hook onFreeroamConfiguratorGetOptions, triés par `order`, valeurs remplies depuis la configuration courante ou leur valeur par défaut), currentSpawnPoint (tuile) et currentVehicle (tuile). Charge le fichier de configuration au premier appel.

- **renvoie** : table {options, currentSpawnPoint, currentVehicle}

#### `freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step)`

Tuile « récent » de la sélection courante pour l'étape donnée.

- `step` (*string*) : 'level' ou 'vehicle'.
- **renvoie** : table|nil Tuile.

#### `freeroam_freeroamConfigurator.getCurrentSpawnPointTile()`

Tuile du point de départ courant. Si ses fichiers n'existent plus ou si la tuile manque, recharge ou retombe sur le niveau/point par défaut.

- **renvoie** : table|nil Tuile.

#### `freeroam_freeroamConfigurator.getCurrentVehicle()`

Véhicule courant de la configuration.

- **renvoie** : table {model, config, additionalData}

#### `freeroam_freeroamConfigurator.getCurrentVehicleTile()`

Tuile du véhicule courant, avec repli sur le véhicule par défaut si invalide.

- **renvoie** : table|nil Tuile.

#### `freeroam_freeroamConfigurator.getWizardFiltersForStep(step)`

Renvoie une copie des filtres mémorisés d'une étape.

- `step` (*string*) : Étape.
- **renvoie** : table|nil Filtres.

#### `freeroam_freeroamConfigurator.getWizardSearchForStep(step)`

Lit le texte de recherche mémorisé.

- `step` (*string*) : Étape.
- **renvoie** : string|nil Texte, nil si étape non supportée.

#### `freeroam_freeroamConfigurator.isCurrentSelection(step, details)`

Indique si les détails correspondent à la sélection courante (level : levelName + spawnPointObjectName ; vehicle : model + config).

- `step` (*string*) : 'level' ou 'vehicle'.
- `details` (*table*) : Détails de la tuile.
- **renvoie** : boolean Vrai si identique.

#### `freeroam_freeroamConfigurator.onDeserialized(data)`

Après rechargement Lua : restaure la configuration.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `freeroam_freeroamConfigurator.onSerialize()`

Avant rechargement Lua : sauvegarde la configuration si modifiée et la renvoie.

- **renvoie** : table La configuration courante.

#### `freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data)`

Idem pour la route de détail d'un niveau (points de départ du niveau).

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data)`

Idem pour le détail d'un niveau.

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data)`

Hook d'entrée sur la route des niveaux du wizard : prépare les données de route (chemin de niveau par défaut).

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données de route à compléter.

#### `freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data)`

Hook de montage de la route des niveaux : prépare les données et attache ou diffère l'instantané du sélecteur (chargement asynchrone si la liste n'est pas chargée).

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data)`

Hook générique d'entrée sur une route du wizard.

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data)`

Idem pour la route de détail d'un véhicule (configs d'un modèle).

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data)`

Idem pour le détail d'un véhicule.

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data)`

Idem pour la route des véhicules.

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data)`

Idem pour la liste des véhicules.

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route.
- `fromRoute` (*table*) : Route d'origine.
- `data` (*table*) : Données.

#### `freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params)`

Titre du fil d'Ariane pour le niveau : d'abord le niveau de la route de détail (spawnPointsForLevel), sinon le niveau choisi (tuile ou nom).

- `params` (*table*) : Paramètres de la route (params.path.keys).
- **renvoie** : string|nil Titre.

#### `freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params)`

Titre du fil d'Ariane pour le véhicule : modèle de la route (configsForModel / configsForBrandSubModelOrModel), sinon la tuile véhicule, sinon le nom dérivé du modèle choisi.

- `params` (*table*) : Paramètres de la route.
- **renvoie** : string|nil Titre.

#### `freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName)`

Choisit le niveau et le point de départ : résout un point de repli si besoin (resolveSpawnPointNameForLevel), met à jour la date d'environnement par défaut du niveau si elle n'avait pas été modifiée, charge et met en cache la tuile, marque la configuration modifiée et navigue vers routeName si fourni.

- `levelName` (*string*) : Nom du niveau.
- `spawnPointName` (*string|nil*) : Nom de l'objet de départ ('undefined' ou nil = point par défaut).
- `key` (*string|nil*) : Clé de tuile (non utilisée dans le corps).
- `routeName` (*string|nil*) : Route UI vers laquelle naviguer.

#### `freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key)`

Choisit le véhicule : résout la config (repli sur une config existante du modèle), garde les additionalData existantes si c'est le même véhicule sans données, met en cache la tuile.

- `model` (*string*) : Clé du modèle.
- `config` (*string*) : Clé de la config.
- `additionalData` (*table|nil*) : Données (paint, paint2, paint3 : noms de peintures).
- `key` (*string|nil*) : Non utilisé dans le corps.

#### `freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload)`

Mémorise les filtres d'une étape (charge normalisée).

- `step` (*string*) : Étape.
- `filtersPayload` (*table*) : Filtres.
- **renvoie** : boolean Succès.

#### `freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText)`

Mémorise le texte de recherche d'une étape (normalisé).

- `step` (*string*) : 'level' ou 'vehicle'.
- `searchText` (*string*) : Texte.
- **renvoie** : boolean false si étape non supportée.

#### `freeroam_freeroamConfigurator.startFreeroam(configuration)`

Démarre la partie : résout les peintures du véhicule, appelle freeroam_freeroam.startFreeroamByName(niveau, point de départ, nil, {modèle, options}), enregistre les récents (point de départ et véhicule) et vide les filtres du wizard.

- `configuration` (*table*) : Configuration complète {levelName, spawnPointName, vehicle={model, config, additionalData}, spawnPointTile…}.

#### `freeroam_freeroamConfigurator.triggerButton(buttonId, ...)`

Exécute un bouton : sauvegarde la configuration si modifiée, notifie onFreeroamConfiguratorApplyOptions puis déclenche le bouton.

- `buttonId` (*any*) : Id du bouton (déduit du code : buttonModule.executeButton).
- `...` (*any*) : Arguments supplémentaires (non utilisés ici).

#### `freeroam_freeroamConfigurator.updateOption(key, value)`

Enregistre la valeur d'une option de partie et marque la configuration comme modifiée.

- `key` (*string*) : Clé de l'option (ex. traffic_trafficMode).
- `value` (*any*) : Valeur.

#### `freeroam_freeroamConfigurator.validateFiles(validationFiles)`

Vérifie que des fichiers (motif nom.ext) ou dossiers existent (FS:fileExists / FS:directoryExists) ; vrai si la liste est nil.

- `validationFiles` (*string[]|nil*) : Chemins à valider.
- **renvoie** : boolean Vrai si tous existent.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Noms d'extensions freeroam_configuratorOptions_* découverts dynamiquement dans lua/ge/extensions/freeroam/configuratorOptions/. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamConfiguratorApplyOptions` — écouté par 1 module(s)
- `onFreeroamConfiguratorGetOptions` — écouté par 1 module(s)
- `onFreeroamConfiguratorOverrideStartButton`

**Évènements UI (guihooks.trigger) :** `FreeroamSelectorDataLoaded`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`
- `Lua:` `getSelectedLanguage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/freeroamConfigurator.lua`.*
