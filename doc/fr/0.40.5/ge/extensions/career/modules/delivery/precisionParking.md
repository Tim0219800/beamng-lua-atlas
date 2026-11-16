# `career_modules_delivery_precisionParking`

*Fichier : `lua/ge/extensions/career/modules/delivery/precisionParking.lua` · VM : Game Engine (GE) · 436 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_precisionParking` : `extensions.load("career_modules_delivery_precisionParking")`, puis la globale `career_modules_delivery_precisionParking`

Évalue la précision de stationnement du véhicule du joueur à la destination d'une livraison (colis, matériaux ou véhicule) et applique des bonus ou pénalités de récompenses. Le score (2 à 20) combine l'alignement angulaire, l'écart latéral et l'écart longitudinal du centre de la boîte englobante par rapport à la place de parking ; il donne un niveau perfect/great/good/bad/horrible. Les bonus touchent l'argent, l'XP logistique, l'XP de compétence et la réputation de l'organisation.

## Remarques

- Seuils de score : perfect >= 20, great >= 15, good >= 10, bad >= 5, sinon horrible. Score = min(20, (angleScore+sideScore+forwardScore)*6 + 2) arrondi, chaque sous-score étant dans [0,1].
- Angles en degrés, distances en mètres. Un stationnement à 180° compte comme 0° (angle ajusté = 180 - angle si > 90). Place par défaut 2.5 m x 5.0 m si width/length absents.
- Les tolérances sont adaptatives : maxSide = max(0.3, (largeurPlace - largeurVéhicule)*0.3), maxForward = max(0.4, (longueurPlace - longueurVéhicule)*0.3) ; les minimums valent 30 % des maximums (planchers 0.1 et 0.15). L'angle va de 7.5 deg (0 point) à 1.6 deg (plein score).
- Le bonus 'skill' est ajouté à la même clé de récompense que le bonus 'logistics' ('logistics-vehicleDelivery', 'logistics-materials' ou 'logistics-delivery') : les deux s'additionnent sur une seule entrée.
- calculateCargoPrecisionScore (interne) ignore son paramètre cargo et utilise toujours le véhicule du joueur (be:getPlayerVehicleID(0)).
- Les montants sont modifiés en place : appeler deux fois la fonction principale sur le même colis appliquerait le bonus deux fois.

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation)` | Pour un colis ou des matériaux : évalue le véhicule du joueur à la place targetLocation.psPath et applique le bonus à cargo.rewards (money, logistics-materials ou logistics-delivery, réputation de l'organisation) ; stocke le détail dans cargo.precisionParking. | 400 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData)` | Pour une livraison de véhicule : calcule la précision à taskData.dropOffPsPath et ajoute le bonus à taskData.adjustedRewards, avec le détail dans taskData.breakdown.precisionParking. Renvoie taskData inchangé si les données manquent. | 380 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot)` | Calcule le score de stationnement d'un véhicule par rapport à une place (position, rotation, largeur et longueur optionnelles), selon la logique de parkingPointsNode.lua. | 64 |
| `career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot)` | Fonction de débogage : renvoie le score de précision d'un véhicule pour une place (le log est commenté dans le code). | 426 |
| `career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData)` | Convertit un résultat de précision en bonus : montants fixes et pourcentages pour l'argent (positif ou négatif), l'XP logistique, l'XP de compétence (good/great/perfect) et la réputation (bonus great/perfect, pénalité horrible). Sans donnée, renvoie un bonus nul de niveau 'none'. | 171 |
| `career_modules_delivery_precisionParking.getPrecisionParkingConfig()` | Renvoie la table de configuration (seuils de score et montants/pourcentages de récompense) pour l'UI ou le débogage. | 415 |
| `career_modules_delivery_precisionParking.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les références vers parcelManager, general, generator et vehicleTasks. *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation)`

Pour un colis ou des matériaux : évalue le véhicule du joueur à la place targetLocation.psPath et applique le bonus à cargo.rewards (money, logistics-materials ou logistics-delivery, réputation de l'organisation) ; stocke le détail dans cargo.precisionParking.

- `cargo` (*table*) : Colis à livrer (rewards, organization, materialType).
- `targetLocation` (*table*) : Destination contenant psPath, le chemin de la place de parking.
- **renvoie** : table Le colis, modifié si le score a pu être calculé.

#### `career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData)`

Pour une livraison de véhicule : calcule la précision à taskData.dropOffPsPath et ajoute le bonus à taskData.adjustedRewards, avec le détail dans taskData.breakdown.precisionParking. Renvoie taskData inchangé si les données manquent.

- `taskData` (*table*) : Tâche de livraison avec dropOffPsPath, vehId, originalRewards, adjustedRewards, breakdown et offer.organization.
- **renvoie** : table taskData modifié.

#### `career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot)`

Calcule le score de stationnement d'un véhicule par rapport à une place (position, rotation, largeur et longueur optionnelles), selon la logique de parkingPointsNode.lua.

- `vehId` (*integer*) : Identifiant du véhicule.
- `targetParkingSpot` (*table*) : Place de parking avec pos (vec3), rot (quat) et optionnellement width, length.
- **renvoie** : table|nil Table avec precisionLevel, totalScore, angle, adjustedAngle, sideDist, forwardDist, sous-scores et tolérances ; nil si le véhicule est introuvable.

#### `career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot)`

Fonction de débogage : renvoie le score de précision d'un véhicule pour une place (le log est commenté dans le code).

- `vehId` (*integer*) : Identifiant du véhicule.
- `targetParkingSpot` (*table*) : Place de parking (pos, rot, width, length).
- **renvoie** : table|nil Données de précision.

#### `career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData)`

Convertit un résultat de précision en bonus : montants fixes et pourcentages pour l'argent (positif ou négatif), l'XP logistique, l'XP de compétence (good/great/perfect) et la réputation (bonus great/perfect, pénalité horrible). Sans donnée, renvoie un bonus nul de niveau 'none'.

- `precisionData` (*table|nil*) : Résultat de calculateVehiclePrecisionScore.
- **renvoie** : table Table avec precisionLevel, totalScore, mesures et champs moneyFlat/Percent, logisticsFlat/Percent, skillFlat/Percent, reputationFlat/Percent.

#### `career_modules_delivery_precisionParking.getPrecisionParkingConfig()`

Renvoie la table de configuration (seuils de score et montants/pourcentages de récompense) pour l'UI ou le débogage.

- **renvoie** : table Table PRECISION_PARKING_CONFIG (référence, non copiée).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : util_stepHandler. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/precisionParking.lua`.*
