# `core_devices`

*Fichier : `lua/ge/extensions/core/devices.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_devices` : `extensions.load("core_devices")`, puis la globale `core_devices`

Pilote l'éclairage RGB des périphériques de jeu (volants, manettes) via l'objet C++ Device. Chaque périphérique assigné à un joueur prend la couleur de ce joueur (orange BeamNG 255,102,0 par défaut), sauf si le retour de force du volant demande le mode d'éclairage « default » et que les LED de changement de rapport du véhicule sont en service : dans ce cas la couleur est réinitialisée (Device.resetRGB).

## Remarques

- Utilise core_input_bindings.assignedPlayers pour savoir quel périphérique appartient à quel joueur, sauf si setPlayerColors a reçu une table d'assignations.
- Les périphériques qui perdent leur joueur repassent à l'orange.
- Ne fait rien si l'objet global Device n'existe pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_devices.onBeforeVehicleReplaced(vehicleId)` | Hook : oublie l'état des LED du véhicule sur le point d'être remplacé. *(interne)* *(hook)* | 74 |
| `core_devices.onFFBConfigChanged()` | Hook : la configuration du retour de force a changé, recalcule l'éclairage des périphériques. *(interne)* *(hook)* | 86 |
| `core_devices.onVehicleDestroyed(vehicleId)` | Hook : oublie l'état des LED du véhicule détruit. *(interne)* *(hook)* | 70 |
| `core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse)` | Hook : un véhicule active ou désactive ses LED de changement de rapport ; si c'est un véhicule de joueur, l'éclairage est recalculé. *(interne)* *(hook)* | 78 |
| `core_devices.setPlayerColors(colors, assignments)` | Définit la couleur par numéro de joueur et rafraîchit immédiatement l'éclairage de tous les périphériques. | 91 |

### Détail des paramètres

#### `core_devices.onBeforeVehicleReplaced(vehicleId)`

Hook : oublie l'état des LED du véhicule sur le point d'être remplacé.

- `vehicleId` (*integer*) : id du véhicule

#### `core_devices.onVehicleDestroyed(vehicleId)`

Hook : oublie l'état des LED du véhicule détruit.

- `vehicleId` (*integer*) : id du véhicule

#### `core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse)`

Hook : un véhicule active ou désactive ses LED de changement de rapport ; si c'est un véhicule de joueur, l'éclairage est recalculé.

- `vehicleId` (*integer*) : id du véhicule
- `shiftLEDsInUse` (*boolean*) : vrai si les LED de rapport sont utilisées

#### `core_devices.setPlayerColors(colors, assignments)`

Définit la couleur par numéro de joueur et rafraîchit immédiatement l'éclairage de tous les périphériques.

- `colors` (*table<integer, vec3>|nil*) : Couleur RGB (composantes 0-255 dans x,y,z) indexée par numéro de joueur ; nil vide la table.
- `assignments` (*table<string, integer>|nil*) : Remplace temporairement l'assignation nom de périphérique -> numéro de joueur (par exemple pour montrer des assignations pas encore appliquées) ; nil utilise core_input_bindings.assignedPlayers.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/devices.lua`.*
