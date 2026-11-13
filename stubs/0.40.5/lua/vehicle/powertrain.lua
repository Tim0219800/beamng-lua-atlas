---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du groupe motopropulseur (powertrain) du véhicule : à l'init il lit la section `powertrain` du jbeam (v.data.powertrain), crée chaque dispositif (device) via la fabrique correspondant à son `type` (fichiers lua/vehicle/powertrain/*.lua du jeu ou lua/powertrain/*.lua du véhicule), les relie en arbre grâce à `inputName`/`inputIndex`, vérifie, calcule les inerties cumulées, et les stocke par nom. À chaque pas de physique il met à jour les vitesses (des roues vers le moteur) puis les couples (du moteur vers les roues). Un moddeur s'en sert surtout pour retrouver un dispositif (getDevice, getDevicesByType, getDevicesByCategory) et lire/écrire ses champs (régime, couple, température…).
--- Accès : globale `powertrain`
---@class powertrain
---@field cumulativeGearRatio number Plus grand rapport cumulé (cumulativeGearRatio) trouvé parmi tous les devices à la construction de l'arbre.
---@field currentEnvPressure number Pression extérieure (obj:getEnvPressure, Pa).
---@field currentEnvTemperature number Température extérieure en kelvin.
---@field currentEnvTemperatureCelsius number Température extérieure en °C.
---@field currentGravity number Gravité courante en m/s².
---@field engineData table Table vide remise à zéro à l'init ; réservée aux données moteur (remplie ailleurs, non utilisée dans ce fichier).
---@field invCurrentEnvPressure number 1 / currentEnvPressure.
---@field invCurrentEnvTemperature number 1 / currentEnvTemperature.
---@field invCurrentEnvTemperatureCelsius number 1 / currentEnvTemperatureCelsius (peut être très grand près de 0 °C).
---@field invCurrentGravity number 1 / currentGravity.
---@field stabilityCoef number Coefficient de stabilité, valeur initiale 250 (utilisé par les devices, non modifié dans ce fichier).
---@field torqueReactionCoefs table<integer, number> Coefficients de réaction de couple par torsion reactor (indice = torsionReactorIdx des rotateurs). Double tampon permuté à chaque update. Vaut {0} si le powertrain n'est pas initialisé afin que l'indice 1 (reactor par défaut) existe.
---@field update function nop tant que l'init n'a pas réussi, puis la fonction update(dt) (pas de physique) ; appelée par main.lua dans onPhysicsStep.
---@field wheels table<string, table> Roues/rotateurs du véhicule par nom (wheels.wheelRotators). Les entrées reçoivent isPropulsed = true si un device propulsé les entraîne.
powertrain = {}

--- Appelée par main.lua quand une poutre casse : prévient les devices qui ont une méthode beamBroke, puis casse les devices dont la breakTriggerBeam correspond (breakDevice).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:812
---@param id integer Identifiant (cid) de la poutre cassée.
function powertrain.beamBroke(id) end

--- Marque un device comme cassé : device:onBreak(), casse ses poutres de déclenchement (obj:breakBeam), affiche le message UI vehicle.powertrain.deviceBroken et signale le dégât au damageTracker. Sans effet si déjà cassé.
---Source : lua/vehicle/powertrain.lua:798
---@param device table Device du powertrain.
function powertrain.breakDevice(device) end

--- Recalcule l'inertie cumulée en parcourant les devices des feuilles vers la racine (device:calculateInertia()). À rappeler après avoir changé des inerties ou la structure.
---Source : lua/vehicle/powertrain.lua:326
function powertrain.calculateTreeInertia() end

--- Renvoie une chaîne lisible (dumps) d'une copie profonde du device, avec parent et enfants remplacés par leur nom, utile au debug.
---Source : lua/vehicle/powertrain.lua:132
---@param device table|nil Device à décrire.
---@return string  Texte du dump, ou "nil".
function powertrain.dumpsDeviceData(device) end

--- Renvoie la liste (sans doublons) des devices moteurs qui entraînent au moins une roue.
---Source : lua/vehicle/powertrain.lua:968
---@return table[]  Devices moteurs.
function powertrain.getAllWheelPropulsionDevices() end

--- Parcourt récursivement les enfants d'un device et renvoie les roues entraînées (device.wheel des shafts de roue). Si outputID est donné, ne suit que l'enfant branché sur ce port.
---Source : lua/vehicle/powertrain.lua:933
---@param parentDevice table Device de départ.
---@param outputID integer|nil Port de sortie à suivre ; -1 ou nil = tous.
---@return table[]  Liste de roues (tables de roue).
function powertrain.getChildWheels(parentDevice, outputID) end

--- Renvoie le device portant ce nom.
---Source : lua/vehicle/powertrain.lua:909
---@param name string|nil Nom du device.
---@return table|nil  Le device, ou nil (aussi si name est nil).
function powertrain.getDevice(name) end

--- Renvoie la table de tous les devices indexée par nom.
---Source : lua/vehicle/powertrain.lua:901
---@return table<string, table>  Devices par nom (vide si pas de powertrain).
function powertrain.getDevices() end

--- Renvoie la liste des devices dont deviceCategories contient la catégorie.
---Source : lua/vehicle/powertrain.lua:923
---@param category string Catégorie (ex. 'engine', 'gearbox', 'hydraulicPowerSource').
---@return table[]  Tableau de devices.
function powertrain.getDevicesByCategory(category) end

--- Renvoie la liste des devices dont `type` égale la valeur donnée (ordre non garanti : parcours de pairs).
---Source : lua/vehicle/powertrain.lua:913
---@param deviceType string Type jbeam (ex. 'combustionEngine', 'differential', 'shaft').
---@return table[]  Tableau de devices (vide si aucun).
function powertrain.getDevicesByType(deviceType) end

--- Renvoie un identifiant de son moteur unique et croissant (0, 1, 2…), remis à -1 à chaque init.
---Source : lua/vehicle/powertrain.lua:1041
---@return integer  Identifiant de son moteur.
function powertrain.getEngineSoundID() end

--- Multiplie les gearRatio en remontant du device du bas jusqu'au device du haut. Renvoie nil si les devices ne sont pas connectés (ou si un argument est nil).
---Source : lua/vehicle/powertrain.lua:1014
---@param topDevice table Device amont (plus proche du moteur).
---@param bottomDevice table Device aval (descendant de topDevice).
---@return number|nil  Rapport cumulé entre les deux.
function powertrain.getGearRatioBetweenDevices(topDevice, bottomDevice) end

--- Cherche parmi les sources hydrauliques (catégorie hydraulicPowerSource) un consommateur nommé.
---Source : lua/vehicle/powertrain.lua:985
---@param consumerName string Nom du consommateur.
---@return table|nil  Consommateur trouvé ou nil.
function powertrain.getHydraulicConsumer(consumerName) end

--- Renvoie le tableau (indexé 1..N) des devices ordonné de la racine vers les feuilles.
---Source : lua/vehicle/powertrain.lua:905
---@return table  Liste ordonnée des devices (ne pas modifier).
function powertrain.getOrderedDevices() end

--- Agrège l'état d'usure/intégrité des devices concernés par les clés de partie de la forme « powertrainDevice:<nom>:<sousSystème> ».
---Source : lua/vehicle/powertrain.lua:1075
---@param partTypeData string[]|nil Liste de clés de type de pièce.
---@return table  {integrityValue (min des devices, défaut 1), integrityState, visualValue=1, visualState}.
---@return boolean  true si au moins un device a fourni une intégrité.
---@return boolean  Toujours false (condition visuelle non fournie).
function powertrain.getPartCondition(partTypeData) end

--- Renvoie, pour chaque roue du véhicule entraînée par un moteur, le nom de ce moteur.
---Source : lua/vehicle/powertrain.lua:957
---@return table<string, string>  nomRoue -> nom du device moteur.
function powertrain.getPoweredWheelNames() end

--- Remonte les parents d'un device jusqu'à trouver un device de catégorie engine.
---Source : lua/vehicle/powertrain.lua:1000
---@param device table Device de départ.
---@return table|nil  Le moteur ancêtre (ou le device lui-même), nil si aucun.
function powertrain.getPropulsionDeviceForDevice(device) end

--- Renvoie le device de catégorie engine qui entraîne la roue (table calculée à l'init).
---Source : lua/vehicle/powertrain.lua:953
---@param wheelName string Nom de la roue.
---@return table|nil  Device moteur ou nil.
function powertrain.getPropulsionDeviceForWheel(wheelName) end

--- Fusionne les états renvoyés par device:getState() de tous les devices (sauvegarde d'état).
---Source : lua/vehicle/powertrain.lua:1101
---@return table|nil  Table fusionnée réutilisée à chaque appel, nil si aucun device n'a de données.
function powertrain.getState() end

--- Construit le powertrain à partir de v.data.powertrain : découvre les fabriques de devices (FS:findFiles sur lua/vehicle/powertrain et <véhicule>/lua/powertrain), instancie chaque device (factory.new(jbeamData)), les relie en arbre, calcule positions visuelles, validation, inerties, poutres de rupture, torsion reactors, restaure les modes précédents et envoie l'arbre à l'UI. Appelée par main.lua (initSystems) et par reset() si un device ne supporte pas reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:426
function powertrain.init() end

--- Appelle device:initSounds(jbeamData) sur chaque device qui en a un. Appelée par main.lua après l'init audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:725
function powertrain.initSounds() end

--- Indique si le powertrain a besoin du pas de physique (true quand un powertrain a été construit). Utilisé par main.lua:updateCorePhysicsStepEnabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:1097
---@return boolean  hasPowertrain.
function powertrain.isPhysicsStepUsed() end

--- Hook relayé par main.lua aux devices (arguments attachEnergy et attachSpeed inversés par compatibilité).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:838
---@param nodeId integer Noeud coupleur local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud de l'autre véhicule.
---@param attachSpeed number Vitesse à l'attache.
---@param attachEnergy number Énergie à l'attache.
function powertrain.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Hook relayé par main.lua aux devices lors du détachement d'un coupleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:847
---@param nodeId integer Noeud coupleur local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud de l'autre véhicule.
---@param breakForce number Force de détachement.
function powertrain.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook relayé par main.lua : transmet à device:onCouplerFound les devices qui l'implémentent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:829
---@param nodeId integer Noeud coupleur local.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud de l'autre véhicule.
---@param nodeDist number Distance entre les noeuds.
function powertrain.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Réinitialise les dégâts de groupes de déformation et appelle device:reset(jbeamData) sur chaque device, recalcule les inerties, renvoie l'arbre à l'UI et remet à zéro les coefficients de réaction de couple. Si un device n'a pas de reset(), retombe sur init(). Appelée par main.lua au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:737
function powertrain.reset() end

--- Appelle device:resetSounds(jbeamData) sur les devices (ou initSounds si reset complet nécessaire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:780
function powertrain.resetSounds() end

--- Envoie à l'UI l'évènement PowertrainDeviceTreeChanged {devices, maxPower, maxTorque} (type, modes, position visuelle, enfants, mode courant de chaque device). Sans effet si le premier joueur n'est pas assis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:272
function powertrain.sendDeviceTree() end

--- Demande à chaque device d'envoyer ses courbes de couple (device:sendTorqueData()) ; sans effet si le premier joueur n'est pas assis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:308
function powertrain.sendTorqueData() end

--- Ancien code lié à un outil imgui, utilisé côté GE : sérialise un sous-ensemble de champs de tous les devices (name, type, engineLoad, outputAV1/2, outputTorque1/2, mode, isBroken, rapports, embrayages…).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:78
---@return string  Table sérialisée (serialize).
function powertrain.serializeDevicesInfo() end

--- Fixe le mode d'un device (device:setMode), mémorise ce choix pour le restaurer après un init et affiche un message UI « <nom> Mode: <mode> ».
---Source : lua/vehicle/powertrain.lua:856
---@param name string Nom du device.
---@param mode string Mode à appliquer (doit exister dans les modes du device).
function powertrain.setDeviceMode(name, mode) end

--- Applique une condition de pièce (odomètre, intégrité, visuel) aux devices désignés par partTypeData via device:setPartCondition.
---Source : lua/vehicle/powertrain.lua:1059
---@param partTypeData string[]|nil Clés « powertrainDevice:<nom>:<sousSystème> ».
---@param odometer number Distance/usure cumulée à appliquer (déduit du code).
---@param integrity number|table Intégrité ; si table, la valeur est integrity.powertrain[nomDevice].
---@param visual any Condition visuelle transmise au device.
function powertrain.setPartCondition(partTypeData, odometer, integrity, visual) end

--- Passe `data` à device:setState(data) de chaque device qui l'implémente.
---Source : lua/vehicle/powertrain.lua:1120
---@param data table|nil État produit par getState ; ignoré si nil.
function powertrain.setState(data) end

--- Enregistre le dossier du véhicule, utilisé pour chercher les fabriques de devices spécifiques. Appelée par main.lua avant init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:1037
---@param path string Dossier du véhicule.
function powertrain.setVehiclePath(path) end

--- Fait passer au mode suivant tous les différentiels (type 'differential') qui ont defaultToggle vrai.
---Source : lua/vehicle/powertrain.lua:893
function powertrain.toggleDefaultDiffs() end

--- Passe le device nommé au mode suivant de sa liste availableModes (cyclique) via setDeviceMode.
---Source : lua/vehicle/powertrain.lua:867
---@param name string Nom du device.
---@return string|nil  Nouveau mode, nil si le device n'existe pas.
function powertrain.toggleDeviceMode(name) end

--- Appelée à chaque frame graphique par main.lua. Met à jour les champs d'environnement, applique aux devices les nouveaux dégâts de groupes de déformation (applyDeformGroupDamage), appelle device:updateGFX et updateSounds, intègre l'angle visuel d'arbre (electrics.values[electricsName]) puis envoie les données du flux UI 'powertrainDeviceData' si demandé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:176
---@param dt number Pas de temps en secondes.
function powertrain.updateGFX(dt) end

--- Dernière étape de la frame graphique (fin de onGraphicsStep) : appelle device:updateGFXLastStage(dt) sur les devices qui l'implémentent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain.lua:229
---@param dt number Pas de temps en secondes.
function powertrain.updateGFXLastStage(dt) end

--- Demande à chaque device de republier ses boutons de contrôle simplifié (device:updateSimpleControlButtons()).
---Source : lua/vehicle/powertrain.lua:318
function powertrain.updateSimpleControlButtons() end

---@type number
i = nil
