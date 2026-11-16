# `gameplay_missions_missionTypes_flowMission`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua` · VM : Game Engine (GE) · 655 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/flowMission")` (fichier sous extensions/ mais pas une extension classique)

Classe de base des missions pilotées par un flowgraph (type « flowgraph » et dérivés). Le module renvoie une fabrique `function(derivedClass, ...)` (même schéma que baseMission). La mission charge un fichier flowgraph (fgPath), y injecte les variables de progression, les variables fgVariables, les réglages utilisateur, puis le démarre ; elle gère aussi les « setup modules » communs (véhicules, trafic, environnement/heure/vent) via les réglages utilisateur, les boutons de contexte de jeu, les frais d'entrée et la compatibilité avec les anciens formats de mission. Un moddeur de missions s'en sert via gameplay_missions_missions.flowMission(C, ...) dans le constructor.lua d'un type de mission.

## Exemple

```lua
-- constructor.lua d'un type de mission basé sur un flowgraph
local C = {}
C.fgPath = '/gameplay/missionTypes/monType/mission.flow.json'
function C:init() self.fgVariables = {} end
return function(...) return gameplay_missions_missions.flowMission(C, ...) end
```

## Remarques

- Comme baseMission, la fabrique appelle init() deux fois (avant et après la copie des clés de la classe dérivée) et copie les clés dérivées directement dans l'objet.
- Les variables ne sont injectées dans le flowgraph que si elles y existent déjà : addOrSetVariable ignore silencieusement (log de niveau D) toute variable absente du flowgraph ; le code d'ajout est commenté. Les valeurs doivent être bool, string, number, ou une table de 3 (vec3) / 4 (quat) éléments, sinon addOrSetVariable renvoie true (erreur).
- Convention de retour inversée : addOrSetVariable, setupFlowgraphManager et onStart renvoient true en cas d'ERREUR (et nil en cas de succès).
- Le nom « attempts » est réservé : il ne peut pas servir de variable de progression. Une clé de fgVariables ne peut pas non plus reprendre le nom d'une variable de progression.
- Les clés de réglages utilisateur ignorées pour le calcul des étoiles actives sont dans ignoreUserSettingsKeyForActiveStars : setupModuleEnvironmentTime, useGroundmarkers, missionVehicleClass, shuffleGroup.
- Le réglage setupModuleEnvironmentTime vaut la chaîne spéciale « __missionDefaultEnvironmentTime » pour « utiliser l'heure par défaut de la mission » ; dans processCommonSettings, cette valeur ne modifie pas l'heure.
- En mode startScreen, onMissionScreenReady remet l'heure du jour du monde à l'heure de la mission si timeScale > 0 (dayLength = 1800 / timeScale).
- Le vent de l'environnement (setupModules.environment._windVec) est réappliqué à chaque frame à tous les véhicules prêts par obj:setWind.
- Le hook onVehicleReset est relayé au script de la mission (self.script.onVehicleReset(self, ...)) ; notez que le script reçoit la mission comme premier argument.

## Classe `C`

Classe de base d'une mission flowgraph. L'objet porte les champs de la mission (id, missionFolder, setupModules, missionTypeData, careerSetup, additionalAttributes, fgPath, fgVariables, progress, userSettings...) et, une fois démarré, self.mgr (le gestionnaire de flowgraph).

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_flowMission")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addOrSetVariable(name, value)` | Modifie la valeur de base d'une variable existante du flowgraph. Types acceptés : boolean, string, number, table de 3 (vec3) ou 4 (quat) éléments. Si la variable n'existe pas dans le flowgraph, elle est ignorée. | 569 |
| `C:attemptAbandonMission()` | Si le flowgraph contient un nœud pour le hook onRequestAbandon, le diffuse et renvoie true (le flowgraph gère l'abandon) ; sinon renvoie nil. | 560 |
| `C:getCommonSettingsData()` | Construit la liste des réglages utilisateur communs à tous les types de mission : sélection du véhicule (setupModuleVehicles, avec option véhicule personnalisé), trafic (setupModuleTraffic) et heure du jour (setupModuleEnvironmentTime). Pendant la construction des réglages par défaut (_buildingDefaultUserSettings), ne renvoie que {key, value} par module activé. | 111 |
| `C:getDynamicStarReward(key, userSettings)` | Point d'extension pour une récompense d'étoile dépendant des réglages ; vide dans la base (renvoie nil). | 420 |
| `C:getEntryFee(userSettings)` | Renvoie les frais d'entrée de la mission (careerSetup.entryFee) sous forme de table attributeKey -> montant, ou nil s'il n'y en a pas. Accepte l'ancien format liste {attributeKey, rewardAmount}. | 409 |
| `C:getGameContextUiButtons()` | Diffuse le hook flowgraph onGatherGameContextUiButtons, fusionne les boutons par id (un bouton actif l'emporte sur un inactif) et les trie par order puis label. | 616 |
| `C:getProgressKeyTranslation(progressKey)` | Renvoie la clé de traduction d'une clé de progression, ou la clé elle-même si elle est inconnue. | 63 |
| `C:init()` | Appelé à la création de la mission. Définit missionTypeLabel, progressKeyTranslations, defaultPreviewFile (/gameplay/missionTypes/<type>/defaultPreview.jpg s'il existe, résultat mis en cache) et ignoreUserSettingsKeyForActiveStars. Charge aussi les données progressSetup du type mais ne les copie pas (la copie est commentée). | 37 |
| `C:onFlowgraphStateStarted(stateName, state, transData)` | Relaie à self.script (s'il existe) le démarrage d'un état du flowgraph. | 491 |
| `C:onFlowgraphStateStopped(stateName, state)` | Relaie à self.script l'arrêt d'un état du flowgraph. | 497 |
| `C:onMissionScreenReady(mode)` | Appelé quand l'écran de mission (début ou fin) est prêt. Relaie au script ; en mode « startScreen », remet l'heure du monde à l'heure de la mission si timeScale > 0. | 503 |
| `C:onStart()` | Démarre la mission : journalise les problèmes (logMissionIssues), appelle onPreStart s'il existe, crée le flowgraph si besoin (preprocessMissionTypeData et getFgPath optionnels), injecte les variables de progression et les réglages utilisateur (puis les vide), lance le flowgraph s'il est arrêté, et appelle script:onStart. | 423 |
| `C:onStop(data)` | Arrête le flowgraph (instantanément si data.stopInstant), crée une tentative « abandoned » si data.abandoned, émet le hook onMissionProgressChanged, relaie à script:onStop puis appelle onPostStop s'il existe. | 537 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : relaie au script et réapplique le vent de l'environnement à tous les véhicules prêts. | 520 |
| `C:onVehicleReset(...)` | Hook relayé à self.script.onVehicleReset si le script le définit (généré dans une boucle sur la liste scriptHooks). | dyn |
| `C:processCommonSettings(flatSettings)` | Applique les réglages communs choisis par le joueur à self.setupModules : véhicule choisi (index, véhicule personnalisé, usePlayerVehicle, useCustomConfig), trafic (useTraffic) et heure de l'environnement. Ne doit pas être appelée pendant qu'une mission est active (erreur loguée sinon). | 295 |
| `C:processUserSettings(settings)` | Mémorise les réglages utilisateur dans self.userSettings ; ils sont injectés dans le flowgraph à onStart. | 324 |
| `C:retrieveProgressFromFlowgraph()` | Relit dans le flowgraph la valeur de chaque variable de progression et la copie dans self.progress ; logue une erreur pour celles introuvables. | 598 |
| `C:setBackwardsCompatibility(keyAliases)` | Convertit les anciens formats de mission vers les setupModules actuels : variables flowgraph presetVehicleActive/playerModel/..., ancien mode de véhicule (own/choice/provided), timeOfDay numérique ou objet vers environment, valeurs par défaut de cloudCover/cloudWindSpeed. Génère aussi l'attribut additionalAttributes.vehicle (own/provided/choice) s'il manque. | 329 |
| `C:setPreviewsForCustomVehicles(userSettings)` | Pour chaque réglage de type select de sélection de véhicule, complète les options « custom » (liées à setupModuleVehiclesCustom) avec la vignette, le libellé « Custom: <marque modèle> » et la classe de véhicule (gameplay_vehiclePerformance.getClassFromConfig). Affiche « Custom: (None Selected) » si le modèle ou la config n'est pas choisi. | 241 |
| `C:setupFlowgraphManager(fgFile, variables)` | Localise le fichier flowgraph (chemin relatif au dossier de la mission, sinon chemin absolu), le charge avec core_flowgraphManager.loadManager (transient=true, activity=self), puis définit les variables de progression (valeur sauvegardée prioritaire sur la valeur de la dernière tentative) et les variables de `variables`. | 69 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionProgressChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `core_environment.` `getSolarTimeOfDayOptions`, `getSolarTimeOfDayValue`, `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`, `setTimeOfDay`

**Charge les extensions :** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua`.*
