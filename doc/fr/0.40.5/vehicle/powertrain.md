# `powertrain`

*Fichier : `lua/vehicle/powertrain.lua` · VM : Véhicule · 1261 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `powertrain`

Gestionnaire du groupe motopropulseur (powertrain) du véhicule : à l'init il lit la section `powertrain` du jbeam (v.data.powertrain), crée chaque dispositif (device) via la fabrique correspondant à son `type` (fichiers lua/vehicle/powertrain/*.lua du jeu ou lua/powertrain/*.lua du véhicule), les relie en arbre grâce à `inputName`/`inputIndex`, vérifie, calcule les inerties cumulées, et les stocke par nom. À chaque pas de physique il met à jour les vitesses (des roues vers le moteur) puis les couples (du moteur vers les roues). Un moddeur s'en sert surtout pour retrouver un dispositif (getDevice, getDevicesByType, getDevicesByCategory) et lire/écrire ses champs (régime, couple, température…).

## Exemple

```lua
local engine = powertrain.getDevice('mainEngine')
if engine then print(engine.outputAV1 * 30 / math.pi) end -- régime en tr/min
for _, e in ipairs(powertrain.getDevicesByType('combustionEngine')) do print(e.name, e.engineLoad) end
powertrain.setDeviceMode('differential_F', 'locked')
local wheelsDrivenBy = powertrain.getChildWheels(engine)
```

## Remarques

- Structure d'un device (champs communs posés par powertrain.init) : name, type, inputName (nom du parent), inputIndex (port de sortie du parent utilisé), parent (table du device parent, ou un faux parent {isFake=true, outputTorque0..2, deviceCategories} pour la racine), children (liste), gearRatio, cumulativeGearRatio (produit des rapports du parent à ce device), cumulativeInertia, isPhysicallyDisconnected, isPropulsed (descend du parent), connectedWheel, outputPorts (table index -> true), deviceCategories (table catégorie -> true, ex. engine, gearbox), uiName, uiSimpleModeControl, visualPosition, deformGroups / deformGroupDamages, mode / availableModes, isBroken, breakTriggerBeam. Les sorties sont lues dans device.outputAV1/outputTorque1 (port 1), outputAV2/outputTorque2 (port 2)… Les noms de champs parentOutputAVName/parentOutputTorqueName sont déduits de inputIndex.
- Méthodes appelées par le gestionnaire sur chaque device (si présentes) : velocityUpdate(dt) et torqueUpdate(dt) (obligatoires, physique), calculateInertia(), validate(), reset(jbeamData), initSounds(jbeamData), resetSounds(jbeamData), updateGFX(dt), updateSounds(dt), updateGFXLastStage(dt), applyDeformGroupDamage(dommage, groupType), onBreak(), beamBroke(id), setMode(mode), onCouplerFound/Attached/Detached, sendTorqueData(), updateSimpleControlButtons(), getState()/setState(data), getPartCondition(sousSysteme)/setPartCondition(...). Si un device n'a pas de reset(), reset() du powertrain refait un init complet.
- Ordre de parcours : orderedDevices est ordonné de la racine (moteur) vers les feuilles (roues). update(dt) fait velocityUpdate des feuilles vers la racine (index décroissant) puis torqueUpdate de la racine vers les feuilles (index croissant). Appelé par main.lua : update dans onPhysicsStep (après wheels.updateWheelVelocities), updateGFX et updateGFXLastStage dans onGraphicsStep.
- Types de device connus = noms des fichiers de lua/vehicle/powertrain (shaft, differential, combustionEngine, electricMotor, automaticGearbox, manualGearbox, etc.) + ceux du dossier lua/powertrain du véhicule ; sont exclus de la liste (compagnons créés par un moteur) : combustionEngineThermals, supercharger, turbocharger, nitrousOxideInjection, hydraulicCylinder. combustionEngineMF est ajouté en dur (le code note un TODO/hack). Un type inconnu avorte l'init avec un log d'erreur (« Powertrain will not work! »).
- Les clés jbeam d'un device sont fusionnées avec la section jbeam du même nom (tableMergeRecursive(jbeamData, v.data[jbeamData.name])). Clés lues ici : name, type, inputName, inputIndex, gearRatio (défaut 1), uiName, uiSimpleModeControl (défaut true), visualPositionRelativeParent {x,y,z}, visualPositionRelativeChildren, breakTriggerBeam (nom ou liste de noms de poutres), deformGroups / deformGroups_<type> (liste de groupes de déformation ; séparateur « _ » ou « : »), visualShaftAVName (défaut inputAV), electricsName / visualShaftAngle (angle visible publié dans electrics.values[electricsName] en degrés).
- Un device est marqué cassé via breakDevice : appelle device:onBreak(), casse les poutres de breakTriggerBeam, affiche un message UI et signale damageTracker. Il est déclenché automatiquement quand une poutre de breakTriggerBeam casse (beamBroke).
- Champs d'environnement mis à jour à chaque updateGFX : currentGravity (m/s², obj:getGravity), currentEnvTemperature (K), currentEnvTemperatureCelsius (°C), currentEnvPressure (Pa), et leurs inverses invCurrent* (gardés contre la division par zéro avec guardZero).
- Si le véhicule n'a pas de section powertrain (remorques, vieux mods), hasPowertrain reste faux : update reste nop, isPhysicsStepUsed() renvoie false, reset/initSounds ne font rien.
- Notes sur les champs signalés par l'extraction : `update` vaut nop par défaut (nop est une fonction globale définie hors du fichier, ce n'est pas nil) et est remplacé par la vraie fonction update après un init réussi ; la globale `i` signalée est un faux positif (variable de boucle locale).
- onCouplerAttached transmet aux devices les arguments dans l'ordre (nodeId, obj2id, obj2nodeId, attachEnergy, attachSpeed), inversé par rapport au hook de main.lua (attachSpeed, attachEnergy), par compatibilité arrière.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain.beamBroke(id)` | Appelée par main.lua quand une poutre casse : prévient les devices qui ont une méthode beamBroke, puis casse les devices dont la breakTriggerBeam correspond (breakDevice). *(interne)* | 812 |
| `powertrain.breakDevice(device)` | Marque un device comme cassé : device:onBreak(), casse ses poutres de déclenchement (obj:breakBeam), affiche le message UI vehicle.powertrain.deviceBroken et signale le dégât au damageTracker. Sans effet si déjà cassé. | 798 |
| `powertrain.calculateTreeInertia()` | Recalcule l'inertie cumulée en parcourant les devices des feuilles vers la racine (device:calculateInertia()). À rappeler après avoir changé des inerties ou la structure. | 326 |
| `powertrain.dumpsDeviceData(device)` | Renvoie une chaîne lisible (dumps) d'une copie profonde du device, avec parent et enfants remplacés par leur nom, utile au debug. | 132 |
| `powertrain.getAllWheelPropulsionDevices()` | Renvoie la liste (sans doublons) des devices moteurs qui entraînent au moins une roue. | 968 |
| `powertrain.getChildWheels(parentDevice, outputID)` | Parcourt récursivement les enfants d'un device et renvoie les roues entraînées (device.wheel des shafts de roue). Si outputID est donné, ne suit que l'enfant branché sur ce port. | 933 |
| `powertrain.getDevice(name)` | Renvoie le device portant ce nom. | 909 |
| `powertrain.getDevices()` | Renvoie la table de tous les devices indexée par nom. | 901 |
| `powertrain.getDevicesByCategory(category)` | Renvoie la liste des devices dont deviceCategories contient la catégorie. | 923 |
| `powertrain.getDevicesByType(deviceType)` | Renvoie la liste des devices dont `type` égale la valeur donnée (ordre non garanti : parcours de pairs). | 913 |
| `powertrain.getEngineSoundID()` | Renvoie un identifiant de son moteur unique et croissant (0, 1, 2…), remis à -1 à chaque init. | 1041 |
| `powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice)` | Multiplie les gearRatio en remontant du device du bas jusqu'au device du haut. Renvoie nil si les devices ne sont pas connectés (ou si un argument est nil). | 1014 |
| `powertrain.getHydraulicConsumer(consumerName)` | Cherche parmi les sources hydrauliques (catégorie hydraulicPowerSource) un consommateur nommé. | 985 |
| `powertrain.getOrderedDevices()` | Renvoie le tableau (indexé 1..N) des devices ordonné de la racine vers les feuilles. | 905 |
| `powertrain.getPartCondition(partTypeData)` | Agrège l'état d'usure/intégrité des devices concernés par les clés de partie de la forme « powertrainDevice:<nom>:<sousSystème> ». | 1075 |
| `powertrain.getPoweredWheelNames()` | Renvoie, pour chaque roue du véhicule entraînée par un moteur, le nom de ce moteur. | 957 |
| `powertrain.getPropulsionDeviceForDevice(device)` | Remonte les parents d'un device jusqu'à trouver un device de catégorie engine. | 1000 |
| `powertrain.getPropulsionDeviceForWheel(wheelName)` | Renvoie le device de catégorie engine qui entraîne la roue (table calculée à l'init). | 953 |
| `powertrain.getState()` | Fusionne les états renvoyés par device:getState() de tous les devices (sauvegarde d'état). | 1101 |
| `powertrain.init()` | Construit le powertrain à partir de v.data.powertrain : découvre les fabriques de devices (FS:findFiles sur lua/vehicle/powertrain et <véhicule>/lua/powertrain), instancie chaque device (factory.new(jbeamData)), les relie en arbre, calcule positions visuelles, validation, inerties, poutres de rupture, torsion reactors, restaure les modes précédents et envoie l'arbre à l'UI. Appelée par main.lua (initSystems) et par reset() si un device ne supporte pas reset. *(interne)* | 426 |
| `powertrain.initSounds()` | Appelle device:initSounds(jbeamData) sur chaque device qui en a un. Appelée par main.lua après l'init audio. *(interne)* | 725 |
| `powertrain.isPhysicsStepUsed()` | Indique si le powertrain a besoin du pas de physique (true quand un powertrain a été construit). Utilisé par main.lua:updateCorePhysicsStepEnabled. *(interne)* | 1097 |
| `powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Hook relayé par main.lua aux devices (arguments attachEnergy et attachSpeed inversés par compatibilité). *(interne)* *(hook)* | 838 |
| `powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook relayé par main.lua aux devices lors du détachement d'un coupleur. *(interne)* *(hook)* | 847 |
| `powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Hook relayé par main.lua : transmet à device:onCouplerFound les devices qui l'implémentent. *(interne)* *(hook)* | 829 |
| `powertrain.reset()` | Réinitialise les dégâts de groupes de déformation et appelle device:reset(jbeamData) sur chaque device, recalcule les inerties, renvoie l'arbre à l'UI et remet à zéro les coefficients de réaction de couple. Si un device n'a pas de reset(), retombe sur init(). Appelée par main.lua au reset du véhicule. *(interne)* | 737 |
| `powertrain.resetSounds()` | Appelle device:resetSounds(jbeamData) sur les devices (ou initSounds si reset complet nécessaire). *(interne)* | 780 |
| `powertrain.sendDeviceTree()` | Envoie à l'UI l'évènement PowertrainDeviceTreeChanged {devices, maxPower, maxTorque} (type, modes, position visuelle, enfants, mode courant de chaque device). Sans effet si le premier joueur n'est pas assis. *(interne)* | 272 |
| `powertrain.sendTorqueData()` | Demande à chaque device d'envoyer ses courbes de couple (device:sendTorqueData()) ; sans effet si le premier joueur n'est pas assis. *(interne)* | 308 |
| `powertrain.serializeDevicesInfo()` | Ancien code lié à un outil imgui, utilisé côté GE : sérialise un sous-ensemble de champs de tous les devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, rapports, embrayages…). *(interne)* | 78 |
| `powertrain.setDeviceMode(name, mode)` | Fixe le mode d'un device (device:setMode), mémorise ce choix pour le restaurer après un init et affiche un message UI « <nom> Mode: <mode> ». | 856 |
| `powertrain.setPartCondition(partTypeData, odometer, integrity, visual)` | Applique une condition de pièce (odomètre, intégrité, visuel) aux devices désignés par partTypeData via device:setPartCondition. | 1059 |
| `powertrain.setState(data)` | Passe `data` à device:setState(data) de chaque device qui l'implémente. | 1120 |
| `powertrain.setVehiclePath(path)` | Enregistre le dossier du véhicule, utilisé pour chercher les fabriques de devices spécifiques. Appelée par main.lua avant init. *(interne)* | 1037 |
| `powertrain.toggleDefaultDiffs()` | Fait passer au mode suivant tous les différentiels (type 'differential') qui ont defaultToggle vrai. | 893 |
| `powertrain.toggleDeviceMode(name)` | Passe le device nommé au mode suivant de sa liste availableModes (cyclique) via setDeviceMode. | 867 |
| `powertrain.updateGFX(dt)` | Appelée à chaque frame graphique par main.lua. Met à jour les champs d'environnement, applique aux devices les nouveaux dégâts de groupes de déformation (applyDeformGroupDamage), appelle device:updateGFX et updateSounds, intègre l'angle visuel d'arbre (electrics.values[electricsName]) puis envoie les données du flux UI 'powertrainDeviceData' si demandé. *(interne)* | 176 |
| `powertrain.updateGFXLastStage(dt)` | Dernière étape de la frame graphique (fin de onGraphicsStep) : appelle device:updateGFXLastStage(dt) sur les devices qui l'implémentent. *(interne)* | 229 |
| `powertrain.updateSimpleControlButtons()` | Demande à chaque device de republier ses boutons de contrôle simplifié (device:updateSimpleControlButtons()). | 318 |

### Détail des paramètres

#### `powertrain.beamBroke(id)`

Appelée par main.lua quand une poutre casse : prévient les devices qui ont une méthode beamBroke, puis casse les devices dont la breakTriggerBeam correspond (breakDevice).

- `id` (*integer*) : Identifiant (cid) de la poutre cassée.

#### `powertrain.breakDevice(device)`

Marque un device comme cassé : device:onBreak(), casse ses poutres de déclenchement (obj:breakBeam), affiche le message UI vehicle.powertrain.deviceBroken et signale le dégât au damageTracker. Sans effet si déjà cassé.

- `device` (*table*) : Device du powertrain.

#### `powertrain.dumpsDeviceData(device)`

Renvoie une chaîne lisible (dumps) d'une copie profonde du device, avec parent et enfants remplacés par leur nom, utile au debug.

- `device` (*table|nil*) : Device à décrire.
- **renvoie** : string Texte du dump, ou "nil".

#### `powertrain.getAllWheelPropulsionDevices()`

Renvoie la liste (sans doublons) des devices moteurs qui entraînent au moins une roue.

- **renvoie** : table[] Devices moteurs.

#### `powertrain.getChildWheels(parentDevice, outputID)`

Parcourt récursivement les enfants d'un device et renvoie les roues entraînées (device.wheel des shafts de roue). Si outputID est donné, ne suit que l'enfant branché sur ce port.

- `parentDevice` (*table*) : Device de départ.
- `outputID` (*integer|nil*) : Port de sortie à suivre ; -1 ou nil = tous.
- **renvoie** : table[] Liste de roues (tables de roue).

#### `powertrain.getDevice(name)`

Renvoie le device portant ce nom.

- `name` (*string|nil*) : Nom du device.
- **renvoie** : table|nil Le device, ou nil (aussi si name est nil).

#### `powertrain.getDevices()`

Renvoie la table de tous les devices indexée par nom.

- **renvoie** : table<string, table> Devices par nom (vide si pas de powertrain).

#### `powertrain.getDevicesByCategory(category)`

Renvoie la liste des devices dont deviceCategories contient la catégorie.

- `category` (*string*) : Catégorie (ex. 'engine', 'gearbox', 'hydraulicPowerSource').
- **renvoie** : table[] Tableau de devices.

#### `powertrain.getDevicesByType(deviceType)`

Renvoie la liste des devices dont `type` égale la valeur donnée (ordre non garanti : parcours de pairs).

- `deviceType` (*string*) : Type jbeam (ex. 'combustionEngine', 'differential', 'shaft').
- **renvoie** : table[] Tableau de devices (vide si aucun).

#### `powertrain.getEngineSoundID()`

Renvoie un identifiant de son moteur unique et croissant (0, 1, 2…), remis à -1 à chaque init.

- **renvoie** : integer Identifiant de son moteur.

#### `powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice)`

Multiplie les gearRatio en remontant du device du bas jusqu'au device du haut. Renvoie nil si les devices ne sont pas connectés (ou si un argument est nil).

- `topDevice` (*table*) : Device amont (plus proche du moteur).
- `bottomDevice` (*table*) : Device aval (descendant de topDevice).
- **renvoie** : number|nil Rapport cumulé entre les deux.

#### `powertrain.getHydraulicConsumer(consumerName)`

Cherche parmi les sources hydrauliques (catégorie hydraulicPowerSource) un consommateur nommé.

- `consumerName` (*string*) : Nom du consommateur.
- **renvoie** : table|nil Consommateur trouvé ou nil.

#### `powertrain.getOrderedDevices()`

Renvoie le tableau (indexé 1..N) des devices ordonné de la racine vers les feuilles.

- **renvoie** : table Liste ordonnée des devices (ne pas modifier).

#### `powertrain.getPartCondition(partTypeData)`

Agrège l'état d'usure/intégrité des devices concernés par les clés de partie de la forme « powertrainDevice:<nom>:<sousSystème> ».

- `partTypeData` (*string[]|nil*) : Liste de clés de type de pièce.
- **renvoie** : table {integrityValue (min des devices, défaut 1), integrityState, visualValue=1, visualState}.
- **renvoie** : boolean true si au moins un device a fourni une intégrité.
- **renvoie** : boolean Toujours false (condition visuelle non fournie).

#### `powertrain.getPoweredWheelNames()`

Renvoie, pour chaque roue du véhicule entraînée par un moteur, le nom de ce moteur.

- **renvoie** : table<string, string> nomRoue -> nom du device moteur.

#### `powertrain.getPropulsionDeviceForDevice(device)`

Remonte les parents d'un device jusqu'à trouver un device de catégorie engine.

- `device` (*table*) : Device de départ.
- **renvoie** : table|nil Le moteur ancêtre (ou le device lui-même), nil si aucun.

#### `powertrain.getPropulsionDeviceForWheel(wheelName)`

Renvoie le device de catégorie engine qui entraîne la roue (table calculée à l'init).

- `wheelName` (*string*) : Nom de la roue.
- **renvoie** : table|nil Device moteur ou nil.

#### `powertrain.getState()`

Fusionne les états renvoyés par device:getState() de tous les devices (sauvegarde d'état).

- **renvoie** : table|nil Table fusionnée réutilisée à chaque appel, nil si aucun device n'a de données.

#### `powertrain.isPhysicsStepUsed()`

Indique si le powertrain a besoin du pas de physique (true quand un powertrain a été construit). Utilisé par main.lua:updateCorePhysicsStepEnabled.

- **renvoie** : boolean hasPowertrain.

#### `powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

Hook relayé par main.lua aux devices (arguments attachEnergy et attachSpeed inversés par compatibilité).

- `nodeId` (*integer*) : Noeud coupleur local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : Noeud de l'autre véhicule.
- `attachSpeed` (*number*) : Vitesse à l'attache.
- `attachEnergy` (*number*) : Énergie à l'attache.

#### `powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook relayé par main.lua aux devices lors du détachement d'un coupleur.

- `nodeId` (*integer*) : Noeud coupleur local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : Noeud de l'autre véhicule.
- `breakForce` (*number*) : Force de détachement.

#### `powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)`

Hook relayé par main.lua : transmet à device:onCouplerFound les devices qui l'implémentent.

- `nodeId` (*integer*) : Noeud coupleur local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : Noeud de l'autre véhicule.
- `nodeDist` (*number*) : Distance entre les noeuds.

#### `powertrain.serializeDevicesInfo()`

Ancien code lié à un outil imgui, utilisé côté GE : sérialise un sous-ensemble de champs de tous les devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, rapports, embrayages…).

- **renvoie** : string Table sérialisée (serialize).

#### `powertrain.setDeviceMode(name, mode)`

Fixe le mode d'un device (device:setMode), mémorise ce choix pour le restaurer après un init et affiche un message UI « <nom> Mode: <mode> ».

- `name` (*string*) : Nom du device.
- `mode` (*string*) : Mode à appliquer (doit exister dans les modes du device).

#### `powertrain.setPartCondition(partTypeData, odometer, integrity, visual)`

Applique une condition de pièce (odomètre, intégrité, visuel) aux devices désignés par partTypeData via device:setPartCondition.

- `partTypeData` (*string[]|nil*) : Clés « powertrainDevice:<nom>:<sousSystème> ».
- `odometer` (*number*) : Distance/usure cumulée à appliquer (déduit du code).
- `integrity` (*number|table*) : Intégrité ; si table, la valeur est integrity.powertrain[nomDevice].
- `visual` (*any*) : Condition visuelle transmise au device.

#### `powertrain.setState(data)`

Passe `data` à device:setState(data) de chaque device qui l'implémente.

- `data` (*table|nil*) : État produit par getState ; ignoré si nil.

#### `powertrain.setVehiclePath(path)`

Enregistre le dossier du véhicule, utilisé pour chercher les fabriques de devices spécifiques. Appelée par main.lua avant init.

- `path` (*string*) : Dossier du véhicule.

#### `powertrain.toggleDeviceMode(name)`

Passe le device nommé au mode suivant de sa liste availableModes (cyclique) via setDeviceMode.

- `name` (*string*) : Nom du device.
- **renvoie** : string|nil Nouveau mode, nil si le device n'existe pas.

#### `powertrain.updateGFX(dt)`

Appelée à chaque frame graphique par main.lua. Met à jour les champs d'environnement, applique aux devices les nouveaux dégâts de groupes de déformation (applyDeformGroupDamage), appelle device:updateGFX et updateSounds, intègre l'angle visuel d'arbre (electrics.values[electricsName]) puis envoie les données du flux UI 'powertrainDeviceData' si demandé.

- `dt` (*number*) : Pas de temps en secondes.

#### `powertrain.updateGFXLastStage(dt)`

Dernière étape de la frame graphique (fin de onGraphicsStep) : appelle device:updateGFXLastStage(dt) sur les devices qui l'implémentent.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cumulativeGearRatio` | number | Plus grand rapport cumulé (cumulativeGearRatio) trouvé parmi tous les devices à la construction de l'arbre. |
| `currentEnvPressure` | number | Pression extérieure (obj:getEnvPressure, Pa). |
| `currentEnvTemperature` | number | Température extérieure en kelvin. |
| `currentEnvTemperatureCelsius` | number | Température extérieure en °C. |
| `currentGravity` | number | Gravité courante en m/s². |
| `engineData` | table | Table vide remise à zéro à l'init ; réservée aux données moteur (remplie ailleurs, non utilisée dans ce fichier). |
| `invCurrentEnvPressure` | number | 1 / currentEnvPressure. |
| `invCurrentEnvTemperature` | number | 1 / currentEnvTemperature. |
| `invCurrentEnvTemperatureCelsius` | number | 1 / currentEnvTemperatureCelsius (peut être très grand près de 0 °C). |
| `invCurrentGravity` | number | 1 / currentGravity. |
| `stabilityCoef` | number | Coefficient de stabilité, valeur initiale 250 (utilisé par les devices, non modifié dans ce fichier). |
| `torqueReactionCoefs` | table<integer, number> | Coefficients de réaction de couple par torsion reactor (indice = torsionReactorIdx des rotateurs). Double tampon permuté à chaque update. Vaut {0} si le powertrain n'est pas initialisé afin que l'indice 1 (reactor par défaut) existe. |
| `update` | function | nop tant que l'init n'a pas réussi, puis la fonction update(dt) (pas de physique) ; appelée par main.lua dans onPhysicsStep. |
| `wheels` | table<string, table> | Roues/rotateurs du véhicule par nom (wheels.wheelRotators). Les entrées reçoivent isPropulsed = true si un device propulsé les entraîne. |

**Globales affectées :** `i`

**Évènements UI (guihooks.trigger) :** `PowertrainDeviceTreeChanged`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `obj:` `breakBeam`, `getEnvPressure`, `getEnvTemperature`, `getGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain.lua`.*
