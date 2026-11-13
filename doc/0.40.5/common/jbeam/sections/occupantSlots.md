# `jbeam_sections_occupantSlots`

*Fichier : `lua/common/jbeam/sections/occupantSlots.lua` · VM : Commun (GE + véhicule) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/occupantSlots")`

Traite la section jbeam « occupantSlots » (places d'occupants). Normalise chaque entrée : id (id, name ou clé de table), defaultPermissionMode (driver, passenger ou unrestricted ; déduit de la caméra sinon), seatSide (left/right/center, déduit de exitSide, driverSide ou du suffixe L/R de l'id), cameraName 'occupant.<id>', entryTrigger 'enterSeat_<id>', cargoGroup '<id>Occupant' et actionMaps (toujours une table). Produit vehicle.occupantSlotsById et active vehicle.occupantSystem.enabled s'il y a des places ou si une pièce active expose un slot de type 'seat_occupant'.

## Remarques

- Les identifiants en double sont rejetés avec une erreur de journal (la seconde entrée est ignorée).
- Un defaultPermissionMode invalide produit un avertissement puis est remplacé : 'driver' si cameraName vaut 'driver', sinon 'passenger'.
- cameraName est toujours réécrit en 'occupant.<id>', quelle que soit la valeur d'origine ; la valeur d'origine ne sert qu'à déduire le mode de permission.
- Le premier paramètre (objID) est ignoré ; appelé seulement côté GE (vmType == 'game').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_occupantSlots.process(_, vehicle, activePartsData)` | Normalise les occupantSlots du véhicule et active le système d'occupants si nécessaire. *(interne)* | 32 |

### Détail des paramètres

#### `jbeam_sections_occupantSlots.process(_, vehicle, activePartsData)`

Normalise les occupantSlots du véhicule et active le système d'occupants si nécessaire.

- `_` (*any*) : Identifiant du véhicule (ignoré).
- `vehicle` (*table*) : Données jbeam (occupantSlots, occupantSystem).
- `activePartsData` (*table<string, table>|nil*) : Pièces actives (pour détecter un slot seat_occupant).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/occupantSlots.lua`.*
