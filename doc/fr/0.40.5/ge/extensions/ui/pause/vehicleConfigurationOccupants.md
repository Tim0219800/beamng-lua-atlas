# `ui_pause_vehicleConfigurationOccupants`

*Fichier : `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_vehicleConfigurationOccupants` : `extensions.load("ui_pause_vehicleConfigurationOccupants")`, puis la globale `ui_pause_vehicleConfigurationOccupants`

Extension GE qui alimente l'onglet « Occupants » de l'écran de configuration du véhicule (menu pause). Elle liste les sièges du véhicule configuré (via gameplay_seatOccupants), les joueurs disponibles (core_multiseat / core_playerPersonas) et permet d'asseoir un joueur, un mannequin (« dummy ») ou personne sur chaque siège. Le véhicule visé est celui de la session (sessionVehicleId) ou, à défaut, celui résolu par core_vehicle_configTarget. Chaque changement déclenche le hook UI VehicleConfigOccupantsStateChanged.

## Exemple

```lua
extensions.load('ui_pause_vehicleConfigurationOccupants')
local st = ui_pause_vehicleConfigurationOccupants.beginSession(true)
ui_pause_vehicleConfigurationOccupants.setSeatOccupant(st.seats[1].seatId, 'dummy')
ui_pause_vehicleConfigurationOccupants.endSession()
```

## Remarques

- Le poids d'un occupant vaut seat.weight si présent, sinon defaultWeight = 89 (kg, valeur locale du fichier).
- Format du paramètre occupant de setSeatOccupant : 'empty', 'dummy' ou 'player:<index>' (index de joueur, 0 pour le joueur solo).
- Pendant une session, un override est posé sur le véhicule (setVehicleOccupantsEnabledOverride) : les occupants restent actifs si l'onglet Occupants est ouvert ou si enabledWhileConfiguring vaut true ; endSession retire l'override.
- onVehicleReplaced et onVehicleResetted sont de simples alias de onVehicleSpawned.

**Dépendances (chargées avant) :** `gameplay_seatOccupants`, `core_multiseat`, `core_playerPersonas`, `core_vehicle_configTarget`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_vehicleConfigurationOccupants.beginSession(enabled)` | Démarre une session de configuration sur le véhicule ciblé. Retire l'override de l'ancien véhicule s'il a changé, mémorise le nouveau et applique l'override des occupants. | 118 |
| `ui_pause_vehicleConfigurationOccupants.endSession()` | Termine la session : supprime l'override des occupants sur le véhicule de session et réinitialise l'état local (sessionVehicleId, onglet actif). | 129 |
| `ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies()` | Place un mannequin de 89 kg sur chaque siège libre du véhicule ciblé. | 202 |
| `ui_pause_vehicleConfigurationOccupants.getState()` | Renvoie l'état affiché par l'onglet : id du véhicule, sièges, joueurs, mode multi-siège, chemins des pièces (partPath) installées, et enabledWhileConfiguring. Si aucun véhicule valide n'est ciblé, renvoie {vehicleId=nil, seats={}, players={}}. | 102 |
| `ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; appelle endSession. *(interne)* *(hook)* | 263 |
| `ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged()` | Hook appelé quand la liste des participants locaux (multi-siège) change ; notifie l'UI si une session est en cours. *(interne)* *(hook)* | 232 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId)` | Hook appelé quand un occupant s'assoit ; notifie l'UI si c'est le véhicule de session. *(interne)* *(hook)* | 224 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId)` | Hook appelé quand un occupant quitte un siège ; notifie l'UI si c'est le véhicule de session. *(interne)* *(hook)* | 228 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged()` | Hook appelé quand la cible de configuration change : retire l'override de l'ancien véhicule, bascule sur le nouveau et notifie l'UI. *(interne)* *(hook)* | 252 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId)` | Hook appelé à la destruction d'un véhicule ; si c'est celui de la session, oublie la session et notifie l'UI. *(interne)* *(hook)* | 246 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId)` | Hook appelé à l'apparition d'un véhicule ; si c'est celui de la session, réapplique l'override et notifie l'UI. *(interne)* *(hook)* | 236 |
| `ui_pause_vehicleConfigurationOccupants.removeAllDummies()` | Retire tous les mannequins du véhicule ciblé. | 216 |
| `ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled)` | Active ou coupe les occupants pendant la configuration et réapplique l'override. | 137 |
| `ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active)` | Indique si l'onglet Occupants est affiché ; tant qu'il l'est, les occupants restent actifs même si enabledWhileConfiguring vaut false. | 143 |
| `ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant)` | Définit l'occupant d'un siège : vide, mannequin ou joueur. Libère le siège au besoin avant de le réoccuper, puis notifie l'UI. | 148 |
| `ui_pause_vehicleConfigurationOccupants.unseatAll()` | Vide tous les sièges du véhicule ciblé et notifie l'UI. | 194 |

### Détail des paramètres

#### `ui_pause_vehicleConfigurationOccupants.beginSession(enabled)`

Démarre une session de configuration sur le véhicule ciblé. Retire l'override de l'ancien véhicule s'il a changé, mémorise le nouveau et applique l'override des occupants.

- `enabled` (*boolean|nil*) : false pour désactiver les occupants pendant la configuration ; toute autre valeur (y compris nil) active.
- **renvoie** : table Le résultat de getState().

#### `ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies()`

Place un mannequin de 89 kg sur chaque siège libre du véhicule ciblé.

- **renvoie** : integer Nombre de mannequins ajoutés (0 si aucun véhicule).

#### `ui_pause_vehicleConfigurationOccupants.getState()`

Renvoie l'état affiché par l'onglet : id du véhicule, sièges, joueurs, mode multi-siège, chemins des pièces (partPath) installées, et enabledWhileConfiguring. Si aucun véhicule valide n'est ciblé, renvoie {vehicleId=nil, seats={}, players={}}.

- **renvoie** : table {vehicleId, seats, players, multiseatActive, vehiclePartPaths, enabledWhileConfiguring}. players : liste triée de {id, label, color '#RRGGBB', icon}.

#### `ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId)`

Hook appelé quand un occupant s'assoit ; notifie l'UI si c'est le véhicule de session.

- `_` (*any*) : Ignoré (déduit du code).
- `vehId` (*integer*) : Id du véhicule concerné.

#### `ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId)`

Hook appelé quand un occupant quitte un siège ; notifie l'UI si c'est le véhicule de session.

- `_` (*any*) : Ignoré (déduit du code).
- `vehId` (*integer*) : Id du véhicule concerné.

#### `ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId)`

Hook appelé à la destruction d'un véhicule ; si c'est celui de la session, oublie la session et notifie l'UI.

- `vehId` (*integer*) : Id du véhicule.

#### `ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId)`

Hook appelé à l'apparition d'un véhicule ; si c'est celui de la session, réapplique l'override et notifie l'UI.

- `vehId` (*integer*) : Id du véhicule.

#### `ui_pause_vehicleConfigurationOccupants.removeAllDummies()`

Retire tous les mannequins du véhicule ciblé.

- **renvoie** : integer Nombre retiré, tel que renvoyé par gameplay_seatOccupants.clearDummyOccupants (0 si aucun véhicule).

#### `ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled)`

Active ou coupe les occupants pendant la configuration et réapplique l'override.

- `enabled` (*boolean|nil*) : false pour désactiver, sinon activé.
- **renvoie** : boolean La valeur retenue.

#### `ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active)`

Indique si l'onglet Occupants est affiché ; tant qu'il l'est, les occupants restent actifs même si enabledWhileConfiguring vaut false.

- `active` (*boolean*) : true si l'onglet est ouvert.

#### `ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant)`

Définit l'occupant d'un siège : vide, mannequin ou joueur. Libère le siège au besoin avant de le réoccuper, puis notifie l'UI.

- `seatId` (*string*) : Identifiant du siège (seat.seatId).
- `occupant` (*string*) : 'empty', 'dummy' ou 'player:<index>'.
- **renvoie** : table {success=boolean, reason=string|nil}. Raisons : seatMissing, invalidOccupant, enterFailed, occupied, ou la raison renvoyée par setDummyOccupant.

#### `ui_pause_vehicleConfigurationOccupants.unseatAll()`

Vide tous les sièges du véhicule ciblé et notifie l'UI.

- **renvoie** : boolean false si aucun véhicule n'est ciblé, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant celle-ci : gameplay_seatOccupants, core_multiseat, core_playerPersonas, core_vehicle_configTarget, core_vehicle_manager. |
| `onVehicleReplaced` | function | Alias de onVehicleSpawned : réapplique l'override et notifie l'UI si le véhicule remplacé est celui de la session. |
| `onVehicleResetted` | function | Alias de onVehicleSpawned : même comportement après un reset du véhicule. |

**Évènements UI (guihooks.trigger) :** `VehicleConfigOccupantsStateChanged`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua`.*
