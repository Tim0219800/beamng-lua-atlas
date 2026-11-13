---@meta
-- tim19Atlas stub generated from lua/ge/ge_utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Comme vehiclesIterator mais ne parcourt que les véhicules actifs (veh:getActive()).
---Source : lua/ge/ge_utils.lua:563
---@param ctx table|nil contexte réutilisable
---@return function  itérateur
---@return table  contexte
function activeVehiclesIterator(ctx) end

--- Crée un objet Prefab (v1, chargement manuel) sans le charger. Logue une erreur et renvoie nil si le nom existe déjà.
---Source : lua/ge/ge_utils.lua:722
---@param objName string nom du prefab
---@param objFileName string fichier prefab
---@param objPos string position 'x y z' (champ TorqueScript)
---@param objRotation string rotation 'x y z angle'
---@param objScale string échelle 'x y z'
---@param useGlobalTranslation boolean|nil défaut false
---@return table|nil  prefab créé
function addPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation) end

--- Sur PS5/PS5 Pro uniquement, vérifie qu'il reste assez de mémoire (défaut 1 Go) ; sinon affiche un toast, journalise et émet onVehicleSpawnBlocked(availableGB, minGB). Sur les autres plateformes renvoie toujours true.
---Source : lua/ge/ge_utils.lua:891
---@param minGB number|nil mémoire libre minimale (Go)
---@return boolean|nil  true si possible, nil sinon (pas de return explicite)
function canSpawnAnotherVehicle(minGB) end

--- Raycast lent (Engine.castRay) entre deux points. Renvoie nil sans impact, sinon la table du moteur avec pt et norm convertis en vec3.
---Source : lua/ge/ge_utils.lua:1329
---@param origin vec3 point de départ (m)
---@param target vec3 point d'arrivée (m)
---@param includeTerrain boolean|nil inclure le terrain (false par défaut)
---@param renderGeometry boolean|nil utiliser la géométrie de rendu (false par défaut)
---@return table|nil  résultat avec pt et norm
function castRay(origin, target, includeTerrain, renderGeometry) end

--- Comme castRay avec dessin debug (sphères de départ/arrivée, ligne verte si impact, rouge sinon, normale).
---Source : lua/ge/ge_utils.lua:1342
---@param origin vec3 départ
---@param target vec3 arrivée
---@param includeTerrain boolean|nil terrain
---@param renderGeometry boolean|nil géométrie de rendu
---@return table|nil  résultat
function castRayDebug(origin, target, includeTerrain, renderGeometry) end

--- Teste si le champ propertyName de l'objet de scène du véhicule vaut value.
---Source : lua/ge/ge_utils.lua:854
---@param vid integer id du véhicule
---@param propertyName string champ
---@param value any valeur comparée
---@return boolean|nil  résultat (nil/false si introuvable)
function checkVehicleProperty(vid, propertyName, value) end

--- Debug : recharge la collision (be:reloadCollision) et affiche la durée en ms.
---Source : lua/ge/ge_utils.lua:427
function collisionReloadTest() end

--- Convertit une liste de couleurs {r,g,b,a} en liste de paints (createVehiclePaint + validateVehiclePaint).
---Source : lua/ge/ge_utils.lua:933
---@param colorTable table<integer, number[]> couleurs à 4 composantes
---@return table<integer, table>  paints
function convertVehicleColorsToPaints(colorTable) end

--- Transforme une table indexée par id de véhicule en table indexée par nom de véhicule (champ 'name').
---Source : lua/ge/ge_utils.lua:1375
---@param data table table par id
---@return table|nil  table par nom ; nil si data n'est pas une table
function convertVehicleIdKeysToVehicleNameKeys(data) end

--- Inverse : transforme une table indexée par nom de véhicule en table indexée par id.
---Source : lua/ge/ge_utils.lua:1398
---@param data table table par nom
---@return table  table par id (vide si erreur)
function convertVehicleNameKeysToVehicleIdKeys(data) end

--- Copie un fichier texte (modes 'r'/'w' : peut altérer un fichier binaire sous Windows). Renvoie nil si ouverture impossible.
---Source : lua/ge/ge_utils.lua:1582
---@param src string source
---@param dst string destination
function copyfile(src, dst) end

--- Crée un objet de la classe C++ exposée en globale (ex. 'SimGroup', 'TSStatic') et incrémente son compteur de références. Logue une erreur et renvoie nil si la classe n'existe pas. Il faut ensuite appeler :registerObject(nom).
---Source : lua/ge/ge_utils.lua:414
---@param className string nom de la classe
---@return table|nil  nouvel objet
function createObject(className) end

--- Construit la table {model=, options={config, paint, licenseText, vehicleName, pos, rot}} pour le spawn d'un véhicule joueur.
---Source : lua/ge/ge_utils.lua:1274
---@param model string modèle
---@param config string configuration
---@param color string|table|nil couleur
---@param licenseText string|nil plaque
---@param vehicleName string|nil nom de l'objet
---@param pos vec3|nil position
---@param rot quat|nil rotation
---@return table  données de spawn
function createPlayerSpawningData(model, config, color, licenseText, vehicleName, pos, rot) end

--- Construit une table paint {baseColor={r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}. Valeurs par défaut : couleur blanche, metallic 0.2, roughness 0.5, clearcoat 0.8, clearcoatRoughness 0.
---Source : lua/ge/ge_utils.lua:949
---@param color table|nil {x,y,z,w} (r,g,b,a)
---@param metallicData table|nil {metallic=,roughness=,clearcoat=,clearcoatRoughness=} ou tableau de 4 nombres
---@return table  paint
function createVehiclePaint(color, metallicData) end

--- Supprime l'objet de scène portant ce nom s'il existe.
---Source : lua/ge/ge_utils.lua:281
---@param name string nom de l'objet
function deleteObject(name) end

--- Liste récursive de tout le contenu (fichiers) de path via FS:findFiles.
---Source : lua/ge/ge_utils.lua:1438
---@param path string dossier
---@return table<integer, string>  chemins
function dirContent(path) end

--- Journalise la mémoire GPU par catégorie (Engine.Render.calculateGfxMemory), en Mo, pour celles dépassant 1 Mo.
---Source : lua/ge/ge_utils.lua:1747
function dumpGfxResourcesMemory() end

--- Échappe les caractères magiques d'un motif Lua pour un usage littéral.
---Source : lua/ge/ge_utils.lua:1478
---@param str string texte
---@return string  texte échappé
function escape_magic(str) end

--- Extrait {config, licenseText, color, model, vehicleName} d'un véhicule de la scène, ou renvoie le véhicule utilisateur de la campagne en cours s'il y en a un.
---Source : lua/ge/ge_utils.lua:1301
---@param vid integer id du véhicule
---@return table|nil  données ; nil et avertissement si l'id est invalide
function extractVehicleData(vid) end

--- Renvoie path s'il s'agit d'un fichier existant, sinon nil.
---Source : lua/ge/ge_utils.lua:1442
---@param path string fichier
---@return string|nil  chemin ou nil
function fileExistsOrNil(path) end

--- Complète une table d'options de spawn de véhicule : résout config (.pc ou nom), paints (color/paintName/paint pour 1 à 3 couleurs), config par défaut du modèle. Modifie et renvoie opt.
---Source : lua/ge/ge_utils.lua:1091
---@param modelName string nom du modèle de véhicule
---@param opt table|nil options (config, color, paintName, paint…)
---@return table  options complétées
function fillVehicleSpawnOptionDefaults(modelName, opt) end

--- Appelle callback(nom, canal) pour chaque objet SFXSourceChannel de la scène.
---Source : lua/ge/ge_utils.lua:598
---@param callback function fonction(name, channel)
function forEachAudioChannel(callback) end

--- Génère un nom objectName + (plus grand id d'objet de la classe + 1).
---Source : lua/ge/ge_utils.lua:1676
---@param className string classe
---@param objectName string préfixe
---@return string  nom
function generateObjectNameForClass(className, objectName) end

--- Renvoie la liste (en cache) de tous les objets BeamNGVehicle présents dans le niveau.
---Source : lua/ge/ge_utils.lua:503
---@return table<integer, table>  véhicules
function getAllVehicles() end

--- Filtre getAllVehicles par type de modèle (core_vehicles.getModel(veh.jbeam).model.Type).
---Source : lua/ge/ge_utils.lua:518
---@param typeList table<integer, string>|nil types voulus ; défaut {'Car','Truck','Automation','Traffic'}
---@return table<integer, table>  véhicules retenus
function getAllVehiclesByType(typeList) end

--- Renvoie les volumes courants de tous les canaux audio.
---Source : lua/ge/ge_utils.lua:609
---@return table<string, number>  volume par nom de canal
function getAudioChannelsVolume() end

--- Cherche le véhicule actif le plus proche de requesterID et rappelle le Lua du véhicule demandeur : callbackfct(id, distance) ou callbackfct(-1,-1) si aucun.
---Source : lua/ge/ge_utils.lua:574
---@param requesterID integer id du véhicule demandeur
---@param callbackfct string nom d'une fonction côté VLua du demandeur
function getClosestVehicle(requesterID, callbackfct) end

--- Renvoie la liste des opérateurs de comparaison {opSymbol, op, opName, opNameLc} : ==, <, >, <=, >=, ~=.
---Source : lua/ge/ge_utils.lua:1704
---@return table<integer, table>  opérateurs
function getComparisonOps() end

--- Date et heure UTC courantes au format ISO 8601 avec millisecondes, ex. 2023-01-01T12:00:00.123Z.
---Source : lua/ge/ge_utils.lua:1648
---@return string  horodatage
function getDateTimeUTCString() end

--- Liste les sous-dossiers immédiats (chemins complets) de path.
---Source : lua/ge/ge_utils.lua:1593
---@param path string dossier
---@return table<integer, string>  dossiers
function getDirectories(path) end

--- Liste des sous-dossiers de path sur recursiveLevels niveaux (filtre les entrées ressemblant à des fichiers).
---Source : lua/ge/ge_utils.lua:1449
---@param path string dossier
---@param recursiveLevels integer niveaux de récursion (-1 illimité)
---@return table<integer, string>  dossiers uniques
function getDirs(path, recursiveLevels) end

--- Taille d'un fichier en octets (ouvert avec io.open), -1 s'il est illisible.
---Source : lua/ge/ge_utils.lua:1466
---@param filename string fichier
---@return integer  taille ou -1
function getFileSize(filename) end

--- Renvoie les noms des paramètres d'une fonction Lua (debug.getlocal) et si elle est variadique. Lent.
---Source : lua/ge/ge_utils.lua:1667
---@param func function fonction
---@return table<integer, string>  noms
---@return boolean  variadique
function getFunctionParameters(func) end

--- Estime le nombre maximal de véhicules : nombre de cœurs physiques, limité par la mémoire disponible en Go et par limit.
---Source : lua/ge/ge_utils.lua:867
---@param limit integer|nil plafond (128 par défaut)
---@return integer  nombre estimé
function getMaxVehicleAmount(limit) end

--- Renvoie le premier objet de scène de la classe donnée (ex. 'TimeOfDay').
---Source : lua/ge/ge_utils.lua:650
---@param className string classe C++
---@return table|nil  objet ou nil
function getObjectByClass(className) end

--- Version avec cache de be:getObjectByID(id) : renvoie le véhicule d'id donné.
---Source : lua/ge/ge_utils.lua:450
---@param id integer id de l'objet véhicule
---@return table|nil  objet BeamNGVehicle
function getObjectByID(id) end

--- Renvoie tous les objets de scène de la classe donnée (ex. 'CloudLayer').
---Source : lua/ge/ge_utils.lua:659
---@param className string classe C++
---@return table<integer, table>|nil  objets ; nil si aucun
function getObjectsByClass(className) end

--- Remonte les parents Prefab (v1) de obj et renvoie le prefab de plus haut niveau.
---Source : lua/ge/ge_utils.lua:380
---@param obj table objet de scène
---@return table|nil  prefab racine, nil s'il n'y en a pas
function getOwningPrefab(obj) end

--- Idem pour les instances de PrefabV2 (Engine.Prefab.findContainingPrefabInstance), renvoie l'instance de plus haut niveau.
---Source : lua/ge/ge_utils.lua:393
---@param obj table objet de scène
---@return table|nil  instance racine ou nil
function getOwningPrefabInstance(obj) end

--- Version avec cache de be:getPlayerVehicle(player) (évite de générer du garbage). Renvoie le véhicule contrôlé par le joueur, ou nil.
---Source : lua/ge/ge_utils.lua:441
---@param player integer index du joueur (0 = joueur principal)
---@return table|nil  objet BeamNGVehicle
function getPlayerVehicle(player) end

--- Tire un paint au hasard parmi ceux du modèle. Avec commonPaintProb, favorise des couleurs réelles courantes (blanc, noir, gris, argent, bleu, rouge) en choisissant le paint du modèle le plus proche. Modèle de repli : 'pessima'.
---Source : lua/ge/ge_utils.lua:1025
---@param vehId integer|nil id du véhicule modèle
---@param commonPaintProb number|nil probabilité 0 à 1 de viser une couleur courante (0 par défaut)
---@return string  nom du paint
---@return table  paint
function getRandomPaint(vehId, commonPaintProb) end

--- Rayon d'un waypoint de scène : le plus grand des 3 composantes de l'échelle.
---Source : lua/ge/ge_utils.lua:849
---@param o table objet de scène
---@return number  rayon (m)
function getSceneWaypointRadius(o) end

--- Renvoie l'heure du jeu (objet TimeOfDay), format 24 h. Nil s'il n'y a pas d'objet TimeOfDay dans la scène.
---Source : lua/ge/ge_utils.lua:671
---@param asString boolean|nil true : chaîne 'HH:MM:SS' ; sinon table {hours, mins, secs}
---@return string|table|nil  heure
function getTimeOfDay(asString) end

--- Renvoie la couleur principale du véhicule sous forme de chaîne 'r g b a metallic roughness clearcoat clearcoatRoughness' (valeurs arrondies à 0,01). Véhicule joueur 0 si vehicleID est nil ; chaîne vide si introuvable.
---Source : lua/ge/ge_utils.lua:478
---@param vehicleID integer|nil id du véhicule
---@return string  chaîne de 8 valeurs séparées par des espaces
function getVehicleColor(vehicleID) end

--- Comme getVehicleColor mais pour colorPalette<index> (index 0 ou 1 selon le véhicule), avec les données métalliques courantes.
---Source : lua/ge/ge_utils.lua:489
---@param index integer numéro de palette
---@param vehicleId integer|nil id du véhicule (joueur 0 par défaut)
---@return string|nil  chaîne de 8 valeurs, nil si pas de véhicule
function getVehicleColorPalette(index, vehicleId) end

--- Paint actuel d'un véhicule (couleur et données métalliques de l'objet de scène).
---Source : lua/ge/ge_utils.lua:966
---@param vehicleId integer|nil id (joueur 0 par défaut)
---@return table|nil  paint
function getVehiclePaint(vehicleId) end

--- Renvoie path s'il existe, sinon fallbackPath ou '/ui/images/appDefault.png'.
---Source : lua/ge/ge_utils.lua:1430
---@param path string|nil image
---@param fallbackPath string|nil image de repli
---@return string  chemin retenu
function imageExistsDefault(path, fallbackPath) end

--- Vide les caches de getPlayerVehicle et getObjectByID. Appelée par main.lua à chaque spawn, changement ou destruction de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/ge_utils.lua:436
function invalidatePlayerVehicles() end

--- Invalide le cache de getAllVehicles / vehiclesIterator. Appelée par main.lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/ge_utils.lua:497
function invalidateVehicleCache() end

--- Vrai si le chemin réel commence par le dossier du jeu.
---Source : lua/ge/ge_utils.lua:1416
---@param path string chemin réel
---@return boolean  résultat
function isOfficialContent(path) end

--- Idem pour un chemin virtuel (résolu par FS:getFileRealPath).
---Source : lua/ge/ge_utils.lua:1420
---@param vpath string chemin virtuel
---@return boolean  résultat
function isOfficialContentVPath(vpath) end

--- Vrai si le fichier est un .pc situé dans le dossier vehicles/ de l'utilisateur (config créée par le joueur).
---Source : lua/ge/ge_utils.lua:1424
---@param vpath string chemin virtuel du .pc
---@return boolean  résultat
function isPlayerVehConfig(vpath) end

--- Charge un fichier prefab PrefabV2 comme modèle nommé d'après son chemin (/ -> _, _ -> __).
---Source : lua/ge/ge_utils.lua:710
---@param filename string chemin du .prefab.json
function loadPrefabv2Template(filename) end

--- Journalise les statistiques de RAM (Engine.Platform.getMemoryInfo) au niveau de log donné.
---Source : lua/ge/ge_utils.lua:885
---@param lovLevel string niveau de log ('I','W'...) ; nom du paramètre tel quel dans le code
function logMemoryInfo(lovLevel) end

--- Chargeur de repli appelé quand le chargeur par défaut ne trouve pas un module : sait charger les plugins workbench/panels/... depuis leur chemin VFS littéral.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/ge_utils.lua:1715
---@param modulename string nom du module
---@return function|nil  chunk chargé ou nil
function moduleLoaderFallback(modulename) end

--- Crée un limiteur de fréquence : limiter:update(dt) renvoie true environ targetFPS fois par seconde. À appeler depuis onPreRender/onUpdate.
---Source : lua/ge/ge_utils.lua:1615
---@param targetFPS number fréquence voulue (Hz)
---@return table  objet avec update(self, dt)
function newFPSLimiter(targetFPS) end

--- Convertit une chaîne ISO 8601 (YYYY-MM-DDTHH:MM:SS.mmmZ) en os.time ; les millisecondes sont ignorées et le fuseau est celui de la machine (os.time).
---Source : lua/ge/ge_utils.lua:1659
---@param isoString string date
---@return integer  secondes epoch
function parseISO8601Date(isoString) end

--- Désactive l'ActionMap nommée <map>ActionMap (pop).
---Source : lua/ge/ge_utils.lua:830
---@param map string nom sans le suffixe ActionMap
---@return any  résultat, ou false si introuvable
function popActionMap(map) end

--- Indique si obj est dans le SimGroup nommé groupName, soit directement, soit via son prefab parent.
---Source : lua/ge/ge_utils.lua:359
---@param obj table|nil objet de scène
---@param groupName string nom du SimGroup
---@return boolean  true si contenu
function prefabIsChildOfGroup(obj, groupName) end

--- Active l'ActionMap nommée <map>ActionMap (push).
---Source : lua/ge/ge_utils.lua:818
---@param map string nom sans le suffixe ActionMap
---@return any  résultat de push, ou false si introuvable
function pushActionMap(map) end

--- Comme pushActionMap mais avec priorité maximale (pushFirst).
---Source : lua/ge/ge_utils.lua:824
---@param map string nom sans le suffixe ActionMap
---@return any  résultat, ou false si introuvable
function pushActionMapHighestPriority(map) end

--- Exécute vluaCommand dans le Lua du véhicule puis rappelle la fonction GE geluaFunctionName avec le résultat de la commande suivi de ...  Préférer l'API vehicleBridge quand c'est possible.
---Source : lua/ge/ge_utils.lua:837
---@param veh table objet véhicule
---@param geluaFunctionName string nom de fonction GE (globale ou chemin)
---@param vluaCommand string expression Lua évaluée côté véhicule
---@param ... any arguments additionnels sérialisables
function queueCallbackInVehicle(veh, geluaFunctionName, vluaCommand, ...) end

--- Génère une chaîne aléatoire de chiffres et lettres.
---Source : lua/ge/ge_utils.lua:1546
---@param len integer longueur
---@return string  chaîne
function randomASCIIString(len) end

--- Enregistre une action dans un tampon circulaire du moteur, imprimé au log en cas de crash ou à l'arrêt ; les actions identiques consécutives sont fusionnées.
---Source : lua/ge/ge_utils.lua:905
---@param text string texte de l'action
function recordPlayerAction(text) end

--- Décharge et supprime le prefab de ce nom s'il existe.
---Source : lua/ge/ge_utils.lua:809
---@param objName string nom du prefab
function removePrefab(objName) end

--- Remplace le caractère à la position pos de str par r.
---Source : lua/ge/ge_utils.lua:221
---@param pos integer position (1 = premier)
---@param str string chaîne
---@param r string remplacement
---@return string  str dont le caractère à pos est remplacé par r
function replace_char(pos, str, r) end

--- Appelle fillVehicleSpawnOptionDefaults, valide les paints, recopie licenseText et vehicleName, et calcule pos/rot par défaut : à 5 m à gauche du véhicule joueur et même orientation, ou devant la caméra libre.
---Source : lua/ge/ge_utils.lua:1217
---@param model string modèle
---@param opt table options de spawn
---@return table  options finales (pos vec3, rot quat, paint, paint2, paint3…)
function sanitizeVehicleSpawnOptions(model, opt) end

--- Tests de dev des champs d'objets de scène.
---Source : lua/ge/ge_utils.lua:144
function scenetree_test_fields() end

--- Tests de dev de scenetree (marqués à convertir en vrais tests unitaires).
---Source : lua/ge/ge_utils.lua:96
function scenetree_tests() end

--- Applique des volumes à des canaux audio par nom (format de getAudioChannelsVolume).
---Source : lua/ge/ge_utils.lua:618
---@param data table<string, number> volume par nom de canal
function setAudioChannelsVolume(data) end

--- OBSOLÈTE : n'a plus d'effet, journalise une erreur (au plus 5 fois).
---Source : lua/ge/ge_utils.lua:1773
function setCEFFocus() end

--- Règle les réglages trafficAmount et trafficParkingAmount à (max estimé - 1, minimum 1). Utilisée par les options principales.
---Source : lua/ge/ge_utils.lua:874
---@param limit integer|nil plafond (8 par défaut)
function setMaxVehicleAmountForTraffic(limit) end

--- Règle l'heure du jeu.
---Source : lua/ge/ge_utils.lua:687
---@param inp string|table '13:00', '13:00:30' ou {hours=, mins=, secs=}
---@return boolean|nil  false s'il n'y a pas d'objet TimeOfDay ; nil sinon
function setTimeOfDay(inp) end

--- Écrit le champ propertyName de l'objet de scène du véhicule.
---Source : lua/ge/ge_utils.lua:859
---@param vid integer id du véhicule
---@param propertyName string champ
---@param value any valeur
function setVehicleProperty(vid, propertyName, value) end

--- Concatène 4 valeurs avec des espaces en réutilisant une table interne (pas d'allocation).
---Source : lua/ge/ge_utils.lua:1577
---@param a any valeur 1
---@param b any valeur 2
---@param c any valeur 3
---@param d any valeur 4
---@return string  'a b c d'
function spaceSeparated4Values(a, b, c, d) end

--- Crée et charge un prefab dans MissionGroup. Si le fichier se termine par .prefab.json et décrit une classe PrefabV2, instancie le modèle (créé au besoin) ; sinon utilise addPrefab + load. Active la reconstruction de collision si l'éditeur est actif.
---Source : lua/ge/ge_utils.lua:744
---@param objName string nom de l'instance
---@param objFileName string fichier prefab
---@param objPos string|vec3 position
---@param objRotation string|QuatF rotation
---@param objScale string|vec3 échelle
---@param useGlobalTranslation boolean|nil seulement pour les prefabs v1
---@return table|nil  prefab ou instance créé
function spawnPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation) end

--- Découpe une chaîne selon un séparateur (motif de classe de caractères, défaut '%s' = espaces) ; les champs vides sont ignorés.
---Source : lua/ge/ge_utils.lua:1562
---@param str string chaîne
---@param sep string|nil contenu d'une classe [^...] ; défaut '%s'
---@return table<integer, string>  morceaux
function stringToTable(str, sep) end

--- Renvoie une clé choisie au hasard dans la table (seed math.random au premier appel).
---Source : lua/ge/ge_utils.lua:1529
---@param t table|nil table
---@return any  clé, ou nil
function tableChooseRandomKey(t) end

--- Test de dev de GBitmap (chargement, couleurs).
---Source : lua/ge/ge_utils.lua:225
function testGBitmap() end

--- Test de dev : balaie un castRayDebug animé ; à appeler chaque frame avec dtReal.
---Source : lua/ge/ge_utils.lua:1367
---@param dtReal number delta temps (s)
function testRaycasting(dtReal) end

--- Test de dev (marqué TODO remove) : crée des SFXParameterGroup et sources audio de test.
---Source : lua/ge/ge_utils.lua:626
function testSounds() end

--- Test de dev de la lecture de ZIP.
---Source : lua/ge/ge_utils.lua:323
function testZIP() end

--- Tests de dev des champs GE.
---Source : lua/ge/ge_utils.lua:165
function test_GE_fields() end

--- Test de dev : crée/supprime un SimGroup 'hey'.
---Source : lua/ge/ge_utils.lua:920
function test_lua() end

--- Détecte des fichiers .url connus à la racine du jeu (version piratée) ; appelée par main.lua pour définir sailingTheHighSeas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/ge_utils.lua:1630
---@return boolean  true si détecté
function the_high_sea_crap_detector() end

--- Convertit une distance en m vers l'unité du réglage uiUnitLength : km/m en métrique, mi/ft en impérial. big=true force la grande unité, 'auto' choisit à partir de 1000 m (métrique) ou 1 mile.
---Source : lua/ge/ge_utils.lua:1486
---@param value number|nil distance en mètres (0 si nil)
---@param big boolean|string|nil true, false ou 'auto'
---@return number  valeur convertie
---@return string  unité : 'km','m','mi','ft'
---@return string  système 'metric' ou 'imperial'
---@return boolean  grande unité utilisée
function translateDistance(value, big) end

--- Convertit une vitesse en m/s vers l'unité du réglage : km/h ou m/s (métrique), mph ou ft/s (impérial). big=true multiplie la valeur par 3600 pour les grandes unités.
---Source : lua/ge/ge_utils.lua:1511
---@param value number vitesse en m/s
---@param big boolean|string|nil true pour km/h ou mph (valeur x3600 après conversion de distance) ; sinon m/s ou ft/s
---@return number  valeur convertie
---@return string  unité
---@return string  système
---@return boolean|string  big tel que passé
function translateVelocity(value, big) end

--- Renvoie une fonction (via core_jobsystem.wrap) qui, une fois appelée, exécute func dans un job ; avec waitForCleanup, attend 3 frames de rendu pour laisser les ressources GPU se libérer.
---Source : lua/ge/ge_utils.lua:81
---@param logTag string tag de log
---@param startType string texte du message de log
---@param func function fonction à exécuter après l'attente
---@param waitForCleanup boolean attendre 3 frames avant d'exécuter func
---@return function  fonction wrapper à appeler pour lancer le job
function triggerDelayedStartGenerator(logTag, startType, func, waitForCleanup) end

--- Normalise une couleur (chaîne ou table de 4 valeurs) en chaîne 'r g b a' à 2 décimales ; défaut '1 1 1 1'.
---Source : lua/ge/ge_utils.lua:1003
---@param color string|table|nil couleur
---@return string  chaîne normalisée
function validateVehicleDataColor(color) end

--- Complète une table paint avec les valeurs par défaut manquantes (modifie et renvoie la table).
---Source : lua/ge/ge_utils.lua:972
---@param paint table paint
---@return table  paint validé
function validateVehiclePaint(paint) end

--- Extrait metallic, roughness, clearcoat, clearcoatRoughness des éléments 5 à 8 d'un tableau de couleur.
---Source : lua/ge/ge_utils.lua:985
---@param colorTable table tableau de 8 nombres
---@return number  metallic
---@return number  roughness
---@return number  clearcoat
---@return number  clearcoatRoughness
function vehicleMetallicPaintDataFromColor(colorTable) end

--- Formate 4 valeurs en chaîne 'metallic roughness clearcoat clearcoatRoughness'.
---Source : lua/ge/ge_utils.lua:998
---@param metallic number metallic
---@param roughness number roughness
---@param clearcoat number clearcoat
---@param clearcoatRoughness number clearcoatRoughness
---@return string  chaîne
function vehicleMetallicPaintString(metallic, roughness, clearcoat, clearcoatRoughness) end

--- Place un véhicule à une position et une rotation (quaternion). Logue une erreur si le véhicule n'existe pas.
---Source : lua/ge/ge_utils.lua:459
---@param id integer id du véhicule
---@param px number x (m)
---@param py number y (m)
---@param pz number z (m)
---@param rx number quaternion x
---@param ry number quaternion y
---@param rz number quaternion z
---@param rw number quaternion w
function vehicleSetPositionRotation(id, px, py, pz, rx, ry, rz, rw) end

--- Itérateur générique sur tous les véhicules : for id, veh in vehiclesIterator() do ... end.
---Source : lua/ge/ge_utils.lua:541
---@param ctx table|nil contexte réutilisable pour éviter l'allocation
---@return function  itérateur
---@return table  contexte
function vehiclesIterator(ctx) end

---@type table
TorqueScriptLua = nil
---@type any
scenetree = nil
---@type any
serializeJsonToFile = nil
