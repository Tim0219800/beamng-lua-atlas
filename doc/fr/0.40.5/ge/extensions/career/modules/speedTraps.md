# `career_modules_speedTraps`

*Fichier : `lua/ge/extensions/career/modules/speedTraps.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_speedTraps` : `extensions.load("career_modules_speedTraps")`, puis la globale `career_modules_speedTraps`

Réaction de la carrière aux radars (gameplay_speedTraps) : amendes pour excès de vitesse et feu rouge, messages UI, son du flash, et enregistrement dans les classements de radars (gameplay_speedTrapLeaderboards) sauvegardés dans <save>/career/speedTrapLeaderboards/. Seul le véhicule du joueur (index 0) est concerné.

## Remarques

- Amende d'excès de vitesse (overSpeed en m/s) : <= 6.7056 m/s (15 mph) 35 ; <= 11.176 m/s (25 mph) 70 ; au-delà 100. Elle est payée avec canBeNegative = true (le solde peut devenir négatif).
- Type de pénalité : véhicule hors inventaire ou possédé avec plaque (partie dont le nom contient "licenseplate") = amende normale ; sans plaque = message sans amende ; véhicule prêté de type "work" avec plaque = perte de 10 points de réputation de l'organisation propriétaire. Un véhicule non possédé et non « work » avec plaque ne reçoit aucune pénalité (penaltyType nil).
- Feu rouge : amende fixe de 500 si le véhicule est hors inventaire ou a une plaque ; sinon seulement un message.
- Quel que soit le résultat, onSpeedTrapTriggered ajoute un record au classement et affiche un message (nouveau record, record sans ancien, ou pas de nouveau record).

**Dépendances (chargées avant) :** `career_career`, `gameplay_speedTraps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_speedTraps.onExtensionLoaded()` | Hook : charge les classements de radars du profil si la carrière est active (renvoie false sinon). *(interne)* *(hook)* | 122 |
| `career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed)` | Hook appelé quand une caméra de feu rouge se déclenche : amende de 500 avec message et son si le véhicule du joueur est identifiable par une plaque. *(interne)* *(hook)* | 97 |
| `career_modules_speedTraps.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit les classements de radars dans career/speedTrapLeaderboards/. *(interne)* *(hook)* | 129 |
| `career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Hook appelé quand un radar de vitesse se déclenche : applique l'amende ou la pénalité selon la plaque et le type de véhicule, puis met à jour le classement du radar. *(interne)* *(hook)* | 35 |

### Détail des paramètres

#### `career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed)`

Hook appelé quand une caméra de feu rouge se déclenche : amende de 500 avec message et son si le véhicule du joueur est identifiable par une plaque.

- `speedTrapData` (*table*) : Données de la caméra (subjectID).
- `playerSpeed` (*number*) : Vitesse enregistrée (non utilisée ici).

#### `career_modules_speedTraps.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit les classements de radars dans career/speedTrapLeaderboards/.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Hook appelé quand un radar de vitesse se déclenche : applique l'amende ou la pénalité selon la plaque et le type de véhicule, puis met à jour le classement du radar.

- `speedTrapData` (*table*) : Données du radar (speedLimit, subjectID...).
- `playerSpeed` (*number*) : Vitesse enregistrée en m/s.
- `overSpeed` (*number*) : Dépassement de la limite en m/s.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, gameplay_speedTraps. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/speedTraps.lua`.*
