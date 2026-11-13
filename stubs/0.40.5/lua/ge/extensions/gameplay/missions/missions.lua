---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre central des missions de BeamNG. Il découvre les missions fichier (dossiers /gameplay/missions/<niveau>/<type>/.../info.json) et procédurales (générateurs du dossier proceduralMissionGenerators), les charge, les assainit, construit l'objet mission avec le constructeur de son type (/gameplay/missionTypes/<type>/constructor.lua), charge la sauvegarde de progression, et fournit les POI des missions pour la carte. Un moddeur l'utilise pour lister, retrouver, créer ou sauvegarder des missions.
--- Accès : extension `gameplay_missions_missions` : `extensions.load("gameplay_missions_missions")`, puis la globale `gameplay_missions_missions`
---@class gameplay_missions_missions
---@field dependencies string[] Extensions chargées avant : gameplay_missions_startTrigger, gameplay_missions_progress, gameplay_rawPois.
---@field onModManagerReady function Alias de clearCache : le registre est vidé quand le gestionnaire de mods est prêt (hook). L'analyse statique l'avait typé « any ».
gameplay_missions_missions = {}

--- Indique si getAllMissions a déjà été exécuté.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1024
---@return boolean  true si la liste complète est en cache.
function gameplay_missions_missions.areAllMissionsLoaded() end

--- Raccourci vers la fabrique de missionTypes/baseMission : à utiliser dans le constructor.lua d'un type de mission simple.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1311
---@param C table Classe dérivée du type.
---@param ... any Options (données de la mission).
---@return table  Mission.
---@return any  Valeur retournée par init.
function gameplay_missions_missions.baseMission(C, ...) end

--- Vide tous les caches du registre (missions, données de fichiers, locations, niveaux disponibles) : les missions seront relues au prochain accès.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1298
function gameplay_missions_missions.clearCache() end

--- Crée et sauvegarde une nouvelle mission dans /gameplay/missions/<id> avec des valeurs par défaut (type flowgraph, startTrigger de type level sur gridmap, startCondition vehicleDriven), puis la recharge et l'ajoute aux caches.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:855
---@param id string Id de la mission (niveau/type/nom).
---@param data table|nil Données initiales.
---@return table  Données chargées de la mission.
function gameplay_missions_missions.createMission(id, data) end

--- Raccourci vers la fabrique editor/util/editorElementHelper pré-configurée avec le contexte 'mission' ; sert à écrire l'éditeur d'un type de mission.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1313
---@param C table Classe d'éditeur dérivée.
---@param ... any Options.
---@return table  Éditeur.
function gameplay_missions_missions.editorHelper(C, ...) end

--- Teste si une mission existe sans la charger (niveau valide et id présent dans la liste d'infos du niveau).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1289
---@param id string Id de mission.
---@return boolean  true si elle existe.
function gameplay_missions_missions.existsMission(id) end

--- Raccourci vers la fabrique de missionTypes/flowMission : à utiliser dans le constructor.lua d'un type de mission flowgraph.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1312
---@param C table Classe dérivée du type.
---@param ... any Options (données de la mission).
---@return table  Mission.
---@return any  Valeur retournée par init.
function gameplay_missions_missions.flowMission(C, ...) end

--- Ajoute à `elements` un POI par zone de démarrage « coordinates » de la mission dans le niveau donné, si la mission est démarrable et visible (gameplay_missions_unlocks). L'id est l'id de la mission, suffixé de -<i> si plusieurs zones.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1113
---@param m table Mission.
---@param elements table Liste de POI à compléter.
---@param levelIdentifier string Niveau concerné.
function gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier) end

--- Renvoie les attributs additionnels affichables (vehicle : own/provided/choice/multi/none ; difficulty : veryLow à veryHigh) avec icône et clés de traduction.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:75
---@return table  Table clé -> {valuesSorted, valuesByKey, icon, label, translationKey}.
---@return string[]  Clés triées : {"vehicle","difficulty"}.
function gameplay_missions_missions.getAdditionalAttributes() end

--- Renvoie les ids de toutes les missions (sans les charger), triés.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1028
---@return string[]  Ids.
function gameplay_missions_missions.getAllIds() end

--- Renvoie toutes les missions de tous les niveaux, triées par id. Premier appel coûteux (charge tout) ; met à jour la progression d'util_asyncBulkLoader si elle est active.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:999
---@return table[]  Missions.
function gameplay_missions_missions.getAllMissions() end

--- Renvoie les données brutes (info.json assainies, ou missions procédurales) de toutes les missions, triées par id, avec cache distinct selon skipThumbnail.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:834
---@param skipThumbnail boolean|nil true pour une liste plus légère sans vignettes.
---@return table[]  Liste de données de mission.
function gameplay_missions_missions.getFilesData(skipThumbnail) end

--- Renvoie (avec cache) les zones de démarrage d'une mission via gameplay_missions_startTrigger.parseMission, en y ajoutant mission et name.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1071
---@param mission table Mission construite.
---@return table[]  Locations {type, level, pos, rot, radius, check, displayMarker, mission, name}.
function gameplay_missions_missions.getLocations(mission) end

--- Renvoie l'objet mission construit pour un id (avec cache), ou nil si elle n'existe pas ou si sa construction échoue.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:967
---@param id string Id de mission.
---@param infoData table|nil Infos déjà connues {dir|data, level, procedural} pour éviter la recherche.
---@return table|nil  Mission.
function gameplay_missions_missions.getMissionById(id, infoData) end

--- Renvoie l'éditeur de missions du type (require de <type>/editor.lua puis appel). S'il n'existe pas, crée un éditeur par défaut basé sur editorHelper. Utilisé par logMissionIssues et par l'éditeur.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:157
---@param missionTypeName string Nom du type.
---@return table  Objet éditeur.
function gameplay_missions_missions.getMissionEditorForType(missionTypeName) end

--- Cherche preview.jpg/png/jpeg dans le dossier de la mission, puis dans le dossier du type de mission ; sinon renvoie l'aperçu par défaut.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:189
---@param missionData table Données de mission (missionFolder, missionType).
---@return string  Chemin de l'image.
function gameplay_missions_missions.getMissionPreviewFilepath(missionData) end

--- Lit et met en cache progressSetup.json du type de mission ({} s'il n'existe pas ou est illisible).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:118
---@param missionTypeName string Nom du type.
---@return table  Données de configuration de la progression.
function gameplay_missions_missions.getMissionProgressSetupData(missionTypeName) end

--- Lit et met en cache staticData.json du type de mission ({} par défaut).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:138
---@param missionTypeName string Nom du type.
---@return table  Données statiques du type.
function gameplay_missions_missions.getMissionStaticData(missionTypeName) end

--- Charge (require) et met en cache le constructeur d'un type de mission. Logue une erreur et renvoie nil si le fichier est introuvable.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:98
---@param missionTypeName string Nom du type (dossier).
---@return function|nil  Fabrique de mission du type.
function gameplay_missions_missions.getMissionTypeConstructor(missionTypeName) end

--- Extrait le type de mission d'un id : le second segment du chemin (après le niveau), ou une chaîne vide.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:701
---@param missionId string Id de mission.
---@return string  Type de mission.
function gameplay_missions_missions.getMissionTypeFromMissionId(missionId) end

--- Liste les types de mission (noms des dossiers de /gameplay/missionTypes contenant constructor.lua). Résultat mis en cache.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:83
---@return string[]  Noms de types.
function gameplay_missions_missions.getMissionTypes() end

--- Filtre toutes les missions par niveau (startTrigger.level) et/ou par missionType.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1046
---@param filters table|nil {level=string, missionType=string}.
---@return table[]  Missions correspondantes.
function gameplay_missions_missions.getMissionsByFilter(filters) end

--- Filtre toutes les missions sur leur missionType.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1036
---@param type string Type de mission.
---@return table[]  Missions de ce type.
function gameplay_missions_missions.getMissionsByMissionType(type) end

--- Renvoie toutes les missions construites d'un niveau, triées par id (avec cache).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:980
---@param levelIdentifier string Identifiant du niveau.
---@return table[]  Missions du niveau.
function gameplay_missions_missions.getMissionsOfLevel(levelIdentifier) end

--- Chemin de l'image d'aperçu par défaut : /ui/images/noPreview.jpg.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:185
---@return string  Chemin.
function gameplay_missions_missions.getNoPreviewFilepath() end

--- Chemin de la vignette par défaut : /ui/images/noThumb.jpg.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:186
---@return string  Chemin.
function gameplay_missions_missions.getNoThumbFilepath() end

--- Chemin de la vignette « véhicule du joueur » : /ui/images/playerVehicle.jpg.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:187
---@return string  Chemin.
function gameplay_missions_missions.getNoVehicleThumbFilepath() end

--- Liste des attributs recommandés possibles pour une mission : durability, offroading, rock crawling, acceleration, top speed, nimble.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:11
---@return string[]  Noms des attributs.
function gameplay_missions_missions.getRecommendedAttributesList() end

--- Charge une mission depuis son dossier (info.json) sans cache : vérifie que le dossier est sous /gameplay/missions/ et sans espace, fixe id et missionFolder, assainit les données. Ce sont les données brutes, pas l'objet mission construit.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:581
---@param missionDir string Dossier de la mission, commençant par /gameplay/missions/.
---@param skipThumbnail boolean|nil true pour ne pas résoudre la vignette.
---@return table|nil  Données de la mission, ou nil en cas d'erreur.
function gameplay_missions_missions.loadMission(missionDir, skipThumbnail) end

--- Calcule (une seule fois) puis journalise la liste des problèmes de configuration d'une mission, via l'éditeur de son type (checkContainer et calculateMissionIssues). Gravités : unknown, minor, warning, error, critical.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1213
---@param mission table Mission (reçoit le champ _issueList).
function gameplay_missions_missions.logMissionIssues(mission) end

--- Hook appelé quand le joueur ouvre la fenêtre d'acceptation d'une activité : pour chaque POI de type « mission », ajoute une fiche (titre, étoiles, attributs additionnels, bouton « voir les détails » qui ouvre mission.details).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1145
---@param elemData table Données des POI concernés.
---@param activityData table Liste de fiches à compléter.
function gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData) end

--- Charge (require) tous les générateurs du dossier proceduralMissionGenerators ; ceux sans generate reçoivent nop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1093
function gameplay_missions_missions.onExtensionLoaded() end

--- Hook du système de POI : ajoute les POI de toutes les missions du niveau (niveau courant si nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1134
---@param levelIdentifier string|nil Niveau ; nil = niveau courant.
---@param elements table Liste de POI à compléter.
function gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Nettoie récursivement une condition : convertit un ancien branchId de condition branchLevel vers le nouveau format (career_branches.oldAttributeNamesToNewNames) et retire les « nested » des conditions qui ne sont pas multiAnd/multiOr (avertissement).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:347
---@param mId string Id de la mission (pour les logs).
---@param cond table Condition à nettoyer (modifiée en place).
function gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond) end

--- Arrête immédiatement la mission en cours, vide les caches de gameplay_markerInteraction, des déblocages et des missions (outil de développement).
---Source : lua/ge/extensions/gameplay/missions/missions.lua:1272
function gameplay_missions_missions.reloadCompleteMissionSystem() end

--- Complète la mission après construction : official, date, infos de mod, icône de carte par défaut (mission_primary_triangle), cache d'étoiles actives, récompenses (rewardAmount nil -> 0 avec erreur loguée) et méthodes par défaut (nop) ou conseils par défaut.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:272
---@param mission table Objet mission construit (modifié en place).
function gameplay_missions_missions.sanitizeMissionAfterCreation(mission) end

--- Écrit info.json (indenté) pour les données de mission : name, description, missionType, retryBehaviour, startCondition, visibleCondition, startTrigger, missionTypeData, careerSetup (sans _activeStarCache, avec les récompenses d'origine restaurées), setupModules, etc.
---Source : lua/ge/extensions/gameplay/missions/missions.lua:617
---@param missionData table Données de la mission.
---@param newFolder string|nil Dossier cible ; par défaut missionData.missionFolder.
function gameplay_missions_missions.saveMission(missionData, newFolder) end

