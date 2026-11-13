# `gameplay_missions_missionScreen`

*Fichier : `lua/ge/extensions/gameplay/missions/missionScreen.lua` · VM : Game Engine (GE) · 1412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missionScreen` : `extensions.load("gameplay_missions_missionScreen")`, puis la globale `gameplay_missions_missionScreen`

Pont entre le système de missions et l'interface (UI Vue) : prépare les données de l'écran de mission (missions au marqueur courant, mission en cours, tuiles de la liste, étoiles actives selon les réglages, options de démarrage, frais d'entrée, réparation, classe de véhicule exigée), lance ou arrête une mission depuis l'UI, gère la navigation vers une mission sur la grande carte et les sons de l'écran de fin. Presque toutes ses fonctions sont appelées par l'interface via des commandes Lua (par ex. gameplay_missions_missionScreen.startMissionById) ; les résultats repartent par guihooks.trigger.

## Exemple

```lua
-- lancer une mission comme le fait l'UI
local settings = {{key='setupModuleTraffic', value=false}}
gameplay_missions_missionScreen.startMissionById('gridmap_v2/timeTrial/x', settings, {})
```

## Remarques

- Les réglages utilisateur venant de l'UI sont une liste {{key, value, ...}} ; startMissionById, startFromWithinMission les aplatit en table clé -> valeur avant de les passer au missionManager.
- startMissionById refuse (erreur loguée) une mission non démarrable (gameplay_missions_unlocks.isMissionStartable) sauf si startingOptions.skipUnlockCheck est vrai ; startingOptions.startedFrom vaut « missionScreen » par défaut. Elle ne renvoie rien.
- Les coûts de réparation au départ sont fixes : 1000 (argent) ou 1 bon (voucher).
- Bug : dans formatMission, `m.missionTypeLabel or mission.missionType` utilise la globale `mission` (nil) au lieu de `m` ; si missionTypeLabel est absent, une erreur est levée.
- Bug : dans openVehicleSelectorForMissionBySetting, `settingIdx = i` utilise une variable `i` non définie (la boucle utilise `_`) : settingIdx vaut toujours nil.
- Bug : dans getMissionScreenData, le hook onAvailableMissionsSentToUi est émis avec `context`, une variable non définie à cet endroit (nil).
- openAPMChallenges remplit openMenuWithCustomMissionList avec {mode='leagues'} puis y ajoute des ids : la table mélange clé « mode » et éléments séquentiels (seuls les éléments séquentiels sont lus ensuite).
- enableDebug(true) remplace M.onUpdate par debugOnUpdate (fenêtre imgui « Mission Start Screen History » avec les 20 dernières mises en page) ; M.onUpdate est nil sinon.
- Les champs savedLayouts et testLayout valent nil par défaut : savedLayouts est rempli par discoverLayouts, testLayout est un champ de test jamais assigné dans ce fichier.
- activateSoundBlur appelle core_sounds.setAudioBlur(1 ou 0) ; le code de son 3D précédent est commenté. activateSound crée trois sources AudioGui (money, xp, vouchers) et ne les détruit jamais (tryDeleteSoundObject est vide).

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `gameplay_markerInteraction`, `gameplay_playmodeMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missionScreen.abandonCurrentMission()` | Abandonne la mission en cours comme si le joueur avait appuyé sur le bouton d'abandon. | 822 |
| `gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch)` | Joue (avec la hauteur donnée) ou arrête les sons de comptage de l'écran de fin (money, xp, vouchers). | 1012 |
| `gameplay_missions_missionScreen.activateSoundBlur(active)` | Active ou désactive le flou audio (core_sounds.setAudioBlur) pendant l'écran de mission. | 894 |
| `gameplay_missions_missionScreen.changeUserSettings(id, settings)` | Appelée quand le joueur change un réglage : détermine la clé de progression correspondante (mission:getProgressKeyForUserSetting) et envoie à l'UI, par guihooks « missionProgressKeyChanged », {progressKey, translation, progress} avec les agrégats reformatés. Utilise la mission parente si missionIdForAttempt est défini. Malgré son nom, elle ne modifie aucun réglage. | 824 |
| `gameplay_missions_missionScreen.debugOnUpdate(dt)` | Fenêtre imgui de debug, utilisée comme onUpdate quand enableDebug(true). *(interne)* | 1291 |
| `gameplay_missions_missionScreen.discoverLayouts()` | Outil de debug : lit les mises en page JSON de /gameplay/testing dans M.savedLayouts. | 1269 |
| `gameplay_missions_missionScreen.enableDebug(enable)` | Outil de debug : active/désactive la fenêtre imgui de l'historique des mises en page (affecte M.onUpdate). | 1281 |
| `gameplay_missions_missionScreen.formatMission(m)` | Met une mission au format attendu par l'UI (id, nom traduit, icône, description, aperçu, libellé de type, étoiles, réglages, classe exigée, ligues en carrière, etc.). | 111 |
| `gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings)` | Détermine quelles étoiles sont actives, visibles et activées pour des réglages donnés (après recalcul des récompenses dynamiques, en ignorant les clés de ignoreUserSettingsKeyForActiveStars). Mémorise les réglages dans m._lastUserSettingsOutsideOfMission. | 599 |
| `gameplay_missions_missionScreen.getMissionScreenData()` | Données de l'écran de mission : si une mission est en cours, renvoie le contexte « ongoingMission » (mission en cours, options de récupération, boutons masqués pendant le tutoriel ou le rallye en boucle) ; sinon contexte « availableMissions » (missions du marqueur ou liste personnalisée, tuiles, mission/page présélectionnées, avertissement de livraison en cours) ou « empty ». | 308 |
| `gameplay_missions_missionScreen.getMissionTiles(ids)` | Construit les tuiles de la liste des missions du niveau courant (filtres, groupes par difficulté et « all », tris). Sans ids, ne garde que les missions visibles en freeroam ; avec ids, seulement celles-ci. | 1096 |
| `gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted()` | Liste des missions du marqueur où se trouve le joueur, déjà formatées et triées par profondeur de déblocage ; nil si l'état de jeu n'a pas de marqueurs de playmode. | 258 |
| `gameplay_missions_missionScreen.getPauseMissionObjectivesData()` | Données du menu pause (composant Vue MissionObjectives) : fusionne les étoiles débloquées avec les règles d'étoiles actives pour les réglages de la mission en cours. | 713 |
| `gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type)` | Coût de la réparation proposée au départ d'une mission en carrière : « moneyRepair » -> {money=1000}, « voucherRepair » -> {vouchers=1}, sinon nil. | 13 |
| `gameplay_missions_missionScreen.isAnyMissionActive()` | Indique si une mission de premier plan est en cours. | 1405 |
| `gameplay_missions_missionScreen.isMissionStartOrEndScreenActive()` | Diffuse le hook onGetIsMissionStartOrEndScreenActive ; un module qui affiche l'écran de début/fin de mission y répond en ajoutant une valeur. | 1406 |
| `gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams)` | Ouvre la grande carte centrée sur une mission (freeroam_bigMapMode.enterBigMap, instantané) ; la sélection du POI et la navigation sont faites ensuite par onBigMapActivated. | 972 |
| `gameplay_missions_missionScreen.onBigMapActivated()` | Hook appelé à l'ouverture de la grande carte : si une navigation vers une mission est en attente (et vieille de plus de 3 s), sélectionne le POI et lance la navigation. *(interne)* *(hook)* | 991 |
| `gameplay_missions_missionScreen.onClientEndMission(levelPath)` | Hook à la fin du niveau ; ne fait rien (code commenté). *(interne)* *(hook)* | 927 |
| `gameplay_missions_missionScreen.onExtensionUnloaded()` | Hook à la décharge de l'extension ; ne fait rien (code commenté). *(interne)* *(hook)* | 923 |
| `gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout)` | Hook envoyé quand l'écran de mission est affiché : mémorise la mise en page UI reçue (20 dernières). *(interne)* *(hook)* | 1380 |
| `gameplay_missions_missionScreen.onRequestMissionScreenData(mode)` | Test (« Todo: Remove ») : si le mode contient « test », renvoie à l'UI une copie de M.testLayout par guihooks « onRequestMissionScreenDataReady ». *(interne)* *(hook)* | 1393 |
| `gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams)` | Ouvre l'écran des défis de la carrière (missions de départ « league » du niveau courant, filtrées par branche et compétence) via ui_router.navigate (« mission.details » par défaut). | 937 |
| `gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey)` | Ouvre le sélecteur de véhicule pour le réglage « véhicule personnalisé » d'une mission, puis revient à la page « settings » de la mission avec le modèle et la config choisis. | 1038 |
| `gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings)` | Calcule les options de démarrage pour les réglages donnés et les envoie à l'UI par guihooks « missionStartingOptionsForUserSettingsReady » ({missionId, options, entryFee}). Vérifie : mission démarrable, véhicule perso choisi, démarrage à pied impossible, frais d'entrée payables, classe de véhicule, et propose la réparation payante en carrière si le véhicule est endommagé. | 421 |
| `gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m)` | Classe du véhicule que la mission utiliserait par défaut (option présélectionnée dans ses réglages). Les règles de choix sont dans gameplay_vehiclePerformance.getDefaultMissionVehicleSpec ; pour un véhicule imposé (preset) la classe vient de getClassFromConfig, sinon on retombe sur celle du joueur. | 42 |
| `gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m)` | Renvoie la classe de véhicule exigée par la mission (missionTypeData.vehicleGroupByClassActive et vehicleGroupByClass), construite avec gameplay_vehiclePerformance.buildClassRequirement ; « auto » prend la classe du joueur (B par défaut), « userSetting » donne nil (choix dans les réglages). | 73 |
| `gameplay_missions_missionScreen.resolvePlayerVehicleClass()` | Classe de performance du véhicule du joueur sous forme {class={name, description, minPI}, performanceIndex} : véhicule d'inventaire actif en carrière, sinon véhicule joueur actuel via gameplay_vehiclePerformance.getClassFromVehId. | 22 |
| `gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass)` | Compare la classe courante et la classe exigée par noms : « met » si identiques, « unmet » si différentes, « unknown » si l'une manque. | 60 |
| `gameplay_missions_missionScreen.setPreselectedMissionId(mId)` | Définit la mission présélectionnée à l'ouverture de l'écran de mission. | 882 |
| `gameplay_missions_missionScreen.setPreselectedPage(page)` | Définit la page de l'écran de mission à ouvrir (utilisée une seule fois par getMissionScreenData). | 877 |
| `gameplay_missions_missionScreen.startFromWithinMission(id, settings)` | Redémarre/reconfigure une mission depuis une mission en cours (aplatit les réglages puis appelle missionManager.startFromWithinMission). | 1250 |
| `gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions)` | Démarre une mission avec fondu (gameplay_missions_missionManager.startWithFade) après avoir aplati les réglages. Logue une erreur si l'id est invalide ou si la mission n'est pas démarrable. | 790 |
| `gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed)` | Demande l'abandon (avec fondu) de la mission d'id donné, ou de la mission de premier plan si id est nil. | 813 |

### Détail des paramètres

#### `gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch)`

Joue (avec la hauteur donnée) ou arrête les sons de comptage de l'écran de fin (money, xp, vouchers).

- `soundLabel` (*string*) : money, xp ou vouchers.
- `active` (*boolean*) : true pour jouer ; false arrête tous les sons de comptage.
- `pitch` (*number|nil*) : Paramètre « pitch » (1 par défaut).

#### `gameplay_missions_missionScreen.activateSoundBlur(active)`

Active ou désactive le flou audio (core_sounds.setAudioBlur) pendant l'écran de mission.

- `active` (*boolean*) : true pour activer.

#### `gameplay_missions_missionScreen.changeUserSettings(id, settings)`

Appelée quand le joueur change un réglage : détermine la clé de progression correspondante (mission:getProgressKeyForUserSetting) et envoie à l'UI, par guihooks « missionProgressKeyChanged », {progressKey, translation, progress} avec les agrégats reformatés. Utilise la mission parente si missionIdForAttempt est défini. Malgré son nom, elle ne modifie aucun réglage.

- `id` (*string*) : Id de la mission.
- `settings` (*table[]*) : Liste {key, value}.

#### `gameplay_missions_missionScreen.debugOnUpdate(dt)`

Fenêtre imgui de debug, utilisée comme onUpdate quand enableDebug(true).

- `dt` (*number*) : Temps écoulé (s).

#### `gameplay_missions_missionScreen.enableDebug(enable)`

Outil de debug : active/désactive la fenêtre imgui de l'historique des mises en page (affecte M.onUpdate).

- `enable` (*boolean*) : true pour activer.

#### `gameplay_missions_missionScreen.formatMission(m)`

Met une mission au format attendu par l'UI (id, nom traduit, icône, description, aperçu, libellé de type, étoiles, réglages, classe exigée, ligues en carrière, etc.).

- `m` (*table*) : Mission construite.
- **renvoie** : table Données formatées pour l'interface.

#### `gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings)`

Détermine quelles étoiles sont actives, visibles et activées pour des réglages donnés (après recalcul des récompenses dynamiques, en ignorant les clés de ignoreUserSettingsKeyForActiveStars). Mémorise les réglages dans m._lastUserSettingsOutsideOfMission.

- `id` (*string*) : Id de la mission.
- `userSettings` (*table*) : Liste {key, value} ou table à plat clé -> valeur.
- **renvoie** : table Table contenant notamment starInfo par clé d'étoile ; table vide si la mission n'existe pas.

#### `gameplay_missions_missionScreen.getMissionScreenData()`

Données de l'écran de mission : si une mission est en cours, renvoie le contexte « ongoingMission » (mission en cours, options de récupération, boutons masqués pendant le tutoriel ou le rallye en boucle) ; sinon contexte « availableMissions » (missions du marqueur ou liste personnalisée, tuiles, mission/page présélectionnées, avertissement de livraison en cours) ou « empty ».

- **renvoie** : table Table avec le champ context et les données associées.

#### `gameplay_missions_missionScreen.getMissionTiles(ids)`

Construit les tuiles de la liste des missions du niveau courant (filtres, groupes par difficulté et « all », tris). Sans ids, ne garde que les missions visibles en freeroam ; avec ids, seulement celles-ci.

- `ids` (*table<string, boolean>|nil*) : Ensemble d'ids à inclure.
- **renvoie** : table Table dont tilesById, et les groupes triés (détail dans le code).

#### `gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted()`

Liste des missions du marqueur où se trouve le joueur, déjà formatées et triées par profondeur de déblocage ; nil si l'état de jeu n'a pas de marqueurs de playmode.

- **renvoie** : table[]|nil Missions formatées.

#### `gameplay_missions_missionScreen.getPauseMissionObjectivesData()`

Données du menu pause (composant Vue MissionObjectives) : fusionne les étoiles débloquées avec les règles d'étoiles actives pour les réglages de la mission en cours.

- **renvoie** : table {stars, message, showMessage} ; stars est vide s'il n'y a pas de mission ou d'étoiles.

#### `gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type)`

Coût de la réparation proposée au départ d'une mission en carrière : « moneyRepair » -> {money=1000}, « voucherRepair » -> {vouchers=1}, sinon nil.

- `type` (*string*) : moneyRepair ou voucherRepair.
- **renvoie** : table<string, number>|nil Coût par attribut.

#### `gameplay_missions_missionScreen.isAnyMissionActive()`

Indique si une mission de premier plan est en cours.

- **renvoie** : boolean true si une mission est active.

#### `gameplay_missions_missionScreen.isMissionStartOrEndScreenActive()`

Diffuse le hook onGetIsMissionStartOrEndScreenActive ; un module qui affiche l'écran de début/fin de mission y répond en ajoutant une valeur.

- **renvoie** : any Première valeur ajoutée par un écouteur, ou false.

#### `gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams)`

Ouvre la grande carte centrée sur une mission (freeroam_bigMapMode.enterBigMap, instantané) ; la sélection du POI et la navigation sont faites ensuite par onBigMapActivated.

- `id` (*string*) : Id de la mission.
- `routeTarget` (*string|nil*) : Route cible de l'UI.
- `routeParams` (*table|nil*) : Paramètres de route (autoSelectPoiId = id par défaut).

#### `gameplay_missions_missionScreen.onClientEndMission(levelPath)`

Hook à la fin du niveau ; ne fait rien (code commenté).

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout)`

Hook envoyé quand l'écran de mission est affiché : mémorise la mise en page UI reçue (20 dernières).

- `mode` (*string*) : Mode de l'écran.
- `uiLayout` (*table*) : Mise en page envoyée par l'UI (reçoit recordedAt).

#### `gameplay_missions_missionScreen.onRequestMissionScreenData(mode)`

Test (« Todo: Remove ») : si le mode contient « test », renvoie à l'UI une copie de M.testLayout par guihooks « onRequestMissionScreenDataReady ».

- `mode` (*string*) : Mode demandé.

#### `gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams)`

Ouvre l'écran des défis de la carrière (missions de départ « league » du niveau courant, filtrées par branche et compétence) via ui_router.navigate (« mission.details » par défaut).

- `branch` (*string|nil*) : Branche ; « undefined » = nil.
- `skill` (*string|nil*) : Compétence ; « undefined » ou « all » = nil.
- `routeTarget` (*string|nil*) : Route cible de l'UI.
- `routeParams` (*table|nil*) : Paramètres de route (pathId = branch par défaut).

#### `gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey)`

Ouvre le sélecteur de véhicule pour le réglage « véhicule personnalisé » d'une mission, puis revient à la page « settings » de la mission avec le modèle et la config choisis.

- `mId` (*string*) : Id de la mission.
- `settingKey` (*string*) : Clé du réglage de sélection de véhicule.

#### `gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings)`

Calcule les options de démarrage pour les réglages donnés et les envoie à l'UI par guihooks « missionStartingOptionsForUserSettingsReady » ({missionId, options, entryFee}). Vérifie : mission démarrable, véhicule perso choisi, démarrage à pied impossible, frais d'entrée payables, classe de véhicule, et propose la réparation payante en carrière si le véhicule est endommagé.

- `id` (*string*) : Id de la mission.
- `userSettings` (*table[]*) : Liste de réglages {key, value}.

#### `gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m)`

Classe du véhicule que la mission utiliserait par défaut (option présélectionnée dans ses réglages). Les règles de choix sont dans gameplay_vehiclePerformance.getDefaultMissionVehicleSpec ; pour un véhicule imposé (preset) la classe vient de getClassFromConfig, sinon on retombe sur celle du joueur.

- `m` (*table*) : Mission construite.
- **renvoie** : table|nil Données de classe.

#### `gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m)`

Renvoie la classe de véhicule exigée par la mission (missionTypeData.vehicleGroupByClassActive et vehicleGroupByClass), construite avec gameplay_vehiclePerformance.buildClassRequirement ; « auto » prend la classe du joueur (B par défaut), « userSetting » donne nil (choix dans les réglages).

- `m` (*table*) : Mission construite.
- **renvoie** : table|nil Exigence de classe, ou nil s'il n'y en a pas.

#### `gameplay_missions_missionScreen.resolvePlayerVehicleClass()`

Classe de performance du véhicule du joueur sous forme {class={name, description, minPI}, performanceIndex} : véhicule d'inventaire actif en carrière, sinon véhicule joueur actuel via gameplay_vehiclePerformance.getClassFromVehId.

- **renvoie** : table|nil Données de classe, ou nil si indisponible.

#### `gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass)`

Compare la classe courante et la classe exigée par noms : « met » si identiques, « unmet » si différentes, « unknown » si l'une manque.

- `currentClass` (*table|nil*) : Classe actuelle {class={name}}.
- `requiredClass` (*table|nil*) : Classe exigée.
- **renvoie** : string met, unmet ou unknown.

#### `gameplay_missions_missionScreen.setPreselectedMissionId(mId)`

Définit la mission présélectionnée à l'ouverture de l'écran de mission.

- `mId` (*string|nil*) : Id de mission.

#### `gameplay_missions_missionScreen.setPreselectedPage(page)`

Définit la page de l'écran de mission à ouvrir (utilisée une seule fois par getMissionScreenData).

- `page` (*string|nil*) : Nom de la page, par ex. « settings ».

#### `gameplay_missions_missionScreen.startFromWithinMission(id, settings)`

Redémarre/reconfigure une mission depuis une mission en cours (aplatit les réglages puis appelle missionManager.startFromWithinMission).

- `id` (*string*) : Id de la mission à démarrer.
- `settings` (*table[]|nil*) : Liste {key, value}.

#### `gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions)`

Démarre une mission avec fondu (gameplay_missions_missionManager.startWithFade) après avoir aplati les réglages. Logue une erreur si l'id est invalide ou si la mission n'est pas démarrable.

- `id` (*string*) : Id de la mission.
- `userSettings` (*table[]|nil*) : Liste {key, value}.
- `startingOptions` (*table|nil*) : Options (startedFrom, skipUnlockCheck, skipPartConditionSnapshot...).

#### `gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed)`

Demande l'abandon (avec fondu) de la mission d'id donné, ou de la mission de premier plan si id est nil.

- `id` (*string|nil*) : Id de la mission.
- `force` (*boolean|nil*) : Transmis à attemptAbandonMissionWithFade (non utilisé là).
- `abandonButtonPressed` (*boolean|nil*) : true si c'est le joueur qui abandonne.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : gameplay_missions_missions, gameplay_markerInteraction, gameplay_playmodeMarkers. |
| `savedLayouts` | table[]|nil | Mises en page de test lues dans /gameplay/testing/*.json par discoverLayouts ; nil avant le premier appel. |
| `testLayout` | table|nil | Mise en page de test renvoyée par onRequestMissionScreenData quand le mode contient « test » ; nil par défaut. |
| `uiLayoutHistory` | table[] | Les 20 dernières mises en page d'écran de mission reçues par onMissionScreenReady (avec recordedAt et recordedAtFormatted). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAvailableMissionsSentToUi` — écouté par 1 module(s)
- `onGetIsMissionStartOrEndScreenActive` — écouté par 1 module(s)
- `onUpdate` — écouté par 186 module(s)

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`, `missionProgressKeyChanged`, `missionStartingOptionsForUserSettingsReady`, `onRequestMissionScreenDataReady`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

**Charge les extensions :** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionScreen.lua`.*
