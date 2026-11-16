# `gameplay_missions_missions`

*Fichier : `lua/ge/extensions/gameplay/missions/missions.lua` · VM : Game Engine (GE) · 1315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missions` : `extensions.load("gameplay_missions_missions")`, puis la globale `gameplay_missions_missions`

Registre central des missions de BeamNG. Il découvre les missions fichier (dossiers /gameplay/missions/<niveau>/<type>/.../info.json) et procédurales (générateurs du dossier proceduralMissionGenerators), les charge, les assainit, construit l'objet mission avec le constructeur de son type (/gameplay/missionTypes/<type>/constructor.lua), charge la sauvegarde de progression, et fournit les POI des missions pour la carte. Un moddeur l'utilise pour lister, retrouver, créer ou sauvegarder des missions.

## Exemple

```lua
local m = gameplay_missions_missions.getMissionById('west_coast_usa/timeTrial/xyz')
for _, mi in ipairs(gameplay_missions_missions.getMissionsOfLevel('gridmap_v2')) do print(mi.id, mi.missionType) end
```

## Remarques

- L'id d'une mission est le chemin du dossier moins le préfixe /gameplay/missions/. La partie avant le premier « / » doit être un niveau connu (comparaison insensible à la casse), sinon la mission est ignorée avec un avertissement. Le chemin ne doit pas contenir d'espace.
- getAllMissions charge toutes les missions de tous les niveaux au premier appel (coûteux) ; getMissionsOfLevel / getMissionById ne chargent que ce qui est demandé. getAllMissions remplit aussi le cache par niveau.
- Un type de mission est un dossier /gameplay/missionTypes/<type>/ contenant constructor.lua (obligatoire), et facultativement editor.lua, progressSetup.json, staticData.json, preview.jpg.
- Un constructor.lua propre à une mission (<dossier de la mission>/constructor.lua) peut fusionner ses clés (sauf init) dans l'objet mission.
- sanitizeMissionAfterCreation remplace par nop les méthodes manquantes (onStart, onUpdate, onStop, stateChanged, getCommonSettingsData, etc.), calcule le cache d'étoiles (careerSetup._activeStarCache) et ajoute les infos de mod (modID, modName, modTitle).
- Les tables renvoyées par getMissionById / getAllMissions sont mises en cache et partagées : ne pas les modifier sans clearCache.
- Bug probable dans createMission : `table.insert(loaded, data)` ajoute la table data comme élément positionnel de la mission chargée (probablement l'intention était de la fusionner).
- Dans constructMissionFromFileData, `infoPath` est calculé avec la variable locale missionDir du module (la chaîne « /gameplay/missions ») et non le dossier de la mission : le chemin affiché dans le message d'erreur « did not specify a valid missionType » est donc faux.
- getAllIdsOfLevel existe en local mais n'est pas exporté.
- M.editorHelper renvoie en réalité la classe editor/util/editorElementHelper (avec le paramètre 'mission'), et non le fichier missionTypes/editorHelper.lua.

**Dépendances (chargées avant) :** `gameplay_missions_startTrigger`, `gameplay_missions_progress`, `gameplay_rawPois`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missions.areAllMissionsLoaded()` | Indique si getAllMissions a déjà été exécuté. | 1024 |
| `gameplay_missions_missions.baseMission(C, ...)` | Raccourci vers la fabrique de missionTypes/baseMission : à utiliser dans le constructor.lua d'un type de mission simple. | 1311 |
| `gameplay_missions_missions.clearCache()` | Vide tous les caches du registre (missions, données de fichiers, locations, niveaux disponibles) : les missions seront relues au prochain accès. | 1298 |
| `gameplay_missions_missions.createMission(id, data)` | Crée et sauvegarde une nouvelle mission dans /gameplay/missions/<id> avec des valeurs par défaut (type flowgraph, startTrigger de type level sur gridmap, startCondition vehicleDriven), puis la recharge et l'ajoute aux caches. | 855 |
| `gameplay_missions_missions.editorHelper(C, ...)` | Raccourci vers la fabrique editor/util/editorElementHelper pré-configurée avec le contexte 'mission' ; sert à écrire l'éditeur d'un type de mission. | 1313 |
| `gameplay_missions_missions.existsMission(id)` | Teste si une mission existe sans la charger (niveau valide et id présent dans la liste d'infos du niveau). | 1289 |
| `gameplay_missions_missions.flowMission(C, ...)` | Raccourci vers la fabrique de missionTypes/flowMission : à utiliser dans le constructor.lua d'un type de mission flowgraph. | 1312 |
| `gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier)` | Ajoute à `elements` un POI par zone de démarrage « coordinates » de la mission dans le niveau donné, si la mission est démarrable et visible (gameplay_missions_unlocks). L'id est l'id de la mission, suffixé de -<i> si plusieurs zones. | 1113 |
| `gameplay_missions_missions.getAdditionalAttributes()` | Renvoie les attributs additionnels affichables (vehicle : own/provided/choice/multi/none ; difficulty : veryLow à veryHigh) avec icône et clés de traduction. | 75 |
| `gameplay_missions_missions.getAllIds()` | Renvoie les ids de toutes les missions (sans les charger), triés. | 1028 |
| `gameplay_missions_missions.getAllMissions()` | Renvoie toutes les missions de tous les niveaux, triées par id. Premier appel coûteux (charge tout) ; met à jour la progression d'util_asyncBulkLoader si elle est active. | 999 |
| `gameplay_missions_missions.getFilesData(skipThumbnail)` | Renvoie les données brutes (info.json assainies, ou missions procédurales) de toutes les missions, triées par id, avec cache distinct selon skipThumbnail. | 834 |
| `gameplay_missions_missions.getLocations(mission)` | Renvoie (avec cache) les zones de démarrage d'une mission via gameplay_missions_startTrigger.parseMission, en y ajoutant mission et name. | 1071 |
| `gameplay_missions_missions.getMissionById(id, infoData)` | Renvoie l'objet mission construit pour un id (avec cache), ou nil si elle n'existe pas ou si sa construction échoue. | 967 |
| `gameplay_missions_missions.getMissionEditorForType(missionTypeName)` | Renvoie l'éditeur de missions du type (require de <type>/editor.lua puis appel). S'il n'existe pas, crée un éditeur par défaut basé sur editorHelper. Utilisé par logMissionIssues et par l'éditeur. | 157 |
| `gameplay_missions_missions.getMissionPreviewFilepath(missionData)` | Cherche preview.jpg/png/jpeg dans le dossier de la mission, puis dans le dossier du type de mission ; sinon renvoie l'aperçu par défaut. | 189 |
| `gameplay_missions_missions.getMissionProgressSetupData(missionTypeName)` | Lit et met en cache progressSetup.json du type de mission ({} s'il n'existe pas ou est illisible). | 118 |
| `gameplay_missions_missions.getMissionStaticData(missionTypeName)` | Lit et met en cache staticData.json du type de mission ({} par défaut). | 138 |
| `gameplay_missions_missions.getMissionTypeConstructor(missionTypeName)` | Charge (require) et met en cache le constructeur d'un type de mission. Logue une erreur et renvoie nil si le fichier est introuvable. | 98 |
| `gameplay_missions_missions.getMissionTypeFromMissionId(missionId)` | Extrait le type de mission d'un id : le second segment du chemin (après le niveau), ou une chaîne vide. | 701 |
| `gameplay_missions_missions.getMissionTypes()` | Liste les types de mission (noms des dossiers de /gameplay/missionTypes contenant constructor.lua). Résultat mis en cache. | 83 |
| `gameplay_missions_missions.getMissionsByFilter(filters)` | Filtre toutes les missions par niveau (startTrigger.level) et/ou par missionType. | 1046 |
| `gameplay_missions_missions.getMissionsByMissionType(type)` | Filtre toutes les missions sur leur missionType. | 1036 |
| `gameplay_missions_missions.getMissionsOfLevel(levelIdentifier)` | Renvoie toutes les missions construites d'un niveau, triées par id (avec cache). | 980 |
| `gameplay_missions_missions.getNoPreviewFilepath()` | Chemin de l'image d'aperçu par défaut : /ui/images/noPreview.jpg. | 185 |
| `gameplay_missions_missions.getNoThumbFilepath()` | Chemin de la vignette par défaut : /ui/images/noThumb.jpg. | 186 |
| `gameplay_missions_missions.getNoVehicleThumbFilepath()` | Chemin de la vignette « véhicule du joueur » : /ui/images/playerVehicle.jpg. | 187 |
| `gameplay_missions_missions.getRecommendedAttributesList()` | Liste des attributs recommandés possibles pour une mission : durability, offroading, rock crawling, acceleration, top speed, nimble. | 11 |
| `gameplay_missions_missions.loadMission(missionDir, skipThumbnail)` | Charge une mission depuis son dossier (info.json) sans cache : vérifie que le dossier est sous /gameplay/missions/ et sans espace, fixe id et missionFolder, assainit les données. Ce sont les données brutes, pas l'objet mission construit. | 581 |
| `gameplay_missions_missions.logMissionIssues(mission)` | Calcule (une seule fois) puis journalise la liste des problèmes de configuration d'une mission, via l'éditeur de son type (checkContainer et calculateMissionIssues). Gravités : unknown, minor, warning, error, critical. | 1213 |
| `gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData)` | Hook appelé quand le joueur ouvre la fenêtre d'acceptation d'une activité : pour chaque POI de type « mission », ajoute une fiche (titre, étoiles, attributs additionnels, bouton « voir les détails » qui ouvre mission.details). *(interne)* *(hook)* | 1145 |
| `gameplay_missions_missions.onExtensionLoaded()` | Charge (require) tous les générateurs du dossier proceduralMissionGenerators ; ceux sans generate reçoivent nop. *(interne)* *(hook)* | 1093 |
| `gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook du système de POI : ajoute les POI de toutes les missions du niveau (niveau courant si nil). *(interne)* *(hook)* | 1134 |
| `gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond)` | Nettoie récursivement une condition : convertit un ancien branchId de condition branchLevel vers le nouveau format (career_branches.oldAttributeNamesToNewNames) et retire les « nested » des conditions qui ne sont pas multiAnd/multiOr (avertissement). | 347 |
| `gameplay_missions_missions.reloadCompleteMissionSystem()` | Arrête immédiatement la mission en cours, vide les caches de gameplay_markerInteraction, des déblocages et des missions (outil de développement). | 1272 |
| `gameplay_missions_missions.sanitizeMissionAfterCreation(mission)` | Complète la mission après construction : official, date, infos de mod, icône de carte par défaut (mission_primary_triangle), cache d'étoiles actives, récompenses (rewardAmount nil -> 0 avec erreur loguée) et méthodes par défaut (nop) ou conseils par défaut. | 272 |
| `gameplay_missions_missions.saveMission(missionData, newFolder)` | Écrit info.json (indenté) pour les données de mission : name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (sans _activeStarCache, avec les récompenses d'origine restaurées), setupModules, etc. | 617 |

### Détail des paramètres

#### `gameplay_missions_missions.areAllMissionsLoaded()`

Indique si getAllMissions a déjà été exécuté.

- **renvoie** : boolean true si la liste complète est en cache.

#### `gameplay_missions_missions.baseMission(C, ...)`

Raccourci vers la fabrique de missionTypes/baseMission : à utiliser dans le constructor.lua d'un type de mission simple.

- `C` (*table*) : Classe dérivée du type.
- `...` (*any*) : Options (données de la mission).
- **renvoie** : table Mission.
- **renvoie** : any Valeur retournée par init.

#### `gameplay_missions_missions.createMission(id, data)`

Crée et sauvegarde une nouvelle mission dans /gameplay/missions/<id> avec des valeurs par défaut (type flowgraph, startTrigger de type level sur gridmap, startCondition vehicleDriven), puis la recharge et l'ajoute aux caches.

- `id` (*string*) : Id de la mission (niveau/type/nom).
- `data` (*table|nil*) : Données initiales.
- **renvoie** : table Données chargées de la mission.

#### `gameplay_missions_missions.editorHelper(C, ...)`

Raccourci vers la fabrique editor/util/editorElementHelper pré-configurée avec le contexte 'mission' ; sert à écrire l'éditeur d'un type de mission.

- `C` (*table*) : Classe d'éditeur dérivée.
- `...` (*any*) : Options.
- **renvoie** : table Éditeur.

#### `gameplay_missions_missions.existsMission(id)`

Teste si une mission existe sans la charger (niveau valide et id présent dans la liste d'infos du niveau).

- `id` (*string*) : Id de mission.
- **renvoie** : boolean true si elle existe.

#### `gameplay_missions_missions.flowMission(C, ...)`

Raccourci vers la fabrique de missionTypes/flowMission : à utiliser dans le constructor.lua d'un type de mission flowgraph.

- `C` (*table*) : Classe dérivée du type.
- `...` (*any*) : Options (données de la mission).
- **renvoie** : table Mission.
- **renvoie** : any Valeur retournée par init.

#### `gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier)`

Ajoute à `elements` un POI par zone de démarrage « coordinates » de la mission dans le niveau donné, si la mission est démarrable et visible (gameplay_missions_unlocks). L'id est l'id de la mission, suffixé de -<i> si plusieurs zones.

- `m` (*table*) : Mission.
- `elements` (*table*) : Liste de POI à compléter.
- `levelIdentifier` (*string*) : Niveau concerné.

#### `gameplay_missions_missions.getAdditionalAttributes()`

Renvoie les attributs additionnels affichables (vehicle : own/provided/choice/multi/none ; difficulty : veryLow à veryHigh) avec icône et clés de traduction.

- **renvoie** : table Table clé -> {valuesSorted, valuesByKey, icon, label, translationKey}.
- **renvoie** : string[] Clés triées : {"vehicle","difficulty"}.

#### `gameplay_missions_missions.getAllIds()`

Renvoie les ids de toutes les missions (sans les charger), triés.

- **renvoie** : string[] Ids.

#### `gameplay_missions_missions.getAllMissions()`

Renvoie toutes les missions de tous les niveaux, triées par id. Premier appel coûteux (charge tout) ; met à jour la progression d'util_asyncBulkLoader si elle est active.

- **renvoie** : table[] Missions.

#### `gameplay_missions_missions.getFilesData(skipThumbnail)`

Renvoie les données brutes (info.json assainies, ou missions procédurales) de toutes les missions, triées par id, avec cache distinct selon skipThumbnail.

- `skipThumbnail` (*boolean|nil*) : true pour une liste plus légère sans vignettes.
- **renvoie** : table[] Liste de données de mission.

#### `gameplay_missions_missions.getLocations(mission)`

Renvoie (avec cache) les zones de démarrage d'une mission via gameplay_missions_startTrigger.parseMission, en y ajoutant mission et name.

- `mission` (*table*) : Mission construite.
- **renvoie** : table[] Locations {type, level, pos, rot, radius, check, displayMarker, mission, name}.

#### `gameplay_missions_missions.getMissionById(id, infoData)`

Renvoie l'objet mission construit pour un id (avec cache), ou nil si elle n'existe pas ou si sa construction échoue.

- `id` (*string*) : Id de mission.
- `infoData` (*table|nil*) : Infos déjà connues {dir|data, level, procedural} pour éviter la recherche.
- **renvoie** : table|nil Mission.

#### `gameplay_missions_missions.getMissionEditorForType(missionTypeName)`

Renvoie l'éditeur de missions du type (require de <type>/editor.lua puis appel). S'il n'existe pas, crée un éditeur par défaut basé sur editorHelper. Utilisé par logMissionIssues et par l'éditeur.

- `missionTypeName` (*string*) : Nom du type.
- **renvoie** : table Objet éditeur.

#### `gameplay_missions_missions.getMissionPreviewFilepath(missionData)`

Cherche preview.jpg/png/jpeg dans le dossier de la mission, puis dans le dossier du type de mission ; sinon renvoie l'aperçu par défaut.

- `missionData` (*table*) : Données de mission (missionFolder, missionType).
- **renvoie** : string Chemin de l'image.

#### `gameplay_missions_missions.getMissionProgressSetupData(missionTypeName)`

Lit et met en cache progressSetup.json du type de mission ({} s'il n'existe pas ou est illisible).

- `missionTypeName` (*string*) : Nom du type.
- **renvoie** : table Données de configuration de la progression.

#### `gameplay_missions_missions.getMissionStaticData(missionTypeName)`

Lit et met en cache staticData.json du type de mission ({} par défaut).

- `missionTypeName` (*string*) : Nom du type.
- **renvoie** : table Données statiques du type.

#### `gameplay_missions_missions.getMissionTypeConstructor(missionTypeName)`

Charge (require) et met en cache le constructeur d'un type de mission. Logue une erreur et renvoie nil si le fichier est introuvable.

- `missionTypeName` (*string*) : Nom du type (dossier).
- **renvoie** : function|nil Fabrique de mission du type.

#### `gameplay_missions_missions.getMissionTypeFromMissionId(missionId)`

Extrait le type de mission d'un id : le second segment du chemin (après le niveau), ou une chaîne vide.

- `missionId` (*string*) : Id de mission.
- **renvoie** : string Type de mission.

#### `gameplay_missions_missions.getMissionTypes()`

Liste les types de mission (noms des dossiers de /gameplay/missionTypes contenant constructor.lua). Résultat mis en cache.

- **renvoie** : string[] Noms de types.

#### `gameplay_missions_missions.getMissionsByFilter(filters)`

Filtre toutes les missions par niveau (startTrigger.level) et/ou par missionType.

- `filters` (*table|nil*) : {level=string, missionType=string}.
- **renvoie** : table[] Missions correspondantes.

#### `gameplay_missions_missions.getMissionsByMissionType(type)`

Filtre toutes les missions sur leur missionType.

- `type` (*string*) : Type de mission.
- **renvoie** : table[] Missions de ce type.

#### `gameplay_missions_missions.getMissionsOfLevel(levelIdentifier)`

Renvoie toutes les missions construites d'un niveau, triées par id (avec cache).

- `levelIdentifier` (*string*) : Identifiant du niveau.
- **renvoie** : table[] Missions du niveau.

#### `gameplay_missions_missions.getNoPreviewFilepath()`

Chemin de l'image d'aperçu par défaut : /ui/images/noPreview.jpg.

- **renvoie** : string Chemin.

#### `gameplay_missions_missions.getNoThumbFilepath()`

Chemin de la vignette par défaut : /ui/images/noThumb.jpg.

- **renvoie** : string Chemin.

#### `gameplay_missions_missions.getNoVehicleThumbFilepath()`

Chemin de la vignette « véhicule du joueur » : /ui/images/playerVehicle.jpg.

- **renvoie** : string Chemin.

#### `gameplay_missions_missions.getRecommendedAttributesList()`

Liste des attributs recommandés possibles pour une mission : durability, offroading, rock crawling, acceleration, top speed, nimble.

- **renvoie** : string[] Noms des attributs.

#### `gameplay_missions_missions.loadMission(missionDir, skipThumbnail)`

Charge une mission depuis son dossier (info.json) sans cache : vérifie que le dossier est sous /gameplay/missions/ et sans espace, fixe id et missionFolder, assainit les données. Ce sont les données brutes, pas l'objet mission construit.

- `missionDir` (*string*) : Dossier de la mission, commençant par /gameplay/missions/.
- `skipThumbnail` (*boolean|nil*) : true pour ne pas résoudre la vignette.
- **renvoie** : table|nil Données de la mission, ou nil en cas d'erreur.

#### `gameplay_missions_missions.logMissionIssues(mission)`

Calcule (une seule fois) puis journalise la liste des problèmes de configuration d'une mission, via l'éditeur de son type (checkContainer et calculateMissionIssues). Gravités : unknown, minor, warning, error, critical.

- `mission` (*table*) : Mission (reçoit le champ _issueList).

#### `gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData)`

Hook appelé quand le joueur ouvre la fenêtre d'acceptation d'une activité : pour chaque POI de type « mission », ajoute une fiche (titre, étoiles, attributs additionnels, bouton « voir les détails » qui ouvre mission.details).

- `elemData` (*table*) : Données des POI concernés.
- `activityData` (*table*) : Liste de fiches à compléter.

#### `gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook du système de POI : ajoute les POI de toutes les missions du niveau (niveau courant si nil).

- `levelIdentifier` (*string|nil*) : Niveau ; nil = niveau courant.
- `elements` (*table*) : Liste de POI à compléter.

#### `gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond)`

Nettoie récursivement une condition : convertit un ancien branchId de condition branchLevel vers le nouveau format (career_branches.oldAttributeNamesToNewNames) et retire les « nested » des conditions qui ne sont pas multiAnd/multiOr (avertissement).

- `mId` (*string*) : Id de la mission (pour les logs).
- `cond` (*table*) : Condition à nettoyer (modifiée en place).

#### `gameplay_missions_missions.sanitizeMissionAfterCreation(mission)`

Complète la mission après construction : official, date, infos de mod, icône de carte par défaut (mission_primary_triangle), cache d'étoiles actives, récompenses (rewardAmount nil -> 0 avec erreur loguée) et méthodes par défaut (nop) ou conseils par défaut.

- `mission` (*table*) : Objet mission construit (modifié en place).

#### `gameplay_missions_missions.saveMission(missionData, newFolder)`

Écrit info.json (indenté) pour les données de mission : name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (sans _activeStarCache, avec les récompenses d'origine restaurées), setupModules, etc.

- `missionData` (*table*) : Données de la mission.
- `newFolder` (*string|nil*) : Dossier cible ; par défaut missionData.missionFolder.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : gameplay_missions_startTrigger, gameplay_missions_progress, gameplay_rawPois. |
| `onModManagerReady` | function | Alias de clearCache : le registre est vidé quand le gestionnaire de mods est prêt (hook). L'analyse statique l'avait typé « any ». |

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missions.lua`.*
