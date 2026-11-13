# `gameplay_freeformDelivery_utils`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/utils.lua` · VM : Game Engine (GE) · 245 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_utils` : `extensions.load("gameplay_freeformDelivery_utils")`, puis la globale `gameplay_freeformDelivery_utils`

Fonctions utilitaires partagées par les sous-modules de la livraison libre : cache de positions de véhicules, recherche d'objets de site (lieux, zones, places de parking), tests de présence d'un véhicule dans une zone cible, résolution de chemins, formatage du temps et accès au joueur (véhicule ou à pied).

## Remarques

- Le cache de positions n'est jamais invalidé automatiquement : getCachedVehiclePosition ne recalcule que si l'entrée n'existe pas ; il faut appeler updateVehicleCache / updateVehicleCacheList régulièrement pour le rafraîchir.
- Le vec3 renvoyé par getCachedVehiclePosition est le vec3 du cache : ne pas le modifier.
- checkParking est appelé avec une tolérance de 0.8 (valeur fixe dans le code).
- findSiteObject cherche d'abord par nom (byName) puis par indice numérique (objects[tonumber(siteId)]) ; sites doit contenir locations, zones et parkingSpots.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType)` | Test unifié de présence : lieu (distance <= radius), zone (containsVehicle) ou place de parking. | 114 |
| `gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot)` | Teste si un véhicule est garé dans une place via parkingSpot:checkParking(vehId, 0.8). | 101 |
| `gameplay_freeformDelivery_utils.clearVehicleCache()` | Vide tout le cache de positions. | 63 |
| `gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId)` | Retrouve un objet de site (lieu, zone ou place de parking) par type et identifiant. | 81 |
| `gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId)` | Cherche une zone cible par id dans delivery.targetAreas. | 152 |
| `gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId)` | Cherche la définition d'un véhicule par id dans delivery.vehicles. | 163 |
| `gameplay_freeformDelivery_utils.formatTime(seconds)` | Formate une durée en secondes en H:MM:SS (si au moins une heure) ou M:SS. | 68 |
| `gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh)` | Renvoie la position en cache d'un véhicule (la calcule au premier appel). | 46 |
| `gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot)` | Détaille le stationnement d'un véhicule dans une place : nombre de coins dans la place (0 à 4), validité et taille de la place. | 214 |
| `gameplay_freeformDelivery_utils.getPlayerPosition()` | Position du joueur : position en cache de son véhicule, sinon position du personnage s'il marche (gameplay_walk). | 199 |
| `gameplay_freeformDelivery_utils.getPlayerVehicle()` | Renvoie le véhicule du joueur 0 (upcasté). | 192 |
| `gameplay_freeformDelivery_utils.getVehicleIds(goal)` | Normalise un goal : renvoie goal.vehicleIds, ou {goal.vehicleId}, ou un tableau vide. | 96 |
| `gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId)` | Convertit un ID de véhicule de livraison en objet véhicule (via gameplay_freeformDelivery_setup.getVehicleId puis Sim.upcast). | 174 |
| `gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId)` | Position en cache du véhicule désigné par son ID de livraison. | 185 |
| `gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath)` | Résout un chemin relatif par rapport au dossier d'un fichier de base. Un chemin commençant par '/' est renvoyé tel quel. | 132 |
| `gameplay_freeformDelivery_utils.updateVehicleCache(veh)` | Met à jour la position en cache d'un véhicule (sans allocation) et la marque valide. | 22 |
| `gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles)` | Met à jour le cache pour chaque véhicule d'une liste. | 37 |

### Détail des paramètres

#### `gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType)`

Test unifié de présence : lieu (distance <= radius), zone (containsVehicle) ou place de parking.

- `veh` (*table*) : Objet véhicule.
- `siteObj` (*table*) : Objet de site.
- `areaType` (*string*) : "location", "zone" ou "parkingSpot".
- **renvoie** : boolean true si le véhicule est dans la zone.

#### `gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot)`

Teste si un véhicule est garé dans une place via parkingSpot:checkParking(vehId, 0.8).

- `veh` (*table*) : Objet véhicule.
- `parkingSpot` (*table*) : Objet place de parking.
- **renvoie** : boolean Résultat de checkParking, false si argument manquant.

#### `gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId)`

Retrouve un objet de site (lieu, zone ou place de parking) par type et identifiant.

- `sites` (*table|nil*) : Table de sites avec locations, zones, parkingSpots (chacun avec byName et objects).
- `siteType` (*string*) : "location", "zone" ou "parkingSpot".
- `siteId` (*string|integer*) : Nom ou indice de l'objet.
- **renvoie** : table|nil Objet de site ou nil.

#### `gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId)`

Cherche une zone cible par id dans delivery.targetAreas.

- `delivery` (*table*) : Données de livraison.
- `areaId` (*string*) : ID de la zone cible.
- **renvoie** : table|nil Zone cible ou nil.

#### `gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId)`

Cherche la définition d'un véhicule par id dans delivery.vehicles.

- `delivery` (*table*) : Données de livraison.
- `vehicleId` (*string*) : ID du véhicule de livraison.
- **renvoie** : table|nil Définition du véhicule ou nil.

#### `gameplay_freeformDelivery_utils.formatTime(seconds)`

Formate une durée en secondes en H:MM:SS (si au moins une heure) ou M:SS.

- `seconds` (*number*) : Durée en secondes.
- **renvoie** : string Chaîne formatée.

#### `gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh)`

Renvoie la position en cache d'un véhicule (la calcule au premier appel).

- `veh` (*table*) : Objet véhicule.
- **renvoie** : vec3|nil Position partagée, ne pas modifier ; nil si veh invalide.

#### `gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot)`

Détaille le stationnement d'un véhicule dans une place : nombre de coins dans la place (0 à 4), validité et taille de la place.

- `veh` (*table*) : Objet véhicule.
- `parkingSpot` (*table*) : Objet place de parking.
- **renvoie** : table|nil {valid, cornerCount, corners, spotSize={x,y,z}} ; nil si aucun coin n'est dans la place.

#### `gameplay_freeformDelivery_utils.getPlayerPosition()`

Position du joueur : position en cache de son véhicule, sinon position du personnage s'il marche (gameplay_walk).

- **renvoie** : vec3|nil Position ou nil.

#### `gameplay_freeformDelivery_utils.getPlayerVehicle()`

Renvoie le véhicule du joueur 0 (upcasté).

- **renvoie** : table|nil Objet véhicule ou nil.

#### `gameplay_freeformDelivery_utils.getVehicleIds(goal)`

Normalise un goal : renvoie goal.vehicleIds, ou {goal.vehicleId}, ou un tableau vide.

- `goal` (*table*) : Objectif de livraison.
- **renvoie** : string[] Liste d'ID de véhicules de livraison.

#### `gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId)`

Convertit un ID de véhicule de livraison en objet véhicule (via gameplay_freeformDelivery_setup.getVehicleId puis Sim.upcast).

- `vehicleId` (*string*) : ID du véhicule de livraison.
- **renvoie** : table|nil Objet véhicule upcasté ou nil.

#### `gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId)`

Position en cache du véhicule désigné par son ID de livraison.

- `vehicleId` (*string*) : ID du véhicule de livraison.
- **renvoie** : vec3|nil Position en cache ou nil.

#### `gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath)`

Résout un chemin relatif par rapport au dossier d'un fichier de base. Un chemin commençant par '/' est renvoyé tel quel.

- `basePath` (*string*) : Chemin du fichier de référence.
- `relativePath` (*string|nil*) : Chemin à résoudre.
- **renvoie** : string|nil Chemin résolu, nil si relativePath est nil ou dossier introuvable.

#### `gameplay_freeformDelivery_utils.updateVehicleCache(veh)`

Met à jour la position en cache d'un véhicule (sans allocation) et la marque valide.

- `veh` (*table*) : Objet véhicule (getID, getPositionXYZ).

#### `gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles)`

Met à jour le cache pour chaque véhicule d'une liste.

- `vehicles` (*table[]*) : Liste d'objets véhicule.

## Appels vers le moteur (C++)

- `Sim.` `upcast`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/utils.lua`.*
