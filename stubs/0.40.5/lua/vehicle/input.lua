---@meta
-- tim19Atlas stub generated from lua/vehicle/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réception et filtrage des entrées de conduite du véhicule (volant, gaz, frein, frein à main, embrayage, et toute entrée spécifique au véhicule). Les actions de contrôle (clavier, manette, volant, IA, scripts) appellent input.event(type, valeur, filtre, …) ; la valeur est stockée dans input.state[type]. À chaque frame, input.updateGFX applique le filtre choisi (lissage clavier/manette, mise en correspondance d'angle du volant, assistances de direction), borne la valeur et l'écrit dans input[type] (ex. input.throttle) et dans electrics.values[type .. '_input']. Les modules du véhicule (controller, hydros, wheels, powertrain) lisent ensuite electrics.values.* ou input.*.
--- Accès : globale `input`
---@class input
---@field allowedInputSources table<string, table<string, boolean>> Sources autorisées par type d'entrée ; absent = toutes. Géré par setAllowedInputSource.
---@field keys table Compatibilité ancienne : toute lecture input.keys[x] est loguée comme obsolète (bindings spécifiques au véhicule à utiliser à la place).
---@field lastFilterType integer|string Dernier filtre de direction vu par updateGFX (-1 au départ).
---@field lastInputs table<string, table<string, number>> Dernière valeur brute reçue par source puis par type d'entrée (vidé au reset).
---@field lowspeedCoef nil Toujours nil (déclaré mais jamais affecté, voir notes).
---@field state table<string, table> Un état par type d'entrée (steering, throttle, brake, parkingbrake, clutch, + entrées véhicule) : val brute, filter, angle, lockType, osClockHP, source, minLimit/maxLimit, smoothers. Recréé par init().
input = {}

--- Enregistre une valeur d'entrée pour la frame suivante. Le filtrage et la publication dans electrics se font dans updateGFX. Ignorée (mais mémorisée dans lastInputs) si des sources sont restreintes pour ce type et que `source` n'en fait pas partie.
---Source : lua/vehicle/input.lua:717
---@param itype string Type d'entrée : "steering", "throttle", "brake", "parkingbrake", "clutch" ou entrée spécifique au véhicule.
---@param ivalue number Valeur brute (steering -1..1, autres 0..1 ; bornée par minLimit/maxLimit après filtrage).
---@param filter integer|string FILTER_KBD (0), FILTER_PAD (1), FILTER_DIRECT (2), FILTER_KBD2 (3) ou FILTER_AI.
---@param angle number|nil Angle du volant physique en degrés pour la mise en correspondance (steering uniquement).
---@param lockType integer|nil Type de verrouillage d'angle : 0 désactivé, 1 normal, 2 plus rapide si nécessaire, 3 désactivé si nécessaire.
---@param osClockHP number|nil Horodatage haute précision de l'évènement, publié dans electrics.values.<type>_timestamp.
---@param source string|nil Origine de l'évènement ; "local" si nil.
function input.event(itype, ivalue, filter, angle, lockType, osClockHP, source) end

--- Premier étage d'initialisation (main.lua : initSystems) : recrée input.state avec les cinq entrées par défaut et leurs lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:88
function input.init() end

--- Second étage (après sounds/electrics) : détermine l'angle de volant du véhicule (hydro steering_input ou v.data.input.steeringWheelLock), autocentrage et lowspeedCoefFFB demandés par l'hydro, crée les sons de frein à main, identifie roues avant/arrière pour les assistances, calcule les taux de lissage clavier, puis appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:144
function input.initSecondStage() end

--- Compatibilité clavier multi-touches : mémorise la valeur de la touche gauche ou droite et envoie event('steering', droite - gauche, filter).
---Source : lua/vehicle/input.lua:753
---@param isRight boolean true pour la touche droite, false pour la gauche.
---@param val number Valeur de la touche (0..1).
---@param filter integer Filtre à utiliser.
function input.kbdSteer(isRight, val, filter) end

--- Remet à 0 (filtre clavier) toutes les entrées sauf le frein à main, et réinitialise les touches gauche/droite de kbdSteer.
---Source : lua/vehicle/input.lua:773
function input.neutralizeControls() end

--- Compatibilité manette mono-axe : val > 0 va sur throttle (frein à 0), val <= 0 va sur brake avec -val (gaz à 0).
---Source : lua/vehicle/input.lua:763
---@param val number Axe -1..1 (positif = accélération).
---@param filter integer Filtre à utiliser.
function input.padAccelerateBrake(val, filter) end

--- Remet à zéro les lisseurs, lastInputs et l'état des assistances, relit les réglages. Appelée par main.lua au reset du véhicule et par initSecondStage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:694
function input.reset() end

--- Restreint ou libère les sources acceptées pour un type d'entrée. source == nil supprime la restriction ; sinon marque la source comme autorisée (enabled true) ou refusée (false). Dès qu'une table existe pour un type, seules les sources à true sont acceptées.
---Source : lua/vehicle/input.lua:834
---@param itype string Type d'entrée.
---@param source string|nil Nom de la source ; nil pour supprimer toute restriction sur ce type.
---@param enabled boolean|nil true pour autoriser la source, false pour la refuser.
function input.setAllowedInputSource(itype, source, enabled) end

--- Relit les réglages (settings.getValue) des assistances de direction : stabilisation anti-survirage, réduction de sous-virage, ralentissement et limitation à haute vitesse, autocentrage à basse vitesse. Appelée par reset() et par onSettingsChanged de main.lua. Intervertit les vitesses de début/fin si elles sont inversées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:783
function input.settingsChanged() end

--- Bascule une entrée : met val à 0 si elle dépasse 0.5, sinon à 1, avec le filtre 0 (clavier). Ignoré si le type n'existe pas dans state. Ne tient pas compte des sources autorisées.
---Source : lua/vehicle/input.lua:738
---@param itype string Type d'entrée existant (ex. "parkingbrake").
function input.toggleEvent(itype) end

--- Appelée à chaque frame graphique par main.lua, très tôt (après sensors et ai, avant electrics). Pour chaque entrée : applique le filtre (direct/pad/clavier/IA), la mise en correspondance d'angle et les assistances de direction, borne la valeur, joue les sons de frein à main et publie le résultat dans input[nom] et electrics.values[nom_input].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:574
---@param dt number Pas de temps de simulation en secondes.
function input.updateGFX(dt) end

--- Métatable posée sur input.keys, uniquement pour la compatibilité : son __index loggue une erreur (une seule fois) indiquant que l'accès à input.keys est obsolète, puis renvoie rawget(M.keys, key).
---@class input_MT
local input_MT = {}

--- Journalise l'utilisation obsolète d'input.keys[key] puis renvoie la valeur brute.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/input.lua:12
---@param tbl table Table input.keys.
---@param key any Clé lue.
function input_MT.__index(tbl, key) end

