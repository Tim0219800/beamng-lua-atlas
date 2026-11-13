---@meta
-- tim19Atlas stub generated from lua/vehicle/electrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de valeurs électriques du véhicule (`electrics.values`) partagée par tous les contrôleurs, l'UI et les extensions, plus la logique des feux, clignotants, warning, barre lumineuse, klaxon et du niveau d'allumage (ignition). Un moddeur lit `electrics.values.xxx` pour connaître l'état du véhicule (régime, vitesse, feux…) et appelle les fonctions `toggle_*`/`set_*` pour agir sur les feux ou la clé de contact. Les contrôleurs et le jbeam (sections `electrics`/`components.electrics`) écrivent leurs propres clés dans cette table.
--- Accès : globale `electrics`
---@class electrics
---@field disabledState table<string, any> Ensemble de clés d'electrics.values à forcer à nil à chaque updateGFX (présence de la clé suffit). Remis à {} par init et reset.
---@field values table<string, number|boolean|nil> Table des valeurs électriques courantes (voir notes pour les clés usuelles). Lue par l'UI, les streams, les capteurs. Les booléens sont convertis en 0/1 à la fin de la 1re étape.
electrics = {}

--- Active ou coupe le klaxon (electrics.values.horn) et joue/arrête le son 'horn' (deux emplacements alternés pour éviter la coupure brutale).
---Source : lua/vehicle/electrics.lua:1034
---@param state boolean true klaxonne.
function electrics.horn(state) end

--- Appelé à la création du véhicule : lit la config jbeam (lisseurs, valeurs custom, niveaux d'allumage, cycle de clignotant), compile les valeurs custom, fixe le niveau d'allumage de départ et enregistre les entrées du menu radial (core_quickAccess).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:824
function electrics.init() end

--- Appelé en fin d'initialisation : si le niveau d'allumage est 3, le ramène à 2 (en mémorisant 3 comme niveau précédent) pour ne pas rester en démarreur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:948
function electrics.initLastStage() end

--- Appel de phares : à true, mémorise l'état courant et passe en feux de route ; à false, restaure l'état mémorisé.
---Source : lua/vehicle/electrics.lua:996
---@param enabled boolean true commence l'appel de phares, false le termine.
function electrics.light_flash_highbeams(enabled) end

--- Appelé au reset du véhicule : vide disabledState, remet les lisseurs et les valeurs de base à 0, restaure les valeurs custom par défaut, l'impulsion de clignotant et le niveau d'allumage de spawn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:774
function electrics.reset() end

--- Même fonction que initLastStage (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:948
function electrics.resetLastStage() end

--- Définit la liste des niveaux d'allumage autorisés et reconstruit la table de substitution (niveau interdit -> niveau supérieur autorisé le plus proche, sinon inférieur). Une liste vide devient {0}.
---Source : lua/vehicle/electrics.lua:740
---@param newAllowedIgnitionLevels table<integer, integer> Liste de niveaux parmi 0 à 3.
function electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels) end

--- Fixe le niveau d'allumage après filtrage par les niveaux autorisés, affiche un message UI (niveaux 0 à 2) et commande le contrôleur principal : niveaux 0/1 coupent allumage et démarreur, 2 allume sans démarreur, 3 allume et active le démarreur. Met à jour la surcharge des valeurs.
---Source : lua/vehicle/electrics.lua:348
---@param ignitionLevel integer 0 arrêt, 1 accessoires, 2 marche, 3 démarreur.
function electrics.setIgnitionLevel(ignitionLevel) end

--- Fixe directement l'état des phares sans validation (utilisé par le menu radial).
---Source : lua/vehicle/electrics.lua:1022
---@param newval integer 0 éteint, 1 croisement, 2 route.
function electrics.setLightsState(newval) end

--- Fixe l'état des antibrouillards (valeur stockée telle quelle puis lue dans electrics.values.fog).
---Source : lua/vehicle/electrics.lua:1030
---@param state boolean true allume.
function electrics.set_fog_lights(state) end

--- Allume ou éteint le clignotant gauche de façon explicite (coupe droit et warning à l'allumage).
---Source : lua/vehicle/electrics.lua:187
---@param state boolean true allume, false éteint.
---@param autoCancel boolean|nil Si true (à l'allumage), le clignotant s'arrête quand le volant est revenu au neutre après avoir tourné.
function electrics.set_left_signal(state, autoCancel) end

--- Fixe l'état de la barre lumineuse. La valeur est prise modulo 3 (modulo 2 si le véhicule n'a pas de son 'siren'). L'état 2 joue la sirène.
---Source : lua/vehicle/electrics.lua:1005
---@param state integer 0 éteinte, 1 lumières, 2 lumières + sirène.
function electrics.set_lightbar_signal(state) end

--- Allume ou éteint le clignotant droit de façon explicite.
---Source : lua/vehicle/electrics.lua:242
---@param state boolean true allume, false éteint.
---@param autoCancel boolean|nil Arrêt automatique après virage, comme set_left_signal.
function electrics.set_right_signal(state, autoCancel) end

--- Active ou coupe les feux de détresse ; met aussi les états gauche et droite à la même valeur et désactive l'arrêt automatique.
---Source : lua/vehicle/electrics.lua:955
---@param value boolean true active le warning.
function electrics.set_warn_signal(value) end

--- Éteint les deux clignotants (sauf si le warning est actif, dans ce cas ne fait rien) et joue le son d'arrêt.
---Source : lua/vehicle/electrics.lua:143
function electrics.stop_turn_signal() end

--- Début de l'appui sur la touche de contact : arme le compteur ; au-delà de 0,5 s maintenu, passe au niveau 3 (démarreur).
---Source : lua/vehicle/electrics.lua:1054
function electrics.toggleIgnitionLevelOnDown() end

--- Relâchement de la touche de contact : fait avancer le niveau 0 -> 1 -> 2, puis 2 -> 1, 1 -> 0 (selon le sens précédent) ; le niveau 3 retombe à 2.
---Source : lua/vehicle/electrics.lua:1058
function electrics.toggleIgnitionLevelOnUp() end

--- Bascule les antibrouillards.
---Source : lua/vehicle/electrics.lua:1026
function electrics.toggle_fog_lights() end

--- Bascule entre croisement (1) et route (2). Sans effet si les phares sont éteints.
---Source : lua/vehicle/electrics.lua:983
function electrics.toggle_highbeams() end

--- Bascule le clignotant gauche (entrée utilisateur). Coupe le droit et le warning quand il s'active ; si le warning est actif, force le gauche à true. Joue les sons si ignitionLevel > 0 et active l'arrêt automatique.
---Source : lua/vehicle/electrics.lua:159
function electrics.toggle_left_signal() end

--- Passe à l'état suivant de la barre lumineuse (0 éteinte, 1 lumières, 2 lumières + sirène si le son 'siren' existe ; sinon 0/1).
---Source : lua/vehicle/electrics.lua:1018
function electrics.toggle_lightbar_signal() end

--- Fait tourner l'état des phares : 0 éteint -> 1 croisement -> 2 route -> 0, avec son d'allumage/extinction.
---Source : lua/vehicle/electrics.lua:968
function electrics.toggle_lights() end

--- Bascule le clignotant droit (même logique que toggle_left_signal).
---Source : lua/vehicle/electrics.lua:214
function electrics.toggle_right_signal() end

--- Bascule les feux de détresse (warning).
---Source : lua/vehicle/electrics.lua:964
function electrics.toggle_warn_signal() end

--- 1re étape de mise à jour par frame : gère le démarreur maintenu, l'impulsion de clignotant, calcule les valeurs dérivées (feux, vitesse sol, altitude, régime lissé…), injecte les electrics distants (beamstate.updateRemoteElectrics(true)), puis convertit les booléens en 0/1 et efface les clés de disabledState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:384
---@param dt number Pas de temps en secondes.
function electrics.updateGFX(dt) end

--- 2e étape, appelée après les contrôleurs : calcule brakelights, brakelight_signal_R/L, réinjecte les electrics distants, applique la surcharge selon le niveau d'allumage (valeurs à 0 si ignitionLevel == 0), exécute les valeurs custom du jbeam puis les lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electrics.lua:476
---@param dt number Pas de temps en secondes.
function electrics.updateGFXSecondStep(dt) end

