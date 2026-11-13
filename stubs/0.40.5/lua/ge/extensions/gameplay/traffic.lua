---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système principal de trafic IA en freeroam. Il fait apparaître un groupe de véhicules (via core_multiSpawn), les insère dans la table du trafic (objets gameplay/traffic/vehicle avec rôles), gère un pool de véhicules actifs/inactifs (core_vehicleActivePooling), et les réapparaît devant le point de focus (joueur ou caméra) sur le réseau routier. Gère aussi les variables globales du trafic (agressivité, limite de vitesse, mode IA…), un système de véhicules « réservés » pour des fournisseurs spéciaux (police, taxi…), la sauvegarde/restauration de l'état et le debug visuel. États : 'off', 'spawning', 'loading', 'on'.
--- Accès : extension `gameplay_traffic` : `extensions.load("gameplay_traffic")`, puis la globale `gameplay_traffic`
---@class gameplay_traffic
---@field debugMode boolean Mode debug visuel et journal (dessine ligne et texte par véhicule dans onPreRender). Modifié par setDebugMode / setTrafficVars({aiDebug='traffic'}).
---@field dependencies string[] Extensions chargées avant ce module.
---@field showMessages boolean Autorise l'affichage automatique de messages UI (true par défaut).
gameplay_traffic = {}

--- Active le mode trafic et ajoute des véhicules à la table. Si vehList n'est pas une table, prend tous les véhicules non garés (compatibilité).
---Source : lua/ge/extensions/gameplay/traffic.lua:966
---@param vehList integer[]|nil Identifiants à ajouter.
function gameplay_traffic.activate(vehList) end

--- Retire tous les véhicules de la table du trafic.
---Source : lua/ge/extensions/gameplay/traffic.lua:992
---@param stopAi boolean|nil Arrêter l'IA des véhicules.
function gameplay_traffic.deactivate(stopAi) end

--- Supprime tous les véhicules du trafic (IA ou marqués isTraffic) de la scène et de la table.
---Source : lua/ge/extensions/gameplay/traffic.lua:956
function gameplay_traffic.deleteVehicles() end

--- S'assure qu'un fournisseur dispose de count véhicules réservés (en fait apparaît au plus 4 à la fois). Émet onTrafficReservedVehiclesReady quand déjà suffisant.
---Source : lua/ge/extensions/gameplay/traffic.lua:99
---@param providerName string Nom du fournisseur.
---@param count integer Nombre souhaité.
---@return boolean  false si rien à faire ou échec, true si déjà prêt ou spawn lancé.
function gameplay_traffic.ensureReservedVehicles(providerName, count) end

--- Téléporte de force un véhicule du trafic vers un point de spawn sûr trouvé autour de pos. Ignoré si enableRespawn est faux ou si ignoreForceTeleport est vrai ; une réserve non utilisée est simplement rendue dormante.
---Source : lua/ge/extensions/gameplay/traffic.lua:508
---@param id integer Identifiant du véhicule.
---@param pos vec3|nil Centre de recherche ; défaut position de la caméra.
---@param dir vec3|nil Direction ; défaut direction avant de la caméra.
---@param minDist number|nil Distance minimale (défaut 100 m).
---@param maxDist number|nil Distance maximale (défaut 500 m).
---@param targetDist number|nil Distance visible cible.
function gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist) end

--- Alias de scatterTraffic.
---Source : lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds integer[]|nil Véhicules.
---@param minDist number|nil Distance minimale.
---@param maxDist number|nil Distance maximale.
function gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist) end

--- Arrête les systèmes de trafic, police et parking et renvoie leurs données sérialisées (utilisé par exemple au début d'une mission).
---Source : lua/ge/extensions/gameplay/traffic.lua:1219
---@param options table|nil Options de onSerialize (despawnVehicles, exceptVehicleId, debugVehicleStashing).
---@return table  Données du trafic.
---@return table  Données de la police.
---@return table  Données du parking.
function gameplay_traffic.freezeState(options) end

--- Renvoie la table de focus {mode, pos, dirVec, speed, vehId, auto}.
---Source : lua/ge/extensions/gameplay/traffic.lua:383
---@return table  Focus courant.
function gameplay_traffic.getFocus() end

--- Calcule le nombre idéal de véhicules à créer.
---Source : lua/ge/extensions/gameplay/traffic.lua:276
---@param amount integer|nil Quantité demandée ; nil ou négatif = réglages (CPU si 0).
---@param enforceLimit boolean|nil Soustrait les véhicules actifs non garés déjà présents (plus un pour le joueur).
---@return integer  Quantité.
function gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit) end

--- Alias de getTrafficAmount.
---Source : lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly boolean|nil Ne compter que les actifs.
---@return integer  Quantité.
function gameplay_traffic.getNumOfTraffic(activeOnly) end

--- État du système : 'off', 'spawning', 'loading' ou 'on'.
---Source : lua/ge/extensions/gameplay/traffic.lua:297
---@return string  État.
function gameplay_traffic.getState() end

--- Alias de getTrafficData.
---Source : lua/ge/extensions/gameplay/traffic.lua:309
---@return table<integer, table>  Véhicules du trafic.
function gameplay_traffic.getTraffic() end

--- Alias de getTrafficList.
---Source : lua/ge/extensions/gameplay/traffic.lua:305
---@return integer[]  Identifiants.
function gameplay_traffic.getTrafficAiVehIds() end

--- Nombre de véhicules IA du trafic (alias getNumOfTraffic).
---Source : lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly boolean|nil Ne compter que les actifs (borné par activeAmount).
---@return integer  Quantité.
function gameplay_traffic.getTrafficAmount(activeOnly) end

--- Table complète du trafic : identifiant -> objet traffic vehicle (alias getTraffic). Contient aussi le véhicule joueur.
---Source : lua/ge/extensions/gameplay/traffic.lua:309
---@return table<integer, table>  Véhicules du trafic.
function gameplay_traffic.getTrafficData() end

--- Liste des identifiants des véhicules IA du trafic (alias getTrafficAiVehIds).
---Source : lua/ge/extensions/gameplay/traffic.lua:305
---@return integer[]  Identifiants (table interne, ne pas modifier).
function gameplay_traffic.getTrafficList() end

--- Renvoie la table des variables du trafic (référence directe).
---Source : lua/ge/extensions/gameplay/traffic.lua:347
---@return table  Variables (voir notes).
function gameplay_traffic.getTrafficVars() end

--- Insère un véhicule existant dans la table du trafic (crée l'objet traffic vehicle, l'ajoute au pool, règle le mode IA, gère le marquage 'reserved:' via spawnMeta). Émet onTrafficVehicleAdded.
---Source : lua/ge/extensions/gameplay/traffic.lua:778
---@param id integer Identifiant du véhicule.
---@param ignoreAi boolean|nil N'applique ni IA ni respawn (utilisé pour le véhicule joueur).
---@param ignoreVehPool boolean|nil Ne pas l'ajouter au pool de désactivation.
function gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool) end

--- Hook : arrête le trafic, vide les spawns réservés, réinitialise variables et focus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1566
function gameplay_traffic.onClientEndMission() end

--- Hook : met à jour la visibilité des passagers des véhicules simple_traffic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1554
function gameplay_traffic.onClientStartMission() end

--- Restaure l'état du trafic ; avec respawnVehicles, recrée les véhicules mémorisés et remappe leurs identifiants (rôle, poursuite, collisions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1639
---@param data table Données de onSerialize.
---@param options table|nil respawnVehicles, debugVehicleStashing.
function gameplay_traffic.onDeserialized(data, options) end

--- Hook : met à jour la visibilité des passagers des véhicules simple_traffic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1558
function gameplay_traffic.onExtensionLoaded() end

--- Hook de rendu : en mode debug, dessine pour chaque véhicule actif une ligne vers le focus et un texte (id, distance, vitesse en km/h).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1493
---@param dt number Temps de frame.
function gameplay_traffic.onPreRender(dt) end

--- Sérialise l'état du trafic (état, véhicules, variables), puis arrête le trafic. Avec despawnVehicles, mémorise aussi les données d'apparition des véhicules et les supprime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1591
---@param options table|nil despawnVehicles, exceptVehicleId, debugVehicleStashing.
---@return table  Données {state, traffic, vars, vehicleSpawnData, vehicleSpawnOrder}.
function gameplay_traffic.onSerialize(options) end

--- Hook : met à jour la visibilité des passagers (réglage enableSeatOccupants).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1562
function gameplay_traffic.onSettingsChanged() end

--- Hook : passe l'état à 'on', prépare le pool et insère les véhicules joueurs. Émis par onUpdate après l'insertion du premier véhicule IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1516
function gameplay_traffic.onTrafficStarted() end

--- Hook : supprime le pool et vide les tables du trafic (état 'off').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1547
function gameplay_traffic.onTrafficStopped() end

--- Hook appelé quand l'écran d'attente est affiché : lance setupTrafficHelper avec les paramètres préparés par setupTrafficWaitForUi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1574
function gameplay_traffic.onUiWaitingState() end

--- Hook appelé à chaque frame : lance le spawn en état 'loading', surveille le watchdog, déclenche onTrafficStarted/onTrafficStopped, met à jour le focus, le pool et la logique de trafic (un véhicule traité par frame).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1417
---@param dtReal number Temps réel (s).
---@param dtSim number Temps simulé (s).
function gameplay_traffic.onUpdate(dtReal, dtSim) end

--- Hook appelé quand un véhicule est activé/désactivé : masque un véhicule désactivé et téléporte un véhicule réactivé si sa position n'est pas sûre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:936
---@param vehId integer Identifiant du véhicule.
---@param active boolean Nouvel état.
function gameplay_traffic.onVehicleActiveChanged(vehId, active) end

--- Hook : retire le véhicule détruit du trafic et du spawn en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:923
---@param id integer Identifiant du véhicule.
function gameplay_traffic.onVehicleDestroyed(id) end

--- Hook appelé quand un groupe multiSpawn est créé : active les véhicules du groupe 'autoTraffic', applique des plaques fantaisie, traite les réserves et émet onTrafficOrParkingReady quand tout est prêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1346
---@param vehList integer[] Véhicules du groupe.
---@param groupId any Identifiant du groupe.
---@param groupName string Nom du groupe.
function gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Hook appelé quand le mapmgr d'un véhicule est prêt ; termine le chargement quand tous les véhicules attendus ont rapporté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:1335
---@param id integer Identifiant du véhicule.
function gameplay_traffic.onVehicleMapmgrUpdate(id) end

--- Hook : traite le reset d'un véhicule du trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:905
---@param id integer Identifiant du véhicule.
function gameplay_traffic.onVehicleResetted(id) end

--- Hook : à l'apparition ou au remplacement d'un véhicule du trafic, réapplique ses données de modèle et son rôle automatique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:890
---@param id integer Identifiant du véhicule.
function gameplay_traffic.onVehicleSpawned(id) end

--- Hook : vérifie que le nouveau véhicule joueur est dans la table du trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic.lua:901
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function gameplay_traffic.onVehicleSwitched(oldId, newId) end

--- Protège un véhicule non réservé du pooling automatique pendant qu'un fournisseur l'utilise (mêmes protections qu'une réserve prise).
---Source : lua/ge/extensions/gameplay/traffic.lua:259
---@param id integer Identifiant du véhicule.
---@param providerName string Nom du fournisseur.
function gameplay_traffic.protectNonReservedVehicle(id, providerName) end

--- Remplace en place le modèle/config d'une réserve non utilisée (spawn.setVehicleObject), la met au rôle 'empty' et dormante.
---Source : lua/ge/extensions/gameplay/traffic.lua:226
---@param providerName string Nom du fournisseur.
---@param id integer Identifiant du véhicule.
---@param spawnData table {model, config} ; config peut être un nom ou un chemin .pc.
---@return boolean  true si recyclé.
function gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData) end

--- Appelle onRefresh sur chaque véhicule du trafic (réinitialise ses données).
---Source : lua/ge/extensions/gameplay/traffic.lua:688
function gameplay_traffic.refreshVehicles() end

--- Enregistre (ou remplace) un fournisseur de véhicules spéciaux (police, taxi…). Champs lus : name (obligatoire), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved.
---Source : lua/ge/extensions/gameplay/traffic.lua:76
---@param provider table Description du fournisseur.
function gameplay_traffic.registerSpecialVehicleProvider(provider) end

--- Supprime tous les véhicules réservés d'un fournisseur et annule un spawn en cours.
---Source : lua/ge/extensions/gameplay/traffic.lua:147
---@param providerName string Nom du fournisseur.
---@return integer  Nombre de véhicules supprimés.
function gameplay_traffic.removeReservedVehicles(providerName) end

--- Retire un véhicule du trafic : remet l'action du rôle à zéro, réaffiche le véhicule, le rend jouable et le sort du pool. Émet onTrafficVehicleRemoved.
---Source : lua/ge/extensions/gameplay/traffic.lua:840
---@param id integer Identifiant du véhicule.
---@param stopAi boolean|nil Mettre l'IA du véhicule en mode 'stop'.
function gameplay_traffic.removeTraffic(id, stopAi) end

--- Déplace un véhicule vers une nouvelle position et rotation (pour le trafic) et appelle onRespawn sur son objet trafic. Mode non strict : spawn.safeTeleport (plus lent, évite la géométrie statique).
---Source : lua/ge/extensions/gameplay/traffic.lua:488
---@param id integer Identifiant du véhicule.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param strict boolean|nil Placement direct (setPositionRotation + autoplace) avec rotation de 180° ajoutée.
function gameplay_traffic.respawnVehicle(id, pos, rot, strict) end

--- Rend des réserves en service au pool dormant. Elles continuent de rouler jusqu'à leur prochaine téléportation hors de vue, où elles se désactivent ; avec immediate, elles deviennent dormantes tout de suite.
---Source : lua/ge/extensions/gameplay/traffic.lua:215
---@param ids integer|integer[] Identifiant(s).
---@param immediate boolean|nil Désactiver immédiatement.
function gameplay_traffic.returnReservedVehicle(ids, immediate) end

--- Téléporte un groupe de véhicules loin de l'endroit actuel (alias forceTeleportAll).
---Source : lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds integer[]|nil Véhicules ; défaut tous les véhicules IA du trafic.
---@param minDist number|nil Distance minimale.
---@param maxDist number|nil Distance maximale.
function gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist) end

--- Fixe le nombre maximal de véhicules actifs (visibles).
---Source : lua/ge/extensions/gameplay/traffic.lua:773
---@param amount integer|nil Nombre ; nil = illimité.
function gameplay_traffic.setActiveAmount(amount) end

--- Active ou coupe le mode debug du trafic (via setTrafficVars aiDebug).
---Source : lua/ge/extensions/gameplay/traffic.lua:768
---@param value boolean true pour activer.
function gameplay_traffic.setDebugMode(value) end

--- Définit le point de focus utilisé pour décider quels véhicules rester actifs ou à téléporter (trafic et parking).
---Source : lua/ge/extensions/gameplay/traffic.lua:351
---@param mode string|nil 'camera', 'vehicle' ou 'custom' ; nil = caméra avec changement automatique.
---@param data table|nil vehId (mode vehicle) ; pos, dir, speed (mode custom) ; auto (booléen).
function gameplay_traffic.setFocus(mode, data) end

--- Modifie les variables du trafic et les propage aux véhicules (mode IA, paramètres IA, spawnValue, spawnDirBias, debug, activeAmount). Passer à un aiMode autre que 'traffic' met les rôles à 'empty' (restaurés au retour en 'traffic').
---Source : lua/ge/extensions/gameplay/traffic.lua:713
---@param data table Variables à fusionner.
---@param reset boolean|nil Réinitialiser aux valeurs par défaut avant.
function gameplay_traffic.setTrafficVars(data, reset) end

--- Fait apparaître un groupe créé avec des paramètres personnalisés.
---Source : lua/ge/extensions/gameplay/traffic.lua:1184
---@param amount integer|nil Quantité (réglages si nil ou négatif).
---@param params table|nil Paramètres de core_multiSpawn.createGroup.
function gameplay_traffic.setupCustomTraffic(amount, params) end

--- Prépare le trafic : supprime le trafic courant (sauf keepCurrent), détermine le nombre de véhicules (réglage ou CPU si -1), construit ou charge le groupe (fichier de niveau, groupe personnalisé ou généré), insère les véhicules des fournisseurs spéciaux (jusqu'à 40 % du total) et les réserves, puis passe en état 'loading' ; le spawn réel se fait ensuite dans onUpdate.
---Source : lua/ge/extensions/gameplay/traffic.lua:1008
---@param amount integer|nil Nombre de véhicules ; -1 ou nil = automatique selon les réglages (trafficAmount, trafficExtraVehicles/trafficExtraAmount).
---@param options table|nil activeAmount, keepCurrent, vehGroup, autoAdjustAmount, autoLoadFromFile, simpleVehs, allMods, allConfigs, pos, rot.
---@return boolean  true si un spawn a été lancé, false si rien à créer.
function gameplay_traffic.setupTraffic(amount, options) end

--- Prépare trafic et véhicules garés en même temps (parking d'abord). Le hook onTrafficOrParkingReady signale la fin.
---Source : lua/ge/extensions/gameplay/traffic.lua:1150
---@param trafficAmount integer|nil Quantité de trafic.
---@param trafficOptions table|nil Options de setupTraffic.
---@param parkingAmount integer|nil Quantité de véhicules garés.
---@param parkingOptions table|nil Options de gameplay_parking.setupVehicles.
---@param extraOptions table|nil Non utilisé.
---@return boolean  Trafic préparé.
---@return boolean  Parking préparé.
function gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions) end

--- Utilisé par le menu pause : affiche l'icône d'attente (app:waiting) et prépare le trafic ; le spawn démarre dans onUiWaitingState.
---Source : lua/ge/extensions/gameplay/traffic.lua:1168
---@param useTraffic boolean Activer le trafic.
---@param useParked boolean Activer les véhicules garés (ignoré si le trafic est activé mais que le réglage trafficParkedVehicles est faux).
---@param options table|nil Options de setupTraffic.
function gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options) end

--- Fait apparaître un groupe de véhicules via core_multiSpawn.spawnGroup (nom 'autoTraffic'). Met l'état à 'spawning'. Interface publique de bas niveau ; on préfère setupTraffic.
---Source : lua/ge/extensions/gameplay/traffic.lua:998
---@param amount integer|nil Nombre de véhicules ; défaut : valeur des réglages moins les véhicules existants (au moins 1).
---@param groupData table|nil Groupe de véhicules ; défaut core_multiSpawn.createGroup(amount).
---@param options table|nil mode ('traffic' par défaut), gap (20 m), pos, dir.
---@return any  Résultat de core_multiSpawn.spawnGroup.
function gameplay_traffic.spawnTraffic(amount, groupData, options) end

--- Active ou désactive le trafic en freeroam (ignoré hors freeroam ou si l'action toggleTraffic est bloquée). Si éteint, lance setupTraffic ; si allumé, soit supprime les véhicules, soit avec keepInMemory les désactive (activeAmount = 0) pour une réactivation instantanée.
---Source : lua/ge/extensions/gameplay/traffic.lua:1193
---@param keepInMemory boolean|nil Garder les véhicules en mémoire (consomme de la RAM).
function gameplay_traffic.toggle(keepInMemory) end

--- Appelé quand le joueur définit un mode IA pour tous les véhicules : applique ce mode comme aiMode du trafic.
---Source : lua/ge/extensions/gameplay/traffic.lua:1330
---@param mode string|nil Mode IA ; défaut 'traffic'.
function gameplay_traffic.trackAIAllVeh(mode) end

--- Restaure les systèmes depuis les données de freezeState puis disperse le trafic (scatterTraffic).
---Source : lua/ge/extensions/gameplay/traffic.lua:1226
---@param trafficData table|nil Données du trafic.
---@param policeData table|nil Données de la police.
---@param parkingData table|nil Données du parking.
---@param options table|nil Options (respawnVehicles, debugVehicleStashing).
function gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options) end

--- Retire cette protection : le véhicule redevient du trafic normal.
---Source : lua/ge/extensions/gameplay/traffic.lua:264
---@param id integer Identifiant du véhicule.
function gameplay_traffic.unprotectNonReservedVehicle(id) end

--- Retire un fournisseur par son nom.
---Source : lua/ge/extensions/gameplay/traffic.lua:90
---@param name string Nom du fournisseur.
function gameplay_traffic.unregisterSpecialVehicleProvider(name) end

--- Met en service jusqu'à count réserves dormantes d'un fournisseur et les active (forcé dans le pool). Les véhicules deviennent « claimed ».
---Source : lua/ge/extensions/gameplay/traffic.lua:195
---@param providerName string Nom du fournisseur.
---@param count integer|nil Nombre (défaut 1).
---@param onClaim function|nil Callback (id, veh) pour chaque véhicule pris.
---@param filter function|nil Filtre (id, veh) -> boolean.
---@return integer[]  Identifiants pris.
function gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter) end

