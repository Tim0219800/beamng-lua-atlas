# `gameplay_freeformDelivery_vehicleSleep`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_vehicleSleep` : `extensions.load("gameplay_freeformDelivery_vehicleSleep")`, puis la globale `gameplay_freeformDelivery_vehicleSleep`

Sous-module de la livraison libre qui endort (setActive(0)) les véhicules de livraison éloignés de la caméra et du véhicule du joueur, et les réveille à l'approche, pour économiser du temps de simulation. Seuls les véhicules ayant un sleepDistance valide dans leur définition sont gérés.

## Remarques

- sleepDistance doit être un nombre > 0, sinon il est ignoré avec une erreur de log.
- wakeDistance par défaut = max(sleepDistance - 50, sleepDistance * 0.8) ; s'il est absent, invalide ou supérieur à sleepDistance, la valeur par défaut est utilisée (hystérésis).
- Un véhicule s'endort quand caméra ET véhicule joueur sont plus loin que sleepDistance ; il se réveille dès que l'un des deux est plus proche que wakeDistance.
- cleanup réveille tous les véhicules suivis.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_vehicleSleep.cleanup()` | Réactive tous les véhicules suivis et vide le suivi. *(interne)* | 128 |
| `gameplay_freeformDelivery_vehicleSleep.getDebugData()` | Renvoie un tableau trié par id avec, pour chaque véhicule suivi, l'état de sommeil et les distances (utile pour l'affichage de debug). | 112 |
| `gameplay_freeformDelivery_vehicleSleep.setup(delivery)` | Normalise sleepDistance/wakeDistance dans delivery.vehicles et enregistre les véhicules concernés (actifs au départ, setActive(1)). *(interne)* | 47 |
| `gameplay_freeformDelivery_vehicleSleep.update()` | Appelée chaque frame : mesure les distances caméra/joueur de chaque véhicule suivi et bascule son état actif/endormi. *(interne)* | 74 |

### Détail des paramètres

#### `gameplay_freeformDelivery_vehicleSleep.getDebugData()`

Renvoie un tableau trié par id avec, pour chaque véhicule suivi, l'état de sommeil et les distances (utile pour l'affichage de debug).

- **renvoie** : table[] Entrées {id, sleeping, sleepDistance, wakeDistance, cameraDistance, playerVehicleDistance}.

#### `gameplay_freeformDelivery_vehicleSleep.setup(delivery)`

Normalise sleepDistance/wakeDistance dans delivery.vehicles et enregistre les véhicules concernés (actifs au départ, setActive(1)).

- `delivery` (*table*) : Données de livraison avec le tableau vehicles.

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua`.*
