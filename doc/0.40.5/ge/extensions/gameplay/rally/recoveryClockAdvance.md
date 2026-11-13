# `gameplay_rally_recoveryClockAdvance`

*Fichier : `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recoveryClockAdvance` : `extensions.load("gameplay_rally_recoveryClockAdvance")`, puis la globale `gameplay_rally_recoveryClockAdvance`

Table des pénalités de chronomètre appliquées à chaque récupération du véhicule (reset) en rallye. Une récupération coûte un nombre fixe de secondes, indépendant de la longueur de l'étape. Sur une spéciale : 5 s pour un recovery, 0 s pour un flip (retournement). Hors spéciale (liaison) : 60 s et 10 s. Utilisé par rallyManager:addRecoveryRaceTime.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage)` | Renvoie la pénalité en secondes selon que l'étape est une spéciale ou non ; 0 si le type est inconnu. | 24 |
| `gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType)` | Renvoie la pénalité en secondes pour un type de récupération sur une spéciale ; 0 si le type est inconnu. | 20 |

### Détail des paramètres

#### `gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage)`

Renvoie la pénalité en secondes selon que l'étape est une spéciale ou non ; 0 si le type est inconnu.

- `recoveryType` (*string*) : "recovery" ou "flip"
- `isSpecialStage` (*boolean*) : true pour une spéciale, false pour une liaison / autre étape
- **renvoie** : number Secondes ajoutées au chrono

#### `gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType)`

Renvoie la pénalité en secondes pour un type de récupération sur une spéciale ; 0 si le type est inconnu.

- `recoveryType` (*string*) : "recovery" ou "flip"
- **renvoie** : number Secondes ajoutées au chrono

## Champs

| Champ | Type | Description |
|---|---|---|
| `nonSpecialStageSeconds` | table<string, number> | Pénalités hors spéciale : recovery = 60, flip = 10. |
| `specialStageSeconds` | table<string, number> | Pénalités sur une spéciale : recovery = 5, flip = 0 (le chemin de code est gardé mais n'ajoute rien). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua`.*
