# Atlas de l'API Lua BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)

Généré par tim19Atlas à partir du code Lua du jeu (lecture seule). 
✍ = description rédigée et vérifiée ; sinon : signatures et commentaires d'origine.

- [Hooks (évènements)](hooks.md)
- [Classes C++ exposées](cpp.md)
- [Mode d'emploi des stubs LuaLS](../../README.md)

## Véhicule

### Modules (38)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `ai`](vehicle/ai.md) | 47 | Intelligence artificielle de conduite d'un véhicule (VM véhicule, globale `ai`). Elle conduit le véhicule le long d'un graphe routier (mapmg |
| [✍ `aiDebugDraw`](vehicle/aiDebugDraw.md) | 6 | Dessin de debug de l'IA véhicule (sphères, cylindres, textes via obj.debugDrawProxy). Chargé par ai.lua (require 'aiDebugDraw') ; ai.setVehi |
| [✍ `backwardsCompatibility`](vehicle/backwardsCompatibility.md) | 1 | Convertit à l'initialisation les anciennes données de véhicule (v.data) vers le format actuel : ancienne chaîne de transmission (engine/diff |
| [✍ `bdebug`](vehicle/bdebug.md) | 23 | Façade légère de l'outil de debug visuel du véhicule (nœuds, poutres, triangles de collision, centre de gravité…). Tant que personne ne l'ut |
| [✍ `bdebugImpl`](vehicle/bdebugImpl.md) | 23 | Implémentation complète de l'outil de debug visuel du véhicule (chargée paresseusement par bdebug.lua). Dessine nœuds, poutres, barres de to |
| [✍ `beamstate`](vehicle/beamstate.md) | 49 | Etat physique du vehicule cote Lua (VM vehicule, globale `beamstate`). Suit les poutres cassees ou deformees, les groupes de casse (breakGro |
| [✍ `bullettime`](vehicle/bullettime.md) | 7 | Ancienne API de ralenti (bullet time) côté véhicule, conservée pour la compatibilité des mods. Elle ne fait que relayer vers `simTimeAuthori |
| [✍ `controller`](vehicle/controller.md) | 26 | Gestionnaire des contrôleurs jbeam du véhicule (VM véhicule, globale `controller`). Au chargement, il lit la section `controller` du jbeam ( |
| [✍ `damageTracker`](vehicle/damageTracker.md) | 9 | Registre des états de dommage du véhicule, organisés par groupe puis par nom (ex. groupe 'energyStorage', nom du réservoir). Chaque changeme |
| [✍ `drivetrain`](vehicle/drivetrain.md) | 5 | Couche de compatibilité ascendante : reproduit l'ancienne API `drivetrain` en lisant les périphériques du nouveau système `powertrain` ('mai |
| [✍ `electrics`](vehicle/electrics.md) | 26 | Table de valeurs électriques du véhicule (`electrics.values`) partagée par tous les contrôleurs, l'UI et les extensions, plus la logique des |
| [✍ `electricsCustomValueParser`](vehicle/electricsCustomValueParser.md) | 5 | Compile et exécute les valeurs électriques personnalisées déclarées dans le jbeam (electrics.customValues : champs electricsName, electricsF |
| [✍ `energyStorage`](vehicle/energyStorage.md) | 13 | Gestionnaire des réservoirs d'énergie du véhicule (carburant, batterie, N2O, air comprimé…). Au init il charge dynamiquement chaque type dep |
| [✍ `fire`](vehicle/fire.md) | 13 | Simulation d'incendie du véhicule. Les noeuds jbeam qui ont un `flashPoint` deviennent des noeuds inflammables : chacun a une température, u |
| [✍ `streams`](vehicle/guistreams.md) | 12 | Flux de données envoyés à l'UI (apps du HUD) à haute fréquence. Chaque flux a un nom (wheelInfo, engineInfo, stats, electrics, sensors, envi |
| [✍ `htmlTexture`](vehicle/htmlTexture.md) | 3 | Aide pour afficher une page web (HTML/JS) sur une texture du véhicule (écran de tableau de bord, afficheur). `create` ou `new` crée une vue  |
| [✍ `hydros`](vehicle/hydros.md) | 18 | Gère les hydros jbeam (poutres/barres de torsion pilotées par une entrée : direction, bennes, grues, etc.) et le retour de force (FFB) du vo |
| [✍ `input`](vehicle/input.md) | 12 | Réception et filtrage des entrées de conduite du véhicule (volant, gaz, frein, frein à main, embrayage, et toute entrée spécifique au véhicu |
| [✍ `v`](vehicle/jbeam/stage2.md) | 1 | Deuxième étape du chargement d'un véhicule, côté VM véhicule : prend les données jbeam déjà assemblées par le jeu (stage 1, dans la VM du je |
| [✍ `main`](vehicle/main.md) | 0 | Point d'entrée de la VM Lua d'un véhicule : c'est le premier script exécuté. Il configure LuaJIT et package.path, charge les utilitaires com |
| [✍ `mapmgr`](vehicle/mapmgr.md) | 17 | Pont entre le véhicule et la carte routière (navgraph) du jeu. Il reçoit la carte du Lua du jeu (GE) par boîte aux lettres (mailbox), la déc |
| [✍ `material`](vehicle/material.md) | 5 | Gère le changement dynamique de matériaux du véhicule (feux, phares, cadrans lumineux, carrosserie cassée). Le jbeam compile à l'init une ta |
| [✍ `motionSim`](vehicle/motionSim.md) | 0 | Fichier obsolète conservé pour compatibilité : le require('motionSim') ne fait que loguer une erreur (renvoie vers https://go.beamng.com/pro |
| [✍ `network`](vehicle/network.md) | 0 | Fichier vide en 0.40.5 (seulement l'en-tête de licence, aucun code). Un require('network') ne renvoie donc pas de table (renvoie true selon  |
| [✍ `partCondition`](vehicle/partCondition.md) | 16 | Système d'usure et d'état des pièces du véhicule (kilométrage, intégrité/dommages, état visuel dont la peinture vieillie). Il découvre quell |
| [✍ `particlefilter`](vehicle/particlefilter.md) | 1 | Filtre d'émission de particules lors des collisions de noeuds. main.lua remplit la table partagée particlefilter.particleData à chaque onNod |
| [✍ `powertrain`](vehicle/powertrain.md) | 39 | Gestionnaire du groupe motopropulseur (powertrain) du véhicule : à l'init il lit la section `powertrain` du jbeam (v.data.powertrain), crée  |
| [✍ `props`](vehicle/props.md) | 4 | Pilote les props animés du véhicule (section jbeam "props" : aiguilles, volant, pièces articulées, lumières de props). À chaque frame, chaqu |
| [✍ `protocols`](vehicle/protocols.md) | 6 | Gestionnaire des protocoles de télémétrie UDP du véhicule (OutGauge pour tableaux de bord externes, MotionSim pour plateformes de mouvement) |
| [✍ `protocols_motionSim`](vehicle/protocols/motionSim.md) | 8 | Protocole UDP « MotionSim » (format 'BNG1') pour piloter une plateforme de mouvement : envoie position, vitesse, accélération (sans gravité) |
| [✍ `protocols_outgauge`](vehicle/protocols/outgauge.md) | 8 | Protocole UDP OutGauge (compatible Live For Speed) : envoie vitesse, régime, rapport, pression de turbo, températures, carburant, entrées pé |
| [✍ `recovery`](vehicle/recovery.md) | 15 | Système de récupération (touche « recover ») du véhicule. En roulant, enregistre toutes les 0,2 s un historique de positions/orientations (j |
| [✍ `scriptai`](vehicle/scriptai.md) | 12 | IA « script » : enregistre la trajectoire du véhicule (position du pare-chocs avant + temps, éventuellement vitesse) puis la rejoue en pilot |
| [✍ `sensors`](vehicle/sensors.md) | 3 | Expose les accélérations mesurées au noeud de référence du véhicule (gx, gy, gz) ainsi que leur version lissée (gx2, gy2, gz2). Les valeurs  |
| [✍ `sounds`](vehicle/sounds.md) | 21 | Sons du véhicule autres que le moteur : bruits de roulement et de dérapage des pneus (selon le matériau du sol : asphalte, terre, gravier, h |
| [✍ `thrusters`](vehicle/thrusters.md) | 8 | Applique des poussées au véhicule : propulseurs jbeam (section 'thrusters', commandés par une valeur electrics ou en mode 'auto' qui fabriqu |
| [✍ `ve_utils`](vehicle/ve_utils.md) | 4 | Utilitaires globaux propres à la VM véhicule, chargés par require("ve_utils") : chronomètre haute précision, conversion de tables jbeam à en |
| [✍ `wheels`](vehicle/wheels.md) | 21 | Gère toutes les roues du véhicule côté Lua : table des roues (wheels), des rotors (rotators) et de l'ensemble des deux (wheelRotators), lect |

### Contrôleurs (113)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `controller_4wd`](vehicle/controller/4wd.md) | 10 | Contrôleur auxiliaire qui donne au conducteur la commande du 4x4 sélectionnable : arbre 4WD (connecté/déconnecté), boîte de gamme (haute/bas |
| [✍ `controller_advancedCouplerControl`](vehicle/controller/advancedCouplerControl.md) | 16 | Contrôleur auxiliaire qui pilote un groupe de verrous locaux (portes, trappes, hayons, loquets) formés de paires de noeuds du même véhicule, |
| [✍ `controller_airplaneSurfaces`](vehicle/controller/airplaneSurfaces.md) | 4 | Contrôleur auxiliaire pour les avions : combine les entrées du pilote (gouverne de direction, ailerons, profondeur) avec les trims, et gère  |
| [✍ `controller_axleLift`](vehicle/controller/axleLift.md) | 8 | Contrôleur auxiliaire qui lève ou abaisse des essieux (typiquement les essieux relevables d'un camion) pour gagner de la garde au sol. Il éc |
| [✍ `controller_beaconSpin`](vehicle/controller/beaconSpin.md) | 2 | Contrôleur auxiliaire minimal qui anime les éléments rotatifs d'une rampe lumineuse : tant que `electrics.values.lightbar` est supérieur à 0 |
| [✍ `controller_beamNavigator`](vehicle/controller/beamNavigator.md) | 2 | Contrôleur auxiliaire qui affiche une carte de navigation en direct sur un écran du véhicule. Il crée une texture HTML (module `htmlTexture` |
| [✍ `controller_braking_adaptiveBrakeLights`](vehicle/controller/braking/adaptiveBrakeLights.md) | 4 | Contrôleur auxiliaire qui calcule la valeur des feux stop (`electrics.values.brakelights` par défaut) en plus de la simple pédale de frein : |
| [✍ `controller_braking_brakedDifferentialSteering`](vehicle/controller/braking/brakedDifferentialSteering.md) | 4 | Contrôleur auxiliaire de direction par freinage différentiel (engins à chenilles ou skid-steer) : selon l'entrée de volant `steering_input`, |
| [✍ `controller_braking_compressionBrake`](vehicle/controller/braking/compressionBrake.md) | 9 | Contrôleur auxiliaire de frein moteur à décompression (« Jake brake » de camion). Il maintient un coefficient de 0 à 1 et des niveaux prérég |
| [✍ `controller_braking_hydraulicPumpBrake`](vehicle/controller/braking/hydraulicPumpBrake.md) | 10 | Contrôleur auxiliaire pour un freinage hydraulique alimenté par la pompe du moteur (véhicules lourds ou anciens). Les freins avant et arrièr |
| [✍ `controller_braking_postCrashBrake`](vehicle/controller/braking/postCrashBrake.md) | 4 | Contrôleur auxiliaire de freinage automatique après un choc. Une machine à états (idle, braking, holding, disabled) détecte une forte accélé |
| [✍ `controller_braking_retarderControl`](vehicle/controller/braking/retarderControl.md) | 8 | Contrôleur auxiliaire qui commande un ralentisseur (retarder) du powertrain. Une liste de réglages ordonnée (auto facultatif, off, puis nive |
| [✍ `controller_braking_transbrake`](vehicle/controller/braking/transbrake.md) | 6 | Contrôleur auxiliaire de transbrake (frein de boîte de drag racing) : il bloque la boîte via `gearbox:setLock(value)`. Le blocage est actif  |
| [✍ `controller_bypassDampers`](vehicle/controller/bypassDampers.md) | 6 | Contrôleur auxiliaire pour amortisseurs à canaux de dérivation (bypass shocks, type tout-terrain/Trophy truck) : l'amortissement d'une poutr |
| [✍ `controller_controlModes`](vehicle/controller/controlModes.md) | 7 | Contrôleur auxiliaire qui remappe les entrées du conducteur (direction, accélérateur, frein, ou accélérateur-frein combiné) vers des valeurs |
| [✍ `controller_controllerTemplate`](vehicle/controller/controllerTemplate.md) | 3 | Modèle de départ pour écrire un contrôleur de véhicule. Un contrôleur est un module Lua placé dans lua/vehicle/controller/, déclaré dans le  |
| [✍ `controller_couplings_containerLockFollow`](vehicle/controller/couplings/containerLockFollow.md) | 9 | Côté « suiveur » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui reçoit (par exemple le conteneur), il ré |
| [✍ `controller_couplings_containerLockLead`](vehicle/controller/couplings/containerLockLead.md) | 11 | Côté « leader » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui porte les verrous (grue, portique, châssi |
| [✍ `controller_couplings_fifthwheel`](vehicle/controller/couplings/fifthwheel.md) | 12 | Contrôleur auxiliaire de sellette d'attelage (fifth wheel) du tracteur : il cherche, parmi les véhicules en collision, les pivots (kingpin)  |
| [✍ `controller_couplings_kingpin`](vehicle/controller/couplings/kingpin.md) | 4 | Contrôleur auxiliaire du pivot d'attelage (kingpin) d'une semi-remorque. Il ne fait que répondre au contrôleur `couplings/fifthwheel` d'un t |
| [✍ `controller_dragTimer`](vehicle/controller/dragTimer.md) | 3 | Contrôleur auxiliaire de chronométrage de drag (accélération). Machine à états ready, countdown, measuring, done : quand le transbrake est a |
| [✍ `controller_driveModes`](vehicle/controller/driveModes.md) | 16 | Contrôleur auxiliaire de modes de conduite (Eco, Sport, Neige, etc., ou modes de différentiel/gamme pour un 4x4). Chaque mode est un ensembl |
| [✍ `controller_drivingDynamics_CMU`](vehicle/controller/drivingDynamics/CMU.md) | 24 | CMU (centre de gestion de la dynamique de conduite, Driving Dynamics Suite) : contrôleur chef d'orchestre des sous-contrôleurs du dossier `d |
| [✍ `controller_drivingDynamics_actuators_activeCenterDiffLock`](vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.md) | 13 | Actionneur de la Driving Dynamics Suite : verrouillage actif du différentiel central (embrayage à commande électronique). À chaque étape phy |
| [✍ `controller_drivingDynamics_actuators_activeDiffBias`](vehicle/controller/drivingDynamics/actuators/activeDiffBias.md) | 13 | Actionneur de la Driving Dynamics Suite : répartition active du couple entre les deux sorties d'un différentiel (torque vectoring). Il compa |
| [✍ `controller_drivingDynamics_actuators_activeDiffLock`](vehicle/controller/drivingDynamics/actuators/activeDiffLock.md) | 13 | Actionneur de la Driving Dynamics Suite : verrouillage actif d'un différentiel d'essieu. À 100 Hz (updateFixedStep) il compare les vitesses  |
| [✍ `controller_drivingDynamics_actuators_adaptiveDampers`](vehicle/controller/drivingDynamics/actuators/adaptiveDampers.md) | 10 | Actionneur de la Driving Dynamics Suite : amortisseurs à amortissement variable. Il regroupe des poutres d'amortisseur (par nom) et applique |
| [✍ `controller_drivingDynamics_actuators_adaptiveTorsionBars`](vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.md) | 10 | Actionneur de la Driving Dynamics Suite : barres de torsion (anti-roulis) à raideur variable. Il regroupe des barres de torsion par nom et a |
| [✍ `controller_drivingDynamics_actuators_electronicDiffLock`](vehicle/controller/drivingDynamics/actuators/electronicDiffLock.md) | 13 | Actionneur de la Driving Dynamics Suite : différentiel à verrouillage électronique par freinage (EDL, « brake-based » : on freine la roue qu |
| [✍ `controller_drivingDynamics_actuators_electronicSplitShaftLock`](vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.md) | 13 | Actionneur de la Driving Dynamics Suite : verrouillage électronique d'un arbre de répartition (split shaft, embrayage de transfert type Hald |
| [✍ `controller_drivingDynamics_sensors_sensorHub`](vehicle/controller/drivingDynamics/sensors/sensorHub.md) | 8 | Capteur central de la Driving Dynamics Suite : à chaque pas physique il lit les vitesses angulaires (roulis, tangage, lacet), l'attitude (ro |
| [✍ `controller_drivingDynamics_sensors_vehicleData`](vehicle/controller/drivingDynamics/sensors/vehicleData.md) | 8 | Capteur « données véhicule » du système drivingDynamics (type "auxiliary", defaultOrder 54). Il identifie les quatre roues d'angle (avant/ar |
| [✍ `controller_drivingDynamics_sensors_virtualSensors`](vehicle/controller/drivingDynamics/sensors/virtualSensors.md) | 9 | Capteurs virtuels du système drivingDynamics (type "auxiliary", defaultOrder 56) : estime la vitesse réelle du véhicule (virtual.speed), l'a |
| [✍ `controller_drivingDynamics_supervisors_components_aeroControl`](vehicle/controller/drivingDynamics/supervisors/components/aeroControl.md) | 14 | Composant de contrôle de lacet (type "auxiliary", defaultOrder 70) pour l'aérodynamique active. Il s'enregistre auprès du superviseur yawCon |
| [✍ `controller_drivingDynamics_supervisors_components_awdControl`](vehicle/controller/drivingDynamics/supervisors/components/awdControl.md) | 14 | Composant de contrôle de lacet pour les transmissions intégrales à verrouillage électronique (type "auxiliary", defaultOrder 70). Il s'enreg |
| [✍ `controller_drivingDynamics_supervisors_components_brakeControl`](vehicle/controller/drivingDynamics/supervisors/components/brakeControl.md) | 16 | Composant de freinage du système drivingDynamics (type "auxiliary", defaultOrder 70). Il agit comme antipatinage (ordre 30), contrôle de lac |
| [✍ `controller_drivingDynamics_supervisors_components_diffControl`](vehicle/controller/drivingDynamics/supervisors/components/diffControl.md) | 14 | Composant de contrôle de lacet agissant sur les différentiels avant/arrière à pilotage électronique (type "auxiliary", defaultOrder 70). Il  |
| [✍ `controller_drivingDynamics_supervisors_components_motorTorqueControl`](vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.md) | 15 | Composant du système drivingDynamics qui réduit le couple moteur via device.throttleFactor, pour l'antipatinage (ordre 40) et le contrôle de |
| [✍ `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip`](vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.md) | 14 | Fournisseur de glissement (type "auxiliary", defaultOrder 70, providerOrder 10) qui compare la vitesse de chaque roue à la vitesse virtuelle |
| [✍ `controller_drivingDynamics_supervisors_tractionControl`](vehicle/controller/drivingDynamics/supervisors/tractionControl.md) | 15 | Superviseur d'antipatinage (TCS) de la nouvelle architecture drivingDynamics (type "auxiliary", defaultOrder 65). Il ne calcule rien lui-mêm |
| [✍ `controller_drivingDynamics_supervisors_yawControl`](vehicle/controller/drivingDynamics/supervisors/yawControl.md) | 15 | Superviseur de contrôle de lacet (ESC moderne, type "auxiliary", defaultOrder 60) de l'architecture drivingDynamics. À chaque pas fixe il de |
| [✍ `controller_drivingDynamics_supervisors_yawProviders_STMEstimate`](vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.md) | 13 | Fournisseur de lacet attendu (type "auxiliary", defaultOrder 80, providerOrder 20) pour le superviseur yawControl. Il estime le taux de lace |
| [✍ `controller_dummy`](vehicle/controller/dummy.md) | 1 | Contrôleur principal (type "main") minimal pour les véhicules sans moteur (remorques, objets). Il fournit l'API obligatoire d'un contrôleur  |
| [✍ `controller_esc`](vehicle/controller/esc.md) | 17 | Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) qui implémente le contrôle de stabilité (ESC) et l'antipatinage (TCS) de la voitur |
| [✍ `controller_etkGauges`](vehicle/controller/etkGauges.md) | 3 | Ancien contrôleur d'instruments HTML (type "auxiliary"), déprécié : init journalise une erreur demandant de passer à genericGauges. Il crée  |
| [✍ `controller_gauges_analogOdometer`](vehicle/controller/gauges/analogOdometer.md) | 4 | Contrôleur auxiliaire pour un compteur kilométrique analogique affiché par une texture HTML (htmlTexture). Il envoie le total (electrics.val |
| [✍ `controller_gauges_customModules_accelerationData`](vehicle/controller/gauges/customModules/accelerationData.md) | 5 | Module de données pour genericGauges (type "auxiliary") : fournit les accélérations du capteur du véhicule. À référencer dans displayData.cu |
| [✍ `controller_gauges_customModules_combustionEngineData`](vehicle/controller/gauges/customModules/combustionEngineData.md) | 5 | Module de données pour genericGauges : calcule consommation de carburant (l/100 km), affichage de consommation, puissance et couple des mote |
| [✍ `controller_gauges_customModules_dynamicRedlineData`](vehicle/controller/gauges/customModules/dynamicRedlineData.md) | 5 | Module de données pour genericGauges : calcule une zone rouge/jaune de compte-tours qui dépend de la température d'huile (moteur froid = rég |
| [✍ `controller_gauges_customModules_electricMotorData`](vehicle/controller/gauges/customModules/electricMotorData.md) | 5 | Module de données pour genericGauges : calcule la puissance affichée, la puissance et le couple, l'autonomie restante et un graphe de consom |
| [✍ `controller_gauges_customModules_environmentData`](vehicle/controller/gauges/customModules/environmentData.md) | 5 | Module de données pour genericGauges : fournit la température extérieure et l'heure système. |
| [✍ `controller_gauges_customModules_navigationData`](vehicle/controller/gauges/customModules/navigationData.md) | 5 | Module de données pour genericGauges : alimente une carte de navigation dans la page HTML. À la configuration il demande à ui_uiNavi (moteur |
| [✍ `controller_gauges_customModules_tireData`](vehicle/controller/gauges/customModules/tireData.md) | 5 | Module de données pour genericGauges : fournit pour chaque roue une couleur de température (valeur fixe) et la pression de pneu. |
| [✍ `controller_gauges_genericGauges`](vehicle/controller/gauges/genericGauges.md) | 7 | Contrôleur auxiliaire qui affiche un tableau de bord HTML sur un matériau 3D (htmlTexture) et lui envoie en continu des données : valeurs el |
| [✍ `controller_hydraulicSuspension`](vehicle/controller/hydraulicSuspension.md) | 11 | Contrôleur auxiliaire de suspension hydraulique (type "auxiliary") : pilote la longueur de référence de poutres (vérins de suspension) regro |
| [✍ `controller_hydraulics_closedLoopLinearControl`](vehicle/controller/hydraulics/closedLoopLinearControl.md) | 4 | Régulateur en boucle fermée de vérin hydraulique linéaire (type "auxiliary"). Un PID compare l'extension moyenne des vérins (hydraulic consu |
| [✍ `controller_hydraulics_electricHydraulics`](vehicle/controller/hydraulics/electricHydraulics.md) | 3 | Petit contrôleur auxiliaire pour un groupe hydraulique électrique : met la valeur electrics motorThrottleElectricsName à 1 dès qu'une des va |
| [✍ `controller_hydraulics_hydraulicTrailerFeet`](vehicle/controller/hydraulics/hydraulicTrailerFeet.md) | 7 | Contrôleur auxiliaire pour les béquilles hydrauliques d'une remorque (type "auxiliary"). Il mémorise la position du vérin quand la remorque  |
| [✍ `controller_hydraulics_hydraulicsCombustionEngineControl`](vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.md) | 7 | Contrôleur auxiliaire qui relève le ralenti d'un moteur thermique et connecte la pompe hydraulique quand une fonction hydraulique est comman |
| [✍ `controller_hydraulics_orbitrolSteering`](vehicle/controller/hydraulics/orbitrolSteering.md) | 3 | Régulateur de direction hydraulique de type orbitrol (type "auxiliary"). Un PID compare la position moyenne des vérins de direction (normali |
| [✍ `controller_hydraulics_truckCabTiltControl`](vehicle/controller/hydraulics/truckCabTiltControl.md) | 3 | Contrôleur auxiliaire pour la bascule de cabine d'un camion : quand au moins un verrou de cabine (contrôleur de groupe) est « attached », le |
| [✍ `controller_inputOutputDemo`](vehicle/controller/inputOutputDemo.md) | 6 | Contrôleur de démonstration (type "auxiliary", defaultOrder 100000) montrant comment lire des données du véhicule, générer des entrées et co |
| [✍ `controller_jato`](vehicle/controller/jato.md) | 7 | Contrôleur auxiliaire de propulseurs JATO (fusées d'appoint, type "auxiliary", defaultOrder 1100). Quand electrics.values.jatoInput > 0, ou  |
| [✍ `controller_lightbar`](vehicle/controller/lightbar.md) | 7 | Contrôleur auxiliaire de rampe lumineuse (gyrophares) à modes configurables (type "auxiliary"). Chaque mode définit, par nom de valeur elect |
| [✍ `controller_lights_taxiLights`](vehicle/controller/lights/taxiLights.md) | 7 | Contrôleur auxiliaire pour l'enseigne de taxi (type "auxiliary"). Il mémorise un état parmi available, occupied, reserved, offDuty (défaut), |
| [✍ `controller_lineLock`](vehicle/controller/lineLock.md) | 7 | Contrôleur auxiliaire « line lock » de dragster (type "auxiliary", defaultOrder 40) : verrouille la pression de frein des roues listées (typ |
| [✍ `controller_linearActuators_linearActuatorTrailerFeet`](vehicle/controller/linearActuators/linearActuatorTrailerFeet.md) | 7 | Contrôleur auxiliaire pour les béquilles d'une remorque à actionneur linéaire électrique (type "auxiliary"). Même logique que hydraulics/hyd |
| [✍ `controller_loggerTemplate`](vehicle/controller/loggerTemplate.md) | 6 | Modèle de contrôleur d'enregistrement de données (type "auxiliary", defaultOrder 100000) : à chaque image il ajoute à un CSV en mémoire (bib |
| [✍ `controller_mechanics_beamChain`](vehicle/controller/mechanics/beamChain.md) | 5 | Contrôleur de mécanique (type "auxiliary") qui relie deux poutres en série : à chaque pas physique, si la somme de leurs longueurs dépasse l |
| [✍ `controller_mechanics_beamLengthTrigger`](vehicle/controller/mechanics/beamLengthTrigger.md) | 3 | Contrôleur de mécanique (type "auxiliary") qui met une valeur electrics à une valeur de déclenchement quand la longueur d'une ou plusieurs p |
| [✍ `controller_mechanics_beamSegments`](vehicle/controller/mechanics/beamSegments.md) | 4 | Contrôleur de mécanique (type "auxiliary") qui répartit la longueur d'une poutre « capteur » sur plusieurs poutres « segments » : à chaque i |
| [✍ `controller_mechanics_linearToAngularTransform`](vehicle/controller/mechanics/linearToAngularTransform.md) | 4 | Contrôleur de mécanique (type "auxiliary") qui convertit le déplacement d'une poutre capteur en rotation de poulie : la variation de longueu |
| [✍ `controller_nitrousOxideInjection`](vehicle/controller/nitrousOxideInjection.md) | 10 | Contrôleur auxiliaire de commande du protoxyde d'azote (N2O, type "auxiliary", relevantDevice "mainEngine"). Il arme/désarme le système via  |
| [✍ `controller_playerController`](vehicle/controller/playerController.md) | 18 | Contrôleur principal (type "main", defaultOrder 500) du véhicule « unicycle » utilisé pour le joueur à pied (mode marche). Le personnage est |
| [✍ `controller_pneumatics`](vehicle/controller/pneumatics.md) | 14 | Contrôleur auxiliaire de suspension/vérins pneumatiques simples (type "auxiliary") : il pilote la pression de poutres « pressurées » (obj:se |
| [✍ `controller_pneumatics_actuators`](vehicle/controller/pneumatics/actuators.md) | 17 | Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) de vérins pneumatiques avec physique de gaz simplifiée : un réservoir d'air (energ |
| [✍ `controller_pneumatics_airbrakes`](vehicle/controller/pneumatics/airbrakes.md) | 4 | Contrôleur auxiliaire de freins pneumatiques (poids lourds). Simule la pression des cylindres de frein de service et des freins à ressort (p |
| [✍ `controller_pneumatics_autoLevelSuspension`](vehicle/controller/pneumatics/autoLevelSuspension.md) | 17 | Contrôleur auxiliaire de suspension pneumatique à mise à niveau automatique (defaultOrder 80). Pour chaque « groupe de contrôle » (une poutr |
| [✍ `controller_pneumatics_crossFlowValve`](vehicle/controller/pneumatics/crossFlowValve.md) | 3 | Contrôleur auxiliaire simulant une vanne de transfert d'air entre deux réservoirs (energyStorage) : l'air passe du réservoir source vers le  |
| [✍ `controller_pneumatics_liftAxleControl`](vehicle/controller/pneumatics/liftAxleControl.md) | 10 | Contrôleur auxiliaire de relevage d'essieu pneumatique (remorques/camions). Deux modes : « lift » (essieu relevé : airbags de levage gonflés |
| [✍ `controller_pneumatics_lowAirPressureWarning`](vehicle/controller/pneumatics/lowAirPressureWarning.md) | 5 | Contrôleur auxiliaire d'alerte de basse pression d'air (poids lourds). Surveille la pression d'un réservoir : sous airTooLowPressure et cont |
| [✍ `controller_powerSteering`](vehicle/controller/powerSteering.md) | 2 | Contrôleur auxiliaire d'assistance de direction. Règle hydros.wheelPowerSteeringCoef (coefficient d'assistance appliqué par le moteur de dir |
| [✍ `controller_powertrainControl_activeCenterDiff`](vehicle/controller/powertrainControl/activeCenterDiff.md) | 4 | Contrôleur auxiliaire de différentiel central piloté. Chaque pas physique, il combine plusieurs cartes jbeam (gaz, glissement entre essieux, |
| [✍ `controller_powertrainControl_antiLag`](vehicle/controller/powertrainControl/antiLag.md) | 6 | Contrôleur auxiliaire d'anti-lag (ALS) pour moteur turbocompressé. Machine à états off / idle / armed / manualOverride / timeout : en idle i |
| [✍ `controller_powertrainControl_combustionEngineGovenor`](vehicle/controller/powertrainControl/combustionEngineGovenor.md) | 2 | Contrôleur auxiliaire « régulateur de régime » d'un moteur thermique (le nom du fichier contient la faute « Govenor »). Un PID calcule une c |
| [✍ `controller_powertrainControl_rimPullControl`](vehicle/controller/powertrainControl/rimPullControl.md) | 3 | Contrôleur auxiliaire de « rim pull » (commande de traction sur jante, ex. engins ferroviaires/tracteurs) : un axe d'entrée input.rimPull (0 |
| [✍ `controller_propAnimation_dualAxisLever`](vehicle/controller/propAnimation/dualAxisLever.md) | 2 | Contrôleur auxiliaire d'animation d'un levier à deux axes (levier de boîte automatique type P R N D S M avec grille). Lit le nom du mode cou |
| [✍ `controller_propAnimation_googlyEyes`](vehicle/controller/propAnimation/googlyEyes.md) | 3 | Contrôleur auxiliaire humoristique d'« yeux » de véhicule : agrandit ou rétrécit des poutres taguées (poutres d'yeux, limiteurs, attaches) s |
| [✍ `controller_propAnimation_hPattern`](vehicle/controller/propAnimation/hPattern.md) | 3 | Contrôleur auxiliaire d'animation d'un levier de vitesses en H (boîte manuelle). Suit le rapport engagé du device « gearbox » et déplace un  |
| [✍ `controller_propAnimation_sequentialLever`](vehicle/controller/propAnimation/sequentialLever.md) | 3 | Contrôleur auxiliaire d'animation d'un levier séquentiel : à chaque changement de rapport du device « gearbox » (rapport monté = levier pous |
| [✍ `controller_propAnimation_singleAxisLever`](vehicle/controller/propAnimation/singleAxisLever.md) | 3 | Contrôleur auxiliaire d'animation d'un levier de vitesses à un seul axe (levier de boîte automatique). Convertit electrics.values.gearModeIn |
| [✍ `controller_pyrotechnicCharge`](vehicle/controller/pyrotechnicCharge.md) | 4 | Contrôleur auxiliaire de charge pyrotechnique à usage unique : dès qu'un des electrics listés dans triggerElectrics vaut 1 ou true, il joue  |
| [✍ `controller_sbrGauges`](vehicle/controller/sbrGauges.md) | 5 | Contrôleur auxiliaire OBSOLÈTE (log E au chargement : à remplacer par genericGauges) qui alimente un écran HTML de tableau de bord (htmlText |
| [✍ `controller_shiftLights`](vehicle/controller/shiftLights.md) | 2 | Contrôleur auxiliaire de LEDs de changement de rapport (shift lights). Découpe la plage de régime [minRPM, maxRPM] en paliers (un par electr |
| [✍ `controller_sound_AVAS`](vehicle/controller/sound/AVAS.md) | 4 | Contrôleur auxiliaire de système d'alerte sonore pour piétons (AVAS) des véhicules électriques. Joue une boucle « avant » en modes D/S, une  |
| [✍ `controller_sound_airbrakes`](vehicle/controller/sound/airbrakes.md) | 3 | Contrôleur auxiliaire de son de purge de freins pneumatiques simple (sans simulation d'air, contrairement à pneumatics/airbrakes). Surveille |
| [✍ `controller_sound_linearMovement`](vehicle/controller/sound/linearMovement.md) | 4 | Contrôleur auxiliaire de sons pour un mouvement linéaire (vérin, siège, plateau, béquille…). Il mesure la longueur d'une poutre « capteur de |
| [✍ `controller_sound_reverseWarn`](vehicle/controller/sound/reverseWarn.md) | 3 | Contrôleur auxiliaire de bip de marche arrière. Tous les 0.5 s, il teste un electric (par défaut « reverse ») : s'il est > 0, il démarre une |
| [✍ `controller_steering_rearWheelSteering`](vehicle/controller/steering/rearWheelSteering.md) | 2 | Contrôleur auxiliaire de direction des roues arrière. En mode feedForward, il calcule une sortie de braquage arrière à partir d'une carte (v |
| [✍ `controller_tirePressureControl`](vehicle/controller/tirePressureControl.md) | 11 | Contrôleur auxiliaire de gonflage/dégonflage centralisé des pneus (CTIS, véhicules tout-terrain/militaires). Les roues sont regroupées en «  |
| [✍ `controller_trailerFeet`](vehicle/controller/trailerFeet.md) | 3 | Contrôleur auxiliaire pour les béquilles de remorque : écrit un electric (« feet » par défaut) à une valeur « attachée » quand un coupleur d |
| [✍ `controller_twoStepLaunch`](vehicle/controller/twoStepLaunch.md) | 11 | Contrôleur auxiliaire de « two-step » (limiteur de régime de départ arrêté). Une fois activé, il s'arme quand le véhicule est quasi à l'arrê |
| [✍ `controller_vehicleController_shiftLogic_automaticGearbox`](vehicle/controller/vehicleController/shiftLogic/automaticGearbox.md) | 12 | Logique de boîte automatique (modes P R N D S 1-9 M, convertisseur de couple avec verrouillage partiel). Chargé par vehicleController quand  |
| [✍ `controller_vehicleController_shiftLogic_cvtGearbox`](vehicle/controller/vehicleController/shiftLogic/cvtGearbox.md) | 11 | Logique de boîte à variation continue (CVT), modes P R N D. Chargé par vehicleController quand le device « gearbox » est de type cvtGearbox. |
| [✍ `controller_vehicleController_shiftLogic_cvtGearbox2`](vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.md) | 11 | Seconde logique de boîte CVT, pilotée par une carte (régime cible = f(vitesse roues, agressivité)) au lieu d'un simple interpolateur. Modes  |
| [✍ `controller_vehicleController_shiftLogic_dctGearbox`](vehicle/controller/vehicleController/shiftLogic/dctGearbox.md) | 12 | Logique de boîte à double embrayage (DCT) à modes automatiques P R N D S 1 2 M. Chargé par vehicleController quand le device « gearbox » est |
| [✍ `controller_vehicleController_shiftLogic_dummy`](vehicle/controller/vehicleController/shiftLogic/dummy.md) | 6 | Module de logique de boîte « neutre » chargé par vehicleController quand le véhicule n'a pas de device « gearbox » (ou via jbeam shiftLogicN |
| [✍ `controller_vehicleController_shiftLogic_electricMotor`](vehicle/controller/vehicleController/shiftLogic/electricMotor.md) | 14 | Logique de « boîte » pour véhicules électriques : modes P R N D qui fixent le sens de rotation (motorDirection) des moteurs électriques, fre |
| [✍ `controller_vehicleController_shiftLogic_manualGearbox`](vehicle/controller/vehicleController/shiftLogic/manualGearbox.md) | 13 | Logique de boîte manuelle (levier en H ou touches monter/descendre) avec embrayage automatique ou manuel. Chargé par vehicleController quand |
| [✍ `controller_vehicleController_shiftLogic_sequentialGearbox`](vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.md) | 11 | Logique de boîte séquentielle (un cran à la fois avec monter/descendre, sans levier en H) avec coupure d'allumage à la montée et embrayage a |
| [✍ `controller_vehicleController_vehicleController`](vehicle/controller/vehicleController/vehicleController.md) | 35 | Contrôleur principal (type "main", defaultOrder 500) du véhicule. Il lit les entrées du conducteur (input.throttle/brake/clutch, ou les over |
| [✍ `controller_vivaceGauges`](vehicle/controller/vivaceGauges.md) | 4 | Contrôleur auxiliaire OBSOLÈTE (remplacé par le contrôleur 'genericGauges') qui alimente l'écran numérique du tableau de bord de la Vivace : |
| [✍ `controller_wendoverGauges`](vehicle/controller/wendoverGauges.md) | 3 | Contrôleur auxiliaire OBSOLÈTE (remplacé par 'genericGauges') pour l'écran numérique du tableau de bord de la Wendover : texture HTML (1024  |

### Powertrain (31)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `powertrain_automaticGearbox`](vehicle/powertrain/automaticGearbox.md) | 16 | Type de device powertrain `automaticGearbox` : boîte automatique à train planétaire/hydraulique simplifié. Elle a des rapports indexés (gear |
| [✍ `powertrain_centrifugalClutch`](vehicle/powertrain/centrifugalClutch.md) | 11 | Type de device powertrain `centrifugalClutch` : embrayage centrifuge (catégories clutchlike et clutch) placé directement après un moteur the |
| [✍ `powertrain_combustionEngine`](vehicle/powertrain/combustionEngine.md) | 48 | Fabrique du type de device powertrain `combustionEngine` (moteur thermique). `new(jbeamData)` construit un device à partir d'une entrée jbea |
| [✍ `powertrain_combustionEngineThermals`](vehicle/powertrain/combustionEngineThermals.md) | 16 | Sous-module thermique et d'usure d'un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'exporte pas `new` et n'es |
| [✍ `powertrain_compressor`](vehicle/powertrain/compressor.md) | 15 | Composant powertrain `compressor` : compresseur d'air pneumatique (freins à air, suspension pneumatique de camions). C'est un consommateur d |
| [✍ `powertrain_cvtGearbox`](vehicle/powertrain/cvtGearbox.md) | 12 | Composant powertrain `cvtGearbox` : boîte à variation continue (CVT) à rapport variable entre minGearRatio et maxGearRatio. Le rapport n'est |
| [✍ `powertrain_dctGearbox`](vehicle/powertrain/dctGearbox.md) | 16 | Composant powertrain `dctGearbox` : boîte à double embrayage (DCT). Elle contient deux embrayages internes (voie 1 et voie 2) qui reçoivent  |
| [✍ `powertrain_differential`](vehicle/powertrain/differential.md) | 11 | Composant powertrain `differential` : répartit le couple d'entrée sur deux sorties (port 1 et port 2) et calcule la vitesse d'entrée à parti |
| [✍ `powertrain_electricMotor`](vehicle/powertrain/electricMotor.md) | 27 | Composant powertrain `electricMotor` : moteur électrique de catégorie `engine`. Il produit un couple selon une courbe couple/régime (clé jbe |
| [✍ `powertrain_electricServo`](vehicle/powertrain/electricServo.md) | 12 | Composant powertrain `electricServo` : servomoteur électrique qui fait tourner une roue « rotor » (clé jbeam `connectedRotator`, une roue dé |
| [✍ `powertrain_electricWinch`](vehicle/powertrain/electricWinch.md) | 8 | Composant powertrain `electricWinch` : treuil électrique très sommaire, de catégorie `winch` et `torqueConsumer`, sans port de sortie. Son c |
| [✍ `powertrain_frictionClutch`](vehicle/powertrain/frictionClutch.md) | 11 | Composant powertrain `frictionClutch` : embrayage à friction placé juste après un moteur (le parent doit être de catégorie `engine`). Il mod |
| [✍ `powertrain_genericTorqueProvider`](vehicle/powertrain/genericTorqueProvider.md) | 14 | Composant powertrain `genericTorqueProvider` : source de couple générique, de catégorie `engine`, dont le couple est simplement `desiredOutp |
| [✍ `powertrain_hydraulicAccumulator`](vehicle/powertrain/hydraulicAccumulator.md) | 17 | Composant powertrain `hydraulicAccumulator` : accumulateur hydraulique autonome (réservoir sous pression, sans pompe ni entraînement mécaniq |
| [✍ `hydraulicCylinder`](vehicle/powertrain/hydraulicCylinder.md) | 14 | Vérin hydraulique : ce n'est PAS un composant powertrain autonome. C'est un « consommateur » hydraulique créé par hydraulicPump.new pour cha |
| [✍ `powertrain_hydraulicPump`](vehicle/powertrain/hydraulicPump.md) | 19 | Composant powertrain `hydraulicPump` : pompe hydraulique (à cylindrée variable ou fixe) entraînée par un arbre, avec un accumulateur intégré |
| [✍ `powertrain_hydraulicWinch`](vehicle/powertrain/hydraulicWinch.md) | 0 | Fichier vide (0 octet) dans BeamNG.drive 0.40.5. Il ne définit ni `new`, ni champ, ni fonction. Utiliser un composant `hydraulicWinch` dans  |
| [✍ `powertrain_hydrodynamicRetarder`](vehicle/powertrain/hydrodynamicRetarder.md) | 15 | Composant powertrain `hydrodynamicRetarder` : ralentisseur hydrodynamique (frein moteur de camion/bus) monté en dérivation sur l'arbre. Il p |
| [✍ `powertrain_linearActuator`](vehicle/powertrain/linearActuator.md) | 10 | Composant powertrain `linearActuator` : vérin à vis (actionneur linéaire mécanique) entraîné par un arbre. Il transforme le couple d'entrée  |
| [✍ `powertrain_manualGearbox`](vehicle/powertrain/manualGearbox.md) | 18 | Composant powertrain `manualGearbox` : boîte de vitesses manuelle à rapports fixes. Le rapport actif est choisi par setGearIndex (indices en |
| [✍ `powertrain_multiShaft`](vehicle/powertrain/multiShaft.md) | 6 | Composant powertrain `multiShaft` : répartiteur de couple à N sorties (N = clé jbeam `numberOfOutputPorts`), par exemple pour un pont à plus |
| [✍ `powertrain_nitrousOxideInjection`](vehicle/powertrain/nitrousOxideInjection.md) | 9 | Sous-module d'injection de protoxyde d'azote (NOS) pour un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'expo |
| [✍ `powertrain_rangeBox`](vehicle/powertrain/rangeBox.md) | 13 | Composant powertrain `rangeBox` : boîte de gamme (réducteur à deux plages « high » / « low », ex. boîte de transfert 4x4 réduite ou gamme de |
| [✍ `powertrain_sequentialGearbox`](vehicle/powertrain/sequentialGearbox.md) | 16 | Composant powertrain `sequentialGearbox` : boîte séquentielle (type course) dont le rapport ne peut changer que d'un cran à la fois (plus un |
| [✍ `powertrain_shaft`](vehicle/powertrain/shaft.md) | 14 | Composant powertrain `shaft` : un arbre de transmission avec rapport de réduction fixe, pertes par frottement et inertie cumulée. Il peut au |
| [✍ `powertrain_splitShaft`](vehicle/powertrain/splitShaft.md) | 13 | Composant powertrain `splitShaft` : répartiteur à deux sorties, typiquement une boîte de transfert 4x4 ou un coupleur d'essieu. Une sortie e |
| [✍ `powertrain_supercharger`](vehicle/powertrain/supercharger.md) | 12 | Sous-système de compresseur mécanique (supercharger) rattaché à un moteur : le compresseur est entraîné par le vilebrequin (rapport gearRati |
| [✍ `powertrain_torqueConverter`](vehicle/powertrain/torqueConverter.md) | 10 | Convertisseur de couple hydraulique d'une boîte automatique, avec embrayage de verrouillage (lockup). Il se branche derrière un moteur (le p |
| [✍ `powertrain_torsionReactor`](vehicle/powertrain/torsionReactor.md) | 6 | Device « arbre fictif » qui sert de réacteur de torsion : il transmet le couple de son parent à ses enfants (multiplié par gearRatio) en con |
| [✍ `powertrain_turbocharger`](vehicle/powertrain/turbocharger.md) | 13 | Sous-système de suralimentation par turbo, rattaché à un moteur (ce n'est pas un device de la chaîne de transmission : init(device, jbeamDat |
| [✍ `powertrain_viscousClutch`](vehicle/powertrain/viscousClutch.md) | 7 | Coupleur visqueux placé derrière un moteur : transmet un couple proportionnel à l'écart de vitesse angulaire entre entrée et sortie (viscous |

### Stockage d'énergie (4)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `energyStorage_electricBattery`](vehicle/energyStorage/electricBattery.md) | 8 | Type de stockage d'énergie 'electricBattery' : batterie de véhicule électrique. L'énergie est gardée en joules (energyType 'electricEnergy') |
| [✍ `energyStorage_fuelTank`](vehicle/energyStorage/fuelTank.md) | 11 | Type de stockage d'énergie 'fuelTank' : réservoir de carburant liquide (essence, diesel, kérosène). L'énergie est stockée en joules à partir |
| [✍ `energyStorage_n2oTank`](vehicle/energyStorage/n2oTank.md) | 11 | Type de stockage d'énergie 'n2oTank' : bouteille de protoxyde d'azote (nitrous). Capacité exprimée en masse (kg), l'énergie stockée étant la |
| [✍ `energyStorage_pressureTank`](vehicle/energyStorage/pressureTank.md) | 18 | Type de stockage d'énergie 'pressureTank' : réservoir de gaz sous pression (air comprimé des camions, remorques, suspensions pneumatiques).  |

### Extensions (56)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `advancedwheeldebug`](vehicle/extensions/advancedwheeldebug.md) | 3 | Extension de débogage qui calcule pour chaque roue les angles de carrossage (camber), de pincement (toe), de chasse (caster), d'inclinaison  |
| [✍ `aeroDebug`](vehicle/extensions/aeroDebug.md) | 6 | Extension de débogage aérodynamique pour l'établi (workbench) : mesure la force et le moment aérodynamiques totaux du véhicule autour de son |
| [✍ `api`](vehicle/extensions/api.md) | 3 | Extension véhicule qui démarre un petit serveur HTTP/JSON local (utils/httpJsonServer) sur localhost:23512 au chargement de l'extension. Il  |
| [✍ `chassisData`](vehicle/extensions/chassisData.md) | 1 | Extension qui calcule l'empattement (wheelBase) et la largeur de voie (trackWidth) du véhicule à partir des positions des nœuds de roues dan |
| [✍ `core_booster`](vehicle/extensions/core/booster.md) | 2 | Extension expérimentale de 'poussée' : simule une force sur le véhicule en plaçant des 'planètes' à masse négative très éloignées (obj:setPl |
| [✍ `core_quickAccess`](vehicle/extensions/core/quickAccess.md) | 8 | Proxy côté véhicule du menu radial (quick access) du GE Lua : les modules du véhicule y déclarent des entrées de menu (addEntry), le GE dema |
| [✍ `couplings`](vehicle/extensions/couplings.md) | 8 | Extension de gestion des attelages de type sellette (fifth wheel). Elle réagit aux événements de beamstate (activation/désactivation de l'at |
| [✍ `cruiseControl`](vehicle/extensions/cruiseControl.md) | 9 | Régulateur de vitesse (cruise control) : un PID pilote electrics.values.throttleOverride pour maintenir la vitesse de roue (electrics.values |
| [✍ `debug_advancedExternalDebug`](vehicle/extensions/debug/advancedExternalDebug.md) | 5 | Extension de débogage qui envoie des paquets JSON par UDP à un outil externe (AED, 'Advanced External Debug') sur 127.0.0.1:43812, à 30 envo |
| [✍ `dragAi`](vehicle/extensions/dragAi.md) | 5 | Mini-IA de dragster : gaz à fond, direction proportionnelle vers un point cible, puis freinage et frein à main à l'arrivée. L'état évolue de |
| [✍ `dynamicVehicleData`](vehicle/extensions/dynamicVehicleData.md) | 5 | Outil interne de génération automatique des fiches de performance des véhicules (fichiers vehicles/<modèle>/info_<config>.json), piloté depu |
| [✍ `dynoClient`](vehicle/extensions/dynoClient.md) | 2 | Client de banc de puissance (dyno) côté véhicule : après initDyno, il envoie chaque frame le régime moteur, le rapport engagé et les rapport |
| [✍ `escCalibration`](vehicle/extensions/escCalibration.md) | 5 | Outil interne de calibration de l'ESC : automatise un test de 'rigidité de dérive' (skew stiffness) en balayant 13 vitesses (40 à 100 km/h)  |
| [✍ `escMeasurement`](vehicle/extensions/escMeasurement.md) | 8 | Outil interne de mesure/calibration automatique de l'ESC (contrôleur drivingDynamics/CMU), piloté depuis le GE par util_calibrateESC. Une co |
| [✍ `gameplayInterface`](vehicle/extensions/gameplayInterface.md) | 12 | Passerelle générique entre le code gameplay (VM GE Lua, via core_vehicleBridge) ou d'autres extensions véhicule et le VM véhicule. Elle char |
| [✍ `gameplayInterfaceModules_interactAI`](vehicle/extensions/gameplayInterfaceModules/interactAI.md) | 2 | Module de gameplayInterface pour l'IA : lit ou fixe le mode d'IA du véhicule courant et peut commander l'IA de tous les autres véhicules en  |
| [✍ `gameplayInterfaceModules_interactBeamstate`](vehicle/extensions/gameplayInterfaceModules/interactBeamstate.md) | 2 | Module de gameplayInterface donnant accès à beamstate : appel à distance d'une fonction sans argument de beamstate par son nom, et lecture d |
| [✍ `gameplayInterfaceModules_interactCargoContainers`](vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.md) | 5 | Module de gameplayInterface pour les conteneurs de cargaison (section jbeam cargoStorage) : permet au gameplay GE de remplir virtuellement l |
| [✍ `gameplayInterfaceModules_interactController`](vehicle/extensions/gameplayInterfaceModules/interactController.md) | 2 | Module de gameplayInterface pour le système de contrôleurs : envoyer un événement gameplay aux contrôleurs, geler le véhicule, changer le mo |
| [✍ `gameplayInterfaceModules_interactElectrics`](vehicle/extensions/gameplayInterfaceModules/interactElectrics.md) | 2 | Module de gameplayInterface pour electrics : fixer le niveau d'allumage, le mode de la barre lumineuse et l'état des phares, et lire n'impor |
| [✍ `gameplayInterfaceModules_interactEnergyStorage`](vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.md) | 2 | Module de gameplayInterface pour energyStorage : fixer l'énergie stockée d'un réservoir et lister tous les stockages avec leur énergie coura |
| [✍ `gameplayInterfaceModules_interactFire`](vehicle/extensions/gameplayInterfaceModules/interactFire.md) | 2 | Module de gameplayInterface donnant accès au système d'incendie : appel à distance d'une fonction sans argument du module fire par son nom. |
| [✍ `gameplayInterfaceModules_interactMisc`](vehicle/extensions/gameplayInterfaceModules/interactMisc.md) | 2 | Module de gameplayInterface fourre-tout : test de connexion (ping) et ouverture/fermeture des verrous des contrôleurs de coupleurs avancés ( |
| [✍ `gameplayInterfaceModules_interactPartCondition`](vehicle/extensions/gameplayInterfaceModules/interactPartCondition.md) | 2 | Module de gameplayInterface pour partCondition : initialiser ou lire les conditions des pièces (odomètre, intégrité, visuel, peintures par d |
| [✍ `gameplayInterfaceModules_interactPowertrain`](vehicle/extensions/gameplayInterfaceModules/interactPowertrain.md) | 2 | Module de gameplayInterface pour powertrain : lecture d'une propriété d'un périphérique du groupe motopropulseur par son nom. |
| [✍ `gameplayInterfaceModules_interactRecovery`](vehicle/extensions/gameplayInterfaceModules/interactRecovery.md) | 2 | Module de gameplayInterface donnant accès au système de récupération (recovery) : appel à distance d'une fonction sans argument du module re |
| [✍ `gameplayInterfaceModules_interactSpecialLights`](vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.md) | 2 | Module de gameplayInterface pour les feux spéciaux : lecture et fixation de l'état du feu de taxi via les contrôleurs 'lights/taxiLights'. |
| [✍ `gameplayInterfaceModules_interactVehiclePerformanceData`](vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.md) | 2 | Module de gameplayInterface relayant vers l'extension véhicule `vehiclePerformanceData` : démarrer/arrêter des enregistrements de performanc |
| [✍ `gameplayStatistic`](vehicle/extensions/gameplayStatistic.md) | 6 | Relais de statistiques de gameplay côté véhicule : transmet des métriques au module GE gameplay_statistic (metricAdd/metricSet) et exécute à |
| [✍ `gameplayStatisticModules_watchAirtime`](vehicle/extensions/gameplayStatisticModules/watchAirtime.md) | 2 | Module de gameplayStatistic qui mesure le temps où le véhicule est entièrement en l'air : vitesse sol > 6 m/s, aucune roue en contact (conta |
| [✍ `gameplayStatisticModules_watchBurnout`](vehicle/extensions/gameplayStatisticModules/watchBurnout.md) | 2 | Module de gameplayStatistic qui détecte les burnouts : une roue motrice intacte patine (vitesse de roue > 2 et > 1,5 x vitesse sol, glisseme |
| [✍ `input_haptics`](vehicle/extensions/input/haptics.md) | 8 | Génère les vibrations de manette (retour haptique) à partir de la dynamique du véhicule : secousses (jerk) de l'accélération, énergie de gli |
| [✍ `inputAnalyzer`](vehicle/extensions/inputAnalyzer.md) | 5 | Détecteur de 'codes' à la manette/clavier : à 30 Hz il observe les entrées (accélérateur, frein, direction gauche/droite, embrayage, frein à |
| [✍ `inputTests`](vehicle/extensions/inputTests.md) | 3 | Banc de test de latence et de précision du retour de force (FFB) des volants : mesure la latence matérielle USB, la résolution et la fréquen |
| [✍ `mqttGrafanaDemo`](vehicle/extensions/mqttGrafanaDemo.md) | 3 | Démonstration : publie la télémétrie du véhicule vers un broker MQTT (127.0.0.1) sur le sujet 'car_data', en JSON, à chaque frame, pour l'af |
| [✍ `odometer`](vehicle/extensions/odometer.md) | 6 | Compteur kilométrique 'relatif' pour les statistiques : intègre la distance parcourue à partir de electrics.values.wheelspeed avec un filtre |
| [✍ `outgauge`](vehicle/extensions/outgauge.md) | 0 | Fichier obsolète : il se contente d'écrire une erreur dans le log (avec la trace d'appel) disant que quelque chose a tenté d'utiliser l'anci |
| [✍ `outsim`](vehicle/extensions/outsim.md) | 0 | Fichier obsolète : il se contente d'écrire une erreur dans le log (avec la trace d'appel) disant que quelque chose a tenté d'utiliser l'anci |
| [✍ `perfectLaunch`](vehicle/extensions/perfectLaunch.md) | 6 | Aide au départ arrêté 'parfait' (launch control) pour dragsters : gaz à fond, puis contrôle PI de la patinage des roues motrices et du lacet |
| [✍ `performanceLogger`](vehicle/extensions/performanceLogger.md) | 6 | Petit outil de profilage : mesure des durées en millisecondes avec HighPerfTimer, soit une mesure unique (startMeasurement / stopMeasurement |
| [`profiling_p`](vehicle/extensions/profiling/p.md) | 2 | LuaJIT profiler. |
| [`profiling_vmdef`](vehicle/extensions/profiling/vmdef.md) | 0 | This is a generated file. DO NOT EDIT! |
| [`profiling_zone`](vehicle/extensions/profiling/zone.md) | 0 | LuaJIT profiler zones. |
| [✍ `scenario_annotate`](vehicle/extensions/scenario/annotate.md) | 2 | Exemple d'extension véhicule pilotée par un scénario. Elle affiche un texte flottant 2 m au-dessus du véhicule (avec un trait vertical) via  |
| [✍ `scenario_functionFreezer`](vehicle/extensions/scenario/functionFreezer.md) | 3 | Permet à un créateur de scénario d'empêcher l'exécution de certaines fonctions Lua du véhicule tant que le scénario n'a pas démarré (écran d |
| [✍ `scenario_shiftBooster`](vehicle/extensions/scenario/shiftBooster.md) | 5 | Extension de scénario de démonstration : donne un coup de pouce (« boost ») au véhicule en lui appliquant un vent constant dirigé selon son  |
| [✍ `simpleTripApp`](vehicle/extensions/simpleTripApp.md) | 4 | Alimente l'appli UI « trip » : cumule distance et temps de simulation, estime la consommation de carburant et l'autonomie, et envoie le résu |
| [✍ `skeleton`](vehicle/extensions/skeleton.md) | 2 | Modèle minimal d'extension véhicule, et extension réellement utilisée : main.lua la charge toujours (extensions.load("skeleton")) à la fin d |
| [✍ `straightLine`](vehicle/extensions/straightLine.md) | 5 | Pilote automatique de direction très simple : un PID corrige la direction pour que le véhicule roule vers un point cible (ou tout droit, 20  |
| [✍ `telemetryLogger`](vehicle/extensions/telemetryLogger.md) | 6 | Enregistreur de télémétrie simple : à chaque frame graphique (quand l'enregistrement est actif) il mémorise timestamp, position, vitesse, ga |
| [✍ `test_csvMetrics`](vehicle/extensions/test/csvMetrics.md) | 3 | Outil de test : enregistre périodiquement des métriques du véhicule (temps, position, rotation quaternion, et en mode étendu températures, r |
| [✍ `test_ffbCalibration`](vehicle/extensions/test/ffbCalibration.md) | 4 | Procédure automatique de calibrage du retour de force (FFB) du volant. Le véhicule est lancé par le régulateur de vitesse (cruiseControl) pu |
| [✍ `ui_simplePowertrainControl`](vehicle/extensions/ui/simplePowertrainControl.md) | 4 | Pont entre le véhicule et les boutons de contrôle simplifié du groupe motopropulseur affichés dans l'UI. setButton envoie l'événement UI `Ch |
| [✍ `utRecorder`](vehicle/extensions/utRecorder.md) | 1 | Envoie à chaque frame les données du véhicule au Lua du moteur de jeu (GE) pour qu'elles soient enregistrées avec le reste (outil de test).  |
| [✍ `vehiclePerformanceData`](vehicle/extensions/vehiclePerformanceData.md) | 5 | Collecte des données de performance du véhicule, surtout utilisée par l'UI/le jeu pour les fiches techniques et certifications. Deux volets  |
| [✍ `vehicleeditor_nodes`](vehicle/extensions/vehicleeditor/nodes.md) | 1 | Petit utilitaire de l'éditeur de véhicule : calcule la masse cumulée de nœuds du véhicule à partir de la masse physique réellement simulée ( |

## Game Engine (GE)

### Modules (36)

| Nom | Fonctions | Résumé |
|---|---|---|
| [`client_canvas`](ge/client/canvas.md) | 4 |  |
| [`client_core`](ge/client/core.md) | 3 |  |
| [`client_init`](ge/client/init.md) | 3 |  |
| [`client_lighting`](ge/client/lighting.md) | 2 |  |
| [`client_lighting_advanced_init`](ge/client/lighting/advanced/init.md) | 0 |  |
| [`client_lighting_advanced_lightViz`](ge/client/lighting/advanced/lightViz.md) | 7 |  |
| [`client_lighting_advanced_shaders`](ge/client/lighting/advanced/shaders.md) | 0 |  |
| [`client_lighting_advanced_shadowViz`](ge/client/lighting/advanced/shadowViz.md) | 0 |  |
| [`client_lighting_basic_init`](ge/client/lighting/basic/init.md) | 0 |  |
| [`client_lighting_basic_shadowFilter`](ge/client/lighting/basic/shadowFilter.md) | 0 |  |
| [`client_lighting_shadowMaps_init`](ge/client/lighting/shadowMaps/init.md) | 0 |  |
| [`client_objectsRequiredForStartup`](ge/client/objectsRequiredForStartup.md) | 0 |  |
| [`parseArgs`](ge/client/parseArgs.md) | 1 |  |
| [`client_postFx`](ge/client/postFx.md) | 4 |  |
| [`client_postFx_caustics`](ge/client/postFx/caustics.md) | 0 |  |
| [`dofModule`](ge/client/postFx/dof.md) | 6 |  |
| [`client_postFx_edgeAA`](ge/client/postFx/edgeAA.md) | 0 |  |
| [`client_postFx_fog`](ge/client/postFx/fog.md) | 2 |  |
| [`client_postFx_fxaa`](ge/client/postFx/fxaa.md) | 1 |  |
| [`client_postFx_glow`](ge/client/postFx/glow.md) | 0 |  |
| [`client_postFx_maskedScreenBlur`](ge/client/postFx/maskedScreenBlur.md) | 0 |  |
| [`client_postFx_screenSpaceShadows`](ge/client/postFx/screenSpaceShadows.md) | 0 |  |
| [`client_postFx_smaa`](ge/client/postFx/smaa.md) | 4 |  |
| [`ssaoModule`](ge/client/postFx/ssao.md) | 6 |  |
| [`client_renderManager`](ge/client/renderManager.md) | 1 |  |
| [✍ `ge_utils`](ge/ge_utils.md) | 0 | Fonctions utilitaires globales de la VM GE, chargées par main.lua (require('ge_utils')) avant les extensions. Elles sont accessibles partout |
| [✍ `main`](ge/main.md) | 0 | Point d'entrée de la VM Lua « Game Engine » (GE, vmType = 'game'). Le moteur C++ charge ce fichier au démarrage puis appelle ses fonctions g |
| [✍ `map`](ge/map.md) | 53 | Graphe routier (navgraph) du niveau côté Game Engine. Il construit le graphe de nœuds et d'arêtes à partir des routes décalques (DecalRoad), |
| [✍ `screenshot`](ge/screenshot.md) | 24 | Prise de captures d'écran côté Game Engine. Il prépare le nom de fichier (dossier screenshots/<mois>/screenshot_<date>), les options de qual |
| [`commands`](ge/server/commands.md) | 21 |  |
| [`server`](ge/server/server.md) | 4 |  |
| [✍ `serverConnection`](ge/serverConnection.md) | 3 | Déconnexion de la session locale (arrêt de la simulation, nettoyage) et passage de l'état de monde prêt. Il sert quand on quitte un niveau p |
| [✍ `setSpawnpoint`](ge/setSpawnpoint.md) | 3 | Mémorise et relit le point d'apparition par défaut choisi pour chaque niveau. Les données sont stockées dans settings/cloud/game-state.json  |
| [✍ `simTimeAuthority`](ge/simTimeAuthority.md) | 19 | Autorité sur la vitesse du temps de simulation : pause, ralenti (bullet time) et reprise, avec lissage. Un moddeur l'utilise pour mettre le  |
| [✍ `spawn`](ge/spawn.md) | 13 | Création et placement de véhicules côté Game Engine. Il crée un objet BeamNGVehicle (spawnVehicle), choisit un point d'apparition (pickSpawn |
| [✍ `suspensionFrequencyTester`](ge/suspensionFrequencyTester.md) | 2 | Outil de développement qui mesure la fréquence de la suspension d'un véhicule. Il affiche une fenêtre ImGui « Suspension Frequency Tester »  |

### Extensions (2024)

| Nom | Fonctions | Résumé |
|---|---|---|
| [`busroute_busrouteConfigurator`](ge/extensions/busroute/busrouteConfigurator.md) | 0 |  |
| [`campaign_campaigns`](ge/extensions/campaign/campaigns.md) | 36 |  |
| [`campaign_campaignsLoader`](ge/extensions/campaign/campaignsLoader.md) | 10 |  |
| [`campaign_comics`](ge/extensions/campaign/comics.md) | 3 |  |
| [`campaign_dealer`](ge/extensions/campaign/dealer.md) | 8 |  |
| [`campaign_photoSafari`](ge/extensions/campaign/photoSafari.md) | 3 |  |
| [`campaign_rewards`](ge/extensions/campaign/rewards.md) | 5 |  |
| [`career_branches`](ge/extensions/career/branches.md) | 23 |  |
| [`career_career`](ge/extensions/career/career.md) | 32 |  |
| [`career_modules_branches_landing`](ge/extensions/career/modules/branches/landing.md) | 8 |  |
| [`career_modules_branches_leagues`](ge/extensions/career/modules/branches/leagues.md) | 16 |  |
| [`career_modules_computer`](ge/extensions/career/modules/computer.md) | 6 |  |
| [`career_modules_debug_attributesDebug`](ge/extensions/career/modules/debug/attributesDebug.md) | 2 |  |
| [`career_modules_debug_cargoContainerDebug`](ge/extensions/career/modules/debug/cargoContainerDebug.md) | 10 |  |
| [`career_modules_debug_cargoFluidDebug`](ge/extensions/career/modules/debug/cargoFluidDebug.md) | 3 |  |
| [`career_modules_debug_dealershipFilterDebug`](ge/extensions/career/modules/debug/dealershipFilterDebug.md) | 2 |  |
| [`career_modules_debug_deliveryRoutes`](ge/extensions/career/modules/debug/deliveryRoutes.md) | 4 |  |
| [`career_modules_debug_insuranceDebug`](ge/extensions/career/modules/debug/insuranceDebug.md) | 1 |  |
| [`career_modules_debug_marketplaceDebug`](ge/extensions/career/modules/debug/marketplaceDebug.md) | 2 |  |
| [`career_modules_debug_missionDebug`](ge/extensions/career/modules/debug/missionDebug.md) | 1 |  |
| [`career_modules_debug_organizationsDebug`](ge/extensions/career/modules/debug/organizationsDebug.md) | 1 |  |
| [`career_modules_debug_parcelDebug`](ge/extensions/career/modules/debug/parcelDebug.md) | 6 |  |
| [`career_modules_debug_precisionParkingDebug`](ge/extensions/career/modules/debug/precisionParkingDebug.md) | 3 |  |
| [`career_modules_debug_psDuplicationChecker`](ge/extensions/career/modules/debug/psDuplicationChecker.md) | 4 |  |
| [`career_modules_debug_vehOfferDebug`](ge/extensions/career/modules/debug/vehOfferDebug.md) | 3 |  |
| [`career_modules_debug_vehicleDebug`](ge/extensions/career/modules/debug/vehicleDebug.md) | 1 |  |
| [`career_modules_debug_vehicleShoppingDebug`](ge/extensions/career/modules/debug/vehicleShoppingDebug.md) | 1 |  |
| [`career_modules_debug_vehicleSpawn`](ge/extensions/career/modules/debug/vehicleSpawn.md) | 5 |  |
| [`career_modules_delivery_cargoCards`](ge/extensions/career/modules/delivery/cargoCards.md) | 9 |  |
| [`career_modules_delivery_cargoScreen`](ge/extensions/career/modules/delivery/cargoScreen.md) | 44 |  |
| [`career_modules_delivery_general`](ge/extensions/career/modules/delivery/general.md) | 34 |  |
| [`career_modules_delivery_generator`](ge/extensions/career/modules/delivery/generator.md) | 24 |  |
| [`career_modules_delivery_parcelManager`](ge/extensions/career/modules/delivery/parcelManager.md) | 30 |  |
| [`career_modules_delivery_parcelMods`](ge/extensions/career/modules/delivery/parcelMods.md) | 14 |  |
| [`career_modules_delivery_precisionParking`](ge/extensions/career/modules/delivery/precisionParking.md) | 7 |  |
| [`career_modules_delivery_progress`](ge/extensions/career/modules/delivery/progress.md) | 19 |  |
| [`career_modules_delivery_tasklist`](ge/extensions/career/modules/delivery/tasklist.md) | 8 |  |
| [`career_modules_delivery_tutorial`](ge/extensions/career/modules/delivery/tutorial.md) | 7 |  |
| [`career_modules_delivery_vehicleOfferManager`](ge/extensions/career/modules/delivery/vehicleOfferManager.md) | 16 |  |
| [`career_modules_delivery_vehicleTasks`](ge/extensions/career/modules/delivery/vehicleTasks.md) | 17 |  |
| [`career_modules_fuel`](ge/extensions/career/modules/fuel.md) | 18 |  |
| [`career_modules_inspectVehicle`](ge/extensions/career/modules/inspectVehicle.md) | 22 |  |
| [`career_modules_insurance_history`](ge/extensions/career/modules/insurance/history.md) | 11 |  |
| [`career_modules_insurance_insurance`](ge/extensions/career/modules/insurance/insurance.md) | 66 |  |
| [`career_modules_insurance_repairScreen`](ge/extensions/career/modules/insurance/repairScreen.md) | 8 |  |
| [`career_modules_inventory`](ge/extensions/career/modules/inventory.md) | 63 |  |
| [`career_modules_loanerVehicles`](ge/extensions/career/modules/loanerVehicles.md) | 10 |  |
| [`career_modules_log`](ge/extensions/career/modules/log.md) | 3 |  |
| [`career_modules_logbook`](ge/extensions/career/modules/logbook.md) | 14 |  |
| [`career_modules_marketplace`](ge/extensions/career/modules/marketplace.md) | 21 |  |
| [`career_modules_milestones_general`](ge/extensions/career/modules/milestones/general.md) | 5 |  |
| [`career_modules_milestones_generalMilestones_branches`](ge/extensions/career/modules/milestones/generalMilestones/branches.md) | 4 |  |
| [`career_modules_milestones_generalMilestones_delivery`](ge/extensions/career/modules/milestones/generalMilestones/delivery.md) | 4 |  |
| [`career_modules_milestones_generalMilestones_insurance`](ge/extensions/career/modules/milestones/generalMilestones/insurance.md) | 2 |  |
| [`career_modules_milestones_generalMilestones_missions`](ge/extensions/career/modules/milestones/generalMilestones/missions.md) | 7 |  |
| [`career_modules_milestones_generalMilestones_money`](ge/extensions/career/modules/milestones/generalMilestones/money.md) | 4 |  |
| [`career_modules_milestones_generalMilestones_speedTraps`](ge/extensions/career/modules/milestones/generalMilestones/speedTraps.md) | 2 |  |
| [`career_modules_milestones_generalMilestones_statistic`](ge/extensions/career/modules/milestones/generalMilestones/statistic.md) | 5 |  |
| [`career_modules_milestones_milestones`](ge/extensions/career/modules/milestones/milestones.md) | 15 |  |
| [`career_modules_missionWrapper`](ge/extensions/career/modules/missionWrapper.md) | 9 |  |
| [`career_modules_painting`](ge/extensions/career/modules/painting.md) | 13 |  |
| [`career_modules_partInventory`](ge/extensions/career/modules/partInventory.md) | 24 |  |
| [`career_modules_partShopping`](ge/extensions/career/modules/partShopping.md) | 19 |  |
| [`career_modules_payment`](ge/extensions/career/modules/payment.md) | 2 |  |
| [`career_modules_permissions`](ge/extensions/career/modules/permissions.md) | 1 |  |
| [`career_modules_playbookWriter`](ge/extensions/career/modules/playbookWriter.md) | 4 |  |
| [`career_modules_playerAbstract`](ge/extensions/career/modules/playerAbstract.md) | 7 |  |
| [`career_modules_playerAttributes`](ge/extensions/career/modules/playerAttributes.md) | 15 |  |
| [`career_modules_playerDriving`](ge/extensions/career/modules/playerDriving.md) | 17 |  |
| [`career_modules_quickTravel`](ge/extensions/career/modules/quickTravel.md) | 4 |  |
| [`career_modules_rentals`](ge/extensions/career/modules/rentals.md) | 1 |  |
| [`career_modules_reputation`](ge/extensions/career/modules/reputation.md) | 5 |  |
| [`career_modules_spawnPoints`](ge/extensions/career/modules/spawnPoints.md) | 6 |  |
| [`career_modules_speedTraps`](ge/extensions/career/modules/speedTraps.md) | 4 |  |
| [`career_modules_testDrive`](ge/extensions/career/modules/testDrive.md) | 14 |  |
| [`career_modules_tether`](ge/extensions/career/modules/tether.md) | 9 |  |
| [`career_modules_tuning`](ge/extensions/career/modules/tuning.md) | 9 |  |
| [`career_modules_tutorial`](ge/extensions/career/modules/tutorial.md) | 17 |  |
| [`career_modules_tutorial_debug`](ge/extensions/career/modules/tutorial/debug.md) | 1 |  |
| [`career_modules_tutorial_step01enterVehicle`](ge/extensions/career/modules/tutorial/step01enterVehicle.md) | 7 |  |
| [`career_modules_tutorial_step02moveOff`](ge/extensions/career/modules/tutorial/step02moveOff.md) | 5 |  |
| [`career_modules_tutorial_step03basicManeuvers`](ge/extensions/career/modules/tutorial/step03basicManeuvers.md) | 5 |  |
| [`career_modules_tutorial_step04timeTrial`](ge/extensions/career/modules/tutorial/step04timeTrial.md) | 12 |  |
| [`career_modules_tutorial_step05driveToDragStrip`](ge/extensions/career/modules/tutorial/step05driveToDragStrip.md) | 6 |  |
| [`career_modules_tutorial_step06dragStripBasics`](ge/extensions/career/modules/tutorial/step06dragStripBasics.md) | 10 |  |
| [`career_modules_tutorial_step07bigmap`](ge/extensions/career/modules/tutorial/step07bigmap.md) | 10 |  |
| [`career_modules_tutorial_step08driveToGarage`](ge/extensions/career/modules/tutorial/step08driveToGarage.md) | 6 |  |
| [`career_modules_tutorial_step09spmSignup`](ge/extensions/career/modules/tutorial/step09spmSignup.md) | 12 |  |
| [`career_modules_tutorial_tasklistLocale`](ge/extensions/career/modules/tutorial/tasklistLocale.md) | 4 |  |
| [`career_modules_tutorialPopups`](ge/extensions/career/modules/tutorialPopups.md) | 12 |  |
| [`career_modules_uiUtils`](ge/extensions/career/modules/uiUtils.md) | 6 |  |
| [`career_modules_unlockFlags`](ge/extensions/career/modules/unlockFlags.md) | 6 |  |
| [`career_modules_valueCalculator`](ge/extensions/career/modules/valueCalculator.md) | 9 |  |
| [`career_modules_vehicleClassGrouping`](ge/extensions/career/modules/vehicleClassGrouping.md) | 2 |  |
| [`career_modules_vehicleDeletionService`](ge/extensions/career/modules/vehicleDeletionService.md) | 7 |  |
| [`career_modules_vehiclePerformance`](ge/extensions/career/modules/vehiclePerformance.md) | 16 |  |
| [`career_modules_vehicleShopping`](ge/extensions/career/modules/vehicleShopping.md) | 37 |  |
| [`career_saveSystem`](ge/extensions/career/saveSystem.md) | 20 |  |
| [`career_startingModes_apmOnboarding`](ge/extensions/career/startingModes/apmOnboarding.md) | 2 |  |
| [`career_startingModes_freshStart`](ge/extensions/career/startingModes/freshStart.md) | 2 |  |
| [`career_startingModes_sandbox`](ge/extensions/career/startingModes/sandbox.md) | 2 |  |
| [`career_startingModes_selfMade`](ge/extensions/career/startingModes/selfMade.md) | 2 |  |
| [✍ `core_activity`](ge/extensions/core/activity.md) | 1 | Extension GE (core_activity) minuscule : démarre une 'activité' nommée. Aujourd'hui la seule activité connue est 'ContinueFreeroam', qui lan |
| [✍ `core_audio`](ge/extensions/core/audio.md) | 11 | Extension GE (core_audio) qui charge les banques FMOD du jeu. Au premier update, elle scanne /art/sound/fmod/<plateforme> (et le sous-dossie |
| [✍ `core_audioForest`](ge/extensions/core/audioForest.md) | 19 | Extension GE (core_audioForest) : coordinateur d'exécution des émetteurs audio de forêt. À partir des arbres/objets du Forest du niveau, ell |
| [✍ `core_audioForest_audioForestCommon`](ge/extensions/core/audioForest/audioForestCommon.md) | 5 | Code partagé entre l'exécution (audioForest.lua) et l'éditeur : transforme les objets d'une Forest en un nuage de noeuds audio éclaircis. Se |
| [✍ `core_audioRibbon`](ge/extensions/core/audioRibbon.md) | 21 | Extension GE (core_audioRibbon) : audio dynamique pour des 'rubans' (rivières, cascades, etc.) définis dans l'éditeur. Un ruban est une band |
| [✍ `core_busRouteManager`](ge/extensions/core/busRouteManager.md) | 6 | Extension GE (core_busRouteManager) qui gère les lignes de bus d'un niveau. Au chargement de l'extension et au démarrage d'un niveau (init), |
| [✍ `core_camera`](ge/extensions/core/camera.md) | 110 | Extension GE (core_camera, dépend de core_vehicle_manager et core_environment) : gestionnaire central de toutes les caméras du jeu. Elle cha |
| [✍ `core_camera.test`](ge/extensions/core/camera.test.md) | 5 | Tests unitaires du système de caméras, pour le framework de tests du jeu. À lancer depuis la console Lua GE : extensions.testFramework_TestM |
| [✍ `core_cameraControllerRegistry`](ge/extensions/core/cameraControllerRegistry.md) | 7 | Couche de routage facultative placée devant le chemin d'entrée caméra. Des 'contrôleurs' enregistrés (par id, avec priorité) peuvent consomm |
| [✍ `core_cameraInput`](ge/extensions/core/cameraInput.md) | 31 | Gestionnaires d'entrées caméra du joueur (regarder, se déplacer, zoomer, axes absolus de souris 3D/SpaceMouse), extraits de core/camera.lua. |
| [✍ `core_cameraModes_autopoint`](ge/extensions/core/cameraModes/autopoint.md) | 4 | Filtre de caméra (isFilter = true, hidden = true) : fait viser la caméra vers un point décalé du véhicule, exprimé en coordonnées locales du |
| [✍ `core_cameraModes_autozoom`](ge/extensions/core/cameraModes/autozoom.md) | 4 | Filtre de caméra (isFilter = true, hidden = true) : règle automatiquement le champ de vision selon la distance entre la caméra et sa cible,  |
| [✍ `core_cameraModes_bigMap`](ge/extensions/core/cameraModes/bigMap.md) | 13 | Caméra globale 'bigMap' (isGlobal, hidden) : vue de dessus en perspective de la grande carte (mode 'BigMap' du jeu libre). Elle gère le zoom |
| [✍ `core_cameraModes_bigMapOrtho`](ge/extensions/core/cameraModes/bigMapOrtho.md) | 13 | Caméra globale 'bigMapOrtho' (isGlobal, hidden) : variante orthographique de la caméra de grande carte. Même logique que bigMap (zoom, dépla |
| [✍ `core_cameraModes_bobbing`](ge/extensions/core/cameraModes/bobbing.md) | 4 | Filtre de caméra (isFilter = true, hidden = true) : ajoute un balancement réaliste de la caméra (tête qui oscille en marchant, respiration à |
| [✍ `core_cameraModes_chase`](ge/extensions/core/cameraModes/chase.md) | 9 | Mode de caméra 'chase' (poursuite) lié au véhicule : la caméra se place derrière le véhicule, à distance fixe (par défaut 5 m, FOV 65), rega |
| [✍ `core_cameraModes_collision`](ge/extensions/core/cameraModes/collision.md) | 6 | Filtre anti-traversée des décors : lance des rayons statiques (castRayStatic) depuis la cible vers les quatre coins du plan proche de la cam |
| [✍ `core_cameraModes_crash`](ge/extensions/core/cameraModes/crash.md) | 3 | Caméra de rediffusion d'accident (masquée). Selon camMode : 1 = caméra proche au-dessus du point d'impact (hitPoint + camOffset, fov 50) ; 2 |
| [✍ `core_cameraModes_droneChase`](ge/extensions/core/cameraModes/droneChase.md) | 13 | Caméra drone de poursuite aérienne (désactivée par défaut, icône cameraFocusOnVehicle1) : flotte au-dessus et derrière le véhicule du joueur |
| [✍ `core_cameraModes_external`](ge/extensions/core/cameraModes/external.md) | 13 | Caméra externe « télé / fan » (désactivée par défaut) : place des caméras fixes aléatoires le long du trajet prévu du véhicule, change de po |
| [✍ `core_cameraModes_fallback`](ge/extensions/core/cameraModes/fallback.md) | 2 | Caméra-filtre globale (isGlobal, isFilter, hidden, runningOrder 0.6) qui garantit que data.res.pos et data.res.rot sont définis : si aucune  |
| [✍ `core_cameraModes_free`](ge/extensions/core/cameraModes/free.md) | 17 | Caméra libre (vol libre, caméra globale du groupe « world », masquée, ordre 10). Position et rotation sont pilotées par MoveManager (transla |
| [✍ `core_cameraModes_gameengine`](ge/extensions/core/cameraModes/gameengine.md) | 2 | Filtre global final (runningOrder 1) qui envoie la pose calculée (data.res) au moteur de rendu : pour la vue principale, setCameraPosRotFovN |
| [✍ `core_cameraModes_handheld`](ge/extensions/core/cameraModes/handheld.md) | 2 | Filtre de caméra « à l'épaule » : la direction de visée suit la cible via un ressort amorti et l'horizon se penche légèrement selon la force |
| [✍ `core_cameraModes_manualzoom`](ge/extensions/core/cameraModes/manualzoom.md) | 3 | Filtre de zoom manuel : modifie le champ de vision (FOV, en degrés) selon MoveManager.zoomIn / zoomOut, borné entre fovMin et fovMax, et aff |
| [✍ `core_cameraModes_noise`](ge/extensions/core/cameraModes/noise.md) | 2 | Effet de bruit : ajoute à data.res.pos un décalage aléatoire (± factor/2 par axe) renouvelé toutes les 0,1 s. Mode masqué, pas un filtre au  |
| [✍ `core_cameraModes_observer`](ge/extensions/core/cameraModes/observer.md) | 7 | Caméra globale « observateur » pour les scénarios : se place sur un objet caméra du niveau (nommé par cameraName, champs optionnels Speed, b |
| [✍ `core_cameraModes_occupant`](ge/extensions/core/cameraModes/occupant.md) | 13 | Caméra « tête de l'occupant » (conducteur ou passager, vue cockpit) définie par le jbeam du véhicule. La caméra suit un nœud de la tête avec |
| [✍ `core_cameraModes_onboard`](ge/extensions/core/cameraModes/onboard.md) | 5 | Caméra embarquée (cockpit, capot, rider...) définie dans le jbeam du véhicule (section camera) : se fixe sur le nœud refNodes.ref (ou camNod |
| [✍ `core_cameraModes_orbit`](ge/extensions/core/cameraModes/orbit.md) | 22 | Caméra orbitale de poursuite, mode principal « extérieur » d'un véhicule. Tourne autour du point cible (nœud ref du véhicule + décalage offs |
| [✍ `core_cameraModes_pacenoteOrbit`](ge/extensions/core/cameraModes/pacenoteOrbit.md) | 7 | Caméra orbitale globale autour d'un point fixe (fixedTargetPos), utilisée par les outils d'annotations de rallye (pacenotes). Rotation à la  |
| [✍ `core_cameraModes_partFocus`](ge/extensions/core/cameraModes/partFocus.md) | 6 | Caméra qui cadre une pièce du véhicule quand le menu des pièces la met en évidence. Masquée (absente du cycle de caméras) : core_vehicle_par |
| [✍ `core_cameraModes_path`](ge/extensions/core/cameraModes/path.md) | 6 | Caméra qui suit un chemin de caméra (core_paths : marqueurs avec position, rotation, FOV, temps). Interpole la position par Catmull-Rom chor |
| [✍ `core_cameraModes_predictor`](ge/extensions/core/cameraModes/predictor.md) | 2 | Filtre qui anticipe le mouvement du véhicule : décale data.res.targetPos de dtFuture * data.vel (vitesse du véhicule) puis recalcule la rota |
| [✍ `core_cameraModes_relative`](ge/extensions/core/cameraModes/relative.md) | 21 | Caméra libre « relative au véhicule » (désactivée par défaut) : une caméra volante dont la position est exprimée dans le repère du véhicule  |
| [✍ `core_cameraModes_scriptedFree`](ge/extensions/core/cameraModes/scriptedFree.md) | 18 | Caméra libre pilotée par script (globale, masquée) : la pose (position, lacet, tangage vers le bas, roulis en degrés) est possédée à chaque  |
| [✍ `core_cameraModes_shake`](ge/extensions/core/cameraModes/shake.md) | 2 | Filtre de tremblement lent : ajoute à la position (amplitudes 0.08/0.05/0.03 m) et à la rotation (10 degrés par mètre de décalage) des oscil |
| [✍ `core_cameraModes_smooth`](ge/extensions/core/cameraModes/smooth.md) | 2 | Filtre de lissage de position : trois ressorts temporels (newTemporalSpring) sur x, y, z de data.res.pos. Masqué. Renvoie un constructeur. |
| [✍ `core_cameraModes_smoothFree`](ge/extensions/core/cameraModes/smoothFree.md) | 0 | Caméra libre cinématique : construit une caméra du mode free, fixe groupOrder = 20 (après la caméra libre simple) et active le lissage via s |
| [✍ `core_cameraModes_steadycam`](ge/extensions/core/cameraModes/steadycam.md) | 12 | Steadycam : caméra à pied à la première personne du groupe « world » (ordre 30, après free et smoothFree, masquée). Marche aux touches de dé |
| [✍ `core_cameraModes_topDown`](ge/extensions/core/cameraModes/topDown.md) | 8 | Caméra vue de dessus (désactivée par défaut), présentée dans le code comme « un exemple de mode de caméra personnalisé ». Suit le véhicule d |
| [✍ `core_cameraModes_trackir`](ge/extensions/core/cameraModes/trackir.md) | 2 | Filtre global (runningOrder 0.5) qui applique le suivi de tête TrackIR : décale la position (nx, ny, nz * 0.00005) et tourne la caméra (yaw, |
| [✍ `core_cameraModes_transition`](ge/extensions/core/cameraModes/transition.md) | 5 | Filtre global (runningOrder 0.2) qui adoucit les changements de caméra : mémorise la pose de l'image précédente (position relative au véhicu |
| [✍ `core_cameraModes_unicycle`](ge/extensions/core/cameraModes/unicycle.md) | 7 | Caméra à la première personne du personnage à pied (« unicycle » : le véhicule joueur à pied). Masquée. La rotation de la tête vient des ent |
| [✍ `core_cameraUpdate`](ge/extensions/core/cameraUpdate.md) | 3 | Boucle de mise à jour de la caméra à chaque image, séparée de core/camera.lua. Elle traite la vue principale du joueur puis les contextes de |
| [✍ `core_cameraUtils_bigMapPan`](ge/extensions/core/cameraUtils/bigMapPan.md) | 3 | Aide partagée de déplacement et de zoom fluides pour les modes de caméra de la grande carte (bigMap / bigMapOrtho). Placée hors de cameraMod |
| [✍ `core_celestial`](ge/extensions/core/celestial.md) | 30 | Ciel astronomique réel piloté par le TimeOfDay du niveau. L'horloge (time, play, dayLength) et le lieu/date de l'observateur (latitude, long |
| [✍ `core_chat`](ge/extensions/core/chat.md) | 0 | Ancien client de chat IRC (irc.beamng.com, canal #beamng). Tout le code du fichier est en commentaire (bloc --[[ ... ]], marqué « not workin |
| [✍ `core_checkpoints`](ge/extensions/core/checkpoints.md) | 14 | Mémorise, pour chaque véhicule d'un scénario de course, le dernier point de passage atteint (position, direction, vecteur haut, indices de w |
| [✍ `core_commandhandler`](ge/extensions/core/commandhandler.md) | 5 | Exécute les commandes asynchrones envoyées au jeu par le schéma de protocole « beamng:v1/<commande>/<données> » (lien navigateur, argument d |
| [✍ `core_couplerCameraModifier`](ge/extensions/core/couplerCameraModifier.md) | 10 | Quand le véhicule du joueur 0 est attelé à une remorque (distance entre les deux véhicules entre 1 et 15 m, l'un des deux de type « Trailer  |
| [✍ `core_devices`](ge/extensions/core/devices.md) | 5 | Pilote l'éclairage RGB des périphériques de jeu (volants, manettes) via l'objet C++ Device. Chaque périphérique assigné à un joueur prend la |
| [✍ `core_dynamicProps`](ge/extensions/core/dynamicProps.md) | 14 | Remplace à la volée des objets de la forêt (théForest) par de vrais véhicules « props » physiques (ex. lampadaire, poubelle) quand le joueur |
| [✍ `core_environment`](ge/extensions/core/environment.md) | 111 | Extension GE `core_environment` : point d'entrée unique pour lire et modifier l'environnement du niveau (heure du jour, nuages, vent, brouil |
| [✍ `core_flowgraphManager`](ge/extensions/core/flowgraphManager.md) | 27 | Extension GE `core_flowgraphManager` : gestionnaire des projets Flowgraph (scripts visuels à base de nœuds) en cours d'exécution. Il crée, c |
| [✍ `core_forest`](ge/extensions/core/forest.md) | 1 | Extension GE `core_forest` : fournit un accès mis en cache à l'objet `Forest` de la scène (la forêt/végétation instanciée du niveau). Un mod |
| [✍ `core_funstuff`](ge/extensions/core/funstuff.md) | 15 | Extension GE `core_funstuff` : actions « fun » du menu radial du mode bac à sable (sandbox) : champ de force, propulsions et lancers du véhi |
| [✍ `core_gameContext`](ge/extensions/core/gameContext.md) | 4 | Extension GE `core_gameContext` : petit relais vers `gameplay_markerInteraction` (contexte de jeu courant) et vers l'UI (changement de missi |
| [✍ `core_gamestate`](ge/extensions/core/gamestate.md) | 16 | Extension GE `core_gamestate` : deux rôles. (1) Stocker l'état de JEU (freeroam, campagne… avec disposition d'applis et éléments de menu) et |
| [✍ `core_groundMarkerArrows`](ge/extensions/core/groundMarkerArrows.md) | 5 | Extension GE `core_groundMarkerArrows` : gère les grandes flèches flottantes affichées aux intersections de l'itinéraire de navigation (modè |
| [✍ `core_groundMarkers`](ge/extensions/core/groundMarkers.md) | 15 | Extension GE `core_groundMarkers` : navigation au sol. Calcule un itinéraire (route planner) du véhicule joueur vers un ou plusieurs points, |
| [✍ `core_hardwareinfo`](ge/extensions/core/hardwareinfo.md) | 11 | Extension GE `core_hardwareinfo` : collecte les informations matérielles et système (OS, mémoire, CPU, GPU, batterie, disque, mods) via Engi |
| [✍ `core_highscores`](ge/extensions/core/highscores.md) | 5 | Extension GE `core_highscores` : stockage des meilleurs temps des scénarios dans settings/highscores.json, organisés par niveau, scénario et |
| [✍ `core_hotlapping`](ge/extensions/core/hotlapping.md) | 39 | Extension GE `core_hotlapping` : mode « tours chronométrés » du freeroam (appli Hotlapping). Le joueur pose des checkpoints (points de passa |
| [✍ `core_input_actionFilter`](ge/extensions/core/input/actionFilter.md) | 16 | Extension GE `core_input_actionFilter` : bloque ou autorise des actions d'entrée par « filtre » nommé (ex. scénario, mode compétitif). Gère  |
| [✍ `core_input_actions`](ge/extensions/core/input/actions.md) | 13 | Extension GE `core_input_actions` : registre des actions d'entrée (ce que les touches/manettes peuvent déclencher). Il lit les fichiers lua/ |
| [✍ `core_input_bindings`](ge/extensions/core/input/bindings.md) | 37 | Extension GE `core_input_bindings` : charge, fusionne, sauvegarde et envoie au moteur les associations touches/axes -> actions (bindings) de |
| [✍ `core_input_categories`](ge/extensions/core/input/categories.md) | 0 | Table de données (le fichier retourne directement une table, pas de fonctions) listant les catégories d'actions d'entrée affichées dans l'éc |
| [✍ `core_input_deprecatedActions`](ge/extensions/core/input/deprecatedActions.md) | 0 | Table de données (le fichier retourne une table) qui associe d'anciens noms d'actions d'entrée à leur remplaçant (`replacement`) ou les décl |
| [✍ `core_input_tests`](ge/extensions/core/input/tests.md) | 7 | Extension GE `core_input_tests` : orchestre les tests de latence/fréquence des entrées (système, moteur, véhicule, oscillation) affichés dan |
| [✍ `core_input_vehicleSwitching`](ge/extensions/core/input/vehicleSwitching.md) | 3 | Extension GE `core_input_vehicleSwitching` : implémente le passage au véhicule suivant/précédent (touches de changement de véhicule). Il peu |
| [✍ `core_input_vibrationDebug`](ge/extensions/core/input/vibrationDebug.md) | 2 | Extension GE `core_input_vibrationDebug` : fenêtre ImGui de debug « Vibration Debug » pour régler en direct les paramètres des vibrations de |
| [✍ `core_input_virtualInput`](ge/extensions/core/input/virtualInput.md) | 4 | Extension GE `core_input_virtualInput` : création de périphériques d'entrée virtuels (axes, boutons, POV) via le VirtualInputManager C++ et  |
| [✍ `core_interAero`](ge/extensions/core/interAero.md) | 4 | Extension GE `core_interAero` : simule les interactions aérodynamiques ENTRE véhicules (aspiration / slipstream, « bump drafting » et effet  |
| [✍ `core_inventory`](ge/extensions/core/inventory.md) | 9 | Extension GE `core_inventory` : inventaire simple de la campagne/scénarios. Stocke par type (clé en MAJUSCULES) soit un compteur numérique ( |
| [✍ `core_jobsystem`](ge/extensions/core/jobsystem.md) | 6 | Extension GE `core_jobsystem` : mini ordonnanceur de tâches coopératives basé sur des coroutines Lua. Un moddeur y met un traitement long (s |
| [✍ `core_lapTimes`](ge/extensions/core/lapTimes.md) | 13 | Extension GE `core_lapTimes` : prépare pour l'UI (appli de temps au tour) les chronos d'une course du système de course « race » : temps cou |
| [✍ `core_levels`](ge/extensions/core/levels.md) | 18 | Extension GE `core_levels` : catalogue des niveaux (dossiers de /levels/), lecture de leur info.json, et lancement d'un niveau (startLevel). |
| [✍ `core_licensePlateDesign`](ge/extensions/core/licensePlateDesign.md) | 1 | Extension GE `core_licensePlateDesign` : charge la définition d'un design de plaque d'immatriculation et la convertit au format actuel (vers |
| [✍ `core_loadMapCmd`](ge/extensions/core/loadMapCmd.md) | 9 | Extension GE `core_loadMapCmd` : exécute la commande de lancement 'openMap' (lien du type beamng:v1/openMap/{level:"levels/gridmap/info.json |
| [✍ `core_locales`](ge/extensions/core/locales.md) | 19 | Extension GE `core_locales` : traduction des textes côté Lua. Elle charge les fichiers *.translation(s).json du dossier /locales/translation |
| [✍ `core_metrics`](ge/extensions/core/metrics.md) | 5 | Extension GE `core_metrics` : fenêtre d'affichage des performances (FPS, temps CPU/GPU, mémoire, statistiques de rendu). Elle s'affiche en h |
| [✍ `core_modmanager`](ge/extensions/core/modmanager.md) | 33 | Extension GE `core_modmanager` : gestionnaire de mods. Au démarrage de l'interface (onUiReady), il lit la base mods/db.json, scanne /mods/*. |
| [✍ `core_multiSpawn`](ge/extensions/core/multiSpawn.md) | 14 | Extension GE `core_multiSpawn` : génération et placement de groupes de véhicules. Elle peut construire un groupe aléatoire à partir des véhi |
| [✍ `core_multiseat`](ge/extensions/core/multiseat.md) | 45 | Extension GE `core_multiseat` : gestion du multi-joueur local (plusieurs joueurs sur le même PC : clavier/souris et manettes). Elle décide q |
| [✍ `core_multiseatCamera`](ge/extensions/core/multiseatCamera.md) | 3 | Extension GE `core_multiseatCamera` : caméra partagée du mode multi-joueur local (multiseat) quand tous les joueurs voient le même écran. El |
| [✍ `core_multiseatPlayerLimits`](ge/extensions/core/multiseatPlayerLimits.md) | 5 | Extension GE `core_multiseatPlayerLimits` : calcule les limites du nombre de joueurs en multi-joueur local (multiseat). Deux sources : la li |
| [✍ `core_multiseatPlayerMarkers`](ge/extensions/core/multiseatPlayerMarkers.md) | 4 | Extension GE `core_multiseatPlayerMarkers` : lit et écrit le réglage 'multiseatTags' qui contrôle l'affichage des marqueurs (étiquettes) de  |
| [✍ `core_nodegrabberGamepad`](ge/extensions/core/nodegrabberGamepad.md) | 20 | Extension GE `core_nodegrabberGamepad` : pilote le 'nodegrabber' (attraper et tirer un nœud du véhicule avec la souris ou la manette) pour l |
| [✍ `core_onScreenKeyboard`](ge/extensions/core/onScreenKeyboard.md) | 3 | Extension GE `core_onScreenKeyboard` : façade vers les claviers virtuels de la plateforme (Steam Deck, console...). Elle ouvre le clavier av |
| [✍ `core_online`](ge/extensions/core/online.md) | 16 | Extension GE `core_online` : couche d'accès aux services en ligne de BeamNG (authentification, API du repository de mods, téléchargements).  |
| [✍ `core_orthoCamera`](ge/extensions/core/orthoCamera.md) | 5 | Extension GE `core_orthoCamera` : active une vue orthographique (sans perspective) sur la vue principale de l'objet OnlyGui, via scenetree.O |
| [✍ `core_paths`](ge/extensions/core/paths.md) | 21 | Extension GE `core_paths` : gestion des chemins de caméra (fichiers *.camPath.json) utilisés par la caméra 'path' et par l'éditeur de trajec |
| [✍ `core_playerPersonas`](ge/extensions/core/playerPersonas.md) | 16 | Extension GE `core_playerPersonas` : identité visuelle des joueurs locaux en multi-joueur (multiseat). Une 'persona' regroupe un nom affiché |
| [✍ `core_quickAccess`](ge/extensions/core/quickAccess.md) | 43 | Extension GE `core_quickAccess` : le menu radial (menu rapide) du jeu. Elle garde un arbre de menus (chemins du type '/root/sandbox/other/') |
| [✍ `core_recoveryCamera`](ge/extensions/core/recoveryCamera.md) | 4 | Caméra libre temporaire pendant le « recovery » (retour en arrière/réapparition) d'un véhicule. beginRecoveryCamera bascule le joueur assis  |
| [✍ `core_recoveryPrompt`](ge/extensions/core/recoveryPrompt.md) | 29 | Menu de « recovery » du joueur (remorquer sur la route, remettre sur les roues, réparer, retourner au garage, voyage rapide, réinitialiser l |
| [✍ `core_remoteController`](ge/extensions/core/remoteController.md) | 5 | Serveur UDP qui permet de piloter le jeu avec l'application mobile BeamNG « remote controller ». getQRCode ouvre le port UDP 4444 et renvoie |
| [✍ `core_replay`](ge/extensions/core/replay.md) | 42 | Interface Lua du système de replays (fichiers .rpl sous replays/). Elle pilote le flux de fichier C++ (be:getFileStream) : enregistrement ma |
| [✍ `core_repository`](ge/extensions/core/repository.md) | 22 | Client du dépôt de mods en ligne (repository BeamNG) côté GE. Il interroge l'API (core_online.apiCall, routes s1/v4 et s2/v4), gère les abon |
| [✍ `core_reproGuard`](ge/extensions/core/reproGuard.md) | 3 | Garde de sécurité pour la commande de schéma v1/runRepro : décide si une ligne de commande décodée peut être transmise à run_repro.bat, d'ap |
| [✍ `core_ropeVisualTest`](ge/extensions/core/ropeVisualTest.md) | 4 | Bac à sable de développement pour les cordes visuelles (rope visuals) du moteur : une interface ImGui permet de créer, cloner et régler des  |
| [✍ `core_schemeCommandServer`](ge/extensions/core/schemeCommandServer.md) | 2 | Ancien serveur UDP local (127.0.0.1:22137) qui recevait les commandes du schéma d'URL 'beamng:' et les passait à commandhandler.onSchemeComm |
| [✍ `core_settings_audio`](ge/extensions/core/settings/audio.md) | 5 | Réglages audio : choix du fournisseur/périphérique de sortie, volumes par canal (maître, moteur, suspension, musique, UI…) et mode casque st |
| [✍ `core_settings_clusteredQuality`](ge/extensions/core/settings/clusteredQuality.md) | 1 | Préréglages de qualité pour l'éclairage « clustered » (lumières locales groupées) et leurs ombres. Chaque niveau (Lowest, Low, Normal, High, |
| [✍ `core_settings_dynCaptureQuality`](ge/extensions/core/settings/dynCaptureQuality.md) | 2 | Préréglages de qualité des captures dynamiques des véhicules : reflets dynamiques (cubemap) et rétroviseurs dynamiques. Chaque fonction appl |
| [✍ `core_settings_graphic`](ge/extensions/core/settings/graphic.md) | 18 | Réglages graphiques : mode d'affichage (fenêtre, plein écran, sans bordure), résolution, fréquence, pilote d'affichage, HDR, anti-crénelage, |
| [✍ `core_settings_graphicsQualityGroup`](ge/extensions/core/settings/graphicsQualityGroup.md) | 5 | Classe de base d'un groupe de qualité graphique. Elle charge un module de préréglages (par ex. meshQuality, terrainQuality), garde le niveau |
| [✍ `core_settings_lightingQuality`](ge/extensions/core/settings/lightingQuality.md) | 1 | Préréglages de qualité d'éclairage, consommés par graphicsQualityGroup. Chaque niveau fixe le gestionnaire de lumière, le filtrage des ombre |
| [✍ `core_settings_meshQuality`](ge/extensions/core/settings/meshQuality.md) | 0 | Préréglages de qualité des maillages (niveau de détail des shapes), consommés par graphicsQualityGroup. Chaque niveau fixe $pref::TS::detail |
| [✍ `core_settings_multiplayer`](ge/extensions/core/settings/multiplayer.md) | 1 | Fournit les « option helpers » des réglages multijoueur. Chaque helper a une fonction set(value) qui répercute le réglage sur l'extension mu |
| [✍ `core_settings_settings`](ge/extensions/core/settings/settings.md) | 17 | Extension centrale des réglages du jeu côté GE. Elle tient la table des valeurs courantes (initialisée depuis les valeurs par défaut du modu |
| [✍ `core_settings_shadowsQuality`](ge/extensions/core/settings/shadowsQuality.md) | 0 | Préréglages de qualité des ombres, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Shadows::textureScalar et $pref::Shadows::d |
| [✍ `core_settings_terrainQuality`](ge/extensions/core/settings/terrainQuality.md) | 1 | Préréglages de qualité du terrain, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Terrain::lodScale et $pref::Terrain::detail |
| [✍ `core_settings_textureQuality`](ge/extensions/core/settings/textureQuality.md) | 1 | Préréglages de qualité des textures, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Video::textureReductionLevel et $pref::Re |
| [✍ `core_skiaTemplate`](ge/extensions/core/skiaTemplate.md) | 5 | Pilote Lua des plaques d'immatriculation dessinées avec Skia. Il génère le texte de plaque à partir des motifs de design.vars (texte littéra |
| [✍ `core_snapshot`](ge/extensions/core/snapshot.md) | 5 | Sauvegarde et chargement de « snapshots » (position et rotation de caméra) via le service en ligne BeamNG (s2/v4/saveSnapshot et getSnapshot |
| [✍ `core_solarTimeOfDay`](ge/extensions/core/solarTimeOfDay.md) | 8 | Calculs solaires purs (sans appel moteur) : à partir d'une latitude, longitude, date et décalage UTC, calcule lever, midi solaire, coucher e |
| [✍ `core_sounds`](ge/extensions/core/sounds.md) | 16 | Pont entre le jeu et le moteur audio FMOD côté GE. Chaque rendu (onPreRender), il pousse des paramètres globaux (vitesse et rotation de camé |
| [✍ `core_supportReport`](ge/extensions/core/supportReport.md) | 4 | Envoi d'un rapport de support au serveur BeamNG depuis l'UI. send déclenche Engine.SupportReport.send ; le moteur rappelle onSupportReportSe |
| [✍ `core_terrain`](ge/extensions/core/terrain.md) | 4 | Accès simplifié au premier TerrainBlock de la scène : hauteur et normale du terrain en un point. Un moddeur s'en sert pour poser des objets  |
| [✍ `core_trafficSignals`](ge/extensions/core/trafficSignals.md) | 85 | Extension GE `core_trafficSignals` (Traffic Signals V2) : simule les feux tricolores, stops et autres signaux d'un niveau. Trois types d'obj |
| [✍ `core_trailerRespawn`](ge/extensions/core/trailerRespawn.md) | 20 | Extension GE `core_trailerRespawn` : mémorise quels véhicules tractent quelle remorque (registre `trailerReg`) à partir des évènements d'att |
| [✍ `core_vehicle_colors`](ge/extensions/core/vehicle/colors.md) | 4 | Extension GE `core_vehicle_colors` : change en direct la couleur ou la peinture d'un des 3 emplacements de peinture du véhicule configuré (c |
| [✍ `core_vehicle_configTarget`](ge/extensions/core/vehicle/configTarget.md) | 17 | Extension GE `core_vehicle_configTarget` : mémorise quel véhicule (et quel joueur) est la cible du menu de configuration du véhicule, pour q |
| [✍ `core_vehicle_inplaceEdit`](ge/extensions/core/vehicle/inplaceEdit.md) | 4 | Extension GE `core_vehicle_inplaceEdit` : éditeur de pièces « en jeu » rudimentaire (« ingame vehicle editor ») : masque l'interface CEF, af |
| [✍ `core_vehicle_manager`](ge/extensions/core/vehicle/manager.md) | 24 | Extension GE `core_vehicle_manager` : chargeur de véhicules côté GE. Quand le moteur crée un objet véhicule, il appelle `_spawnCCallback` :  |
| [✍ `core_vehicle_mirror`](ge/extensions/core/vehicle/mirror.md) | 12 | Extension GE `core_vehicle_mirror` : réglage des angles des rétroviseurs d'un véhicule. Lit la liste des miroirs de vdata.mirrors, applique  |
| [✍ `core_vehicle_partFocusCamera`](ge/extensions/core/vehicle/partFocusCamera.md) | 13 | Extension GE `core_vehicle_partFocusCamera` : pilote le mode caméra caché 'partFocus' depuis le menu de pièces. À partir des pièces sélectio |
| [✍ `core_vehicle_partmgmt`](ge/extensions/core/vehicle/partmgmt.md) | 65 | Extension GE `core_vehicle_partmgmt` : gestion des pièces et de la configuration d'un véhicule en cours de jeu (menu de configuration, tunin |
| [✍ `core_vehicle_partpreview`](ge/extensions/core/vehicle/partpreview.md) | 4 | Extension GE `core_vehicle_partpreview` : aperçu temporaire de pièces dans l'UI de configuration (survol dans les partpacks), sans respawn d |
| [✍ `core_vehicle_thumbnail`](ge/extensions/core/vehicle/thumbnail.md) | 8 | Extension GE `core_vehicle_thumbnail` : génère les miniatures (.jpg) des configurations de véhicule sauvegardées, soit directement dans vehi |
| [✍ `core_vehicle_triggerLabelPlacement`](ge/extensions/core/vehicle/triggerLabelPlacement.md) | 2 | Extension GE `core_vehicle_triggerLabelPlacement` : calcule où placer l'étiquette d'UI d'un trigger de véhicule (zones d'interaction jbeam)  |
| [✍ `core_vehicle_vehicleTriggerHighlight`](ge/extensions/core/vehicle/vehicleTriggerHighlight.md) | 9 | Extension GE `core_vehicle_vehicleTriggerHighlight` : met en surbrillance dans le monde 3D des triggers de véhicule (zones d'interaction déf |
| [✍ `core_vehicleActivePooling`](ge/extensions/core/vehicleActivePooling.md) | 35 | Extension GE `core_vehicleActivePooling` : gère des « pools » de véhicules dont seule une partie est active (visible et simulée) à la fois,  |
| [✍ `core_vehicleBridge`](ge/extensions/core/vehicleBridge.md) | 10 | Extension GE `core_vehicleBridge` : pont de communication entre le Lua GE et le Lua du véhicule (vlua). Envoie des commandes à `extensions.g |
| [✍ `core_vehicleMirrors`](ge/extensions/core/vehicleMirrors.md) | 3 | Extension GE `core_vehicleMirrors` : ébauche de rendu des reflets de rétroviseurs. Suit le véhicule du joueur 0, demande ses données de miro |
| [✍ `core_vehiclePaints`](ge/extensions/core/vehiclePaints.md) | 10 | Extension GE `core_vehiclePaints` : gestion des peintures de véhicules. Lit les fichiers de bibliothèque de peintures (paints, multiPaintSet |
| [✍ `core_vehicleTriggers`](ge/extensions/core/vehicleTriggers.md) | 19 | Gère l'interaction du joueur avec les triggers de véhicule (poignées de porte, capot, etc. définis dans le JBeam) : lancer de rayon depuis l |
| [✍ `core_vehicleTriggersDebug`](ge/extensions/core/vehicleTriggersDebug.md) | 3 | Fenêtre imgui « Vehicle event debug » pour inspecter les triggers de véhicule : affiche l'état de core_vehicleTriggers (caméra, trigger tenu |
| [✍ `core_vehicles`](ge/extensions/core/vehicles.md) | 64 | Catalogue et apparition des véhicules côté GE. Il lit les dossiers /vehicles/<modèle>/ (info.json, fichiers .pc, images, peintures, jbeam) p |
| [✍ `core_versionUpdate`](ge/extensions/core/versionUpdate.md) | 3 | Détecte au démarrage si le jeu vient d'être mis à jour vers une nouvelle version majeure (comparaison des deux premiers nombres de beamng_ve |
| [✍ `core_weather`](ge/extensions/core/weather.md) | 8 | Applique des préréglages météo (presets) en modifiant directement les champs d'objets de la scène (LevelInfo, CloudLayer, ScatterSky, etc.)  |
| [✍ `core_windowsConsole`](ge/extensions/core/windowsConsole.md) | 8 | Pont entre la fenêtre console native de Windows (C++) et Lua. Il remplit la liste déroulante des contextes d'exécution (GE-Lua, véhicule cou |
| [`debug_vehicleDebug`](ge/extensions/debug/vehicleDebug.md) | 7 |  |
| [`editor_aiTests`](ge/extensions/editor/aiTests.md) | 3 |  |
| [`editor_aiViz`](ge/extensions/editor/aiViz.md) | 4 |  |
| [`editor_api_aiPath`](ge/extensions/editor/api/aiPath.md) | 1 |  |
| [`editor_api_assets`](ge/extensions/editor/api/assets.md) | 3 |  |
| [`editor_api_camera`](ge/extensions/editor/api/camera.md) | 28 |  |
| [`editor_api_colorTemperatureUI`](ge/extensions/editor/api/colorTemperatureUI.md) | 3 |  |
| [`editor_api_core`](ge/extensions/editor/api/core.md) | 51 |  |
| [`editor_api_dataBlock`](ge/extensions/editor/api/dataBlock.md) | 9 |  |
| [`editor_api_decal`](ge/extensions/editor/api/decal.md) | 18 |  |
| [`editor_api_dynamicDecals`](ge/extensions/editor/api/dynamicDecals.md) | 204 |  |
| [`editor_api_dynamicDecals_sidecarFileMigration`](ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.md) | 1 |  |
| [`editor_api_dynamicDecals_textures`](ge/extensions/editor/api/dynamicDecals/textures.md) | 14 |  |
| [`editor_api_easeCurveUI`](ge/extensions/editor/api/easeCurveUI.md) | 1 |  |
| [`editor_api_forest`](ge/extensions/editor/api/forest.md) | 8 |  |
| [`editor_api_forestItemTools`](ge/extensions/editor/api/forestItemTools.md) | 19 |  |
| [`editor_api_genericInspector`](ge/extensions/editor/api/genericInspector.md) | 3 |  |
| [`editor_api_gizmo`](ge/extensions/editor/api/gizmo.md) | 30 |  |
| [`editor_api_gui`](ge/extensions/editor/api/gui.md) | 124 |  |
| [`editor_api_guiInstancer`](ge/extensions/editor/api/guiInstancer.md) | 5 |  |
| [`editor_api_guiTheme`](ge/extensions/editor/api/guiTheme.md) | 0 |  |
| [`editor_api_history`](ge/extensions/editor/api/history.md) | 11 |  |
| [`editor_api_iesImporter`](ge/extensions/editor/api/iesImporter.md) | 14 |  |
| [`editor_api_material`](ge/extensions/editor/api/material.md) | 8 |  |
| [`editor_api_navigation`](ge/extensions/editor/api/navigation.md) | 10 |  |
| [`editor_api_object`](ge/extensions/editor/api/object.md) | 65 |  |
| [`editor_api_objectHistoryActions`](ge/extensions/editor/api/objectHistoryActions.md) | 4 |  |
| [`editor_api_preferencesRegistry`](ge/extensions/editor/api/preferencesRegistry.md) | 25 |  |
| [`editor_api_proceduralContentGenerator`](ge/extensions/editor/api/proceduralContentGenerator.md) | 40 |  |
| [`editor_api_roadRiver`](ge/extensions/editor/api/roadRiver.md) | 19 |  |
| [`editor_api_selectabilityPresets`](ge/extensions/editor/api/selectabilityPresets.md) | 11 |  |
| [`editor_api_sketch`](ge/extensions/editor/api/sketch.md) | 4 |  |
| [`editor_api_terrain`](ge/extensions/editor/api/terrain.md) | 48 |  |
| [`editor_api_valueInspector`](ge/extensions/editor/api/valueInspector.md) | 8 |  |
| [`editor_assemblySpline`](ge/extensions/editor/assemblySpline.md) | 9 |  |
| [`editor_assemblySpline_distribution`](ge/extensions/editor/assemblySpline/distribution.md) | 1 |  |
| [`editor_assemblySpline_import`](ge/extensions/editor/assemblySpline/import.md) | 4 |  |
| [`editor_assemblySpline_molecule`](ge/extensions/editor/assemblySpline/molecule.md) | 15 |  |
| [`editor_assemblySpline_populate`](ge/extensions/editor/assemblySpline/populate.md) | 5 |  |
| [`editor_assemblySpline_splineMgr`](ge/extensions/editor/assemblySpline/splineMgr.md) | 37 |  |
| [`editor_assetBrowser`](ge/extensions/editor/assetBrowser.md) | 13 |  |
| [`editor_assetDeduplicator`](ge/extensions/editor/assetDeduplicator.md) | 5 |  |
| [`editor_assetManagementTool`](ge/extensions/editor/assetManagementTool.md) | 4 |  |
| [`editor_audioEventsList`](ge/extensions/editor/audioEventsList.md) | 5 |  |
| [`editor_audioForestEditor`](ge/extensions/editor/audioForestEditor.md) | 4 |  |
| [`editor_audioRibbonEditor`](ge/extensions/editor/audioRibbonEditor.md) | 3 |  |
| [`editor_autoSave`](ge/extensions/editor/autoSave.md) | 4 |  |
| [`editor_barriersEditor`](ge/extensions/editor/barriersEditor.md) | 5 |  |
| [`editor_biomeTool`](ge/extensions/editor/biomeTool.md) | 12 |  |
| [`editor_bulkRename`](ge/extensions/editor/bulkRename.md) | 5 |  |
| [`editor_camPathEditor`](ge/extensions/editor/camPathEditor.md) | 7 |  |
| [`editor_cameraBookmarks`](ge/extensions/editor/cameraBookmarks.md) | 3 |  |
| [`editor_cameraTransform`](ge/extensions/editor/cameraTransform.md) | 4 |  |
| [`editor_cameraV2`](ge/extensions/editor/cameraV2.md) | 10 |  |
| [`editor_cameraV2_controller`](ge/extensions/editor/cameraV2/controller.md) | 11 |  |
| [`editor_cameraV2_orbit`](ge/extensions/editor/cameraV2/orbit.md) | 13 |  |
| [`editor_cameraV2_validation`](ge/extensions/editor/cameraV2/validation.md) | 12 |  |
| [`editor_cameraV2_zoom`](ge/extensions/editor/cameraV2/zoom.md) | 5 |  |
| [`editor_cefHelper`](ge/extensions/editor/cefHelper.md) | 2 |  |
| [`editor_copyToSelected`](ge/extensions/editor/copyToSelected.md) | 2 |  |
| [`editor_crawlEditor`](ge/extensions/editor/crawlEditor.md) | 27 |  |
| [`editor_crawlEditor_boundaries`](ge/extensions/editor/crawlEditor/boundaries.md) | 18 |  |
| [`editor_crawlEditor_input`](ge/extensions/editor/crawlEditor/input.md) | 2 |  |
| [`editor_crawlEditor_missionPortTool`](ge/extensions/editor/crawlEditor/missionPortTool.md) | 3 |  |
| [`editor_crawlEditor_paths`](ge/extensions/editor/crawlEditor/paths.md) | 27 |  |
| [`editor_crawlEditor_presets`](ge/extensions/editor/crawlEditor/presets.md) | 43 |  |
| [`editor_crawlEditor_startingPositions`](ge/extensions/editor/crawlEditor/startingPositions.md) | 15 |  |
| [`editor_crawlEditor_trails`](ge/extensions/editor/crawlEditor/trails.md) | 11 |  |
| [`editor_crawlEditor_waypoints`](ge/extensions/editor/crawlEditor/waypoints.md) | 20 |  |
| [`editor_createObjectTool`](ge/extensions/editor/createObjectTool.md) | 15 |  |
| [`editor_cubemapEditor`](ge/extensions/editor/cubemapEditor.md) | 3 |  |
| [`editor_dataBlockEditor`](ge/extensions/editor/dataBlockEditor.md) | 6 |  |
| [`editor_decalEditor`](ge/extensions/editor/decalEditor.md) | 7 |  |
| [`editor_decalSpline`](ge/extensions/editor/decalSpline.md) | 8 |  |
| [`editor_decalSpline_populate`](ge/extensions/editor/decalSpline/populate.md) | 7 |  |
| [`editor_decalSpline_splineMgr`](ge/extensions/editor/decalSpline/splineMgr.md) | 32 |  |
| [`editor_documentationHelper`](ge/extensions/editor/documentationHelper.md) | 3 |  |
| [`editor_dragRaceEditor`](ge/extensions/editor/dragRaceEditor.md) | 5 |  |
| [`editor_dragRaceEditor_constants`](ge/extensions/editor/dragRaceEditor/constants.md) | 0 |  |
| [`editor_dragRaceEditor_dragSettings`](ge/extensions/editor/dragRaceEditor/dragSettings.md) | 17 |  |
| [`editor_dragRaceEditor_facilities`](ge/extensions/editor/dragRaceEditor/facilities.md) | 14 |  |
| [`editor_dragRaceEditor_input`](ge/extensions/editor/dragRaceEditor/input.md) | 2 | Mouse input for zone editing (same pattern as crawl editor). |
| [`editor_dragRaceEditor_lanes`](ge/extensions/editor/dragRaceEditor/lanes.md) | 13 |  |
| [`editor_dragRaceEditor_state`](ge/extensions/editor/dragRaceEditor/state.md) | 36 |  |
| [`editor_dragRaceEditor_strips`](ge/extensions/editor/dragRaceEditor/strips.md) | 23 |  |
| [`editor_dragRaceEditor_utils`](ge/extensions/editor/dragRaceEditor/utils.md) | 15 |  |
| [`editor_dragRaceEditor_zones`](ge/extensions/editor/dragRaceEditor/zones.md) | 16 | Zone editing for drag strip zone and lane zones (crawl boundary-style). |
| [`editor_driftDataEditor`](ge/extensions/editor/driftDataEditor.md) | 10 |  |
| [`editor_drivePathEditor`](ge/extensions/editor/drivePathEditor.md) | 7 |  |
| [`editor_drivePathEditor_playback`](ge/extensions/editor/drivePathEditor/playback.md) | 4 |  |
| [`editor_drivePathEditor_record`](ge/extensions/editor/drivePathEditor/record.md) | 4 |  |
| [`editor_drivePathEditor_splineMgr`](ge/extensions/editor/drivePathEditor/splineMgr.md) | 32 |  |
| [`editor_dynamicDecals_browser`](ge/extensions/editor/dynamicDecals/browser.md) | 8 |  |
| [`editor_dynamicDecals_brushes`](ge/extensions/editor/dynamicDecals/brushes.md) | 7 |  |
| [`editor_dynamicDecals_camera`](ge/extensions/editor/dynamicDecals/camera.md) | 3 |  |
| [`editor_dynamicDecals_colorHistory`](ge/extensions/editor/dynamicDecals/colorHistory.md) | 5 |  |
| [`editor_dynamicDecals_colorPresets`](ge/extensions/editor/dynamicDecals/colorPresets.md) | 4 |  |
| [`editor_dynamicDecals_debugSection`](ge/extensions/editor/dynamicDecals/debugSection.md) | 3 |  |
| [`editor_dynamicDecals_debugTextures`](ge/extensions/editor/dynamicDecals/debugTextures.md) | 3 |  |
| [`editor_dynamicDecals_docs`](ge/extensions/editor/dynamicDecals/docs.md) | 11 |  |
| [`editor_dynamicDecals_export`](ge/extensions/editor/dynamicDecals/export.md) | 3 |  |
| [`editor_dynamicDecals_fonts`](ge/extensions/editor/dynamicDecals/fonts.md) | 6 |  |
| [`editor_dynamicDecals_gizmo`](ge/extensions/editor/dynamicDecals/gizmo.md) | 11 |  |
| [`editor_dynamicDecals_helper`](ge/extensions/editor/dynamicDecals/helper.md) | 10 |  |
| [`editor_dynamicDecals_history`](ge/extensions/editor/dynamicDecals/history.md) | 3 |  |
| [`editor_dynamicDecals_inspector`](ge/extensions/editor/dynamicDecals/inspector.md) | 6 |  |
| [`editor_dynamicDecals_inspector_utils`](ge/extensions/editor/dynamicDecals/inspector/utils.md) | 6 |  |
| [`editor_dynamicDecals_layerStack`](ge/extensions/editor/dynamicDecals/layerStack.md) | 4 |  |
| [`editor_dynamicDecals_layerTypes_brushStroke`](ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.md) | 3 |  |
| [`editor_dynamicDecals_layerTypes_decal`](ge/extensions/editor/dynamicDecals/layerTypes/decal.md) | 8 |  |
| [`editor_dynamicDecals_layerTypes_fill`](ge/extensions/editor/dynamicDecals/layerTypes/fill.md) | 4 |  |
| [`editor_dynamicDecals_layerTypes_group`](ge/extensions/editor/dynamicDecals/layerTypes/group.md) | 4 |  |
| [`editor_dynamicDecals_layerTypes_linkedSet`](ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.md) | 4 |  |
| [`editor_dynamicDecals_layerTypes_path`](ge/extensions/editor/dynamicDecals/layerTypes/path.md) | 3 |  |
| [`editor_dynamicDecals_layerTypes_textureFill`](ge/extensions/editor/dynamicDecals/layerTypes/textureFill.md) | 4 |  |
| [`editor_dynamicDecals_loadSave`](ge/extensions/editor/dynamicDecals/loadSave.md) | 8 |  |
| [`editor_dynamicDecals_meshes`](ge/extensions/editor/dynamicDecals/meshes.md) | 3 |  |
| [`editor_dynamicDecals_news`](ge/extensions/editor/dynamicDecals/news.md) | 4 |  |
| [`editor_dynamicDecals_notification`](ge/extensions/editor/dynamicDecals/notification.md) | 5 |  |
| [`editor_dynamicDecals_selection`](ge/extensions/editor/dynamicDecals/selection.md) | 5 |  |
| [`editor_dynamicDecals_settings`](ge/extensions/editor/dynamicDecals/settings.md) | 5 |  |
| [`editor_dynamicDecals_textures`](ge/extensions/editor/dynamicDecals/textures.md) | 6 |  |
| [`editor_dynamicDecals_vehicleColorPalette`](ge/extensions/editor/dynamicDecals/vehicleColorPalette.md) | 6 |  |
| [`editor_dynamicDecals_widgets`](ge/extensions/editor/dynamicDecals/widgets.md) | 6 |  |
| [`editor_dynamicDecalsTool`](ge/extensions/editor/dynamicDecalsTool.md) | 31 |  |
| [`editor_editorRenderSettings`](ge/extensions/editor/editorRenderSettings.md) | 7 |  |
| [`editor_engineAudioDebug`](ge/extensions/editor/engineAudioDebug.md) | 8 |  |
| [`editor_extensionsDebug`](ge/extensions/editor/extensionsDebug.md) | 3 |  |
| [`editor_extensionsEditor`](ge/extensions/editor/extensionsEditor.md) | 4 |  |
| [`editor_ezObjectSelect`](ge/extensions/editor/ezObjectSelect.md) | 17 |  |
| [`editor_ezObjectSelect_cameraBookmarks`](ge/extensions/editor/ezObjectSelect/cameraBookmarks.md) | 1 |  |
| [`editor_ezObjectSelect_controller`](ge/extensions/editor/ezObjectSelect/controller.md) | 44 |  |
| [`editor_ezObjectSelect_modalOperatorCommon`](ge/extensions/editor/ezObjectSelect/modalOperatorCommon.md) | 15 |  |
| [`editor_ezObjectSelect_nativeGizmo`](ge/extensions/editor/ezObjectSelect/nativeGizmo.md) | 4 |  |
| [`editor_ezObjectSelect_objectBoxAnchors`](ge/extensions/editor/ezObjectSelect/objectBoxAnchors.md) | 3 |  |
| [`editor_ezObjectSelect_rotateOperator`](ge/extensions/editor/ezObjectSelect/rotateOperator.md) | 8 |  |
| [`editor_ezObjectSelect_scaleOperator`](ge/extensions/editor/ezObjectSelect/scaleOperator.md) | 8 |  |
| [`editor_ezObjectSelect_selectionCache`](ge/extensions/editor/ezObjectSelect/selectionCache.md) | 5 |  |
| [`editor_ezObjectSelect_selectionDebug`](ge/extensions/editor/ezObjectSelect/selectionDebug.md) | 3 |  |
| [`editor_ezObjectSelect_selectionGeometry`](ge/extensions/editor/ezObjectSelect/selectionGeometry.md) | 10 |  |
| [`editor_ezObjectSelect_selectionLabelOverlay`](ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.md) | 1 |  |
| [`editor_ezObjectSelect_selectionLabels`](ge/extensions/editor/ezObjectSelect/selectionLabels.md) | 1 |  |
| [`editor_ezObjectSelect_selectionModel`](ge/extensions/editor/ezObjectSelect/selectionModel.md) | 8 |  |
| [`editor_ezObjectSelect_selectionQuery`](ge/extensions/editor/ezObjectSelect/selectionQuery.md) | 5 |  |
| [`editor_ezObjectSelect_selectionScreenDebug`](ge/extensions/editor/ezObjectSelect/selectionScreenDebug.md) | 2 |  |
| [`editor_ezObjectSelect_stats`](ge/extensions/editor/ezObjectSelect/stats.md) | 6 |  |
| [`editor_ezObjectSelect_subtools_fence_anchors`](ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.md) | 2 |  |
| [`editor_ezObjectSelect_subtools_fence_controller`](ge/extensions/editor/ezObjectSelect/subtools/fence/controller.md) | 4 |  |
| [`editor_ezObjectSelect_subtools_fence_session`](ge/extensions/editor/ezObjectSelect/subtools/fence/session.md) | 14 |  |
| [`editor_ezObjectSelect_transformGizmo`](ge/extensions/editor/ezObjectSelect/transformGizmo.md) | 4 |  |
| [`editor_ezObjectSelect_transformNumericInput`](ge/extensions/editor/ezObjectSelect/transformNumericInput.md) | 4 |  |
| [`editor_ezObjectSelect_transformOperator`](ge/extensions/editor/ezObjectSelect/transformOperator.md) | 9 |  |
| [`editor_ezObjectSelect_transformSession`](ge/extensions/editor/ezObjectSelect/transformSession.md) | 13 |  |
| [`editor_ezObjectSelect_viewportOrientationGizmo`](ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.md) | 1 |  |
| [`editor_ffiptrleaktest`](ge/extensions/editor/ffiptrleaktest.md) | 2 |  |
| [`editor_fileDialog`](ge/extensions/editor/fileDialog.md) | 8 |  |
| [`editor_flowgraph_basewindow`](ge/extensions/editor/flowgraph/basewindow.md) | 13 |  |
| [`editor_flowgraph_events`](ge/extensions/editor/flowgraph/events.md) | 7 |  |
| [`editor_flowgraph_examples`](ge/extensions/editor/flowgraph/examples.md) | 19 |  |
| [`editor_flowgraph_execution`](ge/extensions/editor/flowgraph/execution.md) | 5 |  |
| [`editor_flowgraph_garbageDebug`](ge/extensions/editor/flowgraph/garbageDebug.md) | 10 |  |
| [`editor_flowgraph_history`](ge/extensions/editor/flowgraph/history.md) | 5 |  |
| [`editor_flowgraph_legend`](ge/extensions/editor/flowgraph/legend.md) | 5 |  |
| [`editor_flowgraph_main`](ge/extensions/editor/flowgraph/main.md) | 13 |  |
| [`editor_flowgraph_missionVariableHelper`](ge/extensions/editor/flowgraph/missionVariableHelper.md) | 2 |  |
| [`editor_flowgraph_nodePreview`](ge/extensions/editor/flowgraph/nodePreview.md) | 6 |  |
| [`editor_flowgraph_nodelibrary`](ge/extensions/editor/flowgraph/nodelibrary.md) | 43 |  |
| [`editor_flowgraph_overview`](ge/extensions/editor/flowgraph/overview.md) | 9 |  |
| [`editor_flowgraph_projectSettings`](ge/extensions/editor/flowgraph/projectSettings.md) | 5 |  |
| [`editor_flowgraph_properties`](ge/extensions/editor/flowgraph/properties.md) | 17 |  |
| [`editor_flowgraph_references`](ge/extensions/editor/flowgraph/references.md) | 15 |  |
| [`editor_flowgraph_search`](ge/extensions/editor/flowgraph/search.md) | 17 |  |
| [`editor_flowgraph_stateView`](ge/extensions/editor/flowgraph/stateView.md) | 5 |  |
| [`editor_flowgraph_variables`](ge/extensions/editor/flowgraph/variables.md) | 10 |  |
| [`editor_flowgraph_welcome`](ge/extensions/editor/flowgraph/welcome.md) | 8 |  |
| [`editor_flowgraphEditor`](ge/extensions/editor/flowgraphEditor.md) | 37 |  |
| [`editor_forestEditor`](ge/extensions/editor/forestEditor.md) | 20 |  |
| [`editor_forestTsstaticMover`](ge/extensions/editor/forestTsstaticMover.md) | 2 |  |
| [`editor_forestView`](ge/extensions/editor/forestView.md) | 3 |  |
| [`editor_gizmoHelper`](ge/extensions/editor/gizmoHelper.md) | 3 |  |
| [`editor_groundCoverEditor`](ge/extensions/editor/groundCoverEditor.md) | 4 |  |
| [`editor_groundModelDebugHelper`](ge/extensions/editor/groundModelDebugHelper.md) | 1 |  |
| [`editor_headlessEditorTest`](ge/extensions/editor/headlessEditorTest.md) | 0 |  |
| [`editor_heroRoadEditor`](ge/extensions/editor/heroRoadEditor.md) | 7 |  |
| [`editor_heroRoadEditor_barrierMgr`](ge/extensions/editor/heroRoadEditor/barrierMgr.md) | 4 |  |
| [`editor_heroRoadEditor_exportMgr`](ge/extensions/editor/heroRoadEditor/exportMgr.md) | 4 |  |
| [`editor_heroRoadEditor_groundmodel`](ge/extensions/editor/heroRoadEditor/groundmodel.md) | 14 |  |
| [`editor_heroRoadEditor_groupMgr`](ge/extensions/editor/heroRoadEditor/groupMgr.md) | 58 |  |
| [`editor_heroRoadEditor_heatmap`](ge/extensions/editor/heroRoadEditor/heatmap.md) | 2 |  |
| [`editor_heroRoadEditor_import`](ge/extensions/editor/heroRoadEditor/import.md) | 2 |  |
| [`editor_heroRoadEditor_layerMgr`](ge/extensions/editor/heroRoadEditor/layerMgr.md) | 44 |  |
| [`editor_heroRoadEditor_mesh`](ge/extensions/editor/heroRoadEditor/mesh.md) | 8 |  |
| [`editor_heroRoadEditor_meshRefine`](ge/extensions/editor/heroRoadEditor/meshRefine.md) | 2 |  |
| [`editor_heroRoadEditor_placeablesUI`](ge/extensions/editor/heroRoadEditor/placeablesUI.md) | 2 |  |
| [`editor_heroRoadEditor_profile`](ge/extensions/editor/heroRoadEditor/profile.md) | 3 |  |
| [`editor_heroRoadEditor_repairMgr`](ge/extensions/editor/heroRoadEditor/repairMgr.md) | 2 |  |
| [`editor_heroRoadEditor_sidewalkMgr`](ge/extensions/editor/heroRoadEditor/sidewalkMgr.md) | 4 |  |
| [`editor_iconOverview`](ge/extensions/editor/iconOverview.md) | 6 |  |
| [`editor_iesEditor`](ge/extensions/editor/iesEditor.md) | 3 |  |
| [`editor_imguiCDemo`](ge/extensions/editor/imguiCDemo.md) | 2 |  |
| [`editor_inspector`](ge/extensions/editor/inspector.md) | 20 |  |
| [`editor_layoutManager`](ge/extensions/editor/layoutManager.md) | 7 |  |
| [`editor_levelSettings`](ge/extensions/editor/levelSettings.md) | 3 |  |
| [`editor_levelValidator`](ge/extensions/editor/levelValidator.md) | 17 |  |
| [`editor_lightClassConverter`](ge/extensions/editor/lightClassConverter.md) | 1 |  |
| [`editor_logHelper`](ge/extensions/editor/logHelper.md) | 1 |  |
| [`editor_logger`](ge/extensions/editor/logger.md) | 2 |  |
| [`editor_main`](ge/extensions/editor/main.md) | 30 |  |
| [`editor_mainMenu`](ge/extensions/editor/mainMenu.md) | 12 |  |
| [`editor_mainToolbar`](ge/extensions/editor/mainToolbar.md) | 6 |  |
| [`editor_mainUpdate`](ge/extensions/editor/mainUpdate.md) | 3 |  |
| [`editor_mapJsonEditor`](ge/extensions/editor/mapJsonEditor.md) | 10 |  |
| [`editor_masterSpline`](ge/extensions/editor/masterSpline.md) | 7 |  |
| [`editor_masterSpline_autoRoadGen`](ge/extensions/editor/masterSpline/autoRoadGen.md) | 5 |  |
| [`editor_masterSpline_burn`](ge/extensions/editor/masterSpline/burn.md) | 2 |  |
| [`editor_masterSpline_homologation`](ge/extensions/editor/masterSpline/homologation.md) | 3 |  |
| [`editor_masterSpline_jumpTables`](ge/extensions/editor/masterSpline/jumpTables.md) | 0 |  |
| [`editor_masterSpline_layerMgr`](ge/extensions/editor/masterSpline/layerMgr.md) | 10 |  |
| [`editor_masterSpline_splineMgr`](ge/extensions/editor/masterSpline/splineMgr.md) | 36 |  |
| [`editor_materialEditor`](ge/extensions/editor/materialEditor.md) | 18 |  |
| [`editor_measuresInspectorHeader`](ge/extensions/editor/measuresInspectorHeader.md) | 3 |  |
| [`editor_meshEditor`](ge/extensions/editor/meshEditor.md) | 14 |  |
| [`editor_meshRoadEditor`](ge/extensions/editor/meshRoadEditor.md) | 2 |  |
| [`editor_meshSpline`](ge/extensions/editor/meshSpline.md) | 9 |  |
| [`editor_meshSpline_import`](ge/extensions/editor/meshSpline/import.md) | 3 |  |
| [`editor_meshSpline_populate`](ge/extensions/editor/meshSpline/populate.md) | 8 |  |
| [`editor_meshSpline_populationEngine`](ge/extensions/editor/meshSpline/populationEngine.md) | 4 |  |
| [`editor_meshSpline_splineMgr`](ge/extensions/editor/meshSpline/splineMgr.md) | 39 |  |
| [`editor_missionEditor`](ge/extensions/editor/missionEditor.md) | 15 |  |
| [`editor_missionEditor_additionalAttributes`](ge/extensions/editor/missionEditor/additionalAttributes.md) | 7 |  |
| [`editor_missionEditor_careerSetup`](ge/extensions/editor/missionEditor/careerSetup.md) | 10 |  |
| [`editor_missionEditor_conditions`](ge/extensions/editor/missionEditor/conditions.md) | 4 |  |
| [`editor_missionEditor_dev`](ge/extensions/editor/missionEditor/dev.md) | 3 |  |
| [`editor_missionEditor_general`](ge/extensions/editor/missionEditor/general.md) | 4 |  |
| [`editor_missionEditor_genericTypeData`](ge/extensions/editor/missionEditor/genericTypeData.md) | 13 |  |
| [`editor_missionEditor_issues`](ge/extensions/editor/missionEditor/issues.md) | 6 |  |
| [`editor_missionEditor_layers`](ge/extensions/editor/missionEditor/layers.md) | 4 |  |
| [`editor_missionEditor_objectives`](ge/extensions/editor/missionEditor/objectives.md) | 14 |  |
| [`editor_missionEditor_playbookUtils`](ge/extensions/editor/missionEditor/playbookUtils.md) | 3 |  |
| [`editor_missionEditor_prefabs`](ge/extensions/editor/missionEditor/prefabs.md) | 3 |  |
| [`editor_missionEditor_previewChecker`](ge/extensions/editor/missionEditor/previewChecker.md) | 5 |  |
| [`editor_missionEditor_progressMulti`](ge/extensions/editor/missionEditor/progressMulti.md) | 3 |  |
| [`editor_missionEditor_progressSetup`](ge/extensions/editor/missionEditor/progressSetup.md) | 3 |  |
| [`editor_missionEditor_progressSingle`](ge/extensions/editor/missionEditor/progressSingle.md) | 4 |  |
| [`editor_missionEditor_setupModules`](ge/extensions/editor/missionEditor/setupModules.md) | 6 |  |
| [`editor_missionEditor_startTrigger`](ge/extensions/editor/missionEditor/startTrigger.md) | 4 |  |
| [`editor_missionPlaybook`](ge/extensions/editor/missionPlaybook.md) | 7 |  |
| [`editor_missionPlaybook_attributeViewer`](ge/extensions/editor/missionPlaybook/attributeViewer.md) | 4 |  |
| [`editor_missionPlaybook_missionTreeViewer`](ge/extensions/editor/missionPlaybook/missionTreeViewer.md) | 4 |  |
| [`editor_missionPlaybook_unlockedMissionsViewer`](ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.md) | 4 |  |
| [`editor_missionStartPositionEditor`](ge/extensions/editor/missionStartPositionEditor.md) | 2 |  |
| [`editor_multiSpawnManager`](ge/extensions/editor/multiSpawnManager.md) | 6 |  |
| [`editor_navMeshEditor`](ge/extensions/editor/navMeshEditor.md) | 6 |  |
| [`editor_newsMessage`](ge/extensions/editor/newsMessage.md) | 3 |  |
| [`editor_objectScreenSizeViz`](ge/extensions/editor/objectScreenSizeViz.md) | 2 |  |
| [`editor_objectToSplineEditor`](ge/extensions/editor/objectToSplineEditor.md) | 2 |  |
| [`editor_objectTool`](ge/extensions/editor/objectTool.md) | 13 |  |
| [`editor_particleEditor`](ge/extensions/editor/particleEditor.md) | 5 |  |
| [`editor_particleEditor2`](ge/extensions/editor/particleEditor2.md) | 7 |  |
| [`editor_perfProfiler`](ge/extensions/editor/perfProfiler.md) | 4 |  |
| [`editor_prefabInstanceEditor`](ge/extensions/editor/prefabInstanceEditor.md) | 2 |  |
| [`editor_preferences`](ge/extensions/editor/preferences.md) | 11 |  |
| [`editor_raceEditor`](ge/extensions/editor/raceEditor.md) | 19 |  |
| [`editor_raceEditor_pacenotes`](ge/extensions/editor/raceEditor/pacenotes.md) | 16 |  |
| [`editor_raceEditor_pathnodes`](ge/extensions/editor/raceEditor/pathnodes.md) | 23 |  |
| [`editor_raceEditor_segments`](ge/extensions/editor/raceEditor/segments.md) | 15 |  |
| [`editor_raceEditor_startPositions`](ge/extensions/editor/raceEditor/startPositions.md) | 16 |  |
| [`editor_raceEditor_testing`](ge/extensions/editor/raceEditor/testing.md) | 10 |  |
| [`editor_raceEditor_timeTrials`](ge/extensions/editor/raceEditor/timeTrials.md) | 11 |  |
| [`editor_raceEditor_tools`](ge/extensions/editor/raceEditor/tools.md) | 12 |  |
| [`editor_raceEditor_trackLayout`](ge/extensions/editor/raceEditor/trackLayout.md) | 11 |  |
| [`editor_rallyEditor`](ge/extensions/editor/rallyEditor.md) | 76 |  |
| [`editor_rallyEditor_aiCompetitorsEditorModel`](ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.md) | 9 |  |
| [`editor_rallyEditor_aiCompetitorsEditorPlot`](ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.md) | 2 |  |
| [`editor_rallyEditor_aiCompetitorsEditorPreview`](ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.md) | 2 |  |
| [`editor_rallyEditor_aiCompetitorsEditorTexts`](ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.md) | 0 |  |
| [`editor_rallyEditor_aiCompetitorsTab`](ge/extensions/editor/rallyEditor/aiCompetitorsTab.md) | 14 |  |
| [`editor_rallyEditor_drivelineEditSurface`](ge/extensions/editor/rallyEditor/drivelineEditSurface.md) | 9 |  |
| [`editor_rallyEditor_drivelineTab`](ge/extensions/editor/rallyEditor/drivelineTab.md) | 36 |  |
| [`editor_rallyEditor_ghostNotebook`](ge/extensions/editor/rallyEditor/ghostNotebook.md) | 11 |  |
| [`editor_rallyEditor_ghostNotebook_ghostRenderer`](ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.md) | 5 |  |
| [`editor_rallyEditor_measurementsTab`](ge/extensions/editor/rallyEditor/measurementsTab.md) | 26 |  |
| [`editor_rallyEditor_missionTab`](ge/extensions/editor/rallyEditor/missionTab.md) | 5 |  |
| [`editor_rallyEditor_notebookInfo`](ge/extensions/editor/rallyEditor/notebookInfo.md) | 11 |  |
| [`editor_rallyEditor_pacenotes`](ge/extensions/editor/rallyEditor/pacenotes.md) | 99 |  |
| [`editor_rallyEditor_pacenotes_calibrationAnalysisExport`](ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.md) | 6 |  |
| [`editor_rallyEditor_pacenotes_calibrationMetadataForm`](ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.md) | 1 |  |
| [`editor_rallyEditor_pacenotes_calibrationWindow`](ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.md) | 1 |  |
| [`editor_rallyEditor_pacenotes_customAudioList`](ge/extensions/editor/rallyEditor/pacenotes/customAudioList.md) | 1 |  |
| [`editor_rallyEditor_pacenotes_customForm`](ge/extensions/editor/rallyEditor/pacenotes/customForm.md) | 2 |  |
| [`editor_rallyEditor_pacenotes_measurementsForm`](ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.md) | 2 |  |
| [`editor_rallyEditor_pacenotes_pacenoteForm`](ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.md) | 4 |  |
| [`editor_rallyEditor_pacenotes_selectedPacenoteUtility`](ge/extensions/editor/rallyEditor/pacenotes/selectedPacenoteUtility.md) | 1 |  |
| [`editor_rallyEditor_pacenotes_structuredForm`](ge/extensions/editor/rallyEditor/pacenotes/structuredForm.md) | 2 |  |
| [`editor_rallyEditor_recceTab`](ge/extensions/editor/rallyEditor/recceTab.md) | 11 |  |
| [`editor_rallyEditor_stageLoaderModal`](ge/extensions/editor/rallyEditor/stageLoaderModal.md) | 1 |  |
| [`editor_rallyEditor_systemPacenotesTab`](ge/extensions/editor/rallyEditor/systemPacenotesTab.md) | 6 |  |
| [`editor_rallyEditor_testTab`](ge/extensions/editor/rallyEditor/testTab.md) | 7 |  |
| [`editor_rallyEditor_voicepacksTab`](ge/extensions/editor/rallyEditor/voicepacksTab.md) | 8 |  |
| [`editor_rallyEditor_zSnap`](ge/extensions/editor/rallyEditor/zSnap.md) | 12 |  |
| [`editor_rayCastTest`](ge/extensions/editor/rayCastTest.md) | 5 |  |
| [`editor_renderTest`](ge/extensions/editor/renderTest.md) | 0 |  |
| [`editor_renderViewBuffers`](ge/extensions/editor/renderViewBuffers.md) | 2 |  |
| [`editor_rendererComponents`](ge/extensions/editor/rendererComponents.md) | 3 |  |
| [`editor_resourceChecker`](ge/extensions/editor/resourceChecker.md) | 7 |  |
| [`editor_resourceChecker_resourceUtil`](ge/extensions/editor/resourceChecker/resourceUtil.md) | 29 |  |
| [`editor_riverEditor`](ge/extensions/editor/riverEditor.md) | 2 |  |
| [`editor_roadArchitect`](ge/extensions/editor/roadArchitect.md) | 4 |  |
| [`editor_roadArchitect_clothoid`](ge/extensions/editor/roadArchitect/clothoid.md) | 1 | Copyright (c) 2024, Enrico Bertolazzi, Marco Frego and BeamNG |
| [`editor_roadArchitect_decals`](ge/extensions/editor/roadArchitect/decals.md) | 4 |  |
| [`editor_roadArchitect_geometry`](ge/extensions/editor/roadArchitect/geometry.md) | 1 |  |
| [`editor_roadArchitect_groups`](ge/extensions/editor/roadArchitect/groups.md) | 19 |  |
| [`editor_roadArchitect_importFile`](ge/extensions/editor/roadArchitect/importFile.md) | 4 |  |
| [`editor_roadArchitect_junctions`](ge/extensions/editor/roadArchitect/junctions.md) | 34 |  |
| [`editor_roadArchitect_link`](ge/extensions/editor/roadArchitect/link.md) | 4 |  |
| [`editor_roadArchitect_networkImport`](ge/extensions/editor/roadArchitect/networkImport.md) | 2 |  |
| [`editor_roadArchitect_openDriveExport`](ge/extensions/editor/roadArchitect/openDriveExport.md) | 1 |  |
| [`editor_roadArchitect_openDriveImport`](ge/extensions/editor/roadArchitect/openDriveImport.md) | 2 |  |
| [`editor_roadArchitect_osmImport`](ge/extensions/editor/roadArchitect/osmImport.md) | 0 |  |
| [`editor_roadArchitect_overlays`](ge/extensions/editor/roadArchitect/overlays.md) | 7 |  |
| [`editor_roadArchitect_profiles`](ge/extensions/editor/roadArchitect/profiles.md) | 60 |  |
| [`editor_roadArchitect_render`](ge/extensions/editor/roadArchitect/render.md) | 1 |  |
| [`editor_roadArchitect_roadMesh`](ge/extensions/editor/roadArchitect/roadMesh.md) | 5 |  |
| [`editor_roadArchitect_roads`](ge/extensions/editor/roadArchitect/roads.md) | 53 |  |
| [`editor_roadArchitect_staticMesh`](ge/extensions/editor/roadArchitect/staticMesh.md) | 2 |  |
| [`editor_roadArchitect_staticMeshMgr`](ge/extensions/editor/roadArchitect/staticMeshMgr.md) | 7 |  |
| [`editor_roadArchitect_sumoImport`](ge/extensions/editor/roadArchitect/sumoImport.md) | 0 |  |
| [`editor_roadArchitect_terraform`](ge/extensions/editor/roadArchitect/terraform.md) | 5 |  |
| [`editor_roadArchitect_tunnelMesh`](ge/extensions/editor/roadArchitect/tunnelMesh.md) | 2 |  |
| [`editor_roadArchitect_utilities`](ge/extensions/editor/roadArchitect/utilities.md) | 43 |  |
| [`editor_roadDecorations`](ge/extensions/editor/roadDecorations.md) | 2 |  |
| [`editor_roadEditor`](ge/extensions/editor/roadEditor.md) | 8 |  |
| [`editor_roadNetworkExporter`](ge/extensions/editor/roadNetworkExporter.md) | 3 |  |
| [`editor_roadRiverCacheHandler`](ge/extensions/editor/roadRiverCacheHandler.md) | 2 |  |
| [`editor_roadRiverGui`](ge/extensions/editor/roadRiverGui.md) | 1 |  |
| [`editor_roadSpline`](ge/extensions/editor/roadSpline.md) | 8 |  |
| [`editor_roadSpline_groupMgr`](ge/extensions/editor/roadSpline/groupMgr.md) | 35 |  |
| [`editor_roadSpline_import`](ge/extensions/editor/roadSpline/import.md) | 2 |  |
| [`editor_roadSpline_layerMgr`](ge/extensions/editor/roadSpline/layerMgr.md) | 43 |  |
| [`editor_roadTemplateEditor`](ge/extensions/editor/roadTemplateEditor.md) | 3 |  |
| [`editor_roadUtils`](ge/extensions/editor/roadUtils.md) | 7 |  |
| [`editor_roofServices`](ge/extensions/editor/roofServices.md) | 0 |  |
| [`editor_sceneTree`](ge/extensions/editor/sceneTree.md) | 25 |  |
| [`editor_sceneView`](ge/extensions/editor/sceneView.md) | 4 |  |
| [`editor_screenshotCreatorBootstrap`](ge/extensions/editor/screenshotCreatorBootstrap.md) | 1 |  |
| [`editor_scriptAIEditor`](ge/extensions/editor/scriptAIEditor.md) | 6 |  |
| [`editor_scriptAIManager`](ge/extensions/editor/scriptAIManager.md) | 10 |  |
| [`editor_shapeEditor`](ge/extensions/editor/shapeEditor.md) | 10 |  |
| [`editor_shortcutLegend`](ge/extensions/editor/shortcutLegend.md) | 4 |  |
| [`editor_sitesEditor`](ge/extensions/editor/sitesEditor.md) | 16 |  |
| [`editor_sitesEditor_locations`](ge/extensions/editor/sitesEditor/locations.md) | 11 |  |
| [`editor_sitesEditor_parkingSpots`](ge/extensions/editor/sitesEditor/parkingSpots.md) | 12 |  |
| [`editor_sitesEditor_sortedListDisplay`](ge/extensions/editor/sitesEditor/sortedListDisplay.md) | 13 |  |
| [`editor_sitesEditor_tags`](ge/extensions/editor/sitesEditor/tags.md) | 7 |  |
| [`editor_sitesEditor_zones`](ge/extensions/editor/sitesEditor/zones.md) | 15 |  |
| [`editor_suspensionAudioDebug`](ge/extensions/editor/suspensionAudioDebug.md) | 6 |  |
| [`editor_terraform_fetchSources`](ge/extensions/editor/terraform/fetchSources.md) | 2 |  |
| [`editor_terraform_terraform`](ge/extensions/editor/terraform/terraform.md) | 18 |  |
| [`editor_terraformTool`](ge/extensions/editor/terraformTool.md) | 17 |  |
| [`editor_terrainAndRoadImporter`](ge/extensions/editor/terrainAndRoadImporter.md) | 7 |  |
| [`editor_terrainEditor`](ge/extensions/editor/terrainEditor.md) | 46 |  |
| [`editor_terrainMaterialsEditor`](ge/extensions/editor/terrainMaterialsEditor.md) | 3 |  |
| [`editor_textEditor`](ge/extensions/editor/textEditor.md) | 4 |  |
| [`editor_toolShortcuts`](ge/extensions/editor/toolShortcuts.md) | 3 |  |
| [`editor_toolUtilities_aabbPick`](ge/extensions/editor/toolUtilities/aabbPick.md) | 2 |  |
| [`editor_toolUtilities_bake`](ge/extensions/editor/toolUtilities/bake.md) | 6 |  |
| [`editor_toolUtilities_cameraRig`](ge/extensions/editor/toolUtilities/cameraRig.md) | 6 |  |
| [`editor_toolUtilities_cornerHandles`](ge/extensions/editor/toolUtilities/cornerHandles.md) | 5 |  |
| [`editor_toolUtilities_curveWiden`](ge/extensions/editor/toolUtilities/curveWiden.md) | 6 |  |
| [`editor_toolUtilities_daeExport`](ge/extensions/editor/toolUtilities/daeExport.md) | 7 |  |
| [`editor_toolUtilities_deckSweep`](ge/extensions/editor/toolUtilities/deckSweep.md) | 1 |  |
| [`editor_toolUtilities_dice`](ge/extensions/editor/toolUtilities/dice.md) | 2 |  |
| [`editor_toolUtilities_edgeHandles`](ge/extensions/editor/toolUtilities/edgeHandles.md) | 6 |  |
| [`editor_toolUtilities_engineeredGeom`](ge/extensions/editor/toolUtilities/engineeredGeom.md) | 9 |  |
| [`editor_toolUtilities_fenceStyles`](ge/extensions/editor/toolUtilities/fenceStyles.md) | 3 |  |
| [`editor_toolUtilities_fitPoly`](ge/extensions/editor/toolUtilities/fitPoly.md) | 1 |  |
| [`editor_toolUtilities_foliagePicker`](ge/extensions/editor/toolUtilities/foliagePicker.md) | 4 |  |
| [`editor_toolUtilities_foliageScatter`](ge/extensions/editor/toolUtilities/foliageScatter.md) | 18 |  |
| [`editor_toolUtilities_geom`](ge/extensions/editor/toolUtilities/geom.md) | 113 |  |
| [`editor_toolUtilities_gizmo`](ge/extensions/editor/toolUtilities/gizmo.md) | 2 |  |
| [`editor_toolUtilities_gridCap`](ge/extensions/editor/toolUtilities/gridCap.md) | 2 |  |
| [`editor_toolUtilities_groundBounds`](ge/extensions/editor/toolUtilities/groundBounds.md) | 6 |  |
| [`editor_toolUtilities_groundClaims`](ge/extensions/editor/toolUtilities/groundClaims.md) | 7 |  |
| [`editor_toolUtilities_groundPanel`](ge/extensions/editor/toolUtilities/groundPanel.md) | 3 |  |
| [`editor_toolUtilities_groundPass`](ge/extensions/editor/toolUtilities/groundPass.md) | 13 |  |
| [`editor_toolUtilities_kerbSpec`](ge/extensions/editor/toolUtilities/kerbSpec.md) | 1 |  |
| [`editor_toolUtilities_kitPlacer`](ge/extensions/editor/toolUtilities/kitPlacer.md) | 27 |  |
| [`editor_toolUtilities_marchingCubes`](ge/extensions/editor/toolUtilities/marchingCubes.md) | 1 |  |
| [`editor_toolUtilities_matCombo`](ge/extensions/editor/toolUtilities/matCombo.md) | 1 |  |
| [`editor_toolUtilities_materialSelectionMgr`](ge/extensions/editor/toolUtilities/materialSelectionMgr.md) | 5 |  |
| [`editor_toolUtilities_meshAuditionMgr`](ge/extensions/editor/toolUtilities/meshAuditionMgr.md) | 11 |  |
| [`editor_toolUtilities_meshPart`](ge/extensions/editor/toolUtilities/meshPart.md) | 20 |  |
| [`editor_toolUtilities_meshStats`](ge/extensions/editor/toolUtilities/meshStats.md) | 4 |  |
| [`editor_toolUtilities_networkState`](ge/extensions/editor/toolUtilities/networkState.md) | 15 |  |
| [`editor_toolUtilities_noise`](ge/extensions/editor/toolUtilities/noise.md) | 3 |  |
| [`editor_toolUtilities_occupancy`](ge/extensions/editor/toolUtilities/occupancy.md) | 23 |  |
| [`editor_toolUtilities_panCamera`](ge/extensions/editor/toolUtilities/panCamera.md) | 7 |  |
| [`editor_toolUtilities_perlin`](ge/extensions/editor/toolUtilities/perlin.md) | 1 |  |
| [`editor_toolUtilities_polyBool`](ge/extensions/editor/toolUtilities/polyBool.md) | 3 |  |
| [`editor_toolUtilities_polyOffset`](ge/extensions/editor/toolUtilities/polyOffset.md) | 4 |  |
| [`editor_toolUtilities_polygon`](ge/extensions/editor/toolUtilities/polygon.md) | 10 |  |
| [`editor_toolUtilities_polygonPaint`](ge/extensions/editor/toolUtilities/polygonPaint.md) | 6 |  |
| [`editor_toolUtilities_profileSweep`](ge/extensions/editor/toolUtilities/profileSweep.md) | 2 |  |
| [`editor_toolUtilities_rdp`](ge/extensions/editor/toolUtilities/rdp.md) | 6 |  |
| [`editor_toolUtilities_regionStyles`](ge/extensions/editor/toolUtilities/regionStyles.md) | 1 |  |
| [`editor_toolUtilities_render_graph`](ge/extensions/editor/toolUtilities/render/graph.md) | 7 |  |
| [`editor_toolUtilities_render_lines`](ge/extensions/editor/toolUtilities/render/lines.md) | 29 |  |
| [`editor_toolUtilities_render_markup`](ge/extensions/editor/toolUtilities/render/markup.md) | 48 |  |
| [`editor_toolUtilities_render_spheres`](ge/extensions/editor/toolUtilities/render/spheres.md) | 30 |  |
| [`editor_toolUtilities_render_spline`](ge/extensions/editor/toolUtilities/render/spline.md) | 13 |  |
| [`editor_toolUtilities_render_transport`](ge/extensions/editor/toolUtilities/render/transport.md) | 12 |  |
| [`editor_toolUtilities_render_tris`](ge/extensions/editor/toolUtilities/render/tris.md) | 6 |  |
| [`editor_toolUtilities_ribbonInput`](ge/extensions/editor/toolUtilities/ribbonInput.md) | 2 |  |
| [`editor_toolUtilities_roadDesignStandards`](ge/extensions/editor/toolUtilities/roadDesignStandards.md) | 2 |  |
| [`editor_toolUtilities_roadPlaceables`](ge/extensions/editor/toolUtilities/roadPlaceables.md) | 15 |  |
| [`editor_toolUtilities_roadsideProps`](ge/extensions/editor/toolUtilities/roadsideProps.md) | 12 |  |
| [`editor_toolUtilities_session`](ge/extensions/editor/toolUtilities/session.md) | 14 |  |
| [`editor_toolUtilities_simplex`](ge/extensions/editor/toolUtilities/simplex.md) | 1 |  |
| [`editor_toolUtilities_simplex3`](ge/extensions/editor/toolUtilities/simplex3.md) | 1 |  |
| [`editor_toolUtilities_siteAssets`](ge/extensions/editor/toolUtilities/siteAssets.md) | 16 |  |
| [`editor_toolUtilities_siteBake`](ge/extensions/editor/toolUtilities/siteBake.md) | 12 |  |
| [`editor_toolUtilities_siteDecals`](ge/extensions/editor/toolUtilities/siteDecals.md) | 8 |  |
| [`editor_toolUtilities_siteLibrary`](ge/extensions/editor/toolUtilities/siteLibrary.md) | 1 |  |
| [`editor_toolUtilities_siteLights`](ge/extensions/editor/toolUtilities/siteLights.md) | 4 |  |
| [`editor_toolUtilities_siteMarks`](ge/extensions/editor/toolUtilities/siteMarks.md) | 5 |  |
| [`editor_toolUtilities_sitePad`](ge/extensions/editor/toolUtilities/sitePad.md) | 14 |  |
| [`editor_toolUtilities_siteSpots`](ge/extensions/editor/toolUtilities/siteSpots.md) | 4 |  |
| [`editor_toolUtilities_siteView`](ge/extensions/editor/toolUtilities/siteView.md) | 13 |  |
| [`editor_toolUtilities_siteWater`](ge/extensions/editor/toolUtilities/siteWater.md) | 5 |  |
| [`editor_toolUtilities_skeleton`](ge/extensions/editor/toolUtilities/skeleton.md) | 4 |  |
| [`editor_toolUtilities_splineInput`](ge/extensions/editor/toolUtilities/splineInput.md) | 8 |  |
| [`editor_toolUtilities_splineLock`](ge/extensions/editor/toolUtilities/splineLock.md) | 7 |  |
| [`editor_toolUtilities_splineMaskExport`](ge/extensions/editor/toolUtilities/splineMaskExport.md) | 1 |  |
| [`editor_toolUtilities_statsFooter`](ge/extensions/editor/toolUtilities/statsFooter.md) | 2 |  |
| [`editor_toolUtilities_style`](ge/extensions/editor/toolUtilities/style.md) | 2 |  |
| [`editor_toolUtilities_surfaceKit`](ge/extensions/editor/toolUtilities/surfaceKit.md) | 12 |  |
| [`editor_toolUtilities_sweep`](ge/extensions/editor/toolUtilities/sweep.md) | 20 |  |
| [`editor_toolUtilities_terrainPainter`](ge/extensions/editor/toolUtilities/terrainPainter.md) | 4 |  |
| [`editor_toolUtilities_terrainPolyPaint`](ge/extensions/editor/toolUtilities/terrainPolyPaint.md) | 6 |  |
| [`editor_toolUtilities_toolCamera`](ge/extensions/editor/toolUtilities/toolCamera.md) | 7 |  |
| [`editor_toolUtilities_triLive`](ge/extensions/editor/toolUtilities/triLive.md) | 5 |  |
| [`editor_toolUtilities_uiRows`](ge/extensions/editor/toolUtilities/uiRows.md) | 8 |  |
| [`editor_toolUtilities_util`](ge/extensions/editor/toolUtilities/util.md) | 45 |  |
| [`editor_toolUtilities_walkRibbon`](ge/extensions/editor/toolUtilities/walkRibbon.md) | 5 |  |
| [`editor_trafficDebug`](ge/extensions/editor/trafficDebug.md) | 4 |  |
| [`editor_trafficGatedRoadsEditor`](ge/extensions/editor/trafficGatedRoadsEditor.md) | 10 |  |
| [`editor_trafficManager`](ge/extensions/editor/trafficManager.md) | 13 |  |
| [`editor_trafficSignalsEditor`](ge/extensions/editor/trafficSignalsEditor.md) | 11 |  |
| [`editor_treeSpline`](ge/extensions/editor/treeSpline.md) | 9 |  |
| [`editor_treeSpline_populate`](ge/extensions/editor/treeSpline/populate.md) | 4 |  |
| [`editor_treeSpline_splineMgr`](ge/extensions/editor/treeSpline/splineMgr.md) | 33 |  |
| [`editor_undoHistory`](ge/extensions/editor/undoHistory.md) | 3 |  |
| [`editor_util_customFieldsUtil`](ge/extensions/editor/util/customFieldsUtil.md) | 9 |  |
| [`editor_util_editorElementHelper`](ge/extensions/editor/util/editorElementHelper.md) | 36 |  |
| [`editor_util_plotHelperUtil`](ge/extensions/editor/util/plotHelperUtil.md) | 26 |  |
| [`editor_util_searchUtil`](ge/extensions/editor/util/searchUtil.md) | 13 |  |
| [`editor_util_transformUtil`](ge/extensions/editor/util/transformUtil.md) | 34 |  |
| [`editor_util_vehicleFilterUtil`](ge/extensions/editor/util/vehicleFilterUtil.md) | 4 |  |
| [`editor_util_vehicleSelectUtil`](ge/extensions/editor/util/vehicleSelectUtil.md) | 16 |  |
| [`editor_util_zoneSelectorUtil`](ge/extensions/editor/util/zoneSelectorUtil.md) | 4 |  |
| [`editor_veMain`](ge/extensions/editor/veMain.md) | 11 |  |
| [`editor_vehicleBridgeTest`](ge/extensions/editor/vehicleBridgeTest.md) | 3 |  |
| [`editor_vehicleDetailViewer`](ge/extensions/editor/vehicleDetailViewer.md) | 7 |  |
| [`editor_vehicleEditor_api_nodeTransformer`](ge/extensions/editor/vehicleEditor/api/nodeTransformer.md) | 1 |  |
| [`editor_vehicleEditor_api_powerTrainUtils`](ge/extensions/editor/vehicleEditor/api/powerTrainUtils.md) | 4 |  |
| [`editor_vehicleEditor_liveEditor_veAeroDebug`](ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.md) | 7 |  |
| [`editor_vehicleEditor_liveEditor_veCrashTester`](ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.md) | 4 |  |
| [`editor_vehicleEditor_liveEditor_veFlexbodyDebug`](ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.md) | 7 |  |
| [`editor_vehicleEditor_liveEditor_veGeneralData`](ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.md) | 4 |  |
| [`editor_vehicleEditor_liveEditor_veJBeamPicker`](ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.md) | 8 |  |
| [`editor_vehicleEditor_liveEditor_veLightsDebug`](ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.md) | 5 |  |
| [`editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`](ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.md) | 5 |  |
| [`editor_vehicleEditor_liveEditor_vePowerTrain`](ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.md) | 6 |  |
| [`editor_vehicleEditor_liveEditor_vePropTransformer`](ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.md) | 7 |  |
| [`editor_vehicleEditor_liveEditor_veRawData`](ge/extensions/editor/vehicleEditor/liveEditor/veRawData.md) | 4 |  |
| [`editor_vehicleEditor_liveEditor_veTCSDebug`](ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.md) | 6 |  |
| [`editor_vehicleEditor_liveEditor_veVehicleSpawner`](ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.md) | 5 |  |
| [`editor_vehicleEditor_liveEditor_veView`](ge/extensions/editor/vehicleEditor/liveEditor/veView.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veJBeamBeautifier`](ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`](ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veJBeamSpellchecker`](ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veJBeamTableVis`](ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`](ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_vePartList`](ge/extensions/editor/vehicleEditor/staticEditor/vePartList.md) | 5 |  |
| [`editor_vehicleEditor_staticEditor_vePartPropertyView`](ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.md) | 3 |  |
| [`editor_vehicleEditor_staticEditor_vePartTextView`](ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.md) | 3 |  |
| [`editor_vehicleEditor_staticEditor_vePartTree`](ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.md) | 4 |  |
| [`editor_vehicleEditor_staticEditor_veStaticRenderView`](ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.md) | 14 |  |
| [`editor_vehicleEditor_veToolbar`](ge/extensions/editor/vehicleEditor/veToolbar.md) | 2 |  |
| [`editor_vehicleUiTextureDebug`](ge/extensions/editor/vehicleUiTextureDebug.md) | 2 |  |
| [`editor_visualization`](ge/extensions/editor/visualization.md) | 4 |  |
| [`editor_vizHelper`](ge/extensions/editor/vizHelper.md) | 9 |  |
| [`editor_waterObjectHelper`](ge/extensions/editor/waterObjectHelper.md) | 1 |  |
| [`editor_windows`](ge/extensions/editor/windows.md) | 2 |  |
| [`flowgraph_baseModule`](ge/extensions/flowgraph/baseModule.md) | 8 |  |
| [`flowgraph_baseStateNode`](ge/extensions/flowgraph/baseStateNode.md) | 5 |  |
| [`flowgraph_basenode`](ge/extensions/flowgraph/basenode.md) | 81 |  |
| [`flowgraph_builder`](ge/extensions/flowgraph/builder.md) | 18 |  |
| [`flowgraph_graph`](ge/extensions/flowgraph/graph.md) | 42 |  |
| [`flowgraph_groupHelper`](ge/extensions/flowgraph/groupHelper.md) | 9 |  |
| [`flowgraph_link`](ge/extensions/flowgraph/link.md) | 10 |  |
| [`flowgraph_manager`](ge/extensions/flowgraph/manager.md) | 83 |  |
| [`flowgraph_modules_actionModule`](ge/extensions/flowgraph/modules/actionModule.md) | 9 |  |
| [`flowgraph_modules_aiRecordingModule`](ge/extensions/flowgraph/modules/aiRecordingModule.md) | 11 |  |
| [`flowgraph_modules_buttonModule`](ge/extensions/flowgraph/modules/buttonModule.md) | 10 |  |
| [`flowgraph_modules_cameraModule`](ge/extensions/flowgraph/modules/cameraModule.md) | 17 |  |
| [`flowgraph_modules_driftModule`](ge/extensions/flowgraph/modules/driftModule.md) | 11 |  |
| [`flowgraph_modules_fileModule`](ge/extensions/flowgraph/modules/fileModule.md) | 9 |  |
| [`flowgraph_modules_foreachModule`](ge/extensions/flowgraph/modules/foreachModule.md) | 5 |  |
| [`flowgraph_modules_levelModule`](ge/extensions/flowgraph/modules/levelModule.md) | 8 |  |
| [`flowgraph_modules_missionModule`](ge/extensions/flowgraph/modules/missionModule.md) | 10 |  |
| [`flowgraph_modules_missionReplayModule`](ge/extensions/flowgraph/modules/missionReplayModule.md) | 18 |  |
| [`flowgraph_modules_prefabModule`](ge/extensions/flowgraph/modules/prefabModule.md) | 14 |  |
| [`flowgraph_modules_threadModule`](ge/extensions/flowgraph/modules/threadModule.md) | 9 |  |
| [`flowgraph_modules_timerModule`](ge/extensions/flowgraph/modules/timerModule.md) | 15 |  |
| [`flowgraph_modules_trafficModule`](ge/extensions/flowgraph/modules/trafficModule.md) | 10 |  |
| [`flowgraph_modules_uiModule`](ge/extensions/flowgraph/modules/uiModule.md) | 30 |  |
| [`flowgraph_modules_vehicleModule`](ge/extensions/flowgraph/modules/vehicleModule.md) | 27 |  |
| [`flowgraph_newNodeTemplate`](ge/extensions/flowgraph/newNodeTemplate.md) | 1 |  |
| [`flowgraph_nodes_activity_activityAttempt`](ge/extensions/flowgraph/nodes/activity/activityAttempt.md) | 3 |  |
| [`flowgraph_nodes_activity_activityFlow`](ge/extensions/flowgraph/nodes/activity/activityFlow.md) | 11 |  |
| [`flowgraph_nodes_activity_activityHook`](ge/extensions/flowgraph/nodes/activity/activityHook.md) | 2 |  |
| [`flowgraph_nodes_activity_activityResetPrefabs`](ge/extensions/flowgraph/nodes/activity/activityResetPrefabs.md) | 1 |  |
| [`flowgraph_nodes_activity_activityStop`](ge/extensions/flowgraph/nodes/activity/activityStop.md) | 2 |  |
| [`flowgraph_nodes_activity_aggregateAttempt`](ge/extensions/flowgraph/nodes/activity/aggregateAttempt.md) | 2 |  |
| [`flowgraph_nodes_activity_attemptStars`](ge/extensions/flowgraph/nodes/activity/attemptStars.md) | 2 |  |
| [`flowgraph_nodes_activity_attemptVehicle`](ge/extensions/flowgraph/nodes/activity/attemptVehicle.md) | 2 |  |
| [`flowgraph_nodes_activity_autoStarGoals`](ge/extensions/flowgraph/nodes/activity/autoStarGoals.md) | 2 |  |
| [`flowgraph_nodes_activity_getProgress`](ge/extensions/flowgraph/nodes/activity/getProgress.md) | 2 |  |
| [`flowgraph_nodes_activity_missionAttemptStars`](ge/extensions/flowgraph/nodes/activity/missionAttemptStars.md) | 2 |  |
| [`flowgraph_nodes_activity_requestAbandon`](ge/extensions/flowgraph/nodes/activity/requestAbandon.md) | 7 |  |
| [`flowgraph_nodes_activity_starsActive`](ge/extensions/flowgraph/nodes/activity/starsActive.md) | 3 |  |
| [`flowgraph_nodes_audio_fade`](ge/extensions/flowgraph/nodes/audio/fade.md) | 4 |  |
| [`flowgraph_nodes_audio_fadeIn`](ge/extensions/flowgraph/nodes/audio/fadeIn.md) | 6 |  |
| [`flowgraph_nodes_audio_fadeOut`](ge/extensions/flowgraph/nodes/audio/fadeOut.md) | 6 |  |
| [`flowgraph_nodes_audio_playOnce`](ge/extensions/flowgraph/nodes/audio/playOnce.md) | 4 |  |
| [`flowgraph_nodes_career_addToInventory`](ge/extensions/flowgraph/nodes/career/addToInventory.md) | 2 |  |
| [`flowgraph_nodes_career_careerVehicleSelect`](ge/extensions/flowgraph/nodes/career/careerVehicleSelect.md) | 13 |  |
| [`flowgraph_nodes_career_completeQuest`](ge/extensions/flowgraph/nodes/career/completeQuest.md) | 1 |  |
| [`flowgraph_nodes_career_customTowAction`](ge/extensions/flowgraph/nodes/career/customTowAction.md) | 3 |  |
| [`flowgraph_nodes_career_garageComputerUtil`](ge/extensions/flowgraph/nodes/career/garageComputerUtil.md) | 8 |  |
| [`flowgraph_nodes_career_garageTutorialUtil`](ge/extensions/flowgraph/nodes/career/garageTutorialUtil.md) | 3 |  |
| [`flowgraph_nodes_career_logbookEntry`](ge/extensions/flowgraph/nodes/career/logbookEntry.md) | 1 |  |
| [`flowgraph_nodes_career_menuClosed`](ge/extensions/flowgraph/nodes/career/menuClosed.md) | 3 |  |
| [`flowgraph_nodes_career_onGarageEvent`](ge/extensions/flowgraph/nodes/career/onGarageEvent.md) | 5 |  |
| [`flowgraph_nodes_career_onIntroPopupCareerClosed`](ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.md) | 4 |  |
| [`flowgraph_nodes_career_onMissionPromptShown`](ge/extensions/flowgraph/nodes/career/onMissionPromptShown.md) | 4 |  |
| [`flowgraph_nodes_career_onMissionRunstateChanged`](ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.md) | 4 |  |
| [`flowgraph_nodes_career_onRefueling`](ge/extensions/flowgraph/nodes/career/onRefueling.md) | 6 |  |
| [`flowgraph_nodes_career_onTestDriveChanged`](ge/extensions/flowgraph/nodes/career/onTestDriveChanged.md) | 4 |  |
| [`flowgraph_nodes_career_onVehicleShoppingEvent`](ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.md) | 8 |  |
| [`flowgraph_nodes_career_playerAttribute`](ge/extensions/flowgraph/nodes/career/playerAttribute.md) | 3 |  |
| [`flowgraph_nodes_career_setFuelLevel`](ge/extensions/flowgraph/nodes/career/setFuelLevel.md) | 5 |  |
| [`flowgraph_nodes_career_tasklistHeader`](ge/extensions/flowgraph/nodes/career/tasklistHeader.md) | 1 |  |
| [`flowgraph_nodes_career_vehicleGroupByClass`](ge/extensions/flowgraph/nodes/career/vehicleGroupByClass.md) | 1 |  |
| [`flowgraph_nodes_debug_aiDebug`](ge/extensions/flowgraph/nodes/debug/aiDebug.md) | 4 |  |
| [`flowgraph_nodes_debug_cameraMouseRayCast`](ge/extensions/flowgraph/nodes/debug/cameraMouseRayCast.md) | 1 |  |
| [`flowgraph_nodes_debug_comment`](ge/extensions/flowgraph/nodes/debug/comment.md) | 9 |  |
| [`flowgraph_nodes_debug_debugCylinder`](ge/extensions/flowgraph/nodes/debug/debugCylinder.md) | 2 |  |
| [`flowgraph_nodes_debug_debugLine`](ge/extensions/flowgraph/nodes/debug/debugLine.md) | 2 |  |
| [`flowgraph_nodes_debug_debugPrism`](ge/extensions/flowgraph/nodes/debug/debugPrism.md) | 2 |  |
| [`flowgraph_nodes_debug_debugSphere`](ge/extensions/flowgraph/nodes/debug/debugSphere.md) | 2 |  |
| [`flowgraph_nodes_debug_debugText`](ge/extensions/flowgraph/nodes/debug/debugText.md) | 2 |  |
| [`flowgraph_nodes_debug_display`](ge/extensions/flowgraph/nodes/debug/display.md) | 2 |  |
| [`flowgraph_nodes_debug_displayFlow`](ge/extensions/flowgraph/nodes/debug/displayFlow.md) | 4 |  |
| [`flowgraph_nodes_debug_drawGraph`](ge/extensions/flowgraph/nodes/debug/drawGraph.md) | 10 |  |
| [`flowgraph_nodes_debug_flowButton`](ge/extensions/flowgraph/nodes/debug/flowButton.md) | 5 |  |
| [`flowgraph_nodes_debug_log`](ge/extensions/flowgraph/nodes/debug/log.md) | 5 |  |
| [`flowgraph_nodes_debug_miniGraph`](ge/extensions/flowgraph/nodes/debug/miniGraph.md) | 3 |  |
| [`flowgraph_nodes_debug_multiFlow`](ge/extensions/flowgraph/nodes/debug/multiFlow.md) | 3 |  |
| [`flowgraph_nodes_debug_numberSlider`](ge/extensions/flowgraph/nodes/debug/numberSlider.md) | 6 |  |
| [`flowgraph_nodes_debug_pauseManager`](ge/extensions/flowgraph/nodes/debug/pauseManager.md) | 1 |  |
| [`flowgraph_nodes_debug_restartManager`](ge/extensions/flowgraph/nodes/debug/restartManager.md) | 1 |  |
| [`flowgraph_nodes_debug_stopManager`](ge/extensions/flowgraph/nodes/debug/stopManager.md) | 1 |  |
| [`flowgraph_nodes_debug_testDynamic`](ge/extensions/flowgraph/nodes/debug/testDynamic.md) | 6 |  |
| [`flowgraph_nodes_environment_directionalGravity`](ge/extensions/flowgraph/nodes/environment/directionalGravity.md) | 6 |  |
| [`flowgraph_nodes_environment_getCloud`](ge/extensions/flowgraph/nodes/environment/getCloud.md) | 1 |  |
| [`flowgraph_nodes_environment_getFogDensity`](ge/extensions/flowgraph/nodes/environment/getFogDensity.md) | 1 |  |
| [`flowgraph_nodes_environment_getGravity`](ge/extensions/flowgraph/nodes/environment/getGravity.md) | 1 |  |
| [`flowgraph_nodes_environment_getPause`](ge/extensions/flowgraph/nodes/environment/getPause.md) | 1 |  |
| [`flowgraph_nodes_environment_getPhotomode`](ge/extensions/flowgraph/nodes/environment/getPhotomode.md) | 1 |  |
| [`flowgraph_nodes_environment_getScatterySky`](ge/extensions/flowgraph/nodes/environment/getScatterySky.md) | 1 |  |
| [`flowgraph_nodes_environment_getTimeOfDay`](ge/extensions/flowgraph/nodes/environment/getTimeOfDay.md) | 1 |  |
| [`flowgraph_nodes_environment_pauseGame`](ge/extensions/flowgraph/nodes/environment/pauseGame.md) | 3 |  |
| [`flowgraph_nodes_environment_planet`](ge/extensions/flowgraph/nodes/environment/planet.md) | 12 |  |
| [`flowgraph_nodes_environment_randomTimeOfDay`](ge/extensions/flowgraph/nodes/environment/randomTimeOfDay.md) | 2 |  |
| [`flowgraph_nodes_environment_setBulletTime`](ge/extensions/flowgraph/nodes/environment/setBulletTime.md) | 3 |  |
| [`flowgraph_nodes_environment_setCloud`](ge/extensions/flowgraph/nodes/environment/setCloud.md) | 7 |  |
| [`flowgraph_nodes_environment_setFogDensity`](ge/extensions/flowgraph/nodes/environment/setFogDensity.md) | 7 |  |
| [`flowgraph_nodes_environment_setGravity`](ge/extensions/flowgraph/nodes/environment/setGravity.md) | 5 |  |
| [`flowgraph_nodes_environment_setScatterSky`](ge/extensions/flowgraph/nodes/environment/setScatterSky.md) | 6 |  |
| [`flowgraph_nodes_environment_setTimeOfDay`](ge/extensions/flowgraph/nodes/environment/setTimeOfDay.md) | 7 |  |
| [`flowgraph_nodes_environment_setWind`](ge/extensions/flowgraph/nodes/environment/setWind.md) | 4 |  |
| [`flowgraph_nodes_environment_simplePlanet`](ge/extensions/flowgraph/nodes/environment/simplePlanet.md) | 4 |  |
| [`flowgraph_nodes_events_controlsAction`](ge/extensions/flowgraph/nodes/events/controlsAction.md) | 6 |  |
| [`flowgraph_nodes_events_controlsReset`](ge/extensions/flowgraph/nodes/events/controlsReset.md) | 8 |  |
| [`flowgraph_nodes_events_customizedTriggerBox`](ge/extensions/flowgraph/nodes/events/customizedTriggerBox.md) | 10 |  |
| [`flowgraph_nodes_events_onBeamNGTrigger`](ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.md) | 4 |  |
| [`flowgraph_nodes_events_onMissionEnded`](ge/extensions/flowgraph/nodes/events/onMissionEnded.md) | 3 |  |
| [`flowgraph_nodes_events_onUpdate`](ge/extensions/flowgraph/nodes/events/onUpdate.md) | 5 |  |
| [`flowgraph_nodes_gameplay_allowWalking`](ge/extensions/flowgraph/nodes/gameplay/allowWalking.md) | 1 |  |
| [`flowgraph_nodes_gameplay_blacklistWalking`](ge/extensions/flowgraph/nodes/gameplay/blacklistWalking.md) | 2 |  |
| [`flowgraph_nodes_gameplay_canEnterFromWalking`](ge/extensions/flowgraph/nodes/gameplay/canEnterFromWalking.md) | 2 |  |
| [`flowgraph_nodes_gameplay_careerActive`](ge/extensions/flowgraph/nodes/gameplay/careerActive.md) | 2 |  |
| [`flowgraph_nodes_gameplay_completeScenario`](ge/extensions/flowgraph/nodes/gameplay/completeScenario.md) | 2 |  |
| [`flowgraph_nodes_gameplay_countdown`](ge/extensions/flowgraph/nodes/gameplay/countdown.md) | 10 |  |
| [`flowgraph_nodes_gameplay_crash_onCrashDetected`](ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.md) | 6 |  |
| [`flowgraph_nodes_gameplay_crash_removeTrackedVehicleCrash`](ge/extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash.md) | 1 |  |
| [`flowgraph_nodes_gameplay_crash_trackMultipleVehiclesCrash`](ge/extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash.md) | 1 |  |
| [`flowgraph_nodes_gameplay_crash_trackVehicleCrash`](ge/extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash.md) | 1 |  |
| [`flowgraph_nodes_gameplay_crawl_applyPenalty`](ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.md) | 3 |  |
| [`flowgraph_nodes_gameplay_crawl_getCrawlData`](ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlData.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_getCrawlResults`](ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_getCrawlStartTransform`](ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_getDynamicObjects`](ge/extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_resetCrawl`](ge/extensions/flowgraph/nodes/gameplay/crawl/resetCrawl.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_setupCrawl`](ge/extensions/flowgraph/nodes/gameplay/crawl/setupCrawl.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_startCrawl`](ge/extensions/flowgraph/nodes/gameplay/crawl/startCrawl.md) | 2 |  |
| [`flowgraph_nodes_gameplay_crawl_stopCrawl`](ge/extensions/flowgraph/nodes/gameplay/crawl/stopCrawl.md) | 2 |  |
| [`flowgraph_nodes_gameplay_decalCircle`](ge/extensions/flowgraph/nodes/gameplay/decalCircle.md) | 3 |  |
| [`flowgraph_nodes_gameplay_decalLine`](ge/extensions/flowgraph/nodes/gameplay/decalLine.md) | 3 |  |
| [`flowgraph_nodes_gameplay_decalPath`](ge/extensions/flowgraph/nodes/gameplay/decalPath.md) | 5 |  |
| [`flowgraph_nodes_gameplay_decalSingle`](ge/extensions/flowgraph/nodes/gameplay/decalSingle.md) | 2 |  |
| [`flowgraph_nodes_gameplay_delivery_abandonDelivery`](ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.md) | 5 |  |
| [`flowgraph_nodes_gameplay_delivery_deliveryFinished`](ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.md) | 4 |  |
| [`flowgraph_nodes_gameplay_delivery_getDeliveryResults`](ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.md) | 4 |  |
| [`flowgraph_nodes_gameplay_delivery_loadDelivery`](ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.md) | 6 |  |
| [`flowgraph_nodes_gameplay_delivery_resetDelivery`](ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.md) | 6 |  |
| [`flowgraph_nodes_gameplay_delivery_startDelivery`](ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.md) | 4 |  |
| [`flowgraph_nodes_gameplay_dragRace_dragRaceState`](ge/extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState.md) | 2 |  |
| [`flowgraph_nodes_gameplay_dragRace_dragTimes`](ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.md) | 4 |  |
| [`flowgraph_nodes_gameplay_dragRace_generateDragOpponents`](ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.md) | 12 |  |
| [`flowgraph_nodes_gameplay_dragRace_getDragWinners`](ge/extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners.md) | 2 |  |
| [`flowgraph_nodes_gameplay_dragRace_getRacerData`](ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerData.md) | 2 |  |
| [`flowgraph_nodes_gameplay_dragRace_getRacerSpawnPoint`](ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint.md) | 2 |  |
| [`flowgraph_nodes_gameplay_dragRace_getRacerStatus`](ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus.md) | 2 |  |
| [`flowgraph_nodes_gameplay_dragRace_loadDragData`](ge/extensions/flowgraph/nodes/gameplay/dragRace/loadDragData.md) | 1 |  |
| [`flowgraph_nodes_gameplay_dragRace_resetDragRace`](ge/extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace.md) | 1 |  |
| [`flowgraph_nodes_gameplay_dragRace_setDragVehicle`](ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.md) | 8 |  |
| [`flowgraph_nodes_gameplay_dragRace_setRacerDial`](ge/extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial.md) | 1 |  |
| [`flowgraph_nodes_gameplay_dragRace_startDragRace`](ge/extensions/flowgraph/nodes/gameplay/dragRace/startDragRace.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftClear`](ge/extensions/flowgraph/nodes/gameplay/drift/driftClear.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftDonut`](ge/extensions/flowgraph/nodes/gameplay/drift/driftDonut.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftInformation`](ge/extensions/flowgraph/nodes/gameplay/drift/driftInformation.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftReset`](ge/extensions/flowgraph/nodes/gameplay/drift/driftReset.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftScore`](ge/extensions/flowgraph/nodes/gameplay/drift/driftScore.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftTightDrift`](ge/extensions/flowgraph/nodes/gameplay/drift/driftTightDrift.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_driftVeh`](ge/extensions/flowgraph/nodes/gameplay/drift/driftVeh.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_setDriftBounds`](ge/extensions/flowgraph/nodes/gameplay/drift/setDriftBounds.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_setDriftChallengeMode`](ge/extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_setDriftContext`](ge/extensions/flowgraph/nodes/gameplay/drift/setDriftContext.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_setDriftData`](ge/extensions/flowgraph/nodes/gameplay/drift/setDriftData.md) | 1 |  |
| [`flowgraph_nodes_gameplay_drift_setDriftRacePath`](ge/extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath.md) | 1 |  |
| [`flowgraph_nodes_gameplay_getWalkingBlacklist`](ge/extensions/flowgraph/nodes/gameplay/getWalkingBlacklist.md) | 1 |  |
| [`flowgraph_nodes_gameplay_groundmarkerDistance`](ge/extensions/flowgraph/nodes/gameplay/groundmarkerDistance.md) | 1 |  |
| [`flowgraph_nodes_gameplay_groundmarkers`](ge/extensions/flowgraph/nodes/gameplay/groundmarkers.md) | 5 |  |
| [`flowgraph_nodes_gameplay_isWalking`](ge/extensions/flowgraph/nodes/gameplay/isWalking.md) | 3 |  |
| [`flowgraph_nodes_gameplay_isWalkingEnabled`](ge/extensions/flowgraph/nodes/gameplay/isWalkingEnabled.md) | 1 |  |
| [`flowgraph_nodes_gameplay_missionDefaults`](ge/extensions/flowgraph/nodes/gameplay/missionDefaults.md) | 2 |  |
| [`flowgraph_nodes_gameplay_multiseat`](ge/extensions/flowgraph/nodes/gameplay/multiseat.md) | 4 |  |
| [`flowgraph_nodes_gameplay_playerMoves`](ge/extensions/flowgraph/nodes/gameplay/playerMoves.md) | 3 |  |
| [`flowgraph_nodes_gameplay_pointsBarSetPoints`](ge/extensions/flowgraph/nodes/gameplay/pointsBarSetPoints.md) | 1 |  |
| [`flowgraph_nodes_gameplay_pointsBarSetThresholds`](ge/extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_filePath`](ge/extensions/flowgraph/nodes/gameplay/race/filePath.md) | 6 |  |
| [`flowgraph_nodes_gameplay_race_fileRace`](ge/extensions/flowgraph/nodes/gameplay/race/fileRace.md) | 10 |  |
| [`flowgraph_nodes_gameplay_race_imRaceTimes`](ge/extensions/flowgraph/nodes/gameplay/race/imRaceTimes.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_moveVehicleToStartposition`](ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_pathDefaultStartTransform`](ge/extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_pathEndTransform`](ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_raceAiParameters`](ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.md) | 2 |  |
| [`flowgraph_nodes_gameplay_race_raceCpLapChange`](ge/extensions/flowgraph/nodes/gameplay/race/raceCpLapChange.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_raceData`](ge/extensions/flowgraph/nodes/gameplay/race/raceData.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_raceDisqualify`](ge/extensions/flowgraph/nodes/gameplay/race/raceDisqualify.md) | 2 |  |
| [`flowgraph_nodes_gameplay_race_raceEndScreen`](ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.md) | 18 |  |
| [`flowgraph_nodes_gameplay_race_raceHighscoresComplete`](ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete.md) | 2 |  |
| [`flowgraph_nodes_gameplay_race_raceHighscoresLap`](ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap.md) | 2 |  |
| [`flowgraph_nodes_gameplay_race_raceMarkers`](ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.md) | 7 |  |
| [`flowgraph_nodes_gameplay_race_raceNodeReached`](ge/extensions/flowgraph/nodes/gameplay/race/raceNodeReached.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_racePacenoteReached`](ge/extensions/flowgraph/nodes/gameplay/race/racePacenoteReached.md) | 3 |  |
| [`flowgraph_nodes_gameplay_race_raceRecoveryAvailable`](ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_raceRecoveryUsed`](ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_raceRequestRecovery`](ge/extensions/flowgraph/nodes/gameplay/race/raceRequestRecovery.md) | 1 |  |
| [`flowgraph_nodes_gameplay_race_raceSuspend`](ge/extensions/flowgraph/nodes/gameplay/race/raceSuspend.md) | 2 |  |
| [`flowgraph_nodes_gameplay_rally_aiCompetitorsLeaderboard`](ge/extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_createRallyGroundMarker`](ge/extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_finish`](ge/extensions/flowgraph/nodes/gameplay/rally/finish.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_fireRallyEvent`](ge/extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_handleLapChange`](ge/extensions/flowgraph/nodes/gameplay/rally/handleLapChange.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_advanceLoopSchedule`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_getCurrentRacePath`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_getLoopServiceOutTC`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_getRallyLoopAiCompetitorsInputs`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_getRallyLoopInfo`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopInfo.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_getRallyLoopTrafficEnabled`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopTrafficEnabled.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.md) | 2 |  |
| [`flowgraph_nodes_gameplay_rally_loop_loopInit`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.md) | 4 |  |
| [`flowgraph_nodes_gameplay_rally_loop_rallyClock`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.md) | 3 |  |
| [`flowgraph_nodes_gameplay_rally_loop_rallyExcludeTraffic`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyExcludeTraffic.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_rallyPositionGetter`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter.md) | 2 |  |
| [`flowgraph_nodes_gameplay_rally_loop_recordTimeCardEntry`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_routeAfterRoadSection`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/routeAfterRoadSection.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_loop_saveRallyLoopAttempt`](ge/extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_raceEditorPath`](ge/extensions/flowgraph/nodes/gameplay/rally/raceEditorPath.md) | 3 |  |
| [`flowgraph_nodes_gameplay_rally_rallyDebugNode`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyEndScreenResults`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyMoveVehicleTo`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyRouteData`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyRouteData.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyStageCountdownSetup`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyStageInfoPanel`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.md) | 9 |  |
| [`flowgraph_nodes_gameplay_rally_rallyStageStars`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageStars.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown`](ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.md) | 33 |  |
| [`flowgraph_nodes_gameplay_rally_rallySuperCountdown`](ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.md) | 47 |  |
| [`flowgraph_nodes_gameplay_rally_recoverInPlace`](ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.md) | 7 |  |
| [`flowgraph_nodes_gameplay_rally_recoverToRouteDeparture`](ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.md) | 7 |  |
| [`flowgraph_nodes_gameplay_rally_registerRace`](ge/extensions/flowgraph/nodes/gameplay/rally/registerRace.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_resyncAfterTeleport`](ge/extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_sessionStart`](ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.md) | 5 |  |
| [`flowgraph_nodes_gameplay_rally_setNoteSearch`](ge/extensions/flowgraph/nodes/gameplay/rally/setNoteSearch.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_stageComplete`](ge/extensions/flowgraph/nodes/gameplay/rally/stageComplete.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_stageRuntimeState`](ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.md) | 3 |  |
| [`flowgraph_nodes_gameplay_rally_trackRecovery`](ge/extensions/flowgraph/nodes/gameplay/rally/trackRecovery.md) | 1 |  |
| [`flowgraph_nodes_gameplay_rally_trackStageTime`](ge/extensions/flowgraph/nodes/gameplay/rally/trackStageTime.md) | 2 |  |
| [`flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos`](ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.md) | 5 |  |
| [`flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane`](ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.md) | 11 |  |
| [`flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos`](ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.md) | 10 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_getRecoveryPromptButtonLimitAndCount`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount.md) | 3 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.md) | 6 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.md) | 2 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButton`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton.md) | 1 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButtonEnabled`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled.md) | 2 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptEnabled`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled.md) | 2 |  |
| [`flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit`](ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.md) | 3 |  |
| [`flowgraph_nodes_gameplay_removeOtherVehicles`](ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.md) | 6 |  |
| [`flowgraph_nodes_gameplay_sites_fileSites`](ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.md) | 6 |  |
| [`flowgraph_nodes_gameplay_sites_location`](ge/extensions/flowgraph/nodes/gameplay/sites/location.md) | 8 |  |
| [`flowgraph_nodes_gameplay_sites_locationByName`](ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.md) | 5 |  |
| [`flowgraph_nodes_gameplay_sites_locationsByTag`](ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.md) | 6 |  |
| [`flowgraph_nodes_gameplay_sites_parkingspot`](ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.md) | 8 |  |
| [`flowgraph_nodes_gameplay_sites_parkingspotByName`](ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.md) | 5 |  |
| [`flowgraph_nodes_gameplay_sites_posInZone`](ge/extensions/flowgraph/nodes/gameplay/sites/posInZone.md) | 3 |  |
| [`flowgraph_nodes_gameplay_sites_zoneByName`](ge/extensions/flowgraph/nodes/gameplay/sites/zoneByName.md) | 5 |  |
| [`flowgraph_nodes_gameplay_timers_createTimer`](ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.md) | 3 |  |
| [`flowgraph_nodes_gameplay_timers_getTimer`](ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.md) | 2 |  |
| [`flowgraph_nodes_gameplay_timers_setTimerProperty`](ge/extensions/flowgraph/nodes/gameplay/timers/setTimerProperty.md) | 2 |  |
| [`flowgraph_nodes_gameplay_timers_simpleTimer`](ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.md) | 5 |  |
| [`flowgraph_nodes_gameplay_toggleWalking`](ge/extensions/flowgraph/nodes/gameplay/toggleWalking.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_addVehicle`](ge/extensions/flowgraph/nodes/gameplay/traffic/addVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_drivingStats`](ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_fileVehicleGroup`](ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.md) | 5 |  |
| [`flowgraph_nodes_gameplay_traffic_getTrafficState`](ge/extensions/flowgraph/nodes/gameplay/traffic/getTrafficState.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_getVehicle`](ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_getVehicleData`](ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicleData.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_parkingParams`](ge/extensions/flowgraph/nodes/gameplay/traffic/parkingParams.md) | 2 |  |
| [`flowgraph_nodes_gameplay_traffic_parkingTrackVehicle`](ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_pursuitInformation`](ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.md) | 5 |  |
| [`flowgraph_nodes_gameplay_traffic_pursuitMode`](ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.md) | 2 |  |
| [`flowgraph_nodes_gameplay_traffic_pursuitParams`](ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitParams.md) | 2 |  |
| [`flowgraph_nodes_gameplay_traffic_pursuitRoadblock`](ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_removeVehicle`](ge/extensions/flowgraph/nodes/gameplay/traffic/removeVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_setVehicleData`](ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleData.md) | 2 |  |
| [`flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph`](ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_setupParkedCars`](ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_setupPursuitGameplay`](ge/extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_controller`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.md) | 7 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_controllerByName`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.md) | 6 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_instance`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instance.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_instanceByName`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceByName.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_instanceSettings`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_instanceState`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_sequence`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequence.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_sequenceAdvance`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_sequenceByName`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName.md) | 4 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_sequenceSettings`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_signals_trafficSignalsSettings`](ge/extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings.md) | 2 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficActivate`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.md) | 5 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficCustomGroup`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.md) | 11 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficMoveGroup`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.md) | 6 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficParams`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficParams.md) | 3 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficScatter`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficScatter.md) | 1 |  |
| [`flowgraph_nodes_gameplay_traffic_trafficSpawnGroup`](ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.md) | 7 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_activateAll`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateAll.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_activateByDistance`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_activateVehicle`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_addGroup`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_addVehicle`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_createPool`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.md) | 5 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_cyclePool`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_managePool`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/managePool.md) | 1 |  |
| [`flowgraph_nodes_gameplay_vehiclePool_removeVehicle`](ge/extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle.md) | 1 |  |
| [`flowgraph_nodes_gameplay_zone`](ge/extensions/flowgraph/nodes/gameplay/zone.md) | 2 |  |
| [`flowgraph_nodes_gfx_blur`](ge/extensions/flowgraph/nodes/gfx/blur.md) | 4 |  |
| [`flowgraph_nodes_gfx_dof`](ge/extensions/flowgraph/nodes/gfx/dof.md) | 5 |  |
| [`flowgraph_nodes_input_blacklistAction`](ge/extensions/flowgraph/nodes/input/blacklistAction.md) | 8 |  |
| [`flowgraph_nodes_input_blacklistActionFilter`](ge/extensions/flowgraph/nodes/input/blacklistActionFilter.md) | 6 |  |
| [`flowgraph_nodes_input_getActionControl`](ge/extensions/flowgraph/nodes/input/getActionControl.md) | 1 |  |
| [`flowgraph_nodes_logic_and`](ge/extensions/flowgraph/nodes/logic/and.md) | 6 |  |
| [`flowgraph_nodes_logic_booleanExpression`](ge/extensions/flowgraph/nodes/logic/booleanExpression.md) | 10 |  |
| [`flowgraph_nodes_logic_branch`](ge/extensions/flowgraph/nodes/logic/branch.md) | 1 |  |
| [`flowgraph_nodes_logic_bundle`](ge/extensions/flowgraph/nodes/logic/bundle.md) | 1 |  |
| [`flowgraph_nodes_logic_chainFlowBranch`](ge/extensions/flowgraph/nodes/logic/chainFlowBranch.md) | 1 |  |
| [`flowgraph_nodes_logic_compare`](ge/extensions/flowgraph/nodes/logic/compare.md) | 8 |  |
| [`flowgraph_nodes_logic_edgeDetect`](ge/extensions/flowgraph/nodes/logic/edgeDetect.md) | 2 |  |
| [`flowgraph_nodes_logic_flowSwitch`](ge/extensions/flowgraph/nodes/logic/flowSwitch.md) | 7 |  |
| [`flowgraph_nodes_logic_frameDelay`](ge/extensions/flowgraph/nodes/logic/frameDelay.md) | 7 |  |
| [`flowgraph_nodes_logic_once`](ge/extensions/flowgraph/nodes/logic/once.md) | 3 |  |
| [`flowgraph_nodes_logic_rateLimit`](ge/extensions/flowgraph/nodes/logic/rateLimit.md) | 4 |  |
| [`flowgraph_nodes_logic_select`](ge/extensions/flowgraph/nodes/logic/select.md) | 8 |  |
| [`flowgraph_nodes_logic_sequencer`](ge/extensions/flowgraph/nodes/logic/sequencer.md) | 9 |  |
| [`flowgraph_nodes_logic_switchcase`](ge/extensions/flowgraph/nodes/logic/switchcase.md) | 8 |  |
| [`flowgraph_nodes_logic_timedTrigger`](ge/extensions/flowgraph/nodes/logic/timedTrigger.md) | 7 |  |
| [`flowgraph_nodes_logic_wait`](ge/extensions/flowgraph/nodes/logic/wait.md) | 6 |  |
| [`flowgraph_nodes_logic_xor`](ge/extensions/flowgraph/nodes/logic/xor.md) | 1 |  |
| [`flowgraph_nodes_macro_foreach`](ge/extensions/flowgraph/nodes/macro/foreach.md) | 4 |  |
| [`flowgraph_nodes_macro_getForeach`](ge/extensions/flowgraph/nodes/macro/getForeach.md) | 3 |  |
| [`flowgraph_nodes_macro_integrated`](ge/extensions/flowgraph/nodes/macro/integrated.md) | 15 |  |
| [`flowgraph_nodes_macro_io`](ge/extensions/flowgraph/nodes/macro/io.md) | 6 |  |
| [`flowgraph_nodes_math_accumulator`](ge/extensions/flowgraph/nodes/math/accumulator.md) | 6 |  |
| [`flowgraph_nodes_math_ease`](ge/extensions/flowgraph/nodes/math/ease.md) | 6 |  |
| [`flowgraph_nodes_math_increaser`](ge/extensions/flowgraph/nodes/math/increaser.md) | 4 |  |
| [`flowgraph_nodes_math_math`](ge/extensions/flowgraph/nodes/math/math.md) | 10 |  |
| [`flowgraph_nodes_math_quaternion_direction`](ge/extensions/flowgraph/nodes/math/quaternion/direction.md) | 2 |  |
| [`flowgraph_nodes_math_quaternion_lookAt`](ge/extensions/flowgraph/nodes/math/quaternion/lookAt.md) | 2 |  |
| [`flowgraph_nodes_math_smoothers_linear`](ge/extensions/flowgraph/nodes/math/smoothers/linear.md) | 5 |  |
| [`flowgraph_nodes_math_smoothers_nonLinear`](ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.md) | 4 |  |
| [`flowgraph_nodes_math_smoothers_sigmoid`](ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.md) | 4 |  |
| [`flowgraph_nodes_math_smoothers_spring`](ge/extensions/flowgraph/nodes/math/smoothers/spring.md) | 4 |  |
| [`flowgraph_nodes_math_vector_merge`](ge/extensions/flowgraph/nodes/math/vector/merge.md) | 2 |  |
| [`flowgraph_nodes_math_vector_split`](ge/extensions/flowgraph/nodes/math/vector/split.md) | 2 |  |
| [`flowgraph_nodes_mission_ARunForLife`](ge/extensions/flowgraph/nodes/mission/ARunForLife.md) | 33 |  |
| [`flowgraph_nodes_mission_UpdateDisplayDragRace`](ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.md) | 6 |  |
| [`flowgraph_nodes_mission_blacklistParkingSpots`](ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.md) | 10 |  |
| [`flowgraph_nodes_mission_clearLightsDragRace`](ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.md) | 5 |  |
| [`flowgraph_nodes_mission_countdownLightsController`](ge/extensions/flowgraph/nodes/mission/countdownLightsController.md) | 4 |  |
| [`flowgraph_nodes_mission_getCustomVehicleData`](ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.md) | 3 |  |
| [`flowgraph_nodes_mission_getSetupData`](ge/extensions/flowgraph/nodes/mission/getSetupData.md) | 1 |  |
| [`flowgraph_nodes_mission_goToStartLine`](ge/extensions/flowgraph/nodes/mission/goToStartLine.md) | 3 |  |
| [`flowgraph_nodes_mission_knockAwayCheck`](ge/extensions/flowgraph/nodes/mission/knockAwayCheck.md) | 7 |  |
| [`flowgraph_nodes_mission_lightsController`](ge/extensions/flowgraph/nodes/mission/lightsController.md) | 4 |  |
| [`flowgraph_nodes_mission_postClean`](ge/extensions/flowgraph/nodes/mission/postClean.md) | 1 |  |
| [`flowgraph_nodes_mission_preClean`](ge/extensions/flowgraph/nodes/mission/preClean.md) | 1 |  |
| [`flowgraph_nodes_mission_prepareVehicle`](ge/extensions/flowgraph/nodes/mission/prepareVehicle.md) | 1 |  |
| [`flowgraph_nodes_mission_removeStashedPlayerVehicle`](ge/extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle.md) | 1 |  |
| [`flowgraph_nodes_mission_selectGarage2GarageVehicle`](ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.md) | 5 |  |
| [`flowgraph_nodes_mission_selectGarage2GarageZones`](ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.md) | 6 |  |
| [`flowgraph_nodes_mission_selectGarageSpots`](ge/extensions/flowgraph/nodes/mission/selectGarageSpots.md) | 6 |  |
| [`flowgraph_nodes_mission_selectHeistMissionSpots`](ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.md) | 4 |  |
| [`flowgraph_nodes_mission_stageLightsDragRace`](ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.md) | 5 |  |
| [`flowgraph_nodes_recording_playReplay`](ge/extensions/flowgraph/nodes/recording/playReplay.md) | 1 |  |
| [`flowgraph_nodes_recording_recordCamera`](ge/extensions/flowgraph/nodes/recording/recordCamera.md) | 5 |  |
| [`flowgraph_nodes_recording_recordReplay`](ge/extensions/flowgraph/nodes/recording/recordReplay.md) | 6 |  |
| [`flowgraph_nodes_recording_startAutoReplay`](ge/extensions/flowgraph/nodes/recording/startAutoReplay.md) | 1 |  |
| [`flowgraph_nodes_recording_stopAutoReplay`](ge/extensions/flowgraph/nodes/recording/stopAutoReplay.md) | 1 |  |
| [`flowgraph_nodes_recording_stopReplay`](ge/extensions/flowgraph/nodes/recording/stopReplay.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_cameraAngle`](ge/extensions/flowgraph/nodes/scene/camera/cameraAngle.md) | 2 |  |
| [`flowgraph_nodes_scene_camera_cameraAutoRotate`](ge/extensions/flowgraph/nodes/scene/camera/cameraAutoRotate.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_cameraCircle`](ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.md) | 4 |  |
| [`flowgraph_nodes_scene_camera_cameraPath`](ge/extensions/flowgraph/nodes/scene/camera/cameraPath.md) | 8 |  |
| [`flowgraph_nodes_scene_camera_getCamPath`](ge/extensions/flowgraph/nodes/scene/camera/getCamPath.md) | 5 |  |
| [`flowgraph_nodes_scene_camera_getCameraFOV`](ge/extensions/flowgraph/nodes/scene/camera/getCameraFOV.md) | 2 |  |
| [`flowgraph_nodes_scene_camera_getCameraMode`](ge/extensions/flowgraph/nodes/scene/camera/getCameraMode.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_procedural_procCamPathPosRot`](ge/extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_procedural_procDirectPath`](ge/extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_restartCamPath`](ge/extensions/flowgraph/nodes/scene/camera/restartCamPath.md) | 2 |  |
| [`flowgraph_nodes_scene_camera_returnToVehicle`](ge/extensions/flowgraph/nodes/scene/camera/returnToVehicle.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_setCameraFOV`](ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.md) | 4 |  |
| [`flowgraph_nodes_scene_camera_setCameraMode`](ge/extensions/flowgraph/nodes/scene/camera/setCameraMode.md) | 1 |  |
| [`flowgraph_nodes_scene_camera_setCameraPosition`](ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.md) | 7 |  |
| [`flowgraph_nodes_scene_camera_setCameraRotation`](ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.md) | 7 |  |
| [`flowgraph_nodes_scene_camera_startCamPath`](ge/extensions/flowgraph/nodes/scene/camera/startCamPath.md) | 5 |  |
| [`flowgraph_nodes_scene_camera_stopCamPath`](ge/extensions/flowgraph/nodes/scene/camera/stopCamPath.md) | 2 |  |
| [`flowgraph_nodes_scene_collectionMarker`](ge/extensions/flowgraph/nodes/scene/collectionMarker.md) | 6 |  |
| [`flowgraph_nodes_scene_customLuaCommand`](ge/extensions/flowgraph/nodes/scene/customLuaCommand.md) | 4 |  |
| [`flowgraph_nodes_scene_getObjectField`](ge/extensions/flowgraph/nodes/scene/getObjectField.md) | 1 |  |
| [`flowgraph_nodes_scene_getPlayerVehicle`](ge/extensions/flowgraph/nodes/scene/getPlayerVehicle.md) | 2 |  |
| [`flowgraph_nodes_scene_getPointOnDecalroad`](ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.md) | 3 |  |
| [`flowgraph_nodes_scene_hide`](ge/extensions/flowgraph/nodes/scene/hide.md) | 2 |  |
| [`flowgraph_nodes_scene_idByName`](ge/extensions/flowgraph/nodes/scene/idByName.md) | 6 |  |
| [`flowgraph_nodes_scene_keepPrefab`](ge/extensions/flowgraph/nodes/scene/keepPrefab.md) | 2 |  |
| [`flowgraph_nodes_scene_particleEmitter`](ge/extensions/flowgraph/nodes/scene/particleEmitter.md) | 11 |  |
| [`flowgraph_nodes_scene_pointOnDecalroad`](ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.md) | 3 |  |
| [`flowgraph_nodes_scene_raceLineParking`](ge/extensions/flowgraph/nodes/scene/raceLineParking.md) | 15 |  |
| [`flowgraph_nodes_scene_raycast`](ge/extensions/flowgraph/nodes/scene/raycast.md) | 2 |  |
| [`flowgraph_nodes_scene_rectMarker`](ge/extensions/flowgraph/nodes/scene/rectMarker.md) | 15 |  |
| [`flowgraph_nodes_scene_reloadCollision`](ge/extensions/flowgraph/nodes/scene/reloadCollision.md) | 1 |  |
| [`flowgraph_nodes_scene_reloadNavGraph`](ge/extensions/flowgraph/nodes/scene/reloadNavGraph.md) | 1 |  |
| [`flowgraph_nodes_scene_removePrefab`](ge/extensions/flowgraph/nodes/scene/removePrefab.md) | 2 |  |
| [`flowgraph_nodes_scene_resetPrefab`](ge/extensions/flowgraph/nodes/scene/resetPrefab.md) | 1 |  |
| [`flowgraph_nodes_scene_setObjectField`](ge/extensions/flowgraph/nodes/scene/setObjectField.md) | 1 |  |
| [`flowgraph_nodes_scene_sevensegmentDisplay`](ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.md) | 10 |  |
| [`flowgraph_nodes_scene_singleMarker`](ge/extensions/flowgraph/nodes/scene/singleMarker.md) | 12 |  |
| [`flowgraph_nodes_scene_spawnLight`](ge/extensions/flowgraph/nodes/scene/spawnLight.md) | 7 |  |
| [`flowgraph_nodes_scene_spawnPrefab`](ge/extensions/flowgraph/nodes/scene/spawnPrefab.md) | 8 |  |
| [`flowgraph_nodes_scene_spawnTSStatic`](ge/extensions/flowgraph/nodes/scene/spawnTSStatic.md) | 8 |  |
| [`flowgraph_nodes_scene_storeStatics`](ge/extensions/flowgraph/nodes/scene/storeStatics.md) | 13 |  |
| [`flowgraph_nodes_scene_trackPrefab`](ge/extensions/flowgraph/nodes/scene/trackPrefab.md) | 2 |  |
| [`flowgraph_nodes_states_stateEntry`](ge/extensions/flowgraph/nodes/states/stateEntry.md) | 0 |  |
| [`flowgraph_nodes_states_stateExit`](ge/extensions/flowgraph/nodes/states/stateExit.md) | 5 |  |
| [`flowgraph_nodes_states_stateNode`](ge/extensions/flowgraph/nodes/states/stateNode.md) | 14 |  |
| [`flowgraph_nodes_states_transition`](ge/extensions/flowgraph/nodes/states/transition.md) | 9 |  |
| [`flowgraph_nodes_states_transitionStack`](ge/extensions/flowgraph/nodes/states/transitionStack.md) | 8 |  |
| [`flowgraph_nodes_string_format`](ge/extensions/flowgraph/nodes/string/format.md) | 8 |  |
| [`flowgraph_nodes_string_match`](ge/extensions/flowgraph/nodes/string/match.md) | 3 |  |
| [`flowgraph_nodes_string_stringconcat`](ge/extensions/flowgraph/nodes/string/stringconcat.md) | 8 |  |
| [`flowgraph_nodes_string_subString`](ge/extensions/flowgraph/nodes/string/subString.md) | 3 |  |
| [`flowgraph_nodes_thread_loadProject`](ge/extensions/flowgraph/nodes/thread/loadProject.md) | 5 |  |
| [`flowgraph_nodes_thread_receiveMessage`](ge/extensions/flowgraph/nodes/thread/receiveMessage.md) | 5 |  |
| [`flowgraph_nodes_thread_sendMessage`](ge/extensions/flowgraph/nodes/thread/sendMessage.md) | 4 |  |
| [`flowgraph_nodes_timetrials_onRaceCheckpoint`](ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.md) | 5 |  |
| [`flowgraph_nodes_timetrials_onRaceComplete`](ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.md) | 5 |  |
| [`flowgraph_nodes_timetrials_onRaceConfig`](ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.md) | 4 |  |
| [`flowgraph_nodes_timetrials_onRaceRestarted`](ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.md) | 4 |  |
| [`flowgraph_nodes_timetrials_onRaceStart`](ge/extensions/flowgraph/nodes/timetrials/onRaceStart.md) | 5 |  |
| [`flowgraph_nodes_types_bool`](ge/extensions/flowgraph/nodes/types/bool.md) | 3 |  |
| [`flowgraph_nodes_types_color`](ge/extensions/flowgraph/nodes/types/color.md) | 7 |  |
| [`flowgraph_nodes_types_genericValue`](ge/extensions/flowgraph/nodes/types/genericValue.md) | 7 |  |
| [`flowgraph_nodes_types_getVariable`](ge/extensions/flowgraph/nodes/types/getVariable.md) | 10 |  |
| [`flowgraph_nodes_types_number`](ge/extensions/flowgraph/nodes/types/number.md) | 5 |  |
| [`flowgraph_nodes_types_quat`](ge/extensions/flowgraph/nodes/types/quat.md) | 5 |  |
| [`flowgraph_nodes_types_setVariable`](ge/extensions/flowgraph/nodes/types/setVariable.md) | 10 |  |
| [`flowgraph_nodes_types_string`](ge/extensions/flowgraph/nodes/types/string.md) | 7 |  |
| [`flowgraph_nodes_types_transform`](ge/extensions/flowgraph/nodes/types/transform.md) | 16 |  |
| [`flowgraph_nodes_types_vec3`](ge/extensions/flowgraph/nodes/types/vec3.md) | 5 |  |
| [`flowgraph_nodes_ui_autoMedal`](ge/extensions/flowgraph/nodes/ui/autoMedal.md) | 1 |  |
| [`flowgraph_nodes_ui_buttons_createButton`](ge/extensions/flowgraph/nodes/ui/buttons/createButton.md) | 2 |  |
| [`flowgraph_nodes_ui_buttons_getButton`](ge/extensions/flowgraph/nodes/ui/buttons/getButton.md) | 1 |  |
| [`flowgraph_nodes_ui_buttons_getMultipleButtons`](ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.md) | 7 |  |
| [`flowgraph_nodes_ui_buttons_setButtonProperty`](ge/extensions/flowgraph/nodes/ui/buttons/setButtonProperty.md) | 2 |  |
| [`flowgraph_nodes_ui_buttons_setMultipleButtonsProperty`](ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.md) | 7 |  |
| [`flowgraph_nodes_ui_buttons_simpleButton`](ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.md) | 5 |  |
| [`flowgraph_nodes_ui_buttons_simpleMultipleButtons`](ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.md) | 10 |  |
| [`flowgraph_nodes_ui_clearMessage`](ge/extensions/flowgraph/nodes/ui/clearMessage.md) | 1 |  |
| [`flowgraph_nodes_ui_contextTranslation`](ge/extensions/flowgraph/nodes/ui/contextTranslation.md) | 3 |  |
| [`flowgraph_nodes_ui_convertUnit`](ge/extensions/flowgraph/nodes/ui/convertUnit.md) | 1 |  |
| [`flowgraph_nodes_ui_cornerTimer`](ge/extensions/flowgraph/nodes/ui/cornerTimer.md) | 2 |  |
| [`flowgraph_nodes_ui_customButtonTEST`](ge/extensions/flowgraph/nodes/ui/customButtonTEST.md) | 9 |  |
| [`flowgraph_nodes_ui_customUiLayout`](ge/extensions/flowgraph/nodes/ui/customUiLayout.md) | 8 |  |
| [`flowgraph_nodes_ui_endScreen`](ge/extensions/flowgraph/nodes/ui/endScreen.md) | 17 |  |
| [`flowgraph_nodes_ui_endStats`](ge/extensions/flowgraph/nodes/ui/endStats.md) | 8 |  |
| [`flowgraph_nodes_ui_fadeFromBlack`](ge/extensions/flowgraph/nodes/ui/fadeFromBlack.md) | 6 |  |
| [`flowgraph_nodes_ui_fadeSequence`](ge/extensions/flowgraph/nodes/ui/fadeSequence.md) | 7 |  |
| [`flowgraph_nodes_ui_fadeToBlack`](ge/extensions/flowgraph/nodes/ui/fadeToBlack.md) | 6 |  |
| [`flowgraph_nodes_ui_flashMessage`](ge/extensions/flowgraph/nodes/ui/flashMessage.md) | 2 |  |
| [`flowgraph_nodes_ui_genericMissionDataText`](ge/extensions/flowgraph/nodes/ui/genericMissionDataText.md) | 3 |  |
| [`flowgraph_nodes_ui_getGamestate`](ge/extensions/flowgraph/nodes/ui/getGamestate.md) | 2 |  |
| [`flowgraph_nodes_ui_hideEditor`](ge/extensions/flowgraph/nodes/ui/hideEditor.md) | 2 |  |
| [`flowgraph_nodes_ui_hideGameUI`](ge/extensions/flowgraph/nodes/ui/hideGameUI.md) | 1 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imBegin`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.md) | 3 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imButton`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imButton.md) | 2 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imCheckbox`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox.md) | 3 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imColor`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imColor.md) | 2 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imEnd`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imEnd.md) | 1 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imNumbers`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.md) | 6 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imSeparator`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator.md) | 4 |  |
| [`flowgraph_nodes_ui_imgui_elemental_imText`](ge/extensions/flowgraph/nodes/ui/imgui/elemental/imText.md) | 2 |  |
| [`flowgraph_nodes_ui_imgui_imDialogue`](ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.md) | 10 |  |
| [`flowgraph_nodes_ui_imgui_imSimpleBox`](ge/extensions/flowgraph/nodes/ui/imgui/imSimpleBox.md) | 2 |  |
| [`flowgraph_nodes_ui_imgui_imVehicleSelect`](ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.md) | 7 |  |
| [`flowgraph_nodes_ui_listDescription`](ge/extensions/flowgraph/nodes/ui/listDescription.md) | 7 |  |
| [`flowgraph_nodes_ui_message`](ge/extensions/flowgraph/nodes/ui/message.md) | 5 |  |
| [`flowgraph_nodes_ui_missionControlHint`](ge/extensions/flowgraph/nodes/ui/missionControlHint.md) | 7 |  |
| [`flowgraph_nodes_ui_missionEndScreen`](ge/extensions/flowgraph/nodes/ui/missionEndScreen.md) | 17 |  |
| [`flowgraph_nodes_ui_missionPopup`](ge/extensions/flowgraph/nodes/ui/missionPopup.md) | 12 |  |
| [`flowgraph_nodes_ui_monologue`](ge/extensions/flowgraph/nodes/ui/monologue.md) | 9 |  |
| [`flowgraph_nodes_ui_multiDescription`](ge/extensions/flowgraph/nodes/ui/multiDescription.md) | 8 |  |
| [`flowgraph_nodes_ui_onBigmapPoiSelected`](ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.md) | 4 |  |
| [`flowgraph_nodes_ui_onBigmapStateChange`](ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.md) | 5 |  |
| [`flowgraph_nodes_ui_raceCheckpoints`](ge/extensions/flowgraph/nodes/ui/raceCheckpoints.md) | 1 |  |
| [`flowgraph_nodes_ui_raceLaps`](ge/extensions/flowgraph/nodes/ui/raceLaps.md) | 1 |  |
| [`flowgraph_nodes_ui_raceRecoveriesUsed`](ge/extensions/flowgraph/nodes/ui/raceRecoveriesUsed.md) | 1 |  |
| [`flowgraph_nodes_ui_rtMessage`](ge/extensions/flowgraph/nodes/ui/rtMessage.md) | 3 |  |
| [`flowgraph_nodes_ui_selectButtons`](ge/extensions/flowgraph/nodes/ui/selectButtons.md) | 15 |  |
| [`flowgraph_nodes_ui_setUILayout`](ge/extensions/flowgraph/nodes/ui/setUILayout.md) | 7 |  |
| [`flowgraph_nodes_ui_showApps`](ge/extensions/flowgraph/nodes/ui/showApps.md) | 3 |  |
| [`flowgraph_nodes_ui_showMonitor`](ge/extensions/flowgraph/nodes/ui/showMonitor.md) | 1 |  |
| [`flowgraph_nodes_ui_startScreen`](ge/extensions/flowgraph/nodes/ui/startScreen.md) | 16 |  |
| [`flowgraph_nodes_ui_tasklistClear`](ge/extensions/flowgraph/nodes/ui/tasklistClear.md) | 1 |  |
| [`flowgraph_nodes_ui_tasklistMessage`](ge/extensions/flowgraph/nodes/ui/tasklistMessage.md) | 1 |  |
| [`flowgraph_nodes_ui_tasklistTask`](ge/extensions/flowgraph/nodes/ui/tasklistTask.md) | 1 |  |
| [`flowgraph_nodes_ui_threeElementSelect`](ge/extensions/flowgraph/nodes/ui/threeElementSelect.md) | 13 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenAiCompetitorsLeaderboard`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenBegin`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.md) | 16 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenDriftStats`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenLapTimesPanel`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenResults`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenResults.md) | 2 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenTimeSlip`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip.md) | 2 |  |
| [`flowgraph_nodes_ui_updatedUI_endScreenWhole`](ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.md) | 17 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenBegin`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.md) | 8 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenCrashAnalysisStepDetails`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenDial`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.md) | 3 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenFinish`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenFinish.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenIntro`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenMainHeader`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader.md) | 1 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenRallySettings`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.md) | 15 |  |
| [`flowgraph_nodes_ui_updatedUI_startScreenText`](ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenText.md) | 2 |  |
| [`flowgraph_nodes_ui_vehicleSelector`](ge/extensions/flowgraph/nodes/ui/vehicleSelector.md) | 15 |  |
| [`flowgraph_nodes_util_closestPath`](ge/extensions/flowgraph/nodes/util/closestPath.md) | 7 |  |
| [`flowgraph_nodes_util_closestRoad`](ge/extensions/flowgraph/nodes/util/closestRoad.md) | 4 |  |
| [`flowgraph_nodes_util_customLua`](ge/extensions/flowgraph/nodes/util/customLua.md) | 11 |  |
| [`flowgraph_nodes_util_distanceBetween`](ge/extensions/flowgraph/nodes/util/distanceBetween.md) | 2 |  |
| [`flowgraph_nodes_util_distanceRemaining`](ge/extensions/flowgraph/nodes/util/distanceRemaining.md) | 1 |  |
| [`flowgraph_nodes_util_file_loadData`](ge/extensions/flowgraph/nodes/util/file/loadData.md) | 3 |  |
| [`flowgraph_nodes_util_file_saveData`](ge/extensions/flowgraph/nodes/util/file/saveData.md) | 2 |  |
| [`flowgraph_nodes_util_fileExists`](ge/extensions/flowgraph/nodes/util/fileExists.md) | 1 |  |
| [`flowgraph_nodes_util_firstElement`](ge/extensions/flowgraph/nodes/util/firstElement.md) | 4 |  |
| [`flowgraph_nodes_util_getLevelData`](ge/extensions/flowgraph/nodes/util/getLevelData.md) | 1 |  |
| [`flowgraph_nodes_util_getMapObjectsDynField`](ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.md) | 4 |  |
| [`flowgraph_nodes_util_getTableValueByKey`](ge/extensions/flowgraph/nodes/util/getTableValueByKey.md) | 1 |  |
| [`flowgraph_nodes_util_ghost`](ge/extensions/flowgraph/nodes/util/ghost.md) | 5 |  |
| [`flowgraph_nodes_util_hideLoadingScreen`](ge/extensions/flowgraph/nodes/util/hideLoadingScreen.md) | 3 |  |
| [`flowgraph_nodes_util_hsvColor`](ge/extensions/flowgraph/nodes/util/hsvColor.md) | 3 |  |
| [`flowgraph_nodes_util_linePointFromXnorm`](ge/extensions/flowgraph/nodes/util/linePointFromXnorm.md) | 1 |  |
| [`flowgraph_nodes_util_loadLevel`](ge/extensions/flowgraph/nodes/util/loadLevel.md) | 6 |  |
| [`flowgraph_nodes_util_loadProject`](ge/extensions/flowgraph/nodes/util/loadProject.md) | 4 |  |
| [`flowgraph_nodes_util_onMenu`](ge/extensions/flowgraph/nodes/util/onMenu.md) | 3 |  |
| [`flowgraph_nodes_util_perlinNoise`](ge/extensions/flowgraph/nodes/util/perlinNoise.md) | 10 |  |
| [`flowgraph_nodes_util_popActionMap`](ge/extensions/flowgraph/nodes/util/popActionMap.md) | 2 |  |
| [`flowgraph_nodes_util_project`](ge/extensions/flowgraph/nodes/util/project.md) | 2 |  |
| [`flowgraph_nodes_util_pushActionMap`](ge/extensions/flowgraph/nodes/util/pushActionMap.md) | 4 |  |
| [`flowgraph_nodes_util_randomColor`](ge/extensions/flowgraph/nodes/util/randomColor.md) | 1 |  |
| [`flowgraph_nodes_util_randomNumber`](ge/extensions/flowgraph/nodes/util/randomNumber.md) | 1 |  |
| [`flowgraph_nodes_util_randomQuaternion`](ge/extensions/flowgraph/nodes/util/randomQuaternion.md) | 1 |  |
| [`flowgraph_nodes_util_randomVector`](ge/extensions/flowgraph/nodes/util/randomVector.md) | 1 |  |
| [`flowgraph_nodes_util_roadSegment`](ge/extensions/flowgraph/nodes/util/roadSegment.md) | 3 |  |
| [`flowgraph_nodes_util_routePointToPoint`](ge/extensions/flowgraph/nodes/util/routePointToPoint.md) | 1 |  |
| [`flowgraph_nodes_util_routePosition`](ge/extensions/flowgraph/nodes/util/routePosition.md) | 4 |  |
| [`flowgraph_nodes_util_template`](ge/extensions/flowgraph/nodes/util/template.md) | 12 |  |
| [`flowgraph_nodes_util_time`](ge/extensions/flowgraph/nodes/util/time.md) | 3 |  |
| [`flowgraph_nodes_util_timedSequence`](ge/extensions/flowgraph/nodes/util/timedSequence.md) | 11 |  |
| [`flowgraph_nodes_util_tonumber`](ge/extensions/flowgraph/nodes/util/tonumber.md) | 1 |  |
| [`flowgraph_nodes_util_tostring`](ge/extensions/flowgraph/nodes/util/tostring.md) | 1 |  |
| [`flowgraph_nodes_util_worldEditorOpen`](ge/extensions/flowgraph/nodes/util/worldEditorOpen.md) | 3 |  |
| [`flowgraph_nodes_vehicle_ai_aiParams`](ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.md) | 2 |  |
| [`flowgraph_nodes_vehicle_ai_arrive`](ge/extensions/flowgraph/nodes/vehicle/ai/arrive.md) | 6 |  |
| [`flowgraph_nodes_vehicle_ai_chase`](ge/extensions/flowgraph/nodes/vehicle/ai/chase.md) | 1 |  |
| [`flowgraph_nodes_vehicle_ai_directlyTo`](ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.md) | 8 |  |
| [`flowgraph_nodes_vehicle_ai_disable`](ge/extensions/flowgraph/nodes/vehicle/ai/disable.md) | 2 |  |
| [`flowgraph_nodes_vehicle_ai_flee`](ge/extensions/flowgraph/nodes/vehicle/ai/flee.md) | 1 |  |
| [`flowgraph_nodes_vehicle_ai_follow`](ge/extensions/flowgraph/nodes/vehicle/ai/follow.md) | 1 |  |
| [`flowgraph_nodes_vehicle_ai_followWaypoints`](ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.md) | 7 |  |
| [`flowgraph_nodes_vehicle_ai_getAIMode`](ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.md) | 5 |  |
| [`flowgraph_nodes_vehicle_ai_goToEndLine`](ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.md) | 5 |  |
| [`flowgraph_nodes_vehicle_ai_random`](ge/extensions/flowgraph/nodes/vehicle/ai/random.md) | 1 |  |
| [`flowgraph_nodes_vehicle_ai_scriptAI_followPath`](ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.md) | 12 |  |
| [`flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile`](ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.md) | 7 |  |
| [`flowgraph_nodes_vehicle_ai_scriptAI_pathStored`](ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.md) | 8 |  |
| [`flowgraph_nodes_vehicle_ai_scriptAI_playRecording`](ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.md) | 8 |  |
| [`flowgraph_nodes_vehicle_ai_simpleFollowDecalroad`](ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.md) | 8 |  |
| [`flowgraph_nodes_vehicle_ai_stop`](ge/extensions/flowgraph/nodes/vehicle/ai/stop.md) | 6 |  |
| [`flowgraph_nodes_vehicle_ai_traffic`](ge/extensions/flowgraph/nodes/vehicle/ai/traffic.md) | 1 |  |
| [`flowgraph_nodes_vehicle_alignForCoupling`](ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.md) | 3 |  |
| [`flowgraph_nodes_vehicle_applyVelocity`](ge/extensions/flowgraph/nodes/vehicle/applyVelocity.md) | 1 |  |
| [`flowgraph_nodes_vehicle_beamstate_beamstate`](ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.md) | 6 |  |
| [`flowgraph_nodes_vehicle_beamstate_breakgroup`](ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.md) | 1 |  |
| [`flowgraph_nodes_vehicle_beamstate_couple`](ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.md) | 3 |  |
| [`flowgraph_nodes_vehicle_beamstate_reload`](ge/extensions/flowgraph/nodes/vehicle/beamstate/reload.md) | 1 |  |
| [`flowgraph_nodes_vehicle_beamstate_reset`](ge/extensions/flowgraph/nodes/vehicle/beamstate/reset.md) | 1 |  |
| [`flowgraph_nodes_vehicle_boost`](ge/extensions/flowgraph/nodes/vehicle/boost.md) | 3 |  |
| [`flowgraph_nodes_vehicle_bus_busControls`](ge/extensions/flowgraph/nodes/vehicle/bus/busControls.md) | 3 |  |
| [`flowgraph_nodes_vehicle_bus_isBus`](ge/extensions/flowgraph/nodes/vehicle/bus/isBus.md) | 1 |  |
| [`flowgraph_nodes_vehicle_bus_registerBusData`](ge/extensions/flowgraph/nodes/vehicle/bus/registerBusData.md) | 1 |  |
| [`flowgraph_nodes_vehicle_colors`](ge/extensions/flowgraph/nodes/vehicle/colors.md) | 2 |  |
| [`flowgraph_nodes_vehicle_customPartsConfigProvider`](ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.md) | 8 |  |
| [`flowgraph_nodes_vehicle_enterVehicle`](ge/extensions/flowgraph/nodes/vehicle/enterVehicle.md) | 3 |  |
| [`flowgraph_nodes_vehicle_fire_fire`](ge/extensions/flowgraph/nodes/vehicle/fire/fire.md) | 7 |  |
| [`flowgraph_nodes_vehicle_flipUpright`](ge/extensions/flowgraph/nodes/vehicle/flipUpright.md) | 3 |  |
| [`flowgraph_nodes_vehicle_freeze`](ge/extensions/flowgraph/nodes/vehicle/freeze.md) | 2 |  |
| [`flowgraph_nodes_vehicle_gForce`](ge/extensions/flowgraph/nodes/vehicle/gForce.md) | 5 |  |
| [`flowgraph_nodes_vehicle_generateLicensePlate`](ge/extensions/flowgraph/nodes/vehicle/generateLicensePlate.md) | 1 |  |
| [`flowgraph_nodes_vehicle_getActive`](ge/extensions/flowgraph/nodes/vehicle/getActive.md) | 1 |  |
| [`flowgraph_nodes_vehicle_getElectricsValue`](ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.md) | 8 |  |
| [`flowgraph_nodes_vehicle_getGearboxMode`](ge/extensions/flowgraph/nodes/vehicle/getGearboxMode.md) | 5 |  |
| [`flowgraph_nodes_vehicle_getPowertrainData`](ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.md) | 5 |  |
| [`flowgraph_nodes_vehicle_groundDistance`](ge/extensions/flowgraph/nodes/vehicle/groundDistance.md) | 2 |  |
| [`flowgraph_nodes_vehicle_hasCouplerTag`](ge/extensions/flowgraph/nodes/vehicle/hasCouplerTag.md) | 2 |  |
| [`flowgraph_nodes_vehicle_isCoupled`](ge/extensions/flowgraph/nodes/vehicle/isCoupled.md) | 1 |  |
| [`flowgraph_nodes_vehicle_isPlayerUsable`](ge/extensions/flowgraph/nodes/vehicle/isPlayerUsable.md) | 2 |  |
| [`flowgraph_nodes_vehicle_keep`](ge/extensions/flowgraph/nodes/vehicle/keep.md) | 2 |  |
| [`flowgraph_nodes_vehicle_moveTo`](ge/extensions/flowgraph/nodes/vehicle/moveTo.md) | 3 |  |
| [`flowgraph_nodes_vehicle_onCannonFired`](ge/extensions/flowgraph/nodes/vehicle/onCannonFired.md) | 3 |  |
| [`flowgraph_nodes_vehicle_onVehicleDestroyed`](ge/extensions/flowgraph/nodes/vehicle/onVehicleDestroyed.md) | 5 |  |
| [`flowgraph_nodes_vehicle_onVehicleReset`](ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.md) | 5 |  |
| [`flowgraph_nodes_vehicle_onVehicleSpawned`](ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.md) | 5 |  |
| [`flowgraph_nodes_vehicle_onVehicleSwitched`](ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.md) | 5 |  |
| [`flowgraph_nodes_vehicle_playerUsable`](ge/extensions/flowgraph/nodes/vehicle/playerUsable.md) | 2 |  |
| [`flowgraph_nodes_vehicle_randomConfigProvider`](ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.md) | 7 |  |
| [`flowgraph_nodes_vehicle_recoverInPlace`](ge/extensions/flowgraph/nodes/vehicle/recoverInPlace.md) | 2 |  |
| [`flowgraph_nodes_vehicle_removeVehicle`](ge/extensions/flowgraph/nodes/vehicle/removeVehicle.md) | 1 |  |
| [`flowgraph_nodes_vehicle_replay`](ge/extensions/flowgraph/nodes/vehicle/replay.md) | 7 |  |
| [`flowgraph_nodes_vehicle_setActive`](ge/extensions/flowgraph/nodes/vehicle/setActive.md) | 1 |  |
| [`flowgraph_nodes_vehicle_setGearbox`](ge/extensions/flowgraph/nodes/vehicle/setGearbox.md) | 6 |  |
| [`flowgraph_nodes_vehicle_setIgnition`](ge/extensions/flowgraph/nodes/vehicle/setIgnition.md) | 3 |  |
| [`flowgraph_nodes_vehicle_setLicensePlate`](ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.md) | 3 |  |
| [`flowgraph_nodes_vehicle_setLightbar`](ge/extensions/flowgraph/nodes/vehicle/setLightbar.md) | 3 |  |
| [`flowgraph_nodes_vehicle_setLights`](ge/extensions/flowgraph/nodes/vehicle/setLights.md) | 3 |  |
| [`flowgraph_nodes_vehicle_shiftToGearIndex`](ge/extensions/flowgraph/nodes/vehicle/shiftToGearIndex.md) | 1 |  |
| [`flowgraph_nodes_vehicle_spawnVehicle`](ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.md) | 9 |  |
| [`flowgraph_nodes_vehicle_special_customVehicleGetter`](ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.md) | 6 |  |
| [`flowgraph_nodes_vehicle_special_customVlua`](ge/extensions/flowgraph/nodes/vehicle/special/customVlua.md) | 3 |  |
| [`flowgraph_nodes_vehicle_special_customVlua_string`](ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.md) | 3 |  |
| [`flowgraph_nodes_vehicle_special_vehicleAction`](ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.md) | 7 |  |
| [`flowgraph_nodes_vehicle_special_wheelDistance`](ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.md) | 4 |  |
| [`flowgraph_nodes_vehicle_states`](ge/extensions/flowgraph/nodes/vehicle/states.md) | 1 |  |
| [`flowgraph_nodes_vehicle_teleportToLastRoad`](ge/extensions/flowgraph/nodes/vehicle/teleportToLastRoad.md) | 2 |  |
| [`flowgraph_nodes_vehicle_toShowroom`](ge/extensions/flowgraph/nodes/vehicle/toShowroom.md) | 2 |  |
| [`flowgraph_nodes_vehicle_toggleVehicleControls`](ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.md) | 3 |  |
| [`flowgraph_nodes_vehicle_touching`](ge/extensions/flowgraph/nodes/vehicle/touching.md) | 2 |  |
| [`flowgraph_nodes_vehicle_touchingProps`](ge/extensions/flowgraph/nodes/vehicle/touchingProps.md) | 2 |  |
| [`flowgraph_nodes_vehicle_touchingStatic`](ge/extensions/flowgraph/nodes/vehicle/touchingStatic.md) | 6 |  |
| [`flowgraph_nodes_vehicle_trackVehicle`](ge/extensions/flowgraph/nodes/vehicle/trackVehicle.md) | 3 |  |
| [`flowgraph_nodes_vehicle_trailerRespawn`](ge/extensions/flowgraph/nodes/vehicle/trailerRespawn.md) | 2 |  |
| [`flowgraph_nodes_vehicle_vehicleConfigProvider`](ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.md) | 6 |  |
| [`flowgraph_nodes_vehicle_vehicleData`](ge/extensions/flowgraph/nodes/vehicle/vehicleData.md) | 2 |  |
| [`flowgraph_nodes_vehicle_vehicleMapData`](ge/extensions/flowgraph/nodes/vehicle/vehicleMapData.md) | 2 |  |
| [`flowgraph_nodes_vehicle_vehicleOOBB`](ge/extensions/flowgraph/nodes/vehicle/vehicleOOBB.md) | 2 |  |
| [`flowgraph_nodes_vehicle_vehiclePing`](ge/extensions/flowgraph/nodes/vehicle/vehiclePing.md) | 5 |  |
| [`flowgraph_nodes_vehicle_vehicleWheels`](ge/extensions/flowgraph/nodes/vehicle/vehicleWheels.md) | 2 |  |
| [`flowgraph_pin`](ge/extensions/flowgraph/pin.md) | 18 |  |
| [`flowgraph_states`](ge/extensions/flowgraph/states.md) | 26 |  |
| [`flowgraph_utils`](ge/extensions/flowgraph/utils.md) | 4 |  |
| [`flowgraph_variableStorage`](ge/extensions/flowgraph/variableStorage.md) | 27 |  |
| [✍ `freeroam_bigMapMarkers`](ge/extensions/freeroam/bigMapMarkers.md) | 9 | Gère les marqueurs de la grande carte (big map) : regroupe les points d'intérêt (POI) bruts de gameplay_rawPois qui ont un bigmapMarker en g |
| [✍ `freeroam_bigMapMode`](ge/extensions/freeroam/bigMapMode.md) | 43 | Mode « grande carte » (big map) du jeu : ouvre et ferme la carte du niveau vue de dessus avec une transition de caméra, bascule la caméra 'b |
| [✍ `freeroam_bigMapPoiProvider`](ge/extensions/freeroam/bigMapPoiProvider.md) | 20 | Fournisseur de données pour la grande carte : transforme les POI bruts (missions, garages, stations-service, concessionnaires, points de dép |
| [✍ `freeroam_configuratorOptions_freeroamOptions`](ge/extensions/freeroam/configuratorOptions/freeroamOptions.md) | 3 | Ajoute au configurateur de partie libre (écran de choix du niveau en freeroam) les options propres au freeroam : mode de trafic (désactivé,  |
| [✍ `freeroam_crashCamMode`](ge/extensions/freeroam/crashCamMode.md) | 18 | Caméra de crash (ralenti automatique) du mode freeroam. Chaque image, il prédit (0,2 s à l'avance) si le véhicule du joueur va percuter un v |
| [✍ `freeroam_crashCamModeLoader`](ge/extensions/freeroam/crashCamModeLoader.md) | 2 | Petit chargeur qui charge ou décharge l'extension freeroam_crashCamMode (caméra de ralenti après un crash) selon le réglage enableCrashCam.  |
| [✍ `freeroam_dragRace`](ge/extensions/freeroam/dragRace.md) | 22 | Course de dragster au quart de mile contre une IA (« drag_opponent ») sur les dragstrips des niveaux gridmap_v2 et west_coast_usa. Gère l'ar |
| [✍ `freeroam_facilities`](ge/extensions/freeroam/facilities.md) | 19 | Registre des « facilities » (installations) d'un niveau : garages, stations-service, concessions, ordinateurs, vendeurs privés, fournisseurs |
| [✍ `freeroam_facilities_fuelPrice`](ge/extensions/freeroam/facilities/fuelPrice.md) | 6 | Génère les prix du carburant des stations-service du niveau et les affiche sur les panneaux à afficheurs 7 segments de la scène. Au démarrag |
| [✍ `freeroam_freeroam`](ge/extensions/freeroam/freeroam.md) | 16 | Mode de jeu « freeroam » (balade libre) : démarre un niveau en freeroam, applique les options de spawn (trafic, véhicules garés, heure du jo |
| [✍ `freeroam_freeroamConfigurator`](ge/extensions/freeroam/freeroamConfigurator.md) | 39 | Configurateur de la partie freeroam (assistant « Wizard » de l'UI) : mémorise le niveau, le point de départ, le véhicule (modèle, config, pe |
| [✍ `freeroam_gasStations`](ge/extensions/freeroam/gasStations.md) | 5 | Gestion simple du ravitaillement aux stations-service (carburant ou recharge électrique). Fournit les points d'intérêt (POI) des stations po |
| [✍ `freeroam_levelStats`](ge/extensions/freeroam/levelStats.md) | 4 | Statistiques d'usage des niveaux et des points de départ pour l'interface : compte combien de fois chaque niveau/point de départ a été lancé |
| [✍ `freeroam_organizations`](ge/extensions/freeroam/organizations.md) | 5 | Registre des organisations (factions du mode carrière avec réputation), chargé depuis les fichiers `gameplay/organizations/*.organizations.j |
| [✍ `freeroam_specialTriggers`](ge/extensions/freeroam/specialTriggers.md) | 16 | Déclencheurs spéciaux pilotés par données : relie des BeamNGTrigger (ou zones) à l'affichage/masquage d'objets de scène (TSStatic, lumières  |
| [✍ `freeroam_vehicleSwitchNotification`](ge/extensions/freeroam/vehicleSwitchNotification.md) | 2 | Affiche une notification à l'écran quand le joueur change de véhicule ou de siège : nom du véhicule (marque, nom, configuration), icône selo |
| [✍ `freeroam_vueBigMap`](ge/extensions/freeroam/vueBigMap.md) | 21 | Backend Lua de la grande carte (big map) en interface Vue : prépare pour l'UI la liste des points d'intérêt (POI : missions, garages, statio |
| [`gameplay_achievement`](ge/extensions/gameplay/achievement.md) | 6 |  |
| [`gameplay_backgroundActivities_g2g`](ge/extensions/gameplay/backgroundActivities/g2g.md) | 12 |  |
| [`gameplay_city`](ge/extensions/gameplay/city.md) | 9 |  |
| [`gameplay_crashTest_crashTestBoundaries`](ge/extensions/gameplay/crashTest/crashTestBoundaries.md) | 5 |  |
| [`gameplay_crashTest_crashTestCountdown`](ge/extensions/gameplay/crashTest/crashTestCountdown.md) | 2 |  |
| [`gameplay_crashTest_crashTestScoring`](ge/extensions/gameplay/crashTest/crashTestScoring.md) | 6 |  |
| [`gameplay_crashTest_crashTestTaskList`](ge/extensions/gameplay/crashTest/crashTestTaskList.md) | 6 |  |
| [`gameplay_crashTest_scenarioManager`](ge/extensions/gameplay/crashTest/scenarioManager.md) | 18 |  |
| [`gameplay_crawl_boundary`](ge/extensions/gameplay/crawl/boundary.md) | 13 |  |
| [`gameplay_crawl_crawlFlowgraphBridge`](ge/extensions/gameplay/crawl/crawlFlowgraphBridge.md) | 22 |  |
| [`gameplay_crawl_debug`](ge/extensions/gameplay/crawl/debug.md) | 9 |  |
| [`gameplay_crawl_debugDraw`](ge/extensions/gameplay/crawl/debugDraw.md) | 3 |  |
| [`gameplay_crawl_display`](ge/extensions/gameplay/crawl/display.md) | 22 |  |
| [`gameplay_crawl_flowgraphBridge`](ge/extensions/gameplay/crawl/flowgraphBridge.md) | 23 |  |
| [`gameplay_crawl_freeroamMultiplayer`](ge/extensions/gameplay/crawl/freeroamMultiplayer.md) | 4 |  |
| [`gameplay_crawl_general`](ge/extensions/gameplay/crawl/general.md) | 17 |  |
| [`gameplay_crawl_saveSystem`](ge/extensions/gameplay/crawl/saveSystem.md) | 31 |  |
| [`gameplay_crawl_utils`](ge/extensions/gameplay/crawl/utils.md) | 42 |  |
| [`gameplay_delivery_delivery`](ge/extensions/gameplay/delivery/delivery.md) | 12 |  |
| [`gameplay_discover`](ge/extensions/gameplay/discover.md) | 20 |  |
| [`gameplay_drag_core`](ge/extensions/gameplay/drag/core.md) | 68 |  |
| [`gameplay_drag_dialPopup`](ge/extensions/gameplay/drag/dialPopup.md) | 2 |  |
| [`gameplay_drag_display`](ge/extensions/gameplay/drag/display.md) | 22 |  |
| [`gameplay_drag_dragBridge`](ge/extensions/gameplay/drag/dragBridge.md) | 57 |  |
| [`gameplay_drag_dragTypes_bracketRace`](ge/extensions/gameplay/drag/dragTypes/bracketRace.md) | 5 |  |
| [`gameplay_drag_dragTypes_headsUpRace`](ge/extensions/gameplay/drag/dragTypes/headsUpRace.md) | 5 |  |
| [`gameplay_drag_mpDragHandlers`](ge/extensions/gameplay/drag/mpDragHandlers.md) | 1 |  |
| [`gameplay_drag_phaseHandlers`](ge/extensions/gameplay/drag/phaseHandlers.md) | 26 |  |
| [`gameplay_drag_poi`](ge/extensions/gameplay/drag/poi.md) | 5 |  |
| [`gameplay_drag_rulesMenu`](ge/extensions/gameplay/drag/rulesMenu.md) | 9 |  |
| [`gameplay_drag_saveSystem`](ge/extensions/gameplay/drag/saveSystem.md) | 23 |  |
| [`gameplay_drag_times`](ge/extensions/gameplay/drag/times.md) | 11 |  |
| [`gameplay_drag_timeslip`](ge/extensions/gameplay/drag/timeslip.md) | 3 |  |
| [`gameplay_drift_bounds`](ge/extensions/gameplay/drift/bounds.md) | 5 |  |
| [`gameplay_drift_destination`](ge/extensions/gameplay/drift/destination.md) | 13 |  |
| [`gameplay_drift_display`](ge/extensions/gameplay/drift/display.md) | 27 |  |
| [`gameplay_drift_drift`](ge/extensions/gameplay/drift/drift.md) | 45 |  |
| [`gameplay_drift_freeroam_cruising`](ge/extensions/gameplay/drift/freeroam/cruising.md) | 1 |  |
| [`gameplay_drift_freeroam_driftSpots`](ge/extensions/gameplay/drift/freeroam/driftSpots.md) | 15 |  |
| [`gameplay_drift_general`](ge/extensions/gameplay/drift/general.md) | 23 |  |
| [`gameplay_drift_multiplayer`](ge/extensions/gameplay/drift/multiplayer.md) | 7 |  |
| [`gameplay_drift_quickMessages`](ge/extensions/gameplay/drift/quickMessages.md) | 10 |  |
| [`gameplay_drift_saveLoad`](ge/extensions/gameplay/drift/saveLoad.md) | 9 |  |
| [`gameplay_drift_scoreboard`](ge/extensions/gameplay/drift/scoreboard.md) | 11 |  |
| [`gameplay_drift_scoring`](ge/extensions/gameplay/drift/scoring.md) | 34 |  |
| [`gameplay_drift_sounds`](ge/extensions/gameplay/drift/sounds.md) | 9 |  |
| [`gameplay_drift_stallingSystem`](ge/extensions/gameplay/drift/stallingSystem.md) | 6 |  |
| [`gameplay_drift_statistics`](ge/extensions/gameplay/drift/statistics.md) | 4 |  |
| [`gameplay_drift_stuntZones`](ge/extensions/gameplay/drift/stuntZones.md) | 20 |  |
| [`gameplay_drift_stuntZones_donut`](ge/extensions/gameplay/drift/stuntZones/donut.md) | 8 |  |
| [`gameplay_drift_stuntZones_driftThrough`](ge/extensions/gameplay/drift/stuntZones/driftThrough.md) | 8 |  |
| [`gameplay_drift_stuntZones_hitPole`](ge/extensions/gameplay/drift/stuntZones/hitPole.md) | 11 |  |
| [`gameplay_drift_stuntZones_nearPole`](ge/extensions/gameplay/drift/stuntZones/nearPole.md) | 11 |  |
| [`gameplay_forceField`](ge/extensions/gameplay/forceField.md) | 12 |  |
| [`gameplay_freeformDelivery_debug`](ge/extensions/gameplay/freeformDelivery/debug.md) | 5 |  |
| [`gameplay_freeformDelivery_endScreen`](ge/extensions/gameplay/freeformDelivery/endScreen.md) | 1 |  |
| [`gameplay_freeformDelivery_freeformDelivery`](ge/extensions/gameplay/freeformDelivery/freeformDelivery.md) | 21 |  |
| [`gameplay_freeformDelivery_goals`](ge/extensions/gameplay/freeformDelivery/goals.md) | 16 |  |
| [`gameplay_freeformDelivery_hints`](ge/extensions/gameplay/freeformDelivery/hints.md) | 3 |  |
| [`gameplay_freeformDelivery_loader`](ge/extensions/gameplay/freeformDelivery/loader.md) | 1 |  |
| [`gameplay_freeformDelivery_markers`](ge/extensions/gameplay/freeformDelivery/markers.md) | 5 |  |
| [`gameplay_freeformDelivery_odometer`](ge/extensions/gameplay/freeformDelivery/odometer.md) | 7 |  |
| [`gameplay_freeformDelivery_routes`](ge/extensions/gameplay/freeformDelivery/routes.md) | 20 |  |
| [`gameplay_freeformDelivery_setup`](ge/extensions/gameplay/freeformDelivery/setup.md) | 11 |  |
| [`gameplay_freeformDelivery_tasklist`](ge/extensions/gameplay/freeformDelivery/tasklist.md) | 4 |  |
| [`gameplay_freeformDelivery_utils`](ge/extensions/gameplay/freeformDelivery/utils.md) | 17 |  |
| [`gameplay_freeformDelivery_vehicleSleep`](ge/extensions/gameplay/freeformDelivery/vehicleSleep.md) | 4 |  |
| [`gameplay_garageMode`](ge/extensions/gameplay/garageMode.md) | 28 |  |
| [`gameplay_lowPerformance`](ge/extensions/gameplay/lowPerformance.md) | 9 |  |
| [`gameplay_lowPerformance.test`](ge/extensions/gameplay/lowPerformance.test.md) | 6 | Run with require('testFramework/TestManager'):runTestFiles('gameplay/lowPerformance') |
| [`gameplay_markerInteraction`](ge/extensions/gameplay/markerInteraction.md) | 21 |  |
| [`gameplay_markers_bigmapMarker`](ge/extensions/gameplay/markers/bigmapMarker.md) | 11 |  |
| [`gameplay_markers_crawlMarker`](ge/extensions/gameplay/markers/crawlMarker.md) | 13 |  |
| [`gameplay_markers_driftLineMarker`](ge/extensions/gameplay/markers/driftLineMarker.md) | 11 |  |
| [`gameplay_markers_gasStationMarker`](ge/extensions/gameplay/markers/gasStationMarker.md) | 13 |  |
| [`gameplay_markers_inspectVehicleMarker`](ge/extensions/gameplay/markers/inspectVehicleMarker.md) | 10 |  |
| [`gameplay_markers_invisibleMarker`](ge/extensions/gameplay/markers/invisibleMarker.md) | 10 |  |
| [`gameplay_markers_invisibleTrigger`](ge/extensions/gameplay/markers/invisibleTrigger.md) | 13 |  |
| [`gameplay_markers_missionMarker`](ge/extensions/gameplay/markers/missionMarker.md) | 15 |  |
| [`gameplay_markers_parkingMarker`](ge/extensions/gameplay/markers/parkingMarker.md) | 15 |  |
| [`gameplay_markers_vehicleTrigger`](ge/extensions/gameplay/markers/vehicleTrigger.md) | 13 |  |
| [`gameplay_markers_walkingMarker`](ge/extensions/gameplay/markers/walkingMarker.md) | 13 |  |
| [`gameplay_markers_zoneMarker`](ge/extensions/gameplay/markers/zoneMarker.md) | 12 |  |
| [`gameplay_missions_locationsDetector`](ge/extensions/gameplay/missions/locationsDetector.md) | 1 |  |
| [`gameplay_missions_missionManager`](ge/extensions/gameplay/missions/missionManager.md) | 19 |  |
| [`gameplay_missions_missionScreen`](ge/extensions/gameplay/missions/missionScreen.md) | 34 |  |
| [`gameplay_missions_missionTypes_baseMission`](ge/extensions/gameplay/missions/missionTypes/baseMission.md) | 5 |  |
| [`gameplay_missions_missionTypes_editorHelper`](ge/extensions/gameplay/missions/missionTypes/editorHelper.md) | 33 |  |
| [`gameplay_missions_missionTypes_flowMission`](ge/extensions/gameplay/missions/missionTypes/flowMission.md) | 20 |  |
| [`gameplay_missions_missions`](ge/extensions/gameplay/missions/missions.md) | 37 |  |
| [`gameplay_missions_poiTest`](ge/extensions/gameplay/missions/poiTest.md) | 3 |  |
| [`gameplay_missions_proceduralMissionGenerators_busModeMissions`](ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.md) | 1 |  |
| [`gameplay_missions_proceduralMissionGenerators_timeTrialMissions`](ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.md) | 1 |  |
| [`gameplay_missions_progress`](ge/extensions/gameplay/missions/progress.md) | 27 |  |
| [`gameplay_missions_startTrigger`](ge/extensions/gameplay/missions/startTrigger.md) | 5 |  |
| [`gameplay_missions_unlocks`](ge/extensions/gameplay/missions/unlocks.md) | 19 |  |
| [`gameplay_missions_unlocks_conditions_careerConditions`](ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.md) | 0 |  |
| [`gameplay_missions_unlocks_conditions_genericConditions`](ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.md) | 0 |  |
| [`gameplay_missions_unlocks_conditions_missionConditions`](ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.md) | 2 |  |
| [`gameplay_missions_unlocks_conditions_vehicleConditions`](ge/extensions/gameplay/missions/unlocks/conditions/vehicleConditions.md) | 0 |  |
| [`gameplay_missions_vehicleFilterResolver`](ge/extensions/gameplay/missions/vehicleFilterResolver.md) | 2 |  |
| [`gameplay_multiseat_gamemodeManager`](ge/extensions/gameplay/multiseat/gamemodeManager.md) | 30 |  |
| [`gameplay_parking`](ge/extensions/gameplay/parking.md) | 39 |  |
| [`gameplay_playmodeMarkers`](ge/extensions/gameplay/playmodeMarkers.md) | 12 |  |
| [`gameplay_police`](ge/extensions/gameplay/police.md) | 35 |  |
| [`gameplay_pursuit_proceduralMode`](ge/extensions/gameplay/pursuit/proceduralMode.md) | 3 |  |
| [`gameplay_pursuit_pursuit`](ge/extensions/gameplay/pursuit/pursuit.md) | 21 |  |
| [`gameplay_race_pacenote`](ge/extensions/gameplay/race/pacenote.md) | 9 |  |
| [`gameplay_race_path`](ge/extensions/gameplay/race/path.md) | 18 |  |
| [`gameplay_race_pathnode`](ge/extensions/gameplay/race/pathnode.md) | 19 |  |
| [`gameplay_race_race`](ge/extensions/gameplay/race/race.md) | 38 |  |
| [`gameplay_race_segment`](ge/extensions/gameplay/race/segment.md) | 20 |  |
| [`gameplay_race_startPosition`](ge/extensions/gameplay/race/startPosition.md) | 13 |  |
| [`gameplay_rally`](ge/extensions/gameplay/rally.md) | 37 |  |
| [`gameplay_rally_aiCompetitors`](ge/extensions/gameplay/rally/aiCompetitors.md) | 5 |  |
| [`gameplay_rally_audioManager`](ge/extensions/gameplay/rally/audioManager.md) | 31 |  |
| [`gameplay_rally_audioTiming`](ge/extensions/gameplay/rally/audioTiming.md) | 4 |  |
| [`gameplay_rally_cameraPathPlayer`](ge/extensions/gameplay/rally/cameraPathPlayer.md) | 3 |  |
| [`gameplay_rally_client`](ge/extensions/gameplay/rally/client.md) | 2 |  |
| [`gameplay_rally_codriverTiming`](ge/extensions/gameplay/rally/codriverTiming.md) | 5 |  |
| [`gameplay_rally_compositors_helpers_calibrationOverrides`](ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.md) | 9 |  |
| [`gameplay_rally_compositors_helpers_colors`](ge/extensions/gameplay/rally/compositors/helpers/colors.md) | 0 |  |
| [`gameplay_rally_compositors_helpers_compositorUtil`](ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.md) | 34 |  |
| [`gameplay_rally_compositors_helpers_styleValidator`](ge/extensions/gameplay/rally/compositors/helpers/styleValidator.md) | 1 |  |
| [`gameplay_rally_compositors_helpers_textCompositor`](ge/extensions/gameplay/rally/compositors/helpers/textCompositor.md) | 34 |  |
| [`gameplay_rally_compositors_helpers_visualCompositor`](ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.md) | 3 |  |
| [`gameplay_rally_compositors_styles_english_casual`](ge/extensions/gameplay/rally/compositors/styles/english/casual.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_caution`](ge/extensions/gameplay/rally/compositors/styles/english/caution.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_distance`](ge/extensions/gameplay/rally/compositors/styles/english/distance.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_enthusiast`](ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_modifiers`](ge/extensions/gameplay/rally/compositors/styles/english/modifiers.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`](ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.md) | 0 | Shared English easy/medium/hard corner numbering metadata. |
| [`gameplay_rally_compositors_styles_english_numbering_one_to_six`](ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.md) | 0 | Shared English 1-6 corner numbering metadata. |
| [`gameplay_rally_compositors_styles_english_systemPacenotes`](ge/extensions/gameplay/rally/compositors/styles/english/systemPacenotes.md) | 0 |  |
| [`gameplay_rally_compositors_styles_english_visual`](ge/extensions/gameplay/rally/compositors/styles/english/visual.md) | 0 |  |
| [`gameplay_rally_compositors_styles_spanish_enthusiast`](ge/extensions/gameplay/rally/compositors/styles/spanish/enthusiast.md) | 0 |  |
| [`gameplay_rally_compositors_styles_spanish_numbering_one_to_six`](ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.md) | 0 | Shared Spanish 1-6 corner numbering metadata. |
| [`gameplay_rally_cutCapture`](ge/extensions/gameplay/rally/cutCapture.md) | 5 |  |
| [`gameplay_rally_driveline_drivelineMeasurement`](ge/extensions/gameplay/rally/driveline/drivelineMeasurement.md) | 1 |  |
| [`gameplay_rally_driveline_drivelineRoute`](ge/extensions/gameplay/rally/driveline/drivelineRoute.md) | 48 |  |
| [`gameplay_rally_driveline_drivelineV3`](ge/extensions/gameplay/rally/driveline/drivelineV3.md) | 26 |  |
| [`gameplay_rally_driveline_pointList`](ge/extensions/gameplay/rally/driveline/pointList.md) | 12 |  |
| [`gameplay_rally_driveline_rallyRouteTracker`](ge/extensions/gameplay/rally/driveline/rallyRouteTracker.md) | 15 |  |
| [`gameplay_rally_driveline_util`](ge/extensions/gameplay/rally/driveline/util.md) | 0 |  |
| [`gameplay_rally_enums`](ge/extensions/gameplay/rally/enums.md) | 0 |  |
| [`gameplay_rally_extHelper`](ge/extensions/gameplay/rally/extHelper.md) | 2 |  |
| [`gameplay_rally_fuelUtils`](ge/extensions/gameplay/rally/fuelUtils.md) | 3 |  |
| [`gameplay_rally_geometry`](ge/extensions/gameplay/rally/geometry.md) | 1 |  |
| [`gameplay_rally_loop_penalties`](ge/extensions/gameplay/rally/loop/penalties.md) | 4 |  |
| [`gameplay_rally_loop_rallyAttempts`](ge/extensions/gameplay/rally/loop/rallyAttempts.md) | 2 |  |
| [`gameplay_rally_loop_rallyEventLog`](ge/extensions/gameplay/rally/loop/rallyEventLog.md) | 15 |  |
| [`gameplay_rally_loop_rallyLoopManager`](ge/extensions/gameplay/rally/loop/rallyLoopManager.md) | 134 |  |
| [`gameplay_rally_loop_rallyLoopStars`](ge/extensions/gameplay/rally/loop/rallyLoopStars.md) | 5 |  |
| [`gameplay_rally_loop_rallyLoopTime`](ge/extensions/gameplay/rally/loop/rallyLoopTime.md) | 6 |  |
| [`gameplay_rally_loop_roadSectionPenaltyKeeper`](ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.md) | 5 |  |
| [`gameplay_rally_loop_scheduleUtils`](ge/extensions/gameplay/rally/loop/scheduleUtils.md) | 4 |  |
| [`gameplay_rally_loop_speedingDetector`](ge/extensions/gameplay/rally/loop/speedingDetector.md) | 7 |  |
| [`gameplay_rally_loop_stagedCountdownTest`](ge/extensions/gameplay/rally/loop/stagedCountdownTest.md) | 4 |  |
| [`gameplay_rally_loop_stagedCountdownUtils`](ge/extensions/gameplay/rally/loop/stagedCountdownUtils.md) | 12 |  |
| [`gameplay_rally_loop_standaloneFallbackStream`](ge/extensions/gameplay/rally/loop/standaloneFallbackStream.md) | 6 |  |
| [`gameplay_rally_loop_uiColors`](ge/extensions/gameplay/rally/loop/uiColors.md) | 4 |  |
| [`gameplay_rally_notebook_focusedNearDraw`](ge/extensions/gameplay/rally/notebook/focusedNearDraw.md) | 3 |  |
| [`gameplay_rally_notebook_noSelectionPreview`](ge/extensions/gameplay/rally/notebook/noSelectionPreview.md) | 3 |  |
| [`gameplay_rally_notebook_pacenote`](ge/extensions/gameplay/rally/notebook/pacenote.md) | 129 |  |
| [`gameplay_rally_notebook_pacenoteGenerator`](ge/extensions/gameplay/rally/notebook/pacenoteGenerator.md) | 1 |  |
| [`gameplay_rally_notebook_pacenoteWaypoint`](ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.md) | 20 |  |
| [`gameplay_rally_notebook_path`](ge/extensions/gameplay/rally/notebook/path.md) | 105 |  |
| [`gameplay_rally_notebook_structured`](ge/extensions/gameplay/rally/notebook/structured.md) | 14 |  |
| [`gameplay_rally_notebook_systemPacenotes`](ge/extensions/gameplay/rally/notebook/systemPacenotes.md) | 2 |  |
| [`gameplay_rally_notebook_test_testNotebook`](ge/extensions/gameplay/rally/notebook/test/testNotebook.md) | 1 |  |
| [`gameplay_rally_notebook_waypointTypes`](ge/extensions/gameplay/rally/notebook/waypointTypes.md) | 1 |  |
| [`gameplay_rally_rallyManager`](ge/extensions/gameplay/rally/rallyManager.md) | 88 |  |
| [`gameplay_rally_recce`](ge/extensions/gameplay/rally/recce.md) | 10 |  |
| [`gameplay_rally_recce_cutsRecording`](ge/extensions/gameplay/rally/recce/cutsRecording.md) | 1 |  |
| [`gameplay_rally_recce_drivelineRecording`](ge/extensions/gameplay/rally/recce/drivelineRecording.md) | 1 |  |
| [`gameplay_rally_recceApp`](ge/extensions/gameplay/rally/recceApp.md) | 25 |  |
| [`gameplay_rally_recceSettings`](ge/extensions/gameplay/rally/recceSettings.md) | 16 |  |
| [`gameplay_rally_recoveryClockAdvance`](ge/extensions/gameplay/rally/recoveryClockAdvance.md) | 2 |  |
| [`gameplay_rally_snaproad`](ge/extensions/gameplay/rally/snaproad.md) | 70 |  |
| [`gameplay_rally_snaproad_geoPacenotes`](ge/extensions/gameplay/rally/snaproad/geoPacenotes.md) | 6 |  |
| [`gameplay_rally_snaproad_normals`](ge/extensions/gameplay/rally/snaproad/normals.md) | 2 |  |
| [`gameplay_rally_stage_stageObserver`](ge/extensions/gameplay/rally/stage/stageObserver.md) | 10 |  |
| [`gameplay_rally_stage_stageTimingState`](ge/extensions/gameplay/rally/stage/stageTimingState.md) | 16 |  |
| [`gameplay_rally_starThresholds`](ge/extensions/gameplay/rally/starThresholds.md) | 1 |  |
| [`gameplay_rally_startClocks_rallyStartTree`](ge/extensions/gameplay/rally/startClocks/rallyStartTree.md) | 3 |  |
| [`gameplay_rally_test_testRouteFix`](ge/extensions/gameplay/rally/test/testRouteFix.md) | 4 |  |
| [`gameplay_rally_tools_devTools`](ge/extensions/gameplay/rally/tools/devTools.md) | 26 |  |
| [`gameplay_rally_tools_loopToolbox`](ge/extensions/gameplay/rally/tools/loopToolbox.md) | 12 |  |
| [`gameplay_rally_tools_rallyToolbox`](ge/extensions/gameplay/rally/tools/rallyToolbox.md) | 22 |  |
| [`gameplay_rally_trafficExclusion`](ge/extensions/gameplay/rally/trafficExclusion.md) | 5 |  |
| [`gameplay_rally_transcripts_entry`](ge/extensions/gameplay/rally/transcripts/entry.md) | 16 |  |
| [`gameplay_rally_transcripts_path`](ge/extensions/gameplay/rally/transcripts/path.md) | 8 |  |
| [`gameplay_rally_transcripts_vehicleSnapshot`](ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.md) | 3 |  |
| [`gameplay_rally_util`](ge/extensions/gameplay/rally/util.md) | 48 |  |
| [`gameplay_rally_util_colors`](ge/extensions/gameplay/rally/util/colors.md) | 0 |  |
| [`gameplay_rally_util_jsonlUtils`](ge/extensions/gameplay/rally/util/jsonlUtils.md) | 5 |  |
| [`gameplay_rally_util_normalizer`](ge/extensions/gameplay/rally/util/normalizer.md) | 1 |  |
| [`gameplay_rally_vehicleCapture`](ge/extensions/gameplay/rally/vehicleCapture.md) | 5 |  |
| [`gameplay_rally_vehicleTracker`](ge/extensions/gameplay/rally/vehicleTracker.md) | 13 |  |
| [`gameplay_rally_voicepack`](ge/extensions/gameplay/rally/voicepack.md) | 47 |  |
| [`gameplay_rally_voicepackMissionSettings`](ge/extensions/gameplay/rally/voicepackMissionSettings.md) | 4 |  |
| [`gameplay_rallyLoop`](ge/extensions/gameplay/rallyLoop.md) | 35 |  |
| [`gameplay_rallyStartClock`](ge/extensions/gameplay/rallyStartClock.md) | 8 |  |
| [`gameplay_rawPois`](ge/extensions/gameplay/rawPois.md) | 3 |  |
| [`gameplay_route_raceRoute`](ge/extensions/gameplay/route/raceRoute.md) | 19 |  |
| [`gameplay_route_route`](ge/extensions/gameplay/route/route.md) | 18 |  |
| [`gameplay_seatOccupants`](ge/extensions/gameplay/seatOccupants.md) | 42 |  |
| [`gameplay_sites_location`](ge/extensions/gameplay/sites/location.md) | 6 |  |
| [`gameplay_sites_parkingSpot`](ge/extensions/gameplay/sites/parkingSpot.md) | 15 |  |
| [`gameplay_sites_sites`](ge/extensions/gameplay/sites/sites.md) | 12 |  |
| [`gameplay_sites_sitesManager`](ge/extensions/gameplay/sites/sitesManager.md) | 11 |  |
| [`gameplay_sites_zone`](ge/extensions/gameplay/sites/zone.md) | 21 |  |
| [`gameplay_skidpadTest`](ge/extensions/gameplay/skidpadTest.md) | 3 |  |
| [`gameplay_speedTrapLeaderboards`](ge/extensions/gameplay/speedTrapLeaderboards.md) | 9 |  |
| [`gameplay_speedTraps`](ge/extensions/gameplay/speedTraps.md) | 2 |  |
| [`gameplay_statistic`](ge/extensions/gameplay/statistic.md) | 39 |  |
| [`gameplay_statisticModules_watchJturn`](ge/extensions/gameplay/statisticModules/watchJturn.md) | 4 |  |
| [`gameplay_statisticModules_watchRollover`](ge/extensions/gameplay/statisticModules/watchRollover.md) | 4 |  |
| [`gameplay_taxi`](ge/extensions/gameplay/taxi.md) | 35 |  |
| [`gameplay_traffic`](ge/extensions/gameplay/traffic.md) | 60 |  |
| [`gameplay_traffic_baseRole`](ge/extensions/gameplay/traffic/baseRole.md) | 26 |  |
| [`gameplay_traffic_roadTracking`](ge/extensions/gameplay/traffic/roadTracking.md) | 9 |  |
| [`gameplay_traffic_roles_empty`](ge/extensions/gameplay/traffic/roles/empty.md) | 1 |  |
| [`gameplay_traffic_roles_police`](ge/extensions/gameplay/traffic/roles/police.md) | 5 |  |
| [`gameplay_traffic_roles_standard`](ge/extensions/gameplay/traffic/roles/standard.md) | 9 |  |
| [`gameplay_traffic_roles_suspect`](ge/extensions/gameplay/traffic/roles/suspect.md) | 5 |  |
| [`gameplay_traffic_source`](ge/extensions/gameplay/traffic/source.md) | 10 |  |
| [`gameplay_traffic_trafficUtils`](ge/extensions/gameplay/traffic/trafficUtils.md) | 18 |  |
| [`gameplay_traffic_vehicle`](ge/extensions/gameplay/traffic/vehicle.md) | 35 |  |
| [`gameplay_tutorial_bounds`](ge/extensions/gameplay/tutorial/bounds.md) | 15 |  |
| [`gameplay_tutorial_damageTracker`](ge/extensions/gameplay/tutorial/damageTracker.md) | 19 |  |
| [`gameplay_tutorial_markers`](ge/extensions/gameplay/tutorial/markers.md) | 13 |  |
| [`gameplay_tutorial_runtime`](ge/extensions/gameplay/tutorial/runtime.md) | 15 |  |
| [`gameplay_tutorial_setup`](ge/extensions/gameplay/tutorial/setup.md) | 21 |  |
| [`gameplay_util_crashDetection`](ge/extensions/gameplay/util/crashDetection.md) | 10 |  |
| [`gameplay_util_customFields`](ge/extensions/gameplay/util/customFields.md) | 12 |  |
| [`gameplay_util_damageAssessment`](ge/extensions/gameplay/util/damageAssessment.md) | 9 |  |
| [`gameplay_util_groundContact`](ge/extensions/gameplay/util/groundContact.md) | 1 |  |
| [`gameplay_util_routeGenerator`](ge/extensions/gameplay/util/routeGenerator.md) | 2 |  |
| [`gameplay_util_sortedList`](ge/extensions/gameplay/util/sortedList.md) | 10 |  |
| [`gameplay_util_vehicleSighting`](ge/extensions/gameplay/util/vehicleSighting.md) | 3 |  |
| [`gameplay_vehiclePerformance`](ge/extensions/gameplay/vehiclePerformance.md) | 9 |  |
| [`gameplay_vehiclePresencePolicy`](ge/extensions/gameplay/vehiclePresencePolicy.md) | 4 |  |
| [`gameplay_vehiclePresencePolicy.test`](ge/extensions/gameplay/vehiclePresencePolicy.test.md) | 3 | Run with: |
| [`gameplay_walk`](ge/extensions/gameplay/walk.md) | 36 |  |
| [`license`](ge/extensions/license.md) | 5 |  |
| [`lightrunner_lightrunnerConfigurator`](ge/extensions/lightrunner/lightrunnerConfigurator.md) | 0 |  |
| [✍ `mcp_server`](ge/extensions/mcp/server.md) | 7 | Serveur MCP (Model Context Protocol) intégré au jeu. Il ouvre un petit serveur HTTP local (via le serveur C++ BNGWebWSServer) sur http://127 |
| [✍ `mcp_shared`](ge/extensions/mcp/shared.md) | 4 | État et petites aides partagés par les modules d'outils MCP (mcp/tools/*.lua). Chargé par `require('mcp/shared')`, donc singleton via le cac |
| [✍ `mcp_tools`](ge/extensions/mcp/tools.md) | 3 | Chargeur des modules d'outils MCP. Au chargement il parcourt `/lua/ge/extensions/mcp/tools/*.lua` (niveau 1), les `require` un par un et fus |
| [✍ `mcp_tools_ai`](ge/extensions/mcp/tools/ai.md) | 4 | Outils MCP pour l'IA des véhicules : lire/modifier ses réglages (mode, vitesse, agressivité, cible), l'envoyer vers un point, et inspecter l |
| [✍ `mcp_tools_camera`](ge/extensions/mcp/tools/camera.md) | 5 | Outils MCP pour la caméra du joueur : changer de mode, orbiter autour d'un véhicule (avec rotation continue), lire l'état de la caméra et pl |
| [✍ `mcp_tools_debug`](ge/extensions/mcp/tools/debug.md) | 3 | Outils MCP de dessin de debug dans le monde : sphères, lignes et textes persistants, redessinés à chaque frame avec debugDrawer jusqu'à effa |
| [✍ `mcp_tools_editor`](ge/extensions/mcp/tools/editor.md) | 16 | Outils MCP pour le World Editor : activer/désactiver, état, sélection, annuler/rétablir, modes d'édition, ouvrir/sauvegarder un niveau, list |
| [✍ `mcp_tools_env`](ge/extensions/mcp/tools/env.md) | 2 | Outils MCP pour l'environnement : lire et régler l'heure du jour et les paramètres astronomiques (latitude, longitude, date, décalage UTC, p |
| [✍ `mcp_tools_fs`](ge/extensions/mcp/tools/fs.md) | 8 | Outils MCP système de fichiers : lire/écrire des fichiers texte, lister, chercher, supprimer, copier, renommer, créer des dossiers. Lecture/ |
| [✍ `mcp_tools_input`](ge/extensions/mcp/tools/input.md) | 4 | Outils MCP d'entrées véhicule : injecter un évènement de contrôle (direction, accélérateur, frein…), tester un contrôle « hydro » en aller-r |
| [✍ `mcp_tools_perf`](ge/extensions/mcp/tools/perf.md) | 5 | Outils MCP de performance : métriques de la dernière frame, raison du limiteur de FPS, usage de la VRAM, et captures du profileur Optick (bu |
| [✍ `mcp_tools_scene`](ge/extensions/mcp/tools/scene.md) | 7 | Outils MCP pour le scenetree : trouver des objets (par classe ou nom), les inspecter comme l'inspecteur de l'éditeur, modifier leurs champs, |
| [✍ `mcp_tools_sim`](ge/extensions/mcp/tools/sim.md) | 5 | Outils MCP de contrôle de la simulation : lire l'état, changer l'échelle de temps, mettre la physique en pause, la reprendre, ou l'avancer p |
| [✍ `mcp_tools_spawn`](ge/extensions/mcp/tools/spawn.md) | 4 | Outils MCP de spawn : lister les configurations d'un modèle, faire apparaître ou remplacer un véhicule, et tester automatiquement toutes les |
| [✍ `mcp_tools_system`](ge/extensions/mcp/tools/system.md) | 13 | Outils MCP système : exécuter du Lua dans la VM GE, lire les logs, recharger l'UI ou le Lua, infos de rendu, captures d'écran, infos fichier |
| [✍ `mcp_tools_telemetry`](ge/extensions/mcp/tools/telemetry.md) | 3 | Outils MCP de télémétrie véhicule : valeurs électriques (régime, vitesse, rapport, carburant…), résumé de dommages, et instantané d'état glo |
| [✍ `mcp_tools_ui`](ge/extensions/mcp/tools/ui.md) | 11 | Outils MCP pour l'interface (CEF/Vue) : lire la route et l'état Pinia, naviguer, afficher/masquer l'UI, afficher un message, et piloter le D |
| [✍ `mcp_tools_vehicle`](ge/extensions/mcp/tools/vehicle.md) | 11 | Outils MCP véhicules : lister, détailler, fichiers JBeam et arbre de parts, journal d'instabilité physique, reset/rechargement du véhicule j |
| [✍ `mcp_tools_world`](ge/extensions/mcp/tools/world.md) | 6 | Outils MCP « monde » : lister et charger des niveaux, déclencher une action d'entrée liée (comme une touche), récupérer ou supprimer un véhi |
| [`oneshotRace_oneshotRaceCore`](ge/extensions/oneshotRace/oneshotRaceCore.md) | 1 |  |
| [`oneshotRace_quickRaceConfiguratorDescriptor`](ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.md) | 1 |  |
| [`quickrace_quickraceConfigurator`](ge/extensions/quickrace/quickraceConfigurator.md) | 0 |  |
| [`remoteControl_remoteControl`](ge/extensions/remoteControl/remoteControl.md) | 5 |  |
| [✍ `render_hdr`](ge/extensions/render/hdr.md) | 3 | Crée au premier frame la chaîne d'effets de post-traitement HDR (exposition automatique/locale) : PostEffectBrightPass (rendu AfterPostFX à  |
| [✍ `render_openxr`](ge/extensions/render/openxr.md) | 11 | Interface Lua de la réalité virtuelle OpenXR (casque VR). Pilote le moteur C++ (objet global OpenXR) : activation/désactivation avec une boî |
| [✍ `render_playerCompassMarkers`](ge/extensions/render/playerCompassMarkers.md) | 3 | Indicateurs de direction des autres joueurs pour l'écran partagé (multi-sièges en freeroam). Pour chaque vue, dessine en haut de la vue une  |
| [✍ `render_playerTags`](ge/extensions/render/playerTags.md) | 13 | Étiquettes de nom flottantes au-dessus des véhicules des joueurs (multi-sièges et écran partagé). Utilise le système de billboards Skia (obj |
| [✍ `render_renderViews`](ge/extensions/render/renderViews.md) | 1 | Prise de captures d'écran depuis une caméra virtuelle indépendante (RenderView) : on donne position, rotation, résolution, FOV et masques d' |
| [✍ `render_skiaIcons`](ge/extensions/render/skiaIcons.md) | 22 | Icônes 3D (billboards Skia tournés vers la caméra) pour marquer des positions du monde : missions, stations, marqueurs de course. Chaque icô |
| [✍ `render_splitScreen`](ge/extensions/render/splitScreen.md) | 17 | Écran partagé (multiseat) : crée une vue de rendu par joueur (RenderViewManagerInstance, vues nommées 'splitscreen0', 'splitscreen1'...), ca |
| [✍ `render_splitScreenLayouts`](ge/extensions/render/splitScreenLayouts.md) | 5 | Catalogue des dispositions d'écran partagé, utilisé par render_splitScreen. Il fournit des dispositions prédéfinies pour 2, 3 et 4 joueurs,  |
| [✍ `render_viewDemo`](ge/extensions/render/viewDemo.md) | 1 | Petit exemple d'utilisation des vues de rendu (RenderViewManagerInstance) : crée une vue nommée 'Demo view 1' rendue dans une texture nommée |
| [✍ `scenario_busdriver`](ge/extensions/scenario/busdriver.md) | 14 | Scénario de conduite de bus (itinéraire de ligne avec arrêts). À partir de la configuration scenario.busdriver (routeID, variance, strictSto |
| [✍ `scenario_damageGoal`](ge/extensions/scenario/damageGoal.md) | 3 | Objectif de scénario « damage » (goals.vehicles avec id = 'damage'). Il surveille le dégât du véhicule (map.objects[...].damage) à chaque ti |
| [✍ `scenario_demolitionDerby`](ge/extensions/scenario/demolitionDerby.md) | 2 | Extension de scénario de type démolition : elle déclare vainqueur le dernier véhicule encore en mouvement. Chaque seconde, elle compare la p |
| [✍ `scenario_distanceGoal`](ge/extensions/scenario/distanceGoal.md) | 3 | Objectif de scénario « distance » (goals.vehicles avec id = 'distance') : la distance entre le véhicule du goal et un objet cible du scenetr |
| [✍ `scenario_driftGoal`](ge/extensions/scenario/driftGoal.md) | 3 | Objectif de scénario « drift » (goals.vehicles avec id = 'drift'). Il calcule un score de dérive à partir de l'écart entre la direction du v |
| [✍ `scenario_finishRaceGoal`](ge/extensions/scenario/finishRaceGoal.md) | 3 | Objectif de scénario « finishRace » (goals.vehicles avec id = 'finishRace') : le véhicule doit terminer la course. Il écoute le dernier wayp |
| [✍ `scenario_nomoveGoal`](ge/extensions/scenario/nomoveGoal.md) | 3 | Objectif de scénario « nomove » (goals.vehicles avec id = 'nomove') : le véhicule ne doit pas bouger de plus de 0.1 m par rapport à sa posit |
| [✍ `scenario_positionGoal`](ge/extensions/scenario/positionGoal.md) | 3 | Objectif de scénario « position » (goals.vehicles avec id = 'position') : en fin de course, le véhicule doit se trouver dans la zone d'un ob |
| [✍ `scenario_quickRace`](ge/extensions/scenario/quickRace.md) | 14 | Logique d'une course rapide (quickrace) : charge les prefabs et le flowgraph de la piste, crée le véhicule du joueur à la position de départ |
| [✍ `scenario_quickRaceLoader`](ge/extensions/scenario/quickRaceLoader.md) | 12 | Chargeur des courses rapides (quickrace). Il parcourt les niveaux (levels/<niveau>/quickrace/*.json, fichiers .race.json compris) et les pis |
| [✍ `scenario_raceDebug`](ge/extensions/scenario/raceDebug.md) | 2 | Aide de débogage visuel pour les courses de scénario : calcule le chemin entre les waypoints de lapConfig (map.getPath) et le dessine avec d |
| [✍ `scenario_raceGoals`](ge/extensions/scenario/raceGoals.md) | 8 | Distributeur des objectifs (goals) d'un scénario. À l'initialisation il lit les goals déclarés dans scenario.vehicles[nom].goal du JSON, cré |
| [✍ `scenario_raceMarkers_attention`](ge/extensions/scenario/raceMarkers/attention.md) | 10 | Marqueur de checkpoint « flèche d'attention » : une flèche bleue (modèle s_mm_arrow_ribbon_down.dae) qui flotte au-dessus du point, tournée  |
| [✍ `scenario_raceMarkers_crawlMarker`](ge/extensions/scenario/raceMarkers/crawlMarker.md) | 14 | Marqueur de checkpoint pour les parcours de franchissement (crawl) : une flèche flottante qui regarde la caméra, deux drapeaux orange planté |
| [✍ `scenario_raceMarkers_cylinderMarker`](ge/extensions/scenario/raceMarkers/cylinderMarker.md) | 10 | Marqueur de checkpoint « cylindre » : une base plate au sol (checkpoint_marker_base.dae) et un cylindre haut de 50 unités (checkpoint_marker |
| [✍ `scenario_raceMarkers_directionMarker`](ge/extensions/scenario/raceMarkers/directionMarker.md) | 10 | Marqueur de checkpoint « flèche de direction » : une flèche flottante (s_mm_arrow_floating.dae) orientée selon la rotation du checkpoint, av |
| [✍ `scenario_raceMarkers_dragStagePlane`](ge/extensions/scenario/raceMarkers/dragStagePlane.md) | 12 | Marqueur de zone de placement (staging) pour les courses de dragster : dessine avec debugDrawer des plans translucides au sol (ligne de dépa |
| [✍ `scenario_raceMarkers_noneMarker`](ge/extensions/scenario/raceMarkers/noneMarker.md) | 9 | Marqueur de checkpoint « vide » : il implémente l'interface commune des marqueurs de course (init, update, setToCheckpoint, setMode, setVisi |
| [✍ `scenario_raceMarkers_overhead`](ge/extensions/scenario/raceMarkers/overhead.md) | 10 | Marqueur de checkpoint « flèche en hauteur » : une flèche (s_mm_arrow_ribbon_down.dae) tournée vers la caméra, qui oscille verticalement au- |
| [✍ `scenario_raceMarkers_parkingAttention`](ge/extensions/scenario/raceMarkers/parkingAttention.md) | 9 | Marqueur d'attention pour une place de parking : dessine en debug (debugDrawer:drawTriSolid) les quatre parois bleues translucides (alpha 25 |
| [✍ `scenario_raceMarkers_parkingraceSpotMarker`](ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.md) | 9 | Marqueur d'une place de parking pour les courses de parking : trois contours empilés (park_outline_marker.dae, hauteur 1.2 m) et un décalque |
| [✍ `scenario_raceMarkers_ringMarker`](ge/extensions/scenario/raceMarkers/ringMarker.md) | 10 | Marqueur de checkpoint « anneau » : un anneau 3D (checkpoint_ring.dae, ou checkpoint_ring_finish.dae pour les modes lap et final) orienté se |
| [✍ `scenario_raceMarkers_sideColumnMarker`](ge/extensions/scenario/raceMarkers/sideColumnMarker.md) | 13 | Marqueur de checkpoint par défaut de scenario_race_marker : deux colonnes (modèle single_faded_column.dae) de part et d'autre du passage, pl |
| [✍ `scenario_raceMarkers_sideHologramMarker`](ge/extensions/scenario/raceMarkers/sideHologramMarker.md) | 11 | Marqueur de checkpoint « portique hologramme » : deux piliers (portail gauche et droit), chacun avec un cône au sol, une colonne haute, un c |
| [✍ `scenario_raceMarkers_sideMarker`](ge/extensions/scenario/raceMarkers/sideMarker.md) | 10 | Marqueur de checkpoint « courbes latérales » : une base au sol (checkpoint_curve_base.dae), des courbes latérales actives (checkpoint_curve_ |
| [✍ `scenario_raceMarkers_singleHologramMarker`](ge/extensions/scenario/raceMarkers/singleHologramMarker.md) | 11 | Marqueur de checkpoint « colonne hologramme » : une seule colonne centrale (s_single_faded_column_rect.dae) posée sur le sol par lancer de r |
| [✍ `scenario_raceMarkers_zoneAttention`](ge/extensions/scenario/raceMarkers/zoneAttention.md) | 12 | Marqueur d'attention pour une zone (polygone) : au lieu d'un objet 3D, il demande à l'objet zone de se dessiner lui-même (zone:drawDebug('fa |
| [✍ `scenario_raceUI`](ge/extensions/scenario/raceUI.md) | 5 | Pont entre la course de scénario et l'interface : envoie à l'UI la progression des waypoints (WayPointChange), des tours (RaceLapChange) et  |
| [✍ `scenario_race_marker`](ge/extensions/scenario/race_marker.md) | 10 | Gestionnaire des marqueurs 3D de checkpoints d'une course de scénario. Il crée un marqueur par waypoint avec le type choisi (module scenario |
| [✍ `scenario_scenariohelper`](ge/extensions/scenario/scenariohelper.md) | 17 | Boîte à outils des scénarios (extension GE scenario_scenariohelper). Elle enveloppe l'envoi de commandes Lua à un véhicule par son nom dans  |
| [✍ `scenario_scenarios`](ge/extensions/scenario/scenarios.md) | 45 | Cœur du mode « scénario » : machine à états qui charge le niveau d'un scénario, fait apparaître ses prefabs et véhicules, gère la phase d'in |
| [✍ `scenario_scenariosLoader`](ge/extensions/scenario/scenariosLoader.md) | 9 | Charge et normalise les fichiers de scénario (.json dans levels/<niveau>/scenarios/), les listes pour l'UI et les démarre. processScenarioDa |
| [✍ `scenario_speedGoal`](ge/extensions/scenario/speedGoal.md) | 3 | But de scénario « speed » : surveille la vitesse d'un véhicule et gagne ou échoue quand elle reste hors de la plage [minSpeed, maxSpeed] plu |
| [✍ `scenario_timeLimit`](ge/extensions/scenario/timeLimit.md) | 3 | But de scénario « timeLimit » : le scénario doit être terminé en moins de maxTime secondes. Chargé par scenario_raceGoals (init, processStat |
| [✍ `scenario_waypointAction`](ge/extensions/scenario/waypointAction.md) | 3 | But de scénario « wayPointAction » : affiche un message à l'écran quand un véhicule atteint certains waypoints de la course. Chargé par scen |
| [✍ `scenario_waypoints`](ge/extensions/scenario/waypoints.md) | 14 | Système de waypoints d'un scénario de course : à partir de scenario.lapConfig (liste ordonnée de waypoints/triggers) et des branches (lapCon |
| [`statistics_statistics`](ge/extensions/statistics/statistics.md) | 23 |  |
| [`telemetry_clientFacts`](ge/extensions/telemetry/clientFacts.md) | 4 |  |
| [`telemetry_clientFacts.test`](ge/extensions/telemetry/clientFacts.test.md) | 6 |  |
| [`telemetry_configManager`](ge/extensions/telemetry/configManager.md) | 11 |  |
| [`telemetry_configManager.test`](ge/extensions/telemetry/configManager.test.md) | 1 | Run with: |
| [`telemetry_core`](ge/extensions/telemetry/core.md) | 16 |  |
| [`telemetry_core.test`](ge/extensions/telemetry/core.test.md) | 1 | Run with: |
| [`telemetry_hardwareAudio`](ge/extensions/telemetry/hardwareAudio.md) | 1 |  |
| [`telemetry_hardwareAudio.test`](ge/extensions/telemetry/hardwareAudio.test.md) | 4 |  |
| [`telemetry_hardwareChanges`](ge/extensions/telemetry/hardwareChanges.md) | 3 |  |
| [`telemetry_hardwareChanges.test`](ge/extensions/telemetry/hardwareChanges.test.md) | 4 |  |
| [`telemetry_hardwareInput`](ge/extensions/telemetry/hardwareInput.md) | 3 |  |
| [`telemetry_hardwareInput.test`](ge/extensions/telemetry/hardwareInput.test.md) | 6 |  |
| [`telemetry_performanceMetrics`](ge/extensions/telemetry/performanceMetrics.md) | 4 |  |
| [`telemetry_performanceSpatialConfig`](ge/extensions/telemetry/performanceSpatialConfig.md) | 1 |  |
| [`telemetry_performanceSpatialConfig.test`](ge/extensions/telemetry/performanceSpatialConfig.test.md) | 7 |  |
| [`telemetry_performanceSpatialDetector`](ge/extensions/telemetry/performanceSpatialDetector.md) | 5 |  |
| [`telemetry_performanceSpatialDetector.test`](ge/extensions/telemetry/performanceSpatialDetector.test.md) | 10 |  |
| [`telemetry_performanceSpatialGameplayExit`](ge/extensions/telemetry/performanceSpatialGameplayExit.md) | 2 |  |
| [`telemetry_performanceSpatialGameplayExit.test`](ge/extensions/telemetry/performanceSpatialGameplayExit.test.md) | 10 |  |
| [`telemetry_performanceSpatialSnapshot`](ge/extensions/telemetry/performanceSpatialSnapshot.md) | 1 |  |
| [`telemetry_performanceSpatialSnapshot.test`](ge/extensions/telemetry/performanceSpatialSnapshot.test.md) | 3 |  |
| [`telemetry_reporters_jsonFileReporter`](ge/extensions/telemetry/reporters/jsonFileReporter.md) | 1 |  |
| [`telemetry_trackers_career`](ge/extensions/telemetry/trackers/career.md) | 5 |  |
| [`telemetry_trackers_controls`](ge/extensions/telemetry/trackers/controls.md) | 4 |  |
| [`telemetry_trackers_editor`](ge/extensions/telemetry/trackers/editor.md) | 6 |  |
| [`telemetry_trackers_gameplay_firstDrive`](ge/extensions/telemetry/trackers/gameplay/firstDrive.md) | 8 |  |
| [`telemetry_trackers_gameplay_missions`](ge/extensions/telemetry/trackers/gameplay/missions.md) | 11 |  |
| [`telemetry_trackers_gameplay_other`](ge/extensions/telemetry/trackers/gameplay/other.md) | 7 |  |
| [`telemetry_trackers_hardware`](ge/extensions/telemetry/trackers/hardware.md) | 4 |  |
| [`telemetry_trackers_level`](ge/extensions/telemetry/trackers/level.md) | 11 |  |
| [`telemetry_trackers_mcp`](ge/extensions/telemetry/trackers/mcp.md) | 2 |  |
| [`telemetry_trackers_memory`](ge/extensions/telemetry/trackers/memory.md) | 2 |  |
| [`telemetry_trackers_mods`](ge/extensions/telemetry/trackers/mods.md) | 2 |  |
| [`telemetry_trackers_performance`](ge/extensions/telemetry/trackers/performance.md) | 2 |  |
| [`telemetry_trackers_performanceSpatial`](ge/extensions/telemetry/trackers/performanceSpatial.md) | 7 |  |
| [`telemetry_trackers_performanceWarnings`](ge/extensions/telemetry/trackers/performanceWarnings.md) | 2 |  |
| [`telemetry_trackers_physics`](ge/extensions/telemetry/trackers/physics.md) | 2 |  |
| [`telemetry_trackers_session`](ge/extensions/telemetry/trackers/session.md) | 4 |  |
| [`telemetry_trackers_settings`](ge/extensions/telemetry/trackers/settings.md) | 1 |  |
| [`telemetry_trackers_splitscreen`](ge/extensions/telemetry/trackers/splitscreen.md) | 10 |  |
| [`telemetry_trackers_traffic`](ge/extensions/telemetry/trackers/traffic.md) | 7 |  |
| [`telemetry_trackers_ui`](ge/extensions/telemetry/trackers/ui.md) | 5 |  |
| [`telemetry_trackers_vehicle`](ge/extensions/telemetry/trackers/vehicle.md) | 7 |  |
| [`telemetry_userIdentity`](ge/extensions/telemetry/userIdentity.md) | 2 |  |
| [`telemetry_vehicleInfo`](ge/extensions/telemetry/vehicleInfo.md) | 2 |  |
| [`trackbuilder_trackBuilder`](ge/extensions/trackbuilder/trackBuilder.md) | 25 |  |
| [`ui_ambientSound`](ge/extensions/ui/ambientSound.md) | 4 |  |
| [`ui_appContainers`](ge/extensions/ui/appContainers.md) | 17 |  |
| [`ui_appContainers_topCenter`](ge/extensions/ui/appContainers/topCenter.md) | 28 |  |
| [`ui_appContainers_topLeft`](ge/extensions/ui/appContainers/topLeft.md) | 1 |  |
| [`ui_appContainers_topRight`](ge/extensions/ui/appContainers/topRight.md) | 1 |  |
| [`ui_appLayouts`](ge/extensions/ui/appLayouts.md) | 23 |  |
| [`ui_appSelector_general`](ge/extensions/ui/appSelector/general.md) | 31 |  |
| [`ui_apps`](ge/extensions/ui/apps.md) | 4 |  |
| [`ui_apps_genericMissionData`](ge/extensions/ui/apps/genericMissionData.md) | 4 |  |
| [`ui_apps_minimap_additionalInfo`](ge/extensions/ui/apps/minimap/additionalInfo.md) | 6 |  |
| [`ui_apps_minimap_layers`](ge/extensions/ui/apps/minimap/layers.md) | 0 |  |
| [`ui_apps_minimap_minimap`](ge/extensions/ui/apps/minimap/minimap.md) | 15 |  |
| [`ui_apps_minimap_roads`](ge/extensions/ui/apps/minimap/roads.md) | 2 |  |
| [`ui_apps_minimap_route`](ge/extensions/ui/apps/minimap/route.md) | 2 |  |
| [`ui_apps_minimap_topomap`](ge/extensions/ui/apps/minimap/topomap.md) | 9 |  |
| [`ui_apps_minimap_utils`](ge/extensions/ui/apps/minimap/utils.md) | 19 |  |
| [`ui_apps_minimap_vehicles`](ge/extensions/ui/apps/minimap/vehicles.md) | 3 |  |
| [`ui_apps_missionControls`](ge/extensions/ui/apps/missionControls.md) | 5 |  |
| [`ui_apps_pointsBar`](ge/extensions/ui/apps/pointsBar.md) | 5 |  |
| [`ui_arrowGPS`](ge/extensions/ui/arrowGPS.md) | 7 |  |
| [`ui_arrowGPS.test`](ge/extensions/ui/arrowGPS.test.md) | 8 | Run with require('testFramework/TestManager'):runTestFiles('ui/arrowGPS') |
| [`ui_audio`](ge/extensions/ui/audio.md) | 5 |  |
| [`ui_bindingsLegend`](ge/extensions/ui/bindingsLegend.md) | 22 |  |
| [`ui_busRouteSelector_general`](ge/extensions/ui/busRouteSelector/general.md) | 0 |  |
| [`ui_cameraDistanceApp`](ge/extensions/ui/cameraDistanceApp.md) | 1 |  |
| [`ui_console`](ge/extensions/ui/console.md) | 12 |  |
| [`ui_credits`](ge/extensions/ui/credits.md) | 5 |  |
| [`ui_extApp`](ge/extensions/ui/extApp.md) | 4 |  |
| [`ui_fadeScreen`](ge/extensions/ui/fadeScreen.md) | 9 |  |
| [`ui_firstDrive_moveOff`](ge/extensions/ui/firstDrive/moveOff.md) | 10 |  |
| [`ui_freeroamSelector_general`](ge/extensions/ui/freeroamSelector/general.md) | 49 |  |
| [`ui_frustumOffset`](ge/extensions/ui/frustumOffset.md) | 2 |  |
| [`ui_gameBlur`](ge/extensions/ui/gameBlur.md) | 4 |  |
| [`ui_gamemodes_gamemodesTabProvider`](ge/extensions/ui/gamemodes/gamemodesTabProvider.md) | 10 |  |
| [`ui_gameplayScoreboard`](ge/extensions/ui/gameplayScoreboard.md) | 11 |  |
| [`ui_gameplaySelector_general`](ge/extensions/ui/gameplaySelector/general.md) | 51 |  |
| [`ui_gameplaySelector_tileClustering`](ge/extensions/ui/gameplaySelector/tileClustering.md) | 7 |  |
| [`ui_gameplaySelector_tileGenerators_campaignTiles`](ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.md) | 2 |  |
| [`ui_gameplaySelector_tileGenerators_discoverTiles`](ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.md) | 3 |  |
| [`ui_gameplaySelector_tileGenerators_levelTiles`](ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.md) | 6 |  |
| [`ui_gameplaySelector_tileGenerators_missionTiles`](ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.md) | 2 |  |
| [`ui_gameplaySelector_tileGenerators_scenarioTiles`](ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.md) | 2 |  |
| [`ui_gameplaySelector_tileSorting`](ge/extensions/ui/gameplaySelector/tileSorting.md) | 10 | Tile Sorting Module for Gameplay Selector |
| [`ui_gameplaySelector_tiles`](ge/extensions/ui/gameplaySelector/tiles.md) | 2 |  |
| [`ui_garage_routeLifecycleCallbacks`](ge/extensions/ui/garage/routeLifecycleCallbacks.md) | 3 |  |
| [`ui_gridSelector`](ge/extensions/ui/gridSelector.md) | 31 |  |
| [`ui_gridSelectorRouteLifecycleCallbacks`](ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.md) | 3 |  |
| [`ui_gridSelectorUtils_buttonModule`](ge/extensions/ui/gridSelectorUtils/buttonModule.md) | 1 |  |
| [`ui_gridSelectorUtils_displayDataModule`](ge/extensions/ui/gridSelectorUtils/displayDataModule.md) | 1 |  |
| [`ui_gridSelectorUtils_filterModule`](ge/extensions/ui/gridSelectorUtils/filterModule.md) | 1 |  |
| [`ui_gridSelectorUtils_tilesModule`](ge/extensions/ui/gridSelectorUtils/tilesModule.md) | 1 |  |
| [`ui_gridSelectorUtils_translateHelper`](ge/extensions/ui/gridSelectorUtils/translateHelper.md) | 1 |  |
| [`ui_legal`](ge/extensions/ui/legal.md) | 2 |  |
| [`ui_lightRunnerSelector_general`](ge/extensions/ui/lightRunnerSelector/general.md) | 0 |  |
| [`ui_liveries`](ge/extensions/ui/liveries.md) | 4 |  |
| [`ui_liveries_camera`](ge/extensions/ui/liveries/camera.md) | 15 |  |
| [`ui_liveries_decal`](ge/extensions/ui/liveries/decal.md) | 49 |  |
| [`ui_liveries_fill`](ge/extensions/ui/liveries/fill.md) | 5 |  |
| [`ui_liveries_paint`](ge/extensions/ui/liveries/paint.md) | 4 |  |
| [`ui_liveries_routeLifecycleCallbacks`](ge/extensions/ui/liveries/routeLifecycleCallbacks.md) | 20 |  |
| [`ui_liveries_saves`](ge/extensions/ui/liveries/saves.md) | 11 |  |
| [`ui_liveries_textures`](ge/extensions/ui/liveries/textures.md) | 7 |  |
| [`ui_menuManager`](ge/extensions/ui/menuManager.md) | 10 |  |
| [`ui_menuRouteLifecycleCallbacks`](ge/extensions/ui/menuRouteLifecycleCallbacks.md) | 1 |  |
| [`ui_messagesDebugger`](ge/extensions/ui/messagesDebugger.md) | 4 |  |
| [`ui_missionInfo`](ge/extensions/ui/missionInfo.md) | 8 |  |
| [`ui_multiseat_assignmentCache`](ge/extensions/ui/multiseat/assignmentCache.md) | 3 |  |
| [`ui_multiseat_freeroam`](ge/extensions/ui/multiseat/freeroam.md) | 14 |  |
| [`ui_multiseat_generalSettings`](ge/extensions/ui/multiseat/generalSettings.md) | 5 |  |
| [`ui_multiseat_multiseatConfiguration`](ge/extensions/ui/multiseat/multiseatConfiguration.md) | 24 |  |
| [`ui_multiseat_multiseatSettings`](ge/extensions/ui/multiseat/multiseatSettings.md) | 32 |  |
| [`ui_multiseat_multiseatVehicles`](ge/extensions/ui/multiseat/multiseatVehicles.md) | 63 |  |
| [`ui_oneshotRaceSelector_core`](ge/extensions/ui/oneshotRaceSelector/core.md) | 2 |  |
| [`ui_oneshotRaceSelector_quickRaceTrackDescriptor`](ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.md) | 1 |  |
| [`ui_options`](ge/extensions/ui/options.md) | 2 |  |
| [`ui_pause_actions`](ge/extensions/ui/pause/actions.md) | 12 |  |
| [`ui_pause_camera`](ge/extensions/ui/pause/camera.md) | 6 |  |
| [`ui_pause_features_homeRail`](ge/extensions/ui/pause/features/homeRail.md) | 1 |  |
| [`ui_pause_photomode`](ge/extensions/ui/pause/photomode.md) | 6 |  |
| [`ui_pause_providers_missionObjectives`](ge/extensions/ui/pause/providers/missionObjectives.md) | 1 |  |
| [`ui_pause_providers_nearbyActivities`](ge/extensions/ui/pause/providers/nearbyActivities.md) | 2 |  |
| [`ui_pause_providers_routeData_career`](ge/extensions/ui/pause/providers/routeData/career.md) | 4 |  |
| [`ui_pause_providers_routeData_common`](ge/extensions/ui/pause/providers/routeData/common.md) | 6 |  |
| [`ui_pause_providers_routeData_environment`](ge/extensions/ui/pause/providers/routeData/environment.md) | 5 |  |
| [`ui_pause_providers_routeData_gamemodes`](ge/extensions/ui/pause/providers/routeData/gamemodes.md) | 3 |  |
| [`ui_pause_providers_routeData_home`](ge/extensions/ui/pause/providers/routeData/home.md) | 4 |  |
| [`ui_pause_providers_routeData_multiplayer`](ge/extensions/ui/pause/providers/routeData/multiplayer.md) | 4 |  |
| [`ui_pause_providers_routeData_photomode`](ge/extensions/ui/pause/providers/routeData/photomode.md) | 1 |  |
| [`ui_pause_providers_routeData_system`](ge/extensions/ui/pause/providers/routeData/system.md) | 1 |  |
| [`ui_pause_providers_routeData_vehicle`](ge/extensions/ui/pause/providers/routeData/vehicle.md) | 10 |  |
| [`ui_pause_providers_trafficControls`](ge/extensions/ui/pause/providers/trafficControls.md) | 2 |  |
| [`ui_pause_providers_vehicleTabInteractions`](ge/extensions/ui/pause/providers/vehicleTabInteractions.md) | 18 |  |
| [`ui_pause_routeLifecycleCallbacks`](ge/extensions/ui/pause/routeLifecycleCallbacks.md) | 9 |  |
| [`ui_pause_vehicleConfigurationGuard`](ge/extensions/ui/pause/vehicleConfigurationGuard.md) | 7 |  |
| [`ui_pause_vehicleConfigurationOccupants`](ge/extensions/ui/pause/vehicleConfigurationOccupants.md) | 16 |  |
| [`ui_photomode_advancedRender`](ge/extensions/ui/photomode/advancedRender.md) | 16 |  |
| [`ui_photomode_camera`](ge/extensions/ui/photomode/camera.md) | 24 |  |
| [`ui_photomode_capture`](ge/extensions/ui/photomode/capture.md) | 26 |  |
| [`ui_photomode_effects`](ge/extensions/ui/photomode/effects.md) | 11 |  |
| [`ui_photomode_flash`](ge/extensions/ui/photomode/flash.md) | 10 |  |
| [`ui_photomode_overlays`](ge/extensions/ui/photomode/overlays.md) | 13 |  |
| [`ui_photomode_postFxPersistence`](ge/extensions/ui/photomode/postFxPersistence.md) | 2 |  |
| [`ui_photomode_presets`](ge/extensions/ui/photomode/presets.md) | 12 |  |
| [`ui_photomode_preview`](ge/extensions/ui/photomode/preview.md) | 4 |  |
| [`ui_photomode_scene`](ge/extensions/ui/photomode/scene.md) | 13 |  |
| [`ui_photomode_session`](ge/extensions/ui/photomode/session.md) | 22 |  |
| [`ui_photomode_shared`](ge/extensions/ui/photomode/shared.md) | 20 |  |
| [`ui_photomode_speedCameraOverlay`](ge/extensions/ui/photomode/speedCameraOverlay.md) | 1 |  |
| [`ui_policeInfo`](ge/extensions/ui/policeInfo.md) | 8 |  |
| [`ui_popup`](ge/extensions/ui/popup.md) | 13 |  |
| [`ui_quickraceSelector_general`](ge/extensions/ui/quickraceSelector/general.md) | 0 |  |
| [`ui_router`](ge/extensions/ui/router.md) | 25 |  |
| [`ui_router_config`](ge/extensions/ui/router/config.md) | 0 |  |
| [`ui_router_constants`](ge/extensions/ui/router/constants.md) | 0 |  |
| [`ui_router_debug`](ge/extensions/ui/router/debug.md) | 5 |  |
| [`ui_router_guards_default`](ge/extensions/ui/router/guards/default.md) | 3 |  |
| [`ui_router_guards_legal`](ge/extensions/ui/router/guards/legal.md) | 0 |  |
| [`ui_router_guards_multiseat`](ge/extensions/ui/router/guards/multiseat.md) | 0 |  |
| [`ui_router_guards_photomode`](ge/extensions/ui/router/guards/photomode.md) | 0 |  |
| [`ui_router_guards_vehicleConfiguration`](ge/extensions/ui/router/guards/vehicleConfiguration.md) | 0 |  |
| [`ui_router_lifecycleExecutor`](ge/extensions/ui/router/lifecycleExecutor.md) | 3 |  |
| [`ui_router_managers_breadcrumbManager`](ge/extensions/ui/router/managers/breadcrumbManager.md) | 3 |  |
| [`ui_router_managers_frameworkManager`](ge/extensions/ui/router/managers/frameworkManager.md) | 3 |  |
| [`ui_router_managers_guardManager`](ge/extensions/ui/router/managers/guardManager.md) | 5 |  |
| [`ui_router_managers_scopeManager`](ge/extensions/ui/router/managers/scopeManager.md) | 3 |  |
| [`ui_router_managers_transitionManager`](ge/extensions/ui/router/managers/transitionManager.md) | 22 |  |
| [`ui_router_models_PendingTransition`](ge/extensions/ui/router/models/PendingTransition.md) | 6 |  |
| [`ui_router_models_ResolvedRoute`](ge/extensions/ui/router/models/ResolvedRoute.md) | 10 |  |
| [`ui_router_navigationObserver`](ge/extensions/ui/router/navigationObserver.md) | 5 |  |
| [`ui_router_navigationObserver.test`](ge/extensions/ui/router/navigationObserver.test.md) | 11 |  |
| [`ui_router_navigationProtection.test`](ge/extensions/ui/router/navigationProtection.test.md) | 15 |  |
| [`ui_router_navigationState`](ge/extensions/ui/router/navigationState.md) | 25 |  |
| [`ui_router_routeFailure.test`](ge/extensions/ui/router/routeFailure.test.md) | 5 |  |
| [`ui_router_routeHandlers`](ge/extensions/ui/router/routeHandlers.md) | 1 |  |
| [`ui_router_routeHandlers_careerExitHandlers`](ge/extensions/ui/router/routeHandlers/careerExitHandlers.md) | 3 |  |
| [`ui_router_routeHandlers_mainMenuExitHandlers`](ge/extensions/ui/router/routeHandlers/mainMenuExitHandlers.md) | 1 |  |
| [`ui_router_routeHandlers_missionExitHandlers`](ge/extensions/ui/router/routeHandlers/missionExitHandlers.md) | 3 |  |
| [`ui_router_routeHandlers_radialExitHandlers`](ge/extensions/ui/router/routeHandlers/radialExitHandlers.md) | 1 |  |
| [`ui_router_routeHandlers_rootExitHandlers`](ge/extensions/ui/router/routeHandlers/rootExitHandlers.md) | 1 |  |
| [`ui_router_routeManager`](ge/extensions/ui/router/routeManager.md) | 10 |  |
| [`ui_router_routeManager.test`](ge/extensions/ui/router/routeManager.test.md) | 19 |  |
| [`ui_router_routeReference`](ge/extensions/ui/router/routeReference.md) | 4 |  |
| [`ui_router_routeReference.test`](ge/extensions/ui/router/routeReference.test.md) | 20 |  |
| [`ui_router_routes`](ge/extensions/ui/router/routes.md) | 0 |  |
| [`ui_router_routes_bigmap`](ge/extensions/ui/router/routes/bigmap.md) | 0 |  |
| [`ui_router_routes_busRouteWizard`](ge/extensions/ui/router/routes/busRouteWizard.md) | 0 |  |
| [`ui_router_routes_campaign`](ge/extensions/ui/router/routes/campaign.md) | 0 |  |
| [`ui_router_routes_career`](ge/extensions/ui/router/routes/career.md) | 0 |  |
| [`ui_router_routes_debug`](ge/extensions/ui/router/routes/debug.md) | 0 |  |
| [`ui_router_routes_decals`](ge/extensions/ui/router/routes/decals.md) | 0 |  |
| [`ui_router_routes_default`](ge/extensions/ui/router/routes/default.md) | 0 |  |
| [`ui_router_routes_firstDrive`](ge/extensions/ui/router/routes/firstDrive.md) | 0 |  |
| [`ui_router_routes_freeroamLevels`](ge/extensions/ui/router/routes/freeroamLevels.md) | 0 |  |
| [`ui_router_routes_freeroamWizard`](ge/extensions/ui/router/routes/freeroamWizard.md) | 0 |  |
| [`ui_router_routes_garage`](ge/extensions/ui/router/routes/garage.md) | 0 |  |
| [`ui_router_routes_global`](ge/extensions/ui/router/routes/global.md) | 0 |  |
| [`ui_router_routes_legal`](ge/extensions/ui/router/routes/legal.md) | 0 |  |
| [`ui_router_routes_lightrunnerWizard`](ge/extensions/ui/router/routes/lightrunnerWizard.md) | 0 |  |
| [`ui_router_routes_liveries`](ge/extensions/ui/router/routes/liveries.md) | 0 |  |
| [`ui_router_routes_menu`](ge/extensions/ui/router/routes/menu.md) | 0 |  |
| [`ui_router_routes_mission`](ge/extensions/ui/router/routes/mission.md) | 0 |  |
| [`ui_router_routes_mods`](ge/extensions/ui/router/routes/mods.md) | 0 |  |
| [`ui_router_routes_multiplayer`](ge/extensions/ui/router/routes/multiplayer.md) | 0 |  |
| [`ui_router_routes_multiseat`](ge/extensions/ui/router/routes/multiseat.md) | 0 |  |
| [`ui_router_routes_options`](ge/extensions/ui/router/routes/options.md) | 0 |  |
| [`ui_router_routes_pause`](ge/extensions/ui/router/routes/pause.md) | 0 |  |
| [`ui_router_routes_quickraceWizard`](ge/extensions/ui/router/routes/quickraceWizard.md) | 0 |  |
| [`ui_router_routes_radial`](ge/extensions/ui/router/routes/radial.md) | 0 |  |
| [`ui_router_routes_scenario`](ge/extensions/ui/router/routes/scenario.md) | 0 |  |
| [`ui_router_routes_taxi`](ge/extensions/ui/router/routes/taxi.md) | 0 |  |
| [`ui_router_routes_trackBuilder`](ge/extensions/ui/router/routes/trackBuilder.md) | 0 |  |
| [`ui_router_runtimeRouteRegistry`](ge/extensions/ui/router/runtimeRouteRegistry.md) | 3 |  |
| [`ui_router_runtimeRouteRegistry.test`](ge/extensions/ui/router/runtimeRouteRegistry.test.md) | 24 | Run with: |
| [`ui_router_services_navigationContext`](ge/extensions/ui/router/services/navigationContext.md) | 2 |  |
| [`ui_router_services_routeResolver`](ge/extensions/ui/router/services/routeResolver.md) | 2 |  |
| [`ui_router_transitionRecovery.test`](ge/extensions/ui/router/transitionRecovery.test.md) | 10 |  |
| [`ui_router_utils`](ge/extensions/ui/router/utils.md) | 4 |  |
| [`ui_tutorialHighlight`](ge/extensions/ui/tutorialHighlight.md) | 6 |  |
| [`ui_uiMods`](ge/extensions/ui/uiMods.md) | 9 |  |
| [`ui_uiNavi`](ge/extensions/ui/uiNavi.md) | 17 |  |
| [`ui_uiStateManager`](ge/extensions/ui/uiStateManager.md) | 7 |  |
| [`ui_vehiclePaint`](ge/extensions/ui/vehiclePaint.md) | 4 |  |
| [`ui_vehicleRadarApp`](ge/extensions/ui/vehicleRadarApp.md) | 5 |  |
| [`ui_vehicleSelector_detailsInteraction`](ge/extensions/ui/vehicleSelector/detailsInteraction.md) | 10 |  |
| [`ui_vehicleSelector_general`](ge/extensions/ui/vehicleSelector/general.md) | 80 |  |
| [`ui_vehicleSelector_tileClustering`](ge/extensions/ui/vehicleSelector/tileClustering.md) | 6 |  |
| [`ui_vehicleSelector_tileGrouping`](ge/extensions/ui/vehicleSelector/tileGrouping.md) | 5 |  |
| [`ui_vehicleSelector_tileSorting`](ge/extensions/ui/vehicleSelector/tileSorting.md) | 7 |  |
| [`ui_vehicleSelector_tiles`](ge/extensions/ui/vehicleSelector/tiles.md) | 6 |  |
| [`ui_vehicleSelector_vehicleMetadataEditor`](ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.md) | 1 |  |
| [`ui_vehicleSelector_vehicleOperations`](ge/extensions/ui/vehicleSelector/vehicleOperations.md) | 14 |  |
| [`ui_vehicleSelector_vehicleSpecifications`](ge/extensions/ui/vehicleSelector/vehicleSpecifications.md) | 5 |  |
| [`ui_visibility`](ge/extensions/ui/visibility.md) | 8 |  |
| [`util_asyncBulkLoader`](ge/extensions/util/asyncBulkLoader.md) | 19 |  |
| [`util_autoAnnotation`](ge/extensions/util/autoAnnotation.md) | 6 |  |
| [`util_bakeTest`](ge/extensions/util/bakeTest.md) | 2 | Dev-only: drives the GPU material baker + glTF exporter over a hardcoded set of |
| [`util_booster`](ge/extensions/util/booster.md) | 1 |  |
| [`util_calibrateESC`](ge/extensions/util/calibrateESC.md) | 7 |  |
| [`util_compileImposters`](ge/extensions/util/compileImposters.md) | 5 |  |
| [`util_compileMeshes`](ge/extensions/util/compileMeshes.md) | 2 |  |
| [`util_configListGenerator`](ge/extensions/util/configListGenerator.md) | 3 |  |
| [`util_datastore`](ge/extensions/util/datastore.md) | 17 |  |
| [`util_decalRoadsEditor`](ge/extensions/util/decalRoadsEditor.md) | 3 |  |
| [`util_dependencyTree`](ge/extensions/util/dependencyTree.md) | 1 |  |
| [`util_docCreator`](ge/extensions/util/docCreator.md) | 2 |  |
| [`util_export`](ge/extensions/util/export.md) | 7 |  |
| [`util_followTheWhiteRabbit`](ge/extensions/util/followTheWhiteRabbit.md) | 2 |  |
| [`util_forestGenerator`](ge/extensions/util/forestGenerator.md) | 11 |  |
| [`util_groundModelDebug`](ge/extensions/util/groundModelDebug.md) | 5 |  |
| [`util_inputSystemUtils`](ge/extensions/util/inputSystemUtils.md) | 2 |  |
| [`util_instancedLineRenderDemo`](ge/extensions/util/instancedLineRenderDemo.md) | 2 |  |
| [`util_jbeamStats`](ge/extensions/util/jbeamStats.md) | 1 |  |
| [`util_lawnMower`](ge/extensions/util/lawnMower.md) | 9 |  |
| [`util_logStreams`](ge/extensions/util/logStreams.md) | 6 |  |
| [`util_materialDebugViz`](ge/extensions/util/materialDebugViz.md) | 5 |  |
| [`util_materialHotReload`](ge/extensions/util/materialHotReload.md) | 2 | Hot-reloads *.materials.json files on disk change: re-parses the file (patching |
| [`util_nodeBeamExport`](ge/extensions/util/nodeBeamExport.md) | 2 |  |
| [`util_nodeStream`](ge/extensions/util/nodeStream.md) | 3 |  |
| [`util_optickRollingCapture`](ge/extensions/util/optickRollingCapture.md) | 1 |  |
| [`util_photomode`](ge/extensions/util/photomode.md) | 1 |  |
| [`util_photomodeAttach`](ge/extensions/util/photomodeAttach.md) | 3 |  |
| [`util_photomodeFlash`](ge/extensions/util/photomodeFlash.md) | 6 |  |
| [`util_procTrack`](ge/extensions/util/procTrack.md) | 27 |  |
| [`util_rectangleGen`](ge/extensions/util/rectangleGen.md) | 2 |  |
| [`util_renderComponentsAPI`](ge/extensions/util/renderComponentsAPI.md) | 1 |  |
| [`util_resaveMaterials`](ge/extensions/util/resaveMaterials.md) | 2 |  |
| [`util_resolution`](ge/extensions/util/resolution.md) | 2 |  |
| [`util_richPresence`](ge/extensions/util/richPresence.md) | 37 |  |
| [`util_saveDynamicData`](ge/extensions/util/saveDynamicData.md) | 7 |  |
| [`util_screenshotCreator`](ge/extensions/util/screenshotCreator.md) | 9 |  |
| [`util_screenshotCreator_capture`](ge/extensions/util/screenshotCreator/capture.md) | 2 |  |
| [`util_screenshotCreator_currentConfigThumbnail`](ge/extensions/util/screenshotCreator/currentConfigThumbnail.md) | 3 |  |
| [`util_screenshotCreator_framing_configured`](ge/extensions/util/screenshotCreator/framing/configured.md) | 4 |  |
| [`util_screenshotCreator_framing_isometric`](ge/extensions/util/screenshotCreator/framing/isometric.md) | 3 |  |
| [`util_screenshotCreator_framing_legacy`](ge/extensions/util/screenshotCreator/framing/legacy.md) | 4 |  |
| [`util_screenshotCreator_framing_procedural`](ge/extensions/util/screenshotCreator/framing/procedural.md) | 5 |  |
| [`util_screenshotCreator_framingManager`](ge/extensions/util/screenshotCreator/framingManager.md) | 14 |  |
| [`util_screenshotCreator_job`](ge/extensions/util/screenshotCreator/job.md) | 17 |  |
| [`util_screenshotCreator_lightingSetup`](ge/extensions/util/screenshotCreator/lightingSetup.md) | 7 |  |
| [`util_screenshotCreator_modelSelection`](ge/extensions/util/screenshotCreator/modelSelection.md) | 5 |  |
| [`util_screenshotCreator_nodeOutpaint`](ge/extensions/util/screenshotCreator/nodeOutpaint.md) | 31 |  |
| [`util_screenshotCreator_settings`](ge/extensions/util/screenshotCreator/settings.md) | 51 |  |
| [`util_screenshotCreator_shippedConfigs`](ge/extensions/util/screenshotCreator/shippedConfigs.md) | 3 |  |
| [`util_screenshotCreator_thumbnailCapturePipeline`](ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.md) | 3 |  |
| [`util_screenshotCreator_thumbnailComposerRun`](ge/extensions/util/screenshotCreator/thumbnailComposerRun.md) | 11 |  |
| [`util_screenshotCreator_thumbnailConfig`](ge/extensions/util/screenshotCreator/thumbnailConfig.md) | 9 |  |
| [`util_screenshotCreator_thumbnailPaths`](ge/extensions/util/screenshotCreator/thumbnailPaths.md) | 4 |  |
| [`util_screenshotCreator_thumbnailTargets`](ge/extensions/util/screenshotCreator/thumbnailTargets.md) | 8 |  |
| [`util_screenshotCreator_ui`](ge/extensions/util/screenshotCreator/ui.md) | 5 |  |
| [`util_screenshotCreator_vehicleSetup`](ge/extensions/util/screenshotCreator/vehicleSetup.md) | 8 |  |
| [`util_showroom`](ge/extensions/util/showroom.md) | 4 |  |
| [`util_sortLines`](ge/extensions/util/sortLines.md) | 2 |  |
| [`util_stepHandler`](ge/extensions/util/stepHandler.md) | 18 |  |
| [`util_surfaceMaskWheels`](ge/extensions/util/surfaceMaskWheels.md) | 22 |  |
| [`util_terrainGenerator`](ge/extensions/util/terrainGenerator.md) | 19 |  |
| [`util_testExtensionProxies`](ge/extensions/util/testExtensionProxies.md) | 3 |  |
| [`util_testJSONFilesSyntax`](ge/extensions/util/testJSONFilesSyntax.md) | 1 |  |
| [`util_tileBake`](ge/extensions/util/tileBake.md) | 3 | Dev-only: bakes distant-city tile proxies. Buckets every static mesh + big forest item in |
| [`util_trackBuilder_basicBorders`](ge/extensions/util/trackBuilder/basicBorders.md) | 1 |  |
| [`util_trackBuilder_basicCenters`](ge/extensions/util/trackBuilder/basicCenters.md) | 2 |  |
| [`util_trackBuilder_borderWallMesh`](ge/extensions/util/trackBuilder/borderWallMesh.md) | 1 |  |
| [`util_trackBuilder_cameraTransition`](ge/extensions/util/trackBuilder/cameraTransition.md) | 2 |  |
| [`util_trackBuilder_ceilingMesh`](ge/extensions/util/trackBuilder/ceilingMesh.md) | 1 |  |
| [`util_trackBuilder_markers`](ge/extensions/util/trackBuilder/markers.md) | 19 |  |
| [`util_trackBuilder_materialUtil`](ge/extensions/util/trackBuilder/materialUtil.md) | 4 |  |
| [`util_trackBuilder_meshes`](ge/extensions/util/trackBuilder/meshes.md) | 0 |  |
| [`util_trackBuilder_multiTrackMerger`](ge/extensions/util/trackBuilder/multiTrackMerger.md) | 3 |  |
| [`util_trackBuilder_obstaclePlacer`](ge/extensions/util/trackBuilder/obstaclePlacer.md) | 3 |  |
| [`util_trackBuilder_pieces`](ge/extensions/util/trackBuilder/pieces.md) | 15 |  |
| [`util_trackBuilder_proceduralPrimitives`](ge/extensions/util/trackBuilder/proceduralPrimitives.md) | 6 |  |
| [`util_trackBuilder_quickraceSetup`](ge/extensions/util/trackBuilder/quickraceSetup.md) | 2 |  |
| [`util_trackBuilder_segmentToProceduralMesh`](ge/extensions/util/trackBuilder/segmentToProceduralMesh.md) | 6 |  |
| [`util_trackBuilder_splineTrack`](ge/extensions/util/trackBuilder/splineTrack.md) | 71 |  |
| [`util_vehicleRopeDebug`](ge/extensions/util/vehicleRopeDebug.md) | 1 |  |
| [`util_windDebug`](ge/extensions/util/windDebug.md) | 3 |  |
| [`util_worker`](ge/extensions/util/worker.md) | 10 |  |
| [`util_wsTest`](ge/extensions/util/wsTest.md) | 3 |  |
| [`vehicles_saveConfigUtils`](ge/extensions/vehicles/saveConfigUtils.md) | 3 |  |

## Commun (GE + véhicule)

### Modules (177)

| Nom | Fonctions | Résumé |
|---|---|---|
| [✍ `cdefDebugDraw`](common/cdefDebugDraw.md) | 0 | Déclarations FFI (ffi.cdef) des fonctions C++ de dessin de debug (BNG_DBG_DRAW_*) : sphère, cylindre, ligne, texte, prisme carré, triangle p |
| [✍ `cdefGpuMesh`](common/cdefGpuMesh.md) | 0 | Déclaration FFI du type gpuPrimitive_t (startIndex, indexCount, materialId : trois uint32_t) décrivant une primitive de maillage GPU. Les au |
| [✍ `cdefImgui`](common/cdefImgui.md) | 0 | Déclaration FFI de la fonction de rappel C ImGuiInputTextCallbackLua(const void* data), utilisée côté moteur pour les callbacks de saisie de |
| [✍ `cdefMath`](common/cdefMath.md) | 0 | Déclaration FFI des structures C __luaVec3_t {double x, y, z} et __luaQuat_t {double x, y, z, w}, qui servent de représentation mémoire aux  |
| [✍ `cdefs`](common/cdefs.md) | 0 | Point d'entrée regroupant toutes les déclarations FFI communes : il fait require de common/cdefDebugDraw, common/cdefImgui, common/cdefGpuMe |
| [✍ `controlSystems`](common/controlSystems.md) | 16 | Fournit deux régulateurs PID : forme parallèle (newPIDParallel, gains kP/kI/kD) et forme standard (newPIDStandard, kP avec temps intégral tI |
| [✍ `csvFile`](common/csvlib.md) | 7 | Bibliothèque d'écriture et de lecture de fichiers CSV/TSV. newCSV/newTSV créent un enregistreur (csvWriter) où l'on ajoute des lignes avec a |
| [✍ `delayLine`](common/delayLine.md) | 6 | Ligne à retard générique : chaque paquet de données poussé dans la ligne ressort après le même délai. Créée à l'origine pour simuler le temp |
| [✍ `dequeue`](common/dequeue.md) | 17 | File à double extrémité (deque) : on peut ajouter et retirer des éléments au début comme à la fin. Bibliothèque de Pierre Chapuis (licence M |
| [✍ `devUtils`](common/devUtils.md) | 0 | Utilitaires de développement rarement nécessaires, définis comme fonctions globales : exécution de code Lua avec capture du print, analyse d |
| [✍ `event`](common/event.md) | 0 | Petite classe d'événements (délégués) exposée comme global Event. On crée un objet avec Event.new(), on y abonne des fonctions avec add, et  |
| [✍ `extensions`](common/extensions.md) | 33 | Gestionnaire d'extensions (global `extensions`, présent dans la VM GE et dans la VM véhicule). Il charge/décharge des modules Lua comme exte |
| [✍ `filters`](common/filters.md) | 67 | Collection de filtres numériques à état (lissage, passe-bas/haut, ressort, détecteur de fréquence, régression linéaire) utilisés partout dan |
| [✍ `graphpath`](common/graphpath.md) | 44 | Graphe de routes pondéré et algorithmes de recherche de chemin utilisés par l'IA et le navigateur. newGraphpath() crée un graphe (nœuds nomm |
| [✍ `guihooks`](common/guihooks.md) | 11 | Passerelle Lua vers l'interface HTML/JS (CEF). Permet de déclencher des hooks JS côté UI (guihooks.trigger) et d'envoyer des flux de données |
| [✍ `inputFilters`](common/inputFilters.md) | 0 | Définit des constantes globales identifiant le type de filtre d'entrée (clavier, manette, direct, clavier drift, IA) et la table FILTER_NAME |
| [✍ `interpolateScatteredMap`](common/interpolateScatteredMap.md) | 7 | Interpolation 2D sur points non structurés par triangulation de Delaunay (Bowyer-Watson). loadData construit la triangulation une fois ; get |
| [✍ `interpolatedMap`](common/interpolatedMap.md) | 4 | Table d'interpolation 1D (linéaire) ou 2D (bilinéaire) sur grille régulière ou irrégulière. new() crée l'objet, loadData(inputData, opts) ch |
| [✍ `introspection`](common/introspection.md) | 1 | Outil de debug qui parcourt _G et les modules standard (table, math, string, coroutine, os, io, debug, package) pour lister les fonctions de |
| [✍ `jbeam_expressionParser`](common/jbeam/expressionParser.md) | 5 | Évalue les expressions JBeam de la forme "$=..." (valeurs calculées dans les fichiers jbeam). L'expression est transformée en code Lua (le p |
| [✍ `jbeam_groups`](common/jbeam/groups.md) | 1 | Étape de post-traitement du chargement jbeam pour la colonne/champ « group » des lignes (nœuds, poutres, etc.). Convertit chaque liste group |
| [✍ `jbeam_interaction`](common/jbeam/interaction.md) | 1 | Étape de post-traitement jbeam qui charge les fichiers *.interaction.json (dossier /vehicles/common/ puis dossier du véhicule) et en fusionn |
| [✍ `jbeam_io`](common/jbeam/io.md) | 11 | Lecture et mise en cache des fichiers .jbeam des véhicules. Pour chaque dossier demandé, parse chaque *.jbeam (JSON), normalise les sections |
| [✍ `jbeam_links`](common/jbeam/links.md) | 3 | Résolution des références entre lignes jbeam. Dans un fichier jbeam, une colonne dont le nom contient ':' (ex. "id1:", "torqueArm:", ou "lin |
| [✍ `jbeam_loader`](common/jbeam/loader.md) | 8 | Chargeur principal des véhicules jbeam : orchestre toutes les étapes qui transforment les fichiers .jbeam et la configuration choisie en un  |
| [✍ `jbeam_materials`](common/jbeam/materials.md) | 1 | Étape de chargement côté GE qui prépare les changements de matériaux dynamiques d'un véhicule : (1) la section jbeam glowMap (matériaux qui  |
| [✍ `jbeam_optimization`](common/jbeam/optimization.md) | 2 | Étapes de finalisation des données jbeam avant envoi à la physique. assignCIDs numérote chaque ligne des sections « valides » avec un cid co |
| [✍ `jbeam_partpacks`](common/jbeam/partpacks.md) | 5 | Gestion des « part packs » : ensembles de pièces prédéfinis décrits dans des fichiers *.partpacks.json des dossiers du véhicule (tableau d'o |
| [✍ `jbeam_scaling`](common/jbeam/scaling.md) | 1 | Étape de post-traitement jbeam qui applique les clés « scaleXxx » : pour toute clé numérique nommée scale suivie d'un nom (ex. scaleNodeWeig |
| [✍ `jbeam_sectionMerger`](common/jbeam/sectionMerger.md) | 1 | Fusionne des sections jbeam entre elles pour la rétrocompatibilité : la section triggers2 est versée dans triggers et rails2 dans rails. Les |
| [✍ `jbeam_sections_assorted`](common/jbeam/sections/assorted.md) | 1 | Post-traitement de deux sections jbeam diverses. (1) Section engine : construit engine.waterDamage.nodes en concaténant les listes de nœuds  |
| [✍ `jbeam_sections_camera`](common/jbeam/sections/camera.md) | 1 | Traite les sections jbeam de caméras du véhicule (cameras, et les anciennes camerasInternal/cameraExternal/camerasRelative/cameraChase). Mig |
| [✍ `jbeam_sections_colors`](common/jbeam/sections/colors.md) | 1 | Applique la couleur de carrosserie héritée de la configuration du véhicule (vehicleConfig.colors, ancien format) à l'objet véhicule : colors |
| [✍ `jbeam_sections_events`](common/jbeam/sections/events.md) | 1 | Traite les sections jbeam d'interaction : events (évènements d'entrée, simplement nettoyés), triggers (zones de déclenchement 3D box/sphère  |
| [✍ `jbeam_sections_licenseplatesSkins`](common/jbeam/sections/licenseplatesSkins.md) | 1 | Traite deux familles de pièces actives : plaques d'immatriculation et skins. Une pièce dont un slotType contient '_licenseplate' (ou ayant l |
| [✍ `jbeam_sections_meshs`](common/jbeam/sections/meshs.md) | 1 | Traite les sections jbeam qui concernent les meshes 3D du véhicule : triangles (triangles de collision physique), props (meshes rigides atta |
| [✍ `jbeam_sections_mirror`](common/jbeam/sections/mirror.md) | 1 | Traite la section jbeam « mirrors » (rétroviseurs). Pour chaque entrée ayant un champ mesh, enregistre le rétroviseur dans le moteur (addMir |
| [✍ `jbeam_sections_nodeBeam`](common/jbeam/sections/nodeBeam.md) | 1 | Traite les sections jbeam de la structure physique : nodes (calcule la position finale pos en vec3 après rotation/déplacement du composant,  |
| [✍ `jbeam_sections_occupantFaces`](common/jbeam/sections/occupantFaces.md) | 5 | Gère les visages des occupants (têtes de personnages). Charge, une fois, les pièces du slot 'skin_character_face' du véhicule /vehicles/unic |
| [✍ `jbeam_sections_occupantSlots`](common/jbeam/sections/occupantSlots.md) | 1 | Traite la section jbeam « occupantSlots » (places d'occupants). Normalise chaque entrée : id (id, name ou clé de table), defaultPermissionMo |
| [✍ `jbeam_sections_paints`](common/jbeam/sections/paints.md) | 1 | Applique les peintures du véhicule : vehicleConfig.paints (ou, à défaut, vehicleConfig.colors converti par convertVehicleColorsToPaints) don |
| [✍ `jbeam_sections_vropes`](common/jbeam/sections/vropes.md) | 1 | Traite la section jbeam « vropes » (cordes visuelles simulées, sans poutres physiques). Pour chaque entrée ayant anchorAProp et anchorBProp  |
| [✍ `jbeam_sections_wheelTypes_hubWheels`](common/jbeam/sections/wheelTypes/hubWheels.md) | 1 | Gestionnaire du type de roue 'hubWheels' : roue à moyeu séparé du pneu, avec pression d'air simulée par des poutres pressurisées entre le mo |
| [✍ `jbeam_sections_wheelTypes_hubWheelsTSI`](common/jbeam/sections/wheelTypes/hubWheelsTSI.md) | 1 | Gestionnaire du type de roue 'hubWheelsTSI' : variante de hubWheels sans enjoliveur. Anneau de nœuds de pneu + anneau de nœuds de moyeu, pou |
| [✍ `jbeam_sections_wheelTypes_hubWheelsTSV`](common/jbeam/sections/wheelTypes/hubWheelsTSV.md) | 1 | Gestionnaire du type de roue 'hubWheelsTSV' : roue à moyeu séparé SANS pression d'air simulée : le pneu est relié au moyeu par des poutres a |
| [✍ `jbeam_sections_wheelTypes_monoHubWheels`](common/jbeam/sections/wheelTypes/monoHubWheels.md) | 1 | Gestionnaire du type de roue 'monoHubWheels' : roue à moyeu simple. Anneau de pneu (2 x numRays nœuds) relié aux deux nœuds d'axe par des cô |
| [✍ `jbeam_sections_wheelTypes_pressureWheels`](common/jbeam/sections/wheelTypes/pressureWheels.md) | 1 | Gestionnaire du type de roue 'pressureWheels' : le modèle de roue le plus récent et le plus complet, avec pression d'air simulée par des TRI |
| [✍ `wheels`](common/jbeam/sections/wheelTypes/wheels.md) | 1 | Gestionnaire du type de roue 'wheels' (section jbeam wheels) : la roue simple. À partir de deux nœuds d'axe (node1, node2), il crée un annea |
| [✍ `wheels`](common/jbeam/sections/wheels.md) | 2 | Répartiteur de la construction des roues lors du chargement d'un véhicule jbeam. Il parcourt les sections de roues du véhicule (wheels, mono |
| [✍ `jbeam_slotSystem`](common/jbeam/slotSystem.md) | 3 | Système de slots du jbeam : à partir de la configuration du véhicule (pièces choisies), il parcourt récursivement les slots (sections slots  |
| [✍ `jbeam_tableSchema`](common/jbeam/tableSchema.md) | 2 | Interprète le format tabulaire du jbeam : une section est une liste dont la première ligne est l'en-tête des colonnes et les lignes suivante |
| [✍ `jbeam_utils`](common/jbeam/utils.md) | 11 | Fonctions utilitaires partagées du chargeur jbeam : ajout de nœuds et de poutres au véhicule en construction (compteurs maxIDs, copie des op |
| [✍ `jbeam_variables`](common/jbeam/variables.md) | 5 | Gère les variables jbeam (réglages de véhicule de type range : géométrie, alignement, etc.) et la substitution des '$...' dans les pièces. I |
| [✍ `jbeamWriter`](common/jbeamWriter.md) | 1 | Variante de l'encodeur JSON 'joli' qui n'indente (met en forme multi-lignes) que jusqu'à une certaine profondeur, pour écrire des fichiers j |
| [`jit_p`](common/jit/p.md) | 2 | LuaJIT profiler. |
| [`jit_v`](common/jit/v.md) | 3 | Verbose mode of the LuaJIT compiler. |
| [`jit_vmdef`](common/jit/vmdef.md) | 0 | This is a generated file. DO NOT EDIT! |
| [`zone`](common/jit/zone.md) | 0 | LuaJIT profiler zones. |
| [✍ `json_ast`](common/json-ast.md) | 6 | Parseur JSON/SJSON qui construit un arbre syntaxique (AST) sans perte : chaque espace, tabulation, saut de ligne, commentaire (// et /* */), |
| [✍ `json`](common/json.md) | 1 | Fin enrobage de string.buffer de LuaJIT pour lire et écrire du JSON/SJSON (https://github.com/Autodesk/sjson). `json.decode` lit du texte ou |
| [`json_test`](common/json.test.md) | 17 |  |
| [✍ `jsonDebug`](common/jsonDebug.md) | 1 | Variante de ljson (parseur SJSON en Lua pur) qui, en plus de décoder, renvoie une liste d'avertissements, notamment les clés dupliquées avec |
| [✍ `jsonPrettyEncoderCustom`](common/jsonPrettyEncoderCustom.md) | 1 | Encodeur JSON 'joli' personnalisable : trie les clés par poids (tableWeights), et laisse un callback décider quelles tables sont repliées su |
| [✍ `kdtreebox2d`](common/kdtreebox2d.md) | 10 | Arbre k-d pour boîtes 2D (xmin, ymin, xmax, ymax), donc 4 dimensions, permettant de retrouver rapidement tous les éléments dont la boîte int |
| [✍ `kdtreebox3d`](common/kdtreebox3d.md) | 9 | Arbre k-d pour boîtes 3D (xmin, ymin, zmin, xmax, ymax, zmax), soit 6 dimensions. Permet de retrouver rapidement tous les éléments dont la b |
| [✍ `kdtreepoint3d`](common/kdtreepoint3d.md) | 10 | Arbre k-d pour points 3D. Offre deux types de requêtes : les points dans une boîte (query / queryNotNested, itérateurs) et le point le plus  |
| [`libs_LuLPeg_lulpeg`](common/libs/LuLPeg/lulpeg.md) | 0 | LuLPeg, a pure Lua port of LPeg, Roberto Ierusalimschy's |
| [`libs_LuaIRC_asyncoperations`](common/libs/LuaIRC/asyncoperations.md) | 7 |  |
| [`libs_LuaIRC_handlers`](common/libs/LuaIRC/handlers.md) | 0 |  |
| [`libs_LuaIRC_init`](common/libs/LuaIRC/init.md) | 11 |  |
| [`libs_LuaIRC_set`](common/libs/LuaIRC/set.md) | 4 |  |
| [`libs_LuaIRC_util`](common/libs/LuaIRC/util.md) | 0 |  |
| [`libs_LuaJIT_vmdef`](common/libs/LuaJIT/vmdef.md) | 0 | This is a generated file. DO NOT EDIT! |
| [`zone`](common/libs/LuaJIT/zone.md) | 0 | LuaJIT profiler zones. |
| [`libs_StackTracePlus_StackTracePlus`](common/libs/StackTracePlus/StackTracePlus.md) | 9 | The MIT License |
| [`libs_binaryheap_binaryheap`](common/libs/binaryheap/binaryheap.md) | 15 | Binary heap implementation |
| [`libs_copas_copas`](common/libs/copas/copas.md) | 25 | Copas is free software: it can be used for both academic and commercial purposes at absolutely no |
| [`libs_copas_copas_ftp`](common/libs/copas/copas/ftp.md) | 2 | identical to the socket.ftp module except that it uses |
| [`libs_copas_copas_http`](common/libs/copas/copas/http.md) | 2 | Full copy of the LuaSocket code, modified to include |
| [`libs_copas_copas_limit`](common/libs/copas/copas/limit.md) | 5 | Limits resource usage while executing tasks. |
| [`libs_copas_copas_lock`](common/libs/copas/copas/lock.md) | 3 |  |
| [`libs_copas_copas_semaphore`](common/libs/copas/copas/semaphore.md) | 5 |  |
| [`libs_copas_copas_smtp`](common/libs/copas/copas/smtp.md) | 1 | identical to the socket.smtp module except that it uses |
| [`libs_copas_copas_timer`](common/libs/copas/copas/timer.md) | 2 |  |
| [`libs_ezSVG_EzSVG`](common/libs/ezSVG/EzSVG.md) | 26 | Copyright (c) 2012 Patrick Borgeat |
| [`libs_inspect_inspect`](common/libs/inspect/inspect.md) | 9 | inspect.lua 3.1.0 |
| [`libs_lua_MessagePack_MessagePack`](common/libs/lua-MessagePack/MessagePack.md) | 9 | lua-MessagePack is licensed under the terms of the MIT/X11 license reproduced below. |
| [`epnf`](common/libs/lua-luaepnf/epnf.md) | 9 |  |
| [`libs_lua_websockets_websocket`](common/libs/lua-websockets/websocket.md) | 0 | Copyright (c) 2012 by Gerhard Lipp <gelipp@gmail.com> |
| [`bxor`](common/libs/lua-websockets/websocket/bit.md) | 0 |  |
| [`client`](common/libs/lua-websockets/websocket/client.md) | 0 |  |
| [`libs_lua_websockets_websocket_client_copas`](common/libs/lua-websockets/websocket/client_copas.md) | 0 |  |
| [`libs_lua_websockets_websocket_client_ev`](common/libs/lua-websockets/websocket/client_ev.md) | 0 |  |
| [`libs_lua_websockets_websocket_client_sync`](common/libs/lua-websockets/websocket/client_sync.md) | 0 |  |
| [`message_io`](common/libs/lua-websockets/websocket/ev_common.md) | 2 |  |
| [`libs_lua_websockets_websocket_frame`](common/libs/lua-websockets/websocket/frame.md) | 7 | Following Websocket RFC: http://tools.ietf.org/html/rfc6455 |
| [`libs_lua_websockets_websocket_handshake`](common/libs/lua-websockets/websocket/handshake.md) | 4 |  |
| [`server`](common/libs/lua-websockets/websocket/server.md) | 0 |  |
| [`libs_lua_websockets_websocket_server_copas`](common/libs/lua-websockets/websocket/server_copas.md) | 1 |  |
| [`libs_lua_websockets_websocket_server_ev`](common/libs/lua-websockets/websocket/server_ev.md) | 1 |  |
| [`libs_lua_websockets_websocket_sync`](common/libs/lua-websockets/websocket/sync.md) | 5 |  |
| [`libs_lua_websockets_websocket_tools`](common/libs/lua-websockets/websocket/tools.md) | 7 |  |
| [`libs_luamqtt_mqtt_bit53`](common/libs/luamqtt/mqtt/bit53.md) | 4 | implementing some functions from BitOp (http://bitop.luajit.org/) on Lua 5.3 |
| [`libs_luamqtt_mqtt_bitwrap`](common/libs/luamqtt/mqtt/bitwrap.md) | 0 | wrapper around BitOp module |
| [`libs_luamqtt_mqtt_client`](common/libs/luamqtt/mqtt/client.md) | 30 | MQTT client module |
| [`luamqtt_VERSION`](common/libs/luamqtt/mqtt/init.md) | 3 | MQTT module |
| [`libs_luamqtt_mqtt_ioloop`](common/libs/luamqtt/mqtt/ioloop.md) | 8 | ioloop module |
| [`libs_luamqtt_mqtt_luasocket_copas`](common/libs/luamqtt/mqtt/luasocket-copas.md) | 5 | DOC: https://keplerproject.github.io/copas/ |
| [`connector`](common/libs/luamqtt/mqtt/luasocket.md) | 5 | DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html |
| [`connector`](common/libs/luamqtt/mqtt/luasocket_ssl.md) | 2 | DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html |
| [`libs_luamqtt_mqtt_ngxsocket`](common/libs/luamqtt/mqtt/ngxsocket.md) | 5 | module table |
| [`libs_luamqtt_mqtt_protocol`](common/libs/luamqtt/mqtt/protocol.md) | 25 | MQTT generic protocol components module |
| [`libs_luamqtt_mqtt_protocol4`](common/libs/luamqtt/mqtt/protocol4.md) | 2 | Here is a MQTT v3.1.1 protocol implementation |
| [`libs_luamqtt_mqtt_protocol5`](common/libs/luamqtt/mqtt/protocol5.md) | 2 | Here is a MQTT v5.0 protocol implementation |
| [`libs_luamqtt_mqtt_tools`](common/libs/luamqtt/mqtt/tools.md) | 2 | module table |
| [`libs_luaqrcode_qrencode`](common/libs/luaqrcode/qrencode.md) | 1 | The qrcode library is licensed under the 3-clause BSD license (aka "new BSD") |
| [`libs_luasocket_ltn12`](common/libs/luasocket/ltn12.md) | 18 | LTN12 - Filters, sources, sinks and pumps. |
| [`libs_luasocket_socket_ftp`](common/libs/luasocket/socket/ftp.md) | 1 | FTP support for the Lua language |
| [`libs_luasocket_socket_headers`](common/libs/luasocket/socket/headers.md) | 0 | Canonic header field capitalization |
| [`libs_luasocket_socket_http`](common/libs/luasocket/socket/http.md) | 1 | HTTP/1.1 client support for the Lua language. |
| [`libs_luasocket_socket_mbox`](common/libs/luasocket/socket/mbox.md) | 8 |  |
| [`libs_luasocket_socket_mime`](common/libs/luasocket/socket/mime.md) | 2 | MIME support for the Lua language. |
| [`libs_luasocket_socket_smtp`](common/libs/luasocket/socket/smtp.md) | 2 | SMTP client support for the Lua language. |
| [`libs_luasocket_socket_socket`](common/libs/luasocket/socket/socket.md) | 4 | LuaSocket helper module |
| [`libs_luasocket_socket_tp`](common/libs/luasocket/socket/tp.md) | 1 | Unified SMTP/FTP subsystem |
| [`libs_luasocket_socket_url`](common/libs/luasocket/socket/url.md) | 7 | URI parsing, composition and relative URL resolution |
| [`libs_lunajson_lunajson`](common/libs/lunajson/lunajson.md) | 0 |  |
| [`libs_lunajson_lunajson_decoder`](common/libs/lunajson/lunajson/decoder.md) | 0 |  |
| [`libs_lunajson_lunajson_encoder`](common/libs/lunajson/lunajson/encoder.md) | 0 |  |
| [`libs_lunajson_lunajson_sax`](common/libs/lunajson/lunajson/sax.md) | 2 |  |
| [`libs_lustach_src_lustache`](common/libs/lustach/src/lustache.md) | 0 | lustache: Lua mustache template parsing. |
| [`libs_lustach_src_lustache_context`](common/libs/lustach/src/lustache/context.md) | 4 |  |
| [`renderer`](common/libs/lustach/src/lustache/renderer.md) | 9 |  |
| [`libs_lustach_src_lustache_scanner`](common/libs/lustach/src/lustache/scanner.md) | 4 |  |
| [`libs_resty_template`](common/libs/resty/template.md) | 8 |  |
| [`libs_resty_template_html`](common/libs/resty/template/html.md) | 0 |  |
| [`libs_resty_template_microbenchmark`](common/libs/resty/template/microbenchmark.md) | 1 |  |
| [`libs_slaxml_slaxdom`](common/libs/slaxml/slaxdom.md) | 2 | Optional parser that creates a flat DOM from parsing |
| [`libs_slaxml_slaxml`](common/libs/slaxml/slaxml.md) | 3 | v0.8 Copyright © 2013-2018 Gavin Kistner <!@phrogz.net>; MIT Licensed |
| [`libs_timerwheel_timerwheel`](common/libs/timerwheel/timerwheel.md) | 1 | Timer wheel implementation |
| [`libs_xlsxlib_tests_JUnitXMLWriter`](common/libs/xlsxlib/tests/JUnitXMLWriter.md) | 1 | JUnit XML Writer for test results |
| [`libs_xlsxlib_tests_TestManager`](common/libs/xlsxlib/tests/TestManager.md) | 0 | Unit Test Manager for the xlsx library |
| [`libs_xlsxlib_tests_tests`](common/libs/xlsxlib/tests/tests.md) | 12 | Unit tests for the xlsx library |
| [`libs_xlsxlib_xlsxlib`](common/libs/xlsxlib/xlsxlib.md) | 2 | XLSX Parsing Module for Lua |
| [✍ `ljson`](common/ljson.md) | 1 | Ancien parseur SJSON écrit en Lua pur (Lua 5.1), conservé quand json.lua est passé à string.buffer de LuaJIT. Il décode le format SJSON d'Au |
| [✍ `lpack`](common/lpack.md) | 8 | Sérialiseur/désérialiseur rapide de valeurs Lua (tables, nombres, chaînes, booléens, vec3, quat) vers des chaînes compactes, utilisé pour éc |
| [✍ `luaBinding`](common/luaBinding.md) | 0 | Colle Lua des liaisons C++ <-> Lua : les fonctions __luaBind* sont les __index / __newindex que le moteur C++ place sur les metatables des c |
| [✍ `luaCore`](common/luaCore.md) | 0 | Petit module de base chargé dans les deux VM, qui ajoute des utilitaires de langage utilisés partout : require_optional, unrequire, rerequir |
| [✍ `luaProfiler`](common/luaProfiler.md) | 5 | Petit profileur de sections de code Lua. On crée un profileur avec LuaProfiler(titre), on appelle p:start() au début d'une fonction, p:add(' |
| [✍ `mathlib`](common/mathlib.md) | 135 | Bibliothèque mathématique chargée dans les deux VM (GE et véhicule). Elle définit les types vec3 (x, y, z, doubles) et quat (x, y, z, w), le |
| [`mathlib_test`](common/mathlib.test.md) | 17 |  |
| [✍ `_`](common/particles.md) | 4 | Charge au démarrage lua/common/particles.json (matériaux physiques et règles de particules entre deux matériaux) et prépare des tables de re |
| [✍ `quadtree`](common/quadtree.md) | 11 | Quadtree 2D pour boîtes (insertion, suppression, requête, compression). Contrairement aux arbres k-d, on peut insérer et retirer des élément |
| [✍ `impl`](common/settings.md) | 7 | Accès en lecture aux réglages du jeu depuis Lua (les deux VM). Au chargement il lit /settings/defaults.json (définitions : chaque réglage es |
| [✍ `tcpServer`](common/tcpServer.md) | 5 | Serveur TCP non bloquant servant aux outils externes (chaîne d'outils d'édition, scripts). Utilise ASIO via createNetworkServer s'il est dis |
| [`testFramework_ExtensionTest`](common/testFramework/ExtensionTest.md) | 2 |  |
| [`testFramework_JUnitXMLWriter`](common/testFramework/JUnitXMLWriter.md) | 1 |  |
| [`testFramework_MockGenerators`](common/testFramework/MockGenerators.md) | 52 |  |
| [`testFramework_TestManager`](common/testFramework/TestManager.md) | 0 | Unit Test Manager for the BeamNG |
| [✍ `timeEvents`](common/timeEvents.md) | 4 | Petit planificateur : permet de programmer l'exécution d'une fonction dans X secondes, à la manière de `schedule()`. On crée une liste d'évé |
| [✍ `utils`](common/utils.md) | 8 | Boîte à outils commune (GE et véhicule) chargée au démarrage de chaque VM Lua. Ce fichier ne renvoie pas de table M : il définit directement |
| [`utils_test`](common/utils.test.md) | 56 |  |
| [✍ `utils_calltracer`](common/utils/calltracer.md) | 4 | Outil de profilage/diagnostic : enregistre, grâce à un hook debug.sethook sur les appels de fonctions, qui appelle qui pendant une période,  |
| [✍ `utils_dateUtils`](common/utils/dateUtils.md) | 2 | Petits utilitaires de dates : conversion d'une chaîne ISO 8601 en timestamp Unix et calcul du temps écoulé depuis une date. Se charge avec r |
| [✍ `utils_debugDraw`](common/utils/debugDraw.md) | 5 | Enveloppe rapide (FFI) autour du dessin de debug du moteur (BNG_DBG_DRAW_*). Dans le GE les appels se font dans onPreRender(), côté véhicule |
| [✍ `utils_filterchain`](common/utils/filterchain.md) | 12 | Preuve de concept de 'chaîne de filtres' fonctionnelle : on décrit une chaîne par des textes comme 'smooth(2)' ou 'interval(0.1, 0.1)' qui s |
| [✍ `utils_heatmap`](common/utils/heatmap.md) | 4 | Preuve de concept : génère une image SVG (2048x2048) du réseau routier de la carte (map.getMap()) avec un point rouge par véhicule à chaque  |
| [✍ `utils_httpJsonServer`](common/utils/httpJsonServer.md) | 2 | Mini serveur HTTP non bloquant qui répond en JSON, pour monter rapidement une API REST locale (outils externes, éditeurs). Se charge avec re |
| [✍ `utils_interactiveShell`](common/utils/interactiveShell.md) | 1 | Console Lua interactive (REPL) pour l'exécutable console (console.x64.exe) : require('utils/interactiveShell').start() lit des lignes sur l' |
| [✍ `utils_languageMap`](common/utils/languageMap.md) | 1 | Tables de correspondance pour les langues : codes pays ISO 3166-1, codes de langue ISO 639-1, et codes spécifiques de Weblate (la plateforme |
| [✍ `perf`](common/utils/perf.md) | 5 | Petite bibliothèque de mesure de performance par hook : pendant qu'elle est activée, chaque appel/retour de fonction Lua est chronométré, et |
| [✍ `utils_pixellib`](common/utils/pixellib.md) | 17 | Petite bibliothèque de dessin de pixels en mémoire (tampon RGBA 8 bits via FFI) : points, lignes, cercles, rectangles, icônes et texte en po |
| [✍ `ws`](common/utils/simpleHttpServer.md) | 3 | Mini serveur HTTP non bloquant, qui sert des fichiers statiques d'un dossier (avec détection de type MIME par extension et gabarits libs/res |
| [✍ `utils_simpleProfiler_report`](common/utils/simpleProfiler/report.md) | 1 | Génère un rapport de profilage à partir du journal du 'simpleProfiler' du moteur (global simpleProfilerGetJournal) : une page HTML interacti |
| [✍ `utils_torqueScriptParser`](common/utils/torqueScriptParser.md) | 1 | Preuve de concept d'analyseur (parser PEG, via libs/lua-luaepnf/epnf) de fichiers TorqueScript : déclarations 'new/singleton/datablock', pro |
| [✍ `utils_wsUtils`](common/utils/wsUtils.md) | 1 | Outils pour les WebSockets du moteur (BNGWebWSServer / BNGWSClient). Fournit createOrGetWS qui crée (ou récupère) un serveur WebSocket et ch |
| [`main`](objectpool/main.md) | 0 |  |

### Extensions (11)

| Nom | Fonctions | Résumé |
|---|---|---|
| [`jbeam_jbeamMod`](common/extensions/jbeam/jbeamMod.md) | 2 |  |
| [`networking_editorToolchain`](common/extensions/networking/editorToolchain.md) | 6 |  |
| [`ui_flowgraph_editor`](common/extensions/ui/flowgraph/editor.md) | 22 |  |
| [`ui_flowgraph_editor_api_luaintf`](common/extensions/ui/flowgraph/editor_api_luaintf.md) | 0 |  |
| [`ui_imgui`](common/extensions/ui/imgui.md) | 2 |  |
| [`ui_imguiUtils`](common/extensions/ui/imguiUtils.md) | 18 |  |
| [`ui_imguiWire`](common/extensions/ui/imguiWire.md) | 1 |  |
| [`ui_imgui_api`](common/extensions/ui/imgui_api.md) | 0 |  |
| [`ui_imgui_custom_luaintf`](common/extensions/ui/imgui_custom_luaintf.md) | 0 |  |
| [`ui_imgui_luaintf`](common/extensions/ui/imgui_luaintf.md) | 0 |  |
| [`ui_improfiler`](common/extensions/ui/improfiler.md) | 1 |  |

## Console

### Modules (17)

| Nom | Fonctions | Résumé |
|---|---|---|
| [`bananabench_async`](console/bananabench-async.md) | 0 |  |
| [`bananabench_csv`](console/bananabench-csv.md) | 0 |  |
| [`bananabench_json`](console/bananabench-json.md) | 0 |  |
| [`bananabench_print`](console/bananabench-print.md) | 0 |  |
| [`bananabench_xml`](console/bananabench-xml.md) | 0 |  |
| [`bananabench`](console/bananabench.md) | 3 |  |
| [`benchphysics`](console/benchphysics.md) | 0 |  |
| [`console_lib`](console/console-lib.md) | 3 |  |
| [`json_performance`](console/json-performance.md) | 0 |  |
| [`main`](console/main.md) | 0 |  |
| [`resave_pcs`](console/resave-pcs.md) | 0 |  |
| [`servertests`](console/servertests.md) | 0 |  |
| [`simpleload`](console/simpleload.md) | 0 |  |
| [`simtest`](console/simtest.md) | 0 |  |
| [`test`](console/test.md) | 0 |  |
| [`test_dyncol`](console/test_dyncol.md) | 0 |  |
| [`unittests`](console/unittests.md) | 0 |  |

