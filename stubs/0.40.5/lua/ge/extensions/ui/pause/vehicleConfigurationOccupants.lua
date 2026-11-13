---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui alimente l'onglet « Occupants » de l'écran de configuration du véhicule (menu pause). Elle liste les sièges du véhicule configuré (via gameplay_seatOccupants), les joueurs disponibles (core_multiseat / core_playerPersonas) et permet d'asseoir un joueur, un mannequin (« dummy ») ou personne sur chaque siège. Le véhicule visé est celui de la session (sessionVehicleId) ou, à défaut, celui résolu par core_vehicle_configTarget. Chaque changement déclenche le hook UI VehicleConfigOccupantsStateChanged.
--- Accès : extension `ui_pause_vehicleConfigurationOccupants` : `extensions.load("ui_pause_vehicleConfigurationOccupants")`, puis la globale `ui_pause_vehicleConfigurationOccupants`
---@class ui_pause_vehicleConfigurationOccupants
---@field dependencies table<integer, string> Extensions chargées avant celle-ci : gameplay_seatOccupants, core_multiseat, core_playerPersonas, core_vehicle_configTarget, core_vehicle_manager.
---@field onVehicleReplaced function Alias de onVehicleSpawned : réapplique l'override et notifie l'UI si le véhicule remplacé est celui de la session.
---@field onVehicleResetted function Alias de onVehicleSpawned : même comportement après un reset du véhicule.
ui_pause_vehicleConfigurationOccupants = {}

--- Démarre une session de configuration sur le véhicule ciblé. Retire l'override de l'ancien véhicule s'il a changé, mémorise le nouveau et applique l'override des occupants.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:118
---@param enabled boolean|nil false pour désactiver les occupants pendant la configuration ; toute autre valeur (y compris nil) active.
---@return table  Le résultat de getState().
function ui_pause_vehicleConfigurationOccupants.beginSession(enabled) end

--- Termine la session : supprime l'override des occupants sur le véhicule de session et réinitialise l'état local (sessionVehicleId, onglet actif).
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:129
function ui_pause_vehicleConfigurationOccupants.endSession() end

--- Place un mannequin de 89 kg sur chaque siège libre du véhicule ciblé.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:202
---@return integer  Nombre de mannequins ajoutés (0 si aucun véhicule).
function ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies() end

--- Renvoie l'état affiché par l'onglet : id du véhicule, sièges, joueurs, mode multi-siège, chemins des pièces (partPath) installées, et enabledWhileConfiguring. Si aucun véhicule valide n'est ciblé, renvoie {vehicleId=nil, seats={}, players={}}.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:102
---@return table  {vehicleId, seats, players, multiseatActive, vehiclePartPaths, enabledWhileConfiguring}. players : liste triée de {id, label, color '#RRGGBB', icon}.
function ui_pause_vehicleConfigurationOccupants.getState() end

--- Hook appelé au déchargement de l'extension ; appelle endSession.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:263
function ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded() end

--- Hook appelé quand la liste des participants locaux (multi-siège) change ; notifie l'UI si une session est en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:232
function ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged() end

--- Hook appelé quand un occupant s'assoit ; notifie l'UI si c'est le véhicule de session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:224
---@param _ any Ignoré (déduit du code).
---@param vehId integer Id du véhicule concerné.
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId) end

--- Hook appelé quand un occupant quitte un siège ; notifie l'UI si c'est le véhicule de session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:228
---@param _ any Ignoré (déduit du code).
---@param vehId integer Id du véhicule concerné.
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId) end

--- Hook appelé quand la cible de configuration change : retire l'override de l'ancien véhicule, bascule sur le nouveau et notifie l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:252
function ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged() end

--- Hook appelé à la destruction d'un véhicule ; si c'est celui de la session, oublie la session et notifie l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:246
---@param vehId integer Id du véhicule.
function ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId) end

--- Hook appelé à l'apparition d'un véhicule ; si c'est celui de la session, réapplique l'override et notifie l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:236
---@param vehId integer Id du véhicule.
function ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId) end

--- Retire tous les mannequins du véhicule ciblé.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:216
---@return integer  Nombre retiré, tel que renvoyé par gameplay_seatOccupants.clearDummyOccupants (0 si aucun véhicule).
function ui_pause_vehicleConfigurationOccupants.removeAllDummies() end

--- Active ou coupe les occupants pendant la configuration et réapplique l'override.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:137
---@param enabled boolean|nil false pour désactiver, sinon activé.
---@return boolean  La valeur retenue.
function ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled) end

--- Indique si l'onglet Occupants est affiché ; tant qu'il l'est, les occupants restent actifs même si enabledWhileConfiguring vaut false.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:143
---@param active boolean true si l'onglet est ouvert.
function ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active) end

--- Définit l'occupant d'un siège : vide, mannequin ou joueur. Libère le siège au besoin avant de le réoccuper, puis notifie l'UI.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:148
---@param seatId string Identifiant du siège (seat.seatId).
---@param occupant string 'empty', 'dummy' ou 'player:<index>'.
---@return table  {success=boolean, reason=string|nil}. Raisons : seatMissing, invalidOccupant, enterFailed, occupied, ou la raison renvoyée par setDummyOccupant.
function ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant) end

--- Vide tous les sièges du véhicule ciblé et notifie l'UI.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:194
---@return boolean  false si aucun véhicule n'est ciblé, sinon true.
function ui_pause_vehicleConfigurationOccupants.unseatAll() end

