---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/vehicleSwitchNotification.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affiche une notification à l'écran quand le joueur change de véhicule ou de siège : nom du véhicule (marque, nom, configuration), icône selon le type, siège occupé ou mode spectateur, et nombre de véhicules sélectionnables (position courante). Efface le message quand le joueur n'a plus de véhicule ou passe en mode marche (unicycle). Passe par guihooks.trigger('Message', …) avec la catégorie « vehicleSwitch<joueur> ». Global : freeroam_vehicleSwitchNotification.
--- Accès : extension `freeroam_vehicleSwitchNotification` : `extensions.load("freeroam_vehicleSwitchNotification")`, puis la globale `freeroam_vehicleSwitchNotification`
---@class freeroam_vehicleSwitchNotification
freeroam_vehicleSwitchNotification = {}

--- Hook appelé quand la présence d'un joueur dans un véhicule/siège change : affiche la notification correspondante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/vehicleSwitchNotification.lua:159
---@param player integer|nil Joueur (défaut 0).
---@param _ any Non utilisé (ancienne présence, déduit du code).
---@param presence table|nil {vehicleId, seatId?, permissionMode?}
function freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence) end

--- Hook de changement de véhicule : si le nouveau véhicule n'existe pas ou est l'unicycle, efface la notification (clear=true) de ce joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/vehicleSwitchNotification.lua:147
---@param _ integer Ancien id (non utilisé).
---@param newId integer Nouvel id (-1 = aucun).
---@param player integer|nil Joueur (défaut 0).
function freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player) end

