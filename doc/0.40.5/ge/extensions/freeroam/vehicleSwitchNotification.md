# `freeroam_vehicleSwitchNotification`

*Fichier : `lua/ge/extensions/freeroam/vehicleSwitchNotification.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_vehicleSwitchNotification` : `extensions.load("freeroam_vehicleSwitchNotification")`, puis la globale `freeroam_vehicleSwitchNotification`

Affiche une notification à l'écran quand le joueur change de véhicule ou de siège : nom du véhicule (marque, nom, configuration), icône selon le type, siège occupé ou mode spectateur, et nombre de véhicules sélectionnables (position courante). Efface le message quand le joueur n'a plus de véhicule ou passe en mode marche (unicycle). Passe par guihooks.trigger('Message', …) avec la catégorie « vehicleSwitch<joueur> ». Global : freeroam_vehicleSwitchNotification.

## Remarques

- Icône : Trailer -> smallTrailer, Prop -> trafficCone, Truck -> boxTruck, Car -> car, autre type -> beamNG ; défaut car.
- Les véhicules comptés comme « sélectionnables » excluent : unicycle, non playerUsable, inactifs, blacklistés (gameplay_walk.isVehicleBlacklisted) et les Type PropParked/PropTraffic. Si les actions switch_next_vehicle/switch_previous_vehicle sont bloquées, le compte est forcé à 1 / index 0.
- Le message dépend de presence.seatId (siège, via gameplay_seatOccupants.getSeats pour le nom) ou de presence.permissionMode ('passenger' = spectateur, sinon pleins contrôles).
- TTL du message : 5 s.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence)` | Hook appelé quand la présence d'un joueur dans un véhicule/siège change : affiche la notification correspondante. *(interne)* *(hook)* | 159 |
| `freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player)` | Hook de changement de véhicule : si le nouveau véhicule n'existe pas ou est l'unicycle, efface la notification (clear=true) de ce joueur. *(interne)* *(hook)* | 147 |

### Détail des paramètres

#### `freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence)`

Hook appelé quand la présence d'un joueur dans un véhicule/siège change : affiche la notification correspondante.

- `player` (*integer|nil*) : Joueur (défaut 0).
- `_` (*any*) : Non utilisé (ancienne présence, déduit du code).
- `presence` (*table|nil*) : {vehicleId, seatId?, permissionMode?}

#### `freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player)`

Hook de changement de véhicule : si le nouveau véhicule n'existe pas ou est l'unicycle, efface la notification (clear=true) de ce joueur.

- `_` (*integer*) : Ancien id (non utilisé).
- `newId` (*integer*) : Nouvel id (-1 = aucun).
- `player` (*integer|nil*) : Joueur (défaut 0).

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/vehicleSwitchNotification.lua`.*
