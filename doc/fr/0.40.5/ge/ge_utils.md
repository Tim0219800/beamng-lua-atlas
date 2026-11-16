# `ge_utils`

*Fichier : `lua/ge/ge_utils.lua` · VM : Game Engine (GE) · 1784 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("ge_utils")`

Fonctions utilitaires globales de la VM GE, chargées par main.lua (require('ge_utils')) avant les extensions. Elles sont accessibles partout sans require : getPlayerVehicle, getObjectByID, getAllVehicles, vehiclesIterator, scenetree, spawnPrefab, castRay, getTimeOfDay/setTimeOfDay, sanitizeVehicleSpawnOptions, translateDistance/translateVelocity, etc. Le fichier définit aussi la globale scenetree (lecture seule : scenetree.NomObjet renvoie l'objet de scène) et un chargeur de modules (advancedModuleLoader) installé en 2e position de package.loaders.

## Exemple

```lua
local veh = getPlayerVehicle(0)
if veh then
  local pos = veh:getPosition()
  local hit = castRay(pos, pos - vec3(0,0,5), true, false)
  if hit then log('I','', 'sol à '..hit.pt.z) end
end
for vid, v in vehiclesIterator() do print(vid, v:getJBeamFilename()) end
setTimeOfDay('13:30')
```

## Remarques

- Cache : getPlayerVehicle(player) et getObjectByID(id) mémorisent leur résultat (false interne, renvoyé comme nil). main.lua appelle invalidatePlayerVehicles() / invalidateVehicleCache() à chaque vehicleSpawned, vehicleSwitched, vehicleDestroyed. getAllVehicles() renvoie la table mise en cache : ne pas la modifier.
- vehiclesIterator(ctx) renvoie (id, objet) ; l'itération se fait sur le cache créé au premier appel. activeVehiclesIterator ne retient que les véhicules avec veh:getActive() vrai.
- Globales définies : scenetree (singleton read-only dont __index fait findObject), TorqueScriptLua (call obsolète : ne fait que loguer une erreur ; callNoReturn l'appelle ; exec -> TorqueScript.exec ; getBoolVar/getVar/setVar obsolètes -> VariableRegistry), moduleLoaderFallback, serializeJsonToFile (= jsonWriteFile, obsolète), string.c_str (rétrocompatibilité).
- Table scenetree : findObject(nom), findObjectById(id), objectExists(id), objectExistsById(id), decalRoadContainsPoint(id, point), findClassObjects(className) (liste de noms ou nil), findSubClassObjects(className), getAllObjects() (noms ou nil). Toute autre clé est traitée comme un nom d'objet : scenetree.MissionGroup. Les écritures sont ignorées.
- Les chaînes de position/rotation/échelle de spawnPrefab pour un PrefabV2 sont lues avec le motif [0-9]* : les nombres négatifs ou décimaux ne sont pas reconnus (bug probable ; passer des vec3/QuatF plutôt que des chaînes).
- Bug/incohérence : convertVehicleColorsToPaints logue la variable inexistante 'colors' (au lieu de colorTable) ; convertVehicleNameKeysToVehicleIdKeys logue 'vid' qui n'existe pas dans cette fonction (valeur nil dans le message).
- Bug/incohérence : canSpawnAnotherVehicle renvoie true sauf sur PS5/PS5 Pro ; quand la mémoire manque, la fonction se termine sans return explicite (renvoie donc nil, pas false).
- Bug/incohérence : translateDistance ne renvoie rien si le réglage uiUnitLength n'est ni 'metric' ni 'imperial' ; translateVelocity échouerait alors.
- Bug/incohérence : le motif de getDirs exclut les entrées contenant un point après un '/', donc ignore les dossiers dont le nom contient un point.
- Fonctions de test/dev non documentées en détail : scenetree_tests, scenetree_test_fields, test_GE_fields, testGBitmap, testZIP, collisionReloadTest, testSounds, test_lua, testRaycasting. Fonctions locales du fichier (colorDifference, prefabFilenameToTemplateName, comparisons...) non exportées.
- the_high_sea_crap_detector, appelée par main.lua, cherche des fichiers .url à la racine dont le hash SHA1 est connu, et renvoie true si trouvé (affecte la globale sailingTheHighSeas).
- getTimeOfDay/setTimeOfDay : l'objet TimeOfDay stocke time comme fraction de jour décalée de 0,5 (heures = ((time+0.5)%1)*24). Les fonctions font la conversion ; heure en 24 h. setTimeOfDay accepte 'HH', 'HH:MM', 'HH:MM:SS' ou {hours, mins, secs}.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `activeVehiclesIterator(ctx)` | Comme vehiclesIterator mais ne parcourt que les véhicules actifs (veh:getActive()). | 563 |
| `addPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation)` | Crée un objet Prefab (v1, chargement manuel) sans le charger. Logue une erreur et renvoie nil si le nom existe déjà. | 722 |
| `canSpawnAnotherVehicle(minGB)` | Sur PS5/PS5 Pro uniquement, vérifie qu'il reste assez de mémoire (défaut 1 Go) ; sinon affiche un toast, journalise et émet onVehicleSpawnBlocked(availableGB, minGB). Sur les autres plateformes renvoie toujours true. | 891 |
| `castRay(origin, target, includeTerrain, renderGeometry)` | Raycast lent (Engine.castRay) entre deux points. Renvoie nil sans impact, sinon la table du moteur avec pt et norm convertis en vec3. | 1329 |
| `castRayDebug(origin, target, includeTerrain, renderGeometry)` | Comme castRay avec dessin debug (sphères de départ/arrivée, ligne verte si impact, rouge sinon, normale). | 1342 |
| `checkVehicleProperty(vid, propertyName, value)` | Teste si le champ propertyName de l'objet de scène du véhicule vaut value. | 854 |
| `collisionReloadTest()` | Debug : recharge la collision (be:reloadCollision) et affiche la durée en ms. | 427 |
| `convertVehicleColorsToPaints(colorTable)` | Convertit une liste de couleurs {r,g,b,a} en liste de paints (createVehiclePaint + validateVehiclePaint). | 933 |
| `convertVehicleIdKeysToVehicleNameKeys(data)` | Transforme une table indexée par id de véhicule en table indexée par nom de véhicule (champ 'name'). | 1375 |
| `convertVehicleNameKeysToVehicleIdKeys(data)` | Inverse : transforme une table indexée par nom de véhicule en table indexée par id. | 1398 |
| `copyfile(src, dst)` | Copie un fichier texte (modes 'r'/'w' : peut altérer un fichier binaire sous Windows). Renvoie nil si ouverture impossible. | 1582 |
| `createObject(className)` | Crée un objet de la classe C++ exposée en globale (ex. 'SimGroup', 'TSStatic') et incrémente son compteur de références. Logue une erreur et renvoie nil si la classe n'existe pas. Il faut ensuite appeler :registerObject(nom). | 414 |
| `createPlayerSpawningData(model, config, color, licenseText, vehicleName, pos, rot)` | Construit la table {model=, options={config, paint, licenseText, vehicleName, pos, rot}} pour le spawn d'un véhicule joueur. | 1274 |
| `createVehiclePaint(color, metallicData)` | Construit une table paint {baseColor={r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}. Valeurs par défaut : couleur blanche, metallic 0.2, roughness 0.5, clearcoat 0.8, clearcoatRoughness 0. | 949 |
| `deleteObject(name)` | Supprime l'objet de scène portant ce nom s'il existe. | 281 |
| `dirContent(path)` | Liste récursive de tout le contenu (fichiers) de path via FS:findFiles. | 1438 |
| `dumpGfxResourcesMemory()` | Journalise la mémoire GPU par catégorie (Engine.Render.calculateGfxMemory), en Mo, pour celles dépassant 1 Mo. | 1747 |
| `escape_magic(str)` | Échappe les caractères magiques d'un motif Lua pour un usage littéral. | 1478 |
| `extractVehicleData(vid)` | Extrait {config, licenseText, color, model, vehicleName} d'un véhicule de la scène, ou renvoie le véhicule utilisateur de la campagne en cours s'il y en a un. | 1301 |
| `fileExistsOrNil(path)` | Renvoie path s'il s'agit d'un fichier existant, sinon nil. | 1442 |
| `fillVehicleSpawnOptionDefaults(modelName, opt)` | Complète une table d'options de spawn de véhicule : résout config (.pc ou nom), paints (color/paintName/paint pour 1 à 3 couleurs), config par défaut du modèle. Modifie et renvoie opt. | 1091 |
| `forEachAudioChannel(callback)` | Appelle callback(nom, canal) pour chaque objet SFXSourceChannel de la scène. | 598 |
| `generateObjectNameForClass(className, objectName)` | Génère un nom objectName + (plus grand id d'objet de la classe + 1). | 1676 |
| `getAllVehicles()` | Renvoie la liste (en cache) de tous les objets BeamNGVehicle présents dans le niveau. | 503 |
| `getAllVehiclesByType(typeList)` | Filtre getAllVehicles par type de modèle (core_vehicles.getModel(veh.jbeam).model.Type). | 518 |
| `getAudioChannelsVolume()` | Renvoie les volumes courants de tous les canaux audio. | 609 |
| `getClosestVehicle(requesterID, callbackfct)` | Cherche le véhicule actif le plus proche de requesterID et rappelle le Lua du véhicule demandeur : callbackfct(id, distance) ou callbackfct(-1,-1) si aucun. | 574 |
| `getComparisonOps()` | Renvoie la liste des opérateurs de comparaison {opSymbol, op, opName, opNameLc} : ==, <, >, <=, >=, ~=. | 1704 |
| `getDateTimeUTCString()` | Date et heure UTC courantes au format ISO 8601 avec millisecondes, ex. 2023-01-01T12:00:00.123Z. | 1648 |
| `getDirectories(path)` | Liste les sous-dossiers immédiats (chemins complets) de path. | 1593 |
| `getDirs(path, recursiveLevels)` | Liste des sous-dossiers de path sur recursiveLevels niveaux (filtre les entrées ressemblant à des fichiers). | 1449 |
| `getFileSize(filename)` | Taille d'un fichier en octets (ouvert avec io.open), -1 s'il est illisible. | 1466 |
| `getFunctionParameters(func)` | Renvoie les noms des paramètres d'une fonction Lua (debug.getlocal) et si elle est variadique. Lent. | 1667 |
| `getMaxVehicleAmount(limit)` | Estime le nombre maximal de véhicules : nombre de cœurs physiques, limité par la mémoire disponible en Go et par limit. | 867 |
| `getObjectByClass(className)` | Renvoie le premier objet de scène de la classe donnée (ex. 'TimeOfDay'). | 650 |
| `getObjectByID(id)` | Version avec cache de be:getObjectByID(id) : renvoie le véhicule d'id donné. | 450 |
| `getObjectsByClass(className)` | Renvoie tous les objets de scène de la classe donnée (ex. 'CloudLayer'). | 659 |
| `getOwningPrefab(obj)` | Remonte les parents Prefab (v1) de obj et renvoie le prefab de plus haut niveau. | 380 |
| `getOwningPrefabInstance(obj)` | Idem pour les instances de PrefabV2 (Engine.Prefab.findContainingPrefabInstance), renvoie l'instance de plus haut niveau. | 393 |
| `getPlayerVehicle(player)` | Version avec cache de be:getPlayerVehicle(player) (évite de générer du garbage). Renvoie le véhicule contrôlé par le joueur, ou nil. | 441 |
| `getRandomPaint(vehId, commonPaintProb)` | Tire un paint au hasard parmi ceux du modèle. Avec commonPaintProb, favorise des couleurs réelles courantes (blanc, noir, gris, argent, bleu, rouge) en choisissant le paint du modèle le plus proche. Modèle de repli : 'pessima'. | 1025 |
| `getSceneWaypointRadius(o)` | Rayon d'un waypoint de scène : le plus grand des 3 composantes de l'échelle. | 849 |
| `getTimeOfDay(asString)` | Renvoie l'heure du jeu (objet TimeOfDay), format 24 h. Nil s'il n'y a pas d'objet TimeOfDay dans la scène. | 671 |
| `getVehicleColor(vehicleID)` | Renvoie la couleur principale du véhicule sous forme de chaîne 'r g b a metallic roughness clearcoat clearcoatRoughness' (valeurs arrondies à 0,01). Véhicule joueur 0 si vehicleID est nil ; chaîne vide si introuvable. | 478 |
| `getVehicleColorPalette(index, vehicleId)` | Comme getVehicleColor mais pour colorPalette<index> (index 0 ou 1 selon le véhicule), avec les données métalliques courantes. | 489 |
| `getVehiclePaint(vehicleId)` | Paint actuel d'un véhicule (couleur et données métalliques de l'objet de scène). | 966 |
| `imageExistsDefault(path, fallbackPath)` | Renvoie path s'il existe, sinon fallbackPath ou '/ui/images/appDefault.png'. | 1430 |
| `invalidatePlayerVehicles()` | Vide les caches de getPlayerVehicle et getObjectByID. Appelée par main.lua à chaque spawn, changement ou destruction de véhicule. | 436 |
| `invalidateVehicleCache()` | Invalide le cache de getAllVehicles / vehiclesIterator. Appelée par main.lua. | 497 |
| `isOfficialContent(path)` | Vrai si le chemin réel commence par le dossier du jeu. | 1416 |
| `isOfficialContentVPath(vpath)` | Idem pour un chemin virtuel (résolu par FS:getFileRealPath). | 1420 |
| `isPlayerVehConfig(vpath)` | Vrai si le fichier est un .pc situé dans le dossier vehicles/ de l'utilisateur (config créée par le joueur). | 1424 |
| `loadPrefabv2Template(filename)` | Charge un fichier prefab PrefabV2 comme modèle nommé d'après son chemin (/ -> _, _ -> __). | 710 |
| `logMemoryInfo(lovLevel)` | Journalise les statistiques de RAM (Engine.Platform.getMemoryInfo) au niveau de log donné. | 885 |
| `moduleLoaderFallback(modulename)` | Chargeur de repli appelé quand le chargeur par défaut ne trouve pas un module : sait charger les plugins workbench/panels/... depuis leur chemin VFS littéral. | 1715 |
| `newFPSLimiter(targetFPS)` | Crée un limiteur de fréquence : limiter:update(dt) renvoie true environ targetFPS fois par seconde. À appeler depuis onPreRender/onUpdate. | 1615 |
| `parseISO8601Date(isoString)` | Convertit une chaîne ISO 8601 (YYYY-MM-DDTHH:MM:SS.mmmZ) en os.time ; les millisecondes sont ignorées et le fuseau est celui de la machine (os.time). | 1659 |
| `popActionMap(map)` | Désactive l'ActionMap nommée <map>ActionMap (pop). | 830 |
| `prefabIsChildOfGroup(obj, groupName)` | Indique si obj est dans le SimGroup nommé groupName, soit directement, soit via son prefab parent. | 359 |
| `pushActionMap(map)` | Active l'ActionMap nommée <map>ActionMap (push). | 818 |
| `pushActionMapHighestPriority(map)` | Comme pushActionMap mais avec priorité maximale (pushFirst). | 824 |
| `queueCallbackInVehicle(veh, geluaFunctionName, vluaCommand, ...)` | Exécute vluaCommand dans le Lua du véhicule puis rappelle la fonction GE geluaFunctionName avec le résultat de la commande suivi de ...  Préférer l'API vehicleBridge quand c'est possible. | 837 |
| `randomASCIIString(len)` | Génère une chaîne aléatoire de chiffres et lettres. | 1546 |
| `recordPlayerAction(text)` | Enregistre une action dans un tampon circulaire du moteur, imprimé au log en cas de crash ou à l'arrêt ; les actions identiques consécutives sont fusionnées. | 905 |
| `removePrefab(objName)` | Décharge et supprime le prefab de ce nom s'il existe. | 809 |
| `replace_char(pos, str, r)` | Remplace le caractère à la position pos de str par r. | 221 |
| `sanitizeVehicleSpawnOptions(model, opt)` | Appelle fillVehicleSpawnOptionDefaults, valide les paints, recopie licenseText et vehicleName, et calcule pos/rot par défaut : à 5 m à gauche du véhicule joueur et même orientation, ou devant la caméra libre. | 1217 |
| `scenetree_test_fields()` | Tests de dev des champs d'objets de scène. | 144 |
| `scenetree_tests()` | Tests de dev de scenetree (marqués à convertir en vrais tests unitaires). | 96 |
| `setAudioChannelsVolume(data)` | Applique des volumes à des canaux audio par nom (format de getAudioChannelsVolume). | 618 |
| `setCEFFocus()` | OBSOLÈTE : n'a plus d'effet, journalise une erreur (au plus 5 fois). | 1773 |
| `setMaxVehicleAmountForTraffic(limit)` | Règle les réglages trafficAmount et trafficParkingAmount à (max estimé - 1, minimum 1). Utilisée par les options principales. | 874 |
| `setTimeOfDay(inp)` | Règle l'heure du jeu. | 687 |
| `setVehicleProperty(vid, propertyName, value)` | Écrit le champ propertyName de l'objet de scène du véhicule. | 859 |
| `spaceSeparated4Values(a, b, c, d)` | Concatène 4 valeurs avec des espaces en réutilisant une table interne (pas d'allocation). | 1577 |
| `spawnPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation)` | Crée et charge un prefab dans MissionGroup. Si le fichier se termine par .prefab.json et décrit une classe PrefabV2, instancie le modèle (créé au besoin) ; sinon utilise addPrefab + load. Active la reconstruction de collision si l'éditeur est actif. | 744 |
| `stringToTable(str, sep)` | Découpe une chaîne selon un séparateur (motif de classe de caractères, défaut '%s' = espaces) ; les champs vides sont ignorés. | 1562 |
| `tableChooseRandomKey(t)` | Renvoie une clé choisie au hasard dans la table (seed math.random au premier appel). | 1529 |
| `testGBitmap()` | Test de dev de GBitmap (chargement, couleurs). | 225 |
| `testRaycasting(dtReal)` | Test de dev : balaie un castRayDebug animé ; à appeler chaque frame avec dtReal. | 1367 |
| `testSounds()` | Test de dev (marqué TODO remove) : crée des SFXParameterGroup et sources audio de test. | 626 |
| `testZIP()` | Test de dev de la lecture de ZIP. | 323 |
| `test_GE_fields()` | Tests de dev des champs GE. | 165 |
| `test_lua()` | Test de dev : crée/supprime un SimGroup 'hey'. | 920 |
| `the_high_sea_crap_detector()` | Détecte des fichiers .url connus à la racine du jeu (version piratée) ; appelée par main.lua pour définir sailingTheHighSeas. | 1630 |
| `translateDistance(value, big)` | Convertit une distance en m vers l'unité du réglage uiUnitLength : km/m en métrique, mi/ft en impérial. big=true force la grande unité, 'auto' choisit à partir de 1000 m (métrique) ou 1 mile. | 1486 |
| `translateVelocity(value, big)` | Convertit une vitesse en m/s vers l'unité du réglage : km/h ou m/s (métrique), mph ou ft/s (impérial). big=true multiplie la valeur par 3600 pour les grandes unités. | 1511 |
| `triggerDelayedStartGenerator(logTag, startType, func, waitForCleanup)` | Renvoie une fonction (via core_jobsystem.wrap) qui, une fois appelée, exécute func dans un job ; avec waitForCleanup, attend 3 frames de rendu pour laisser les ressources GPU se libérer. | 81 |
| `validateVehicleDataColor(color)` | Normalise une couleur (chaîne ou table de 4 valeurs) en chaîne 'r g b a' à 2 décimales ; défaut '1 1 1 1'. | 1003 |
| `validateVehiclePaint(paint)` | Complète une table paint avec les valeurs par défaut manquantes (modifie et renvoie la table). | 972 |
| `vehicleMetallicPaintDataFromColor(colorTable)` | Extrait metallic, roughness, clearcoat, clearcoatRoughness des éléments 5 à 8 d'un tableau de couleur. | 985 |
| `vehicleMetallicPaintString(metallic, roughness, clearcoat, clearcoatRoughness)` | Formate 4 valeurs en chaîne 'metallic roughness clearcoat clearcoatRoughness'. | 998 |
| `vehicleSetPositionRotation(id, px, py, pz, rx, ry, rz, rw)` | Place un véhicule à une position et une rotation (quaternion). Logue une erreur si le véhicule n'existe pas. | 459 |
| `vehiclesIterator(ctx)` | Itérateur générique sur tous les véhicules : for id, veh in vehiclesIterator() do ... end. | 541 |

**Globales affectées :** `TorqueScriptLua`, `scenetree`, `serializeJsonToFile`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSpawnBlocked`

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `Engine.` `castRay`, `setNeedCollisionRebuild`
- `FS:` `directoryExists`, `fileExists`, `findFiles`, `getFileRealPath`, `getGamePath`, `getUserPath`
- `Lua:` `findObjectsByClassAsTable`, `findObjectsBySubClassAsTable`, `getAllObjects`
- `Sim.` `decalRoadContainsPoint`, `findObject`, `findObjectById`, `objectExists`, `objectExistsById`, `upcast`
- `TorqueScriptLua.` `call`
- `be:` `getObject`, `getObjectByID`, `getObjectCount`, `getPlayerVehicle`, `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `delete`, `get`, `getDeclarationLine`, `incRefCount`, `isChildOfGroup`, `registerObject`, `set`, `unload`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/ge_utils.lua`.*
