# `electrics`

*Fichier : `lua/vehicle/electrics.lua` · VM : Véhicule · 1114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `electrics`

Table de valeurs électriques du véhicule (`electrics.values`) partagée par tous les contrôleurs, l'UI et les extensions, plus la logique des feux, clignotants, warning, barre lumineuse, klaxon et du niveau d'allumage (ignition). Un moddeur lit `electrics.values.xxx` pour connaître l'état du véhicule (régime, vitesse, feux…) et appelle les fonctions `toggle_*`/`set_*` pour agir sur les feux ou la clé de contact. Les contrôleurs et le jbeam (sections `electrics`/`components.electrics`) écrivent leurs propres clés dans cette table.

## Exemple

```lua
-- Dans un contrôleur ou une extension véhicule
local rpm = electrics.values.rpm
electrics.setIgnitionLevel(2)      -- contact mis, démarreur non engagé
electrics.set_warn_signal(true)     -- feux de détresse
electrics.values.myCustomValue = 1 -- valeur lue ensuite par l'UI / les streams
```

## Remarques

- Boucle de mise à jour : electrics.updateGFX(dt) (1re étape) -> les contrôleurs écrivent leurs valeurs -> electrics.updateGFXSecondStep(dt) (2e étape : brakelights, valeurs importées du réseau, surcharge par niveau d'allumage, valeurs custom jbeam, lisseurs).
- À la fin de updateGFX, tous les booléens de electrics.values sont convertis en 0/1 (les clés listées dans M.disabledState sont mises à nil). Les valeurs écrites après (seconde étape, contrôleurs) peuvent rester booléennes : tester avec `== 1` ou `> 0` ne marche pas pour true.
- Clés initialisées dans le fichier : throttle, brake, steering, clutch, wheelspeed, odometer, avgWheelAV, airspeed, horn, rpmspin, rpm, boost, boostMax. init/reset ajoutent aussi airflowspeed et electricalLoadCoef (=1) et ignitionLevel.
- Clés écrites par updateGFX : accXSmooth/accYSmooth/accZSmooth (sensors.gx2/gy2/gz2), odometer et trip (partCondition, voir ce module pour l'unité), nop (=0), parkingbrake (copie de parkingbrake_input), parkingbrakelight, lights et lights_state (0 éteint, 1 croisement, 2 route), turnsignal (-1 gauche, 0, 1 droite), airspeed (obj:getGroundSpeed(), nom trompeur : vitesse sol), airflowspeed (obj:getAirflowSpeed()), altitude (obj:getAltitude()), parking (toujours 0, TODO dans le code), reverse (gearIndex < 0), signal_L/signal_R (clignotant allumé pendant l'impulsion), hazard, hazard_enabled, lightbar (0 éteint, 1 lumières, 2 lumières+sirène), lowpressure (beamstate.lowpressure), oil (oiltemp >= 130), lowhighbeam, lowbeam, highbeam, fog, horn, lowhighbeam_signal_R/L (style américain), highbeam_wigwag_R/L, reverse_wigwag_R/L, rpmTacho (rpm lissé par un sigmoïde temporel), rpmspin (angle en degrés de la 'roue' de régime, modulo 360), signal_right_input/signal_left_input (état de commande des clignotants), boost (turboBoost + superchargerBoost), boostMax (max de turboBoostMax et superchargerBoostMax).
- Clés écrites par updateGFXSecondStep : brakelights (ceil(brake) si non fourni par un contrôleur), brakelight_signal_R/L.
- Clés LUES mais écrites ailleurs : ignitionLevel (écrit ici aussi), gearIndex, oiltemp, watertemp, fuel, wigwag_R, wigwag_L, parkingbrake_input, turboBoost, turboBoostMax, superchargerBoost, superchargerBoostMax, steering (en degrés brut du volant : seuils 60 et 10 pour l'arrêt auto des clignotants), rpm. Clés remises à 0 par la surcharge 'european' quand ignitionLevel == 0 : brakelights, parkingbrakelight, brakelight_signal_R/L, parking, reverse, lights, lights_state, turnsignal, signal_L/R, hazard, hazard_enabled, lowpressure, oil, lowhighbeam, lowbeam, highbeam, fog, horn, lowhighbeam_signal_R/L, highbeam_wigwag_R/L, reverse_wigwag_R/L, signal_right_input, signal_left_input, fuel, lowfuel, abs, esc, tcs, oiltemp, watertemp, checkengine, ignition, running, engineRunning.
- Lisseurs par défaut (exponentiels) : wheelspeed, gear_A, rpm, lights, turnsignal, airspeed, airflowspeed, altitude (paramètre 10) ; fuel, oiltemp, watertemp (paramètre 100). Le jbeam peut les remplacer via electrics.smoothers (types exponential, temporal, temporalNonLinear). Les lisseurs sont appliqués en tout dernier, après les valeurs custom.
- Niveaux d'allumage : 0 arrêt, 1 accessoires, 2 marche (moteur autorisé à tourner), 3 démarreur. Les niveaux interdits par jbeam (allowedIgnitionLevels, défaut {0,1,2,3}) sont remplacés par le plus proche niveau supérieur autorisé, sinon inférieur. Le niveau initial vient du réglage spawnVehicleIgnitionLevel (défaut 3) ou de config.additionalVehicleData.spawnWithEngineRunning (true => 3, false => 0).
- Jbeam : electrics.indicatorCycleTime (défaut 0.8 s, un demi-cycle = durée d'un état on/off), electrics.ignitionLevelOverrideType (seul 'european' existe), electrics.allowedIgnitionLevels, electrics.smoothers, electrics.customValues (voir electricsCustomValueParser).
- Le clignotant s'arrête tout seul (autoCancel) quand le volant a dépassé 60 dans le sens du virage puis est revenu vers le neutre (seuil 10), pour toggle_left/right_signal et pour set_*_signal(state, true).
- Incohérence : M.resetLastStage pointe sur la même fonction que M.initLastStage (qui force le niveau 3 vers 2).
- Risque d'erreur : updateGFX évalue `vals.parkingbrake > 0` ; si parkingbrake_input n'a jamais été écrit par un contrôleur/input, la comparaison est faite sur nil (erreur Lua).
- toggle_lights fait tourner lightsState 0 -> 1 -> 2 -> 0 ; setLightsState n'a aucune validation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `electrics.horn(state)` | Active ou coupe le klaxon (electrics.values.horn) et joue/arrête le son 'horn' (deux emplacements alternés pour éviter la coupure brutale). | 1034 |
| `electrics.init()` | Appelé à la création du véhicule : lit la config jbeam (lisseurs, valeurs custom, niveaux d'allumage, cycle de clignotant), compile les valeurs custom, fixe le niveau d'allumage de départ et enregistre les entrées du menu radial (core_quickAccess). *(interne)* | 824 |
| `electrics.initLastStage()` | Appelé en fin d'initialisation : si le niveau d'allumage est 3, le ramène à 2 (en mémorisant 3 comme niveau précédent) pour ne pas rester en démarreur. *(interne)* | 948 |
| `electrics.light_flash_highbeams(enabled)` | Appel de phares : à true, mémorise l'état courant et passe en feux de route ; à false, restaure l'état mémorisé. | 996 |
| `electrics.reset()` | Appelé au reset du véhicule : vide disabledState, remet les lisseurs et les valeurs de base à 0, restaure les valeurs custom par défaut, l'impulsion de clignotant et le niveau d'allumage de spawn. *(interne)* | 774 |
| `electrics.resetLastStage()` | Même fonction que initLastStage (voir notes). *(interne)* | 948 |
| `electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels)` | Définit la liste des niveaux d'allumage autorisés et reconstruit la table de substitution (niveau interdit -> niveau supérieur autorisé le plus proche, sinon inférieur). Une liste vide devient {0}. | 740 |
| `electrics.setIgnitionLevel(ignitionLevel)` | Fixe le niveau d'allumage après filtrage par les niveaux autorisés, affiche un message UI (niveaux 0 à 2) et commande le contrôleur principal : niveaux 0/1 coupent allumage et démarreur, 2 allume sans démarreur, 3 allume et active le démarreur. Met à jour la surcharge des valeurs. | 348 |
| `electrics.setLightsState(newval)` | Fixe directement l'état des phares sans validation (utilisé par le menu radial). | 1022 |
| `electrics.set_fog_lights(state)` | Fixe l'état des antibrouillards (valeur stockée telle quelle puis lue dans electrics.values.fog). | 1030 |
| `electrics.set_left_signal(state, autoCancel)` | Allume ou éteint le clignotant gauche de façon explicite (coupe droit et warning à l'allumage). | 187 |
| `electrics.set_lightbar_signal(state)` | Fixe l'état de la barre lumineuse. La valeur est prise modulo 3 (modulo 2 si le véhicule n'a pas de son 'siren'). L'état 2 joue la sirène. | 1005 |
| `electrics.set_right_signal(state, autoCancel)` | Allume ou éteint le clignotant droit de façon explicite. | 242 |
| `electrics.set_warn_signal(value)` | Active ou coupe les feux de détresse ; met aussi les états gauche et droite à la même valeur et désactive l'arrêt automatique. | 955 |
| `electrics.stop_turn_signal()` | Éteint les deux clignotants (sauf si le warning est actif, dans ce cas ne fait rien) et joue le son d'arrêt. | 143 |
| `electrics.toggleIgnitionLevelOnDown()` | Début de l'appui sur la touche de contact : arme le compteur ; au-delà de 0,5 s maintenu, passe au niveau 3 (démarreur). | 1054 |
| `electrics.toggleIgnitionLevelOnUp()` | Relâchement de la touche de contact : fait avancer le niveau 0 -> 1 -> 2, puis 2 -> 1, 1 -> 0 (selon le sens précédent) ; le niveau 3 retombe à 2. | 1058 |
| `electrics.toggle_fog_lights()` | Bascule les antibrouillards. | 1026 |
| `electrics.toggle_highbeams()` | Bascule entre croisement (1) et route (2). Sans effet si les phares sont éteints. | 983 |
| `electrics.toggle_left_signal()` | Bascule le clignotant gauche (entrée utilisateur). Coupe le droit et le warning quand il s'active ; si le warning est actif, force le gauche à true. Joue les sons si ignitionLevel > 0 et active l'arrêt automatique. | 159 |
| `electrics.toggle_lightbar_signal()` | Passe à l'état suivant de la barre lumineuse (0 éteinte, 1 lumières, 2 lumières + sirène si le son 'siren' existe ; sinon 0/1). | 1018 |
| `electrics.toggle_lights()` | Fait tourner l'état des phares : 0 éteint -> 1 croisement -> 2 route -> 0, avec son d'allumage/extinction. | 968 |
| `electrics.toggle_right_signal()` | Bascule le clignotant droit (même logique que toggle_left_signal). | 214 |
| `electrics.toggle_warn_signal()` | Bascule les feux de détresse (warning). | 964 |
| `electrics.updateGFX(dt)` | 1re étape de mise à jour par frame : gère le démarreur maintenu, l'impulsion de clignotant, calcule les valeurs dérivées (feux, vitesse sol, altitude, régime lissé…), injecte les electrics distants (beamstate.updateRemoteElectrics(true)), puis convertit les booléens en 0/1 et efface les clés de disabledState. *(interne)* | 384 |
| `electrics.updateGFXSecondStep(dt)` | 2e étape, appelée après les contrôleurs : calcule brakelights, brakelight_signal_R/L, réinjecte les electrics distants, applique la surcharge selon le niveau d'allumage (valeurs à 0 si ignitionLevel == 0), exécute les valeurs custom du jbeam puis les lisseurs. *(interne)* | 476 |

### Détail des paramètres

#### `electrics.horn(state)`

Active ou coupe le klaxon (electrics.values.horn) et joue/arrête le son 'horn' (deux emplacements alternés pour éviter la coupure brutale).

- `state` (*boolean*) : true klaxonne.

#### `electrics.light_flash_highbeams(enabled)`

Appel de phares : à true, mémorise l'état courant et passe en feux de route ; à false, restaure l'état mémorisé.

- `enabled` (*boolean*) : true commence l'appel de phares, false le termine.

#### `electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels)`

Définit la liste des niveaux d'allumage autorisés et reconstruit la table de substitution (niveau interdit -> niveau supérieur autorisé le plus proche, sinon inférieur). Une liste vide devient {0}.

- `newAllowedIgnitionLevels` (*table<integer, integer>*) : Liste de niveaux parmi 0 à 3.

#### `electrics.setIgnitionLevel(ignitionLevel)`

Fixe le niveau d'allumage après filtrage par les niveaux autorisés, affiche un message UI (niveaux 0 à 2) et commande le contrôleur principal : niveaux 0/1 coupent allumage et démarreur, 2 allume sans démarreur, 3 allume et active le démarreur. Met à jour la surcharge des valeurs.

- `ignitionLevel` (*integer*) : 0 arrêt, 1 accessoires, 2 marche, 3 démarreur.

#### `electrics.setLightsState(newval)`

Fixe directement l'état des phares sans validation (utilisé par le menu radial).

- `newval` (*integer*) : 0 éteint, 1 croisement, 2 route.

#### `electrics.set_fog_lights(state)`

Fixe l'état des antibrouillards (valeur stockée telle quelle puis lue dans electrics.values.fog).

- `state` (*boolean*) : true allume.

#### `electrics.set_left_signal(state, autoCancel)`

Allume ou éteint le clignotant gauche de façon explicite (coupe droit et warning à l'allumage).

- `state` (*boolean*) : true allume, false éteint.
- `autoCancel` (*boolean|nil*) : Si true (à l'allumage), le clignotant s'arrête quand le volant est revenu au neutre après avoir tourné.

#### `electrics.set_lightbar_signal(state)`

Fixe l'état de la barre lumineuse. La valeur est prise modulo 3 (modulo 2 si le véhicule n'a pas de son 'siren'). L'état 2 joue la sirène.

- `state` (*integer*) : 0 éteinte, 1 lumières, 2 lumières + sirène.

#### `electrics.set_right_signal(state, autoCancel)`

Allume ou éteint le clignotant droit de façon explicite.

- `state` (*boolean*) : true allume, false éteint.
- `autoCancel` (*boolean|nil*) : Arrêt automatique après virage, comme set_left_signal.

#### `electrics.set_warn_signal(value)`

Active ou coupe les feux de détresse ; met aussi les états gauche et droite à la même valeur et désactive l'arrêt automatique.

- `value` (*boolean*) : true active le warning.

#### `electrics.updateGFX(dt)`

1re étape de mise à jour par frame : gère le démarreur maintenu, l'impulsion de clignotant, calcule les valeurs dérivées (feux, vitesse sol, altitude, régime lissé…), injecte les electrics distants (beamstate.updateRemoteElectrics(true)), puis convertit les booléens en 0/1 et efface les clés de disabledState.

- `dt` (*number*) : Pas de temps en secondes.

#### `electrics.updateGFXSecondStep(dt)`

2e étape, appelée après les contrôleurs : calcule brakelights, brakelight_signal_R/L, réinjecte les electrics distants, applique la surcharge selon le niveau d'allumage (valeurs à 0 si ignitionLevel == 0), exécute les valeurs custom du jbeam puis les lisseurs.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `disabledState` | table<string, any> | Ensemble de clés d'electrics.values à forcer à nil à chaque updateGFX (présence de la clé suffit). Remis à {} par init et reset. |
| `values` | table<string, number|boolean|nil> | Table des valeurs électriques courantes (voir notes pour les clés usuelles). Lue par l'UI, les streams, les capteurs. Les booléens sont convertis en 0/1 à la fin de la 1re étape. |

## Appels vers le moteur (C++)

- `obj:` `getAirflowSpeed`, `getAltitude`, `getGroundSpeed`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/electrics.lua`.*
