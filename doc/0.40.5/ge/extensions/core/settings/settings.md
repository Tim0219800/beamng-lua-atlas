# `core_settings_settings`

*Fichier : `lua/ge/extensions/core/settings/settings.lua` · VM : Game Engine (GE) · 620 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_settings` : `extensions.load("core_settings_settings")`, puis la globale `core_settings_settings`

Extension centrale des réglages du jeu côté GE. Elle tient la table des valeurs courantes (initialisée depuis les valeurs par défaut du module common settings), applique chaque changement via des « option helpers » (setters Lua ou propagation vers CppSettings), enregistre sur disque avec un délai (local, cloud, persona), notifie l'UI (guihooks SettingsChanged) et les extensions (hook onSettingsChanged), gère les langues, et charge ou décharge des extensions selon certains réglages (ui_extApp, core_couplerCameraModifier, mcp_server, workbench_webSocketHandler). C'est le point d'entrée pour lire ou modifier un réglage depuis un mod.

## Exemple

```lua
local v = core_settings_settings.getValue('uiUnitLength', 'metric')
core_settings_settings.setValue('AudioMasterVol', 0.5)
```

## Remarques

- settings.impl est le module common 'settings' (require("settings")) : defaults, defaultValues, chemins pathLocal/pathCloud/pathPersona, etc.
- save est le même objet que requestSave : il n'écrit pas tout de suite mais programme une sauvegarde 0.5 s plus tard via settingsTick (appelé par la boucle principale). La vraie écriture est la fonction locale save, appelée par settingsTick.
- Seules les valeurs différentes des valeurs par défaut sont écrites ; les clés dont le défaut est classé "cloud" vont dans pathCloud, "discard" nulle part, sinon pathLocal.
- Après une sauvegarde : notifyUI, core_settings_graphic.onSettingsChanged(), hook extensions 'onSettingsChanged', et be:queueAllObjectLua('onSettingsChanged()') (les VM véhicule reçoivent aussi le hook).
- setValue ne déclenche le setter (options[key].set) que si la valeur change (comparaison par tostring) ou si ignoreCache est vrai. Un appel récursif sur la même clé est ignoré (retourne nil).
- setState applique d'abord les groupes de qualité graphique (GraphicOverallQuality, GraphicMeshQuality, …) puis les autres clés dans l'ordre alphabétique.
- Incohérence probable : enableDragRaceInFreeroam, enableDriftInFreeroam, enableCrawlInFreeroam et enableGasStationsInFreeroam émettent tous le hook showMissionMarkersToggled (comme showMissionMarkers) ; sans doute un copier-coller voulu pour rafraîchir les marqueurs.
- Le champ settingsTick vaut nop (fonction globale du jeu) et est remplacé par requestSave le temps de la sauvegarde différée.
- Valeurs d'unités proposées dans les options (modes) : longueur metric/imperial, température c/f/k, poids lb/kg, puissance hp/bhp/kw, pression inHg/bar/psi/kPa, etc.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_settings.exit()` | Appelé à la fermeture : sauvegarde immédiatement et supprime le fichier des valeurs persona. *(interne)* | 579 |
| `core_settings_settings.finalizeInit()` | Fin d'initialisation appelée par le moteur : load(true), onFirstUpdateSettings des modules graphic et audio, chargement des réglages de plateforme (PlatformSwitches.settingsJsonPath, déprécié), autorise les sauvegardes, charge telemetry_core. *(interne)* | 539 |
| `core_settings_settings.getValue(key, defaultValue, persona)` | Lit la valeur courante d'un réglage, ou defaultValue si nil. Avec multiseat actif, la valeur peut être surchargée par le persona. | 416 |
| `core_settings_settings.getValuesCopy()` | Renvoie une copie profonde de toutes les valeurs courantes. | 575 |
| `core_settings_settings.initSettings(reason)` | Initialisation : construit les dictionnaires clés/valeurs des options, charge core_settings_graphic, core_settings_audio et core_settings_multiplayer et fusionne leurs buildOptionHelpers, ajoute un setter propageant vers CppSettings pour chaque réglage connu du C++ (type vérifié), puis lit le fichier de réglages et appelle core_settings_graphic.onInitSettings. *(interne)* | 479 |
| `core_settings_settings.load(ignoreCache)` | Recharge les réglages depuis les fichiers : monte translations.zip si présent, fusionne les valeurs lues avec les courantes, applique via setState puis core_settings_graphic.load. Journalise la dernière erreur CppSettings si elle existe. Pendant ce temps, les sauvegardes sont bloquées. | 454 |
| `core_settings_settings.loadPlatformSettings(platformSettingsPath)` | Charge un JSON de réglages spécifiques à la plateforme et les applique avec setState. Journalise une erreur si le fichier est illisible. *(interne)* | 527 |
| `core_settings_settings.notifyUI()` | Envoie à l'UI l'évènement guihooks 'SettingsChanged' avec {values, options}. | 57 |
| `core_settings_settings.onFilesChanged(files)` | Hook de surveillance de fichiers : si les fichiers de réglages local ou cloud ont changé de l'extérieur (et plus de 5 s après la dernière sauvegarde), recharge via load(false). *(interne)* *(hook)* | 558 |
| `core_settings_settings.onFirstUpdate()` | Hook premier update. Si communityTranslations vaut 'enable' et que le jeu a été mis à jour depuis une version 0.x avec x < 39, appelle updateTranslations() (défini dans ge/main.lua). *(interne)* *(hook)* | 589 |
| `core_settings_settings.refreshTSState(withValue)` | Recopie dans la table des valeurs le résultat des get() des options (si withValue) et recalcule les modes (getModes) des options qui en ont. Nom hérité de TorqueScript. | 116 |
| `core_settings_settings.requestSave()` | Programme une sauvegarde différée des réglages (0.5 s) via settingsTick. | 317 |
| `core_settings_settings.requestState()` | Alias de notifyUI (rétrocompatibilité). | 57 |
| `core_settings_settings.resetSettingToDefault(key)` | Remet un réglage à sa valeur par défaut (M.impl.defaultValues) via setValue, si une valeur par défaut existe. | 410 |
| `core_settings_settings.save()` | Alias de requestSave : sauvegarde différée, pas immédiate. | 317 |
| `core_settings_settings.setState(newState, ignoreCache)` | Applique une table de réglages : groupes de qualité graphique d'abord, puis le reste par ordre alphabétique, via setValue. Si quelque chose a changé (ou ignoreCache), relit l'état, sauvegarde, et réconcilie les extensions dépendantes (ui_extApp selon externalUI2, core_couplerCameraModifier selon couplerCameraModifier, mcp_server selon enableMcp, workbench_webSocketHandler selon workbenchMobile) puis les langues. Les clés non string sont ignorées avec un avertissement. | 212 |
| `core_settings_settings.setValue(key, value, ignoreCache, persona)` | Change un réglage : met à jour la valeur, appelle le setter de l'option, et programme la sauvegarde. Avec un persona (et multiseat actif) et une clé spécifique aux personas, écrit dans le fichier persona au lieu des réglages globaux. | 357 |

### Détail des paramètres

#### `core_settings_settings.getValue(key, defaultValue, persona)`

Lit la valeur courante d'un réglage, ou defaultValue si nil. Avec multiseat actif, la valeur peut être surchargée par le persona.

- `key` (*string*) : Nom du réglage.
- `defaultValue` (*any*) : Valeur de repli si le réglage est nil.
- `persona` (*string|table|nil*) : Persona (ignoré si multiseat n'est pas actif).
- **renvoie** : any Valeur du réglage.

#### `core_settings_settings.getValuesCopy()`

Renvoie une copie profonde de toutes les valeurs courantes.

- **renvoie** : table<string, any> Copie des réglages.

#### `core_settings_settings.initSettings(reason)`

Initialisation : construit les dictionnaires clés/valeurs des options, charge core_settings_graphic, core_settings_audio et core_settings_multiplayer et fusionne leurs buildOptionHelpers, ajoute un setter propageant vers CppSettings pour chaque réglage connu du C++ (type vérifié), puis lit le fichier de réglages et appelle core_settings_graphic.onInitSettings.

- `reason` (*string|nil*) : Raison de l'init ; 'reload' pour un rechargement de Lua (sinon les valeurs persona sont effacées).

#### `core_settings_settings.load(ignoreCache)`

Recharge les réglages depuis les fichiers : monte translations.zip si présent, fusionne les valeurs lues avec les courantes, applique via setState puis core_settings_graphic.load. Journalise la dernière erreur CppSettings si elle existe. Pendant ce temps, les sauvegardes sont bloquées.

- `ignoreCache` (*boolean|nil*) : Force l'application de toutes les valeurs.

#### `core_settings_settings.loadPlatformSettings(platformSettingsPath)`

Charge un JSON de réglages spécifiques à la plateforme et les applique avec setState. Journalise une erreur si le fichier est illisible.

- `platformSettingsPath` (*string|nil*) : Chemin du JSON ; ignoré si nil ou vide.

#### `core_settings_settings.onFilesChanged(files)`

Hook de surveillance de fichiers : si les fichiers de réglages local ou cloud ont changé de l'extérieur (et plus de 5 s après la dernière sauvegarde), recharge via load(false).

- `files` (*table[]*) : Liste d'entrées avec un champ filename.

#### `core_settings_settings.refreshTSState(withValue)`

Recopie dans la table des valeurs le résultat des get() des options (si withValue) et recalcule les modes (getModes) des options qui en ont. Nom hérité de TorqueScript.

- `withValue` (*boolean*) : Si vrai, relit aussi les valeurs via get().

#### `core_settings_settings.resetSettingToDefault(key)`

Remet un réglage à sa valeur par défaut (M.impl.defaultValues) via setValue, si une valeur par défaut existe.

- `key` (*string*) : Nom du réglage.

#### `core_settings_settings.setState(newState, ignoreCache)`

Applique une table de réglages : groupes de qualité graphique d'abord, puis le reste par ordre alphabétique, via setValue. Si quelque chose a changé (ou ignoreCache), relit l'état, sauvegarde, et réconcilie les extensions dépendantes (ui_extApp selon externalUI2, core_couplerCameraModifier selon couplerCameraModifier, mcp_server selon enableMcp, workbench_webSocketHandler selon workbenchMobile) puis les langues. Les clés non string sont ignorées avec un avertissement.

- `newState` (*table<string, any>|nil*) : Réglages à appliquer ; nil = rien.
- `ignoreCache` (*boolean|nil*) : Si vrai, applique même les valeurs inchangées.

#### `core_settings_settings.setValue(key, value, ignoreCache, persona)`

Change un réglage : met à jour la valeur, appelle le setter de l'option, et programme la sauvegarde. Avec un persona (et multiseat actif) et une clé spécifique aux personas, écrit dans le fichier persona au lieu des réglages globaux.

- `key` (*string*) : Nom du réglage.
- `value` (*any*) : Nouvelle valeur.
- `ignoreCache` (*boolean|nil*) : Applique même si la valeur est identique. Si une valeur non booléenne est passée ici sans persona, elle est interprétée comme persona.
- `persona` (*string|table|nil*) : Identifiant de persona, ou table avec un champ id.
- **renvoie** : boolean|nil true si l'état a changé ; false si rien ou persona invalide ; nil si appel récursif sur la même clé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `impl` | table | Module common 'settings' : valeurs par défaut (defaultValues, defaults), chemins de fichiers, cache et valeurs par persona (getPersonaValue, invalidateCache…). |
| `settingsTick` | function | Hook de boucle appelé par le moteur à chaque image (dtReal, dtSim, dtRaw). Vaut nop au repos ; requestSave y met une fonction qui décompte 0.5 s puis sauvegarde. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMinimapSettingsChanged` — écouté par 1 module(s)
- `onSettingsChanged` — écouté par 25 module(s)
- `showMissionMarkersToggled`
- `taxiSettingChanged`

**Évènements UI (guihooks.trigger) :** `SettingsChanged`, `toastrMsg`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`, `setMcpPort`
- `FS:` `directoryCreate`, `fileExists`, `isMounted`, `mount`, `removeFile`
- `Lua:` `getOSLanguage`, `getSelectedLanguage`, `getSteamLanguage`, `reloadLanguages`
- `ResearchVerifier.` `isTechLicenseVerified`
- `be:` `queueAllObjectLua`
- `ui_imgui.` `IoFontsGetCount`, `IoFontsGetName`, `SetDefaultFont`

**Charge les extensions :** `core_couplerCameraModifier`, `mcp_server`, `telemetry_core`, `ui_extApp`, `workbench_webSocketHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/settings.lua`.*
