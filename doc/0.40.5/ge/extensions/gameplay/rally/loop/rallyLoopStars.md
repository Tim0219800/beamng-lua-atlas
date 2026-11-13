# `gameplay_rally_loop_rallyLoopStars`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_rallyLoopStars` : `extensions.load("gameplay_rally_loop_rallyLoopStars")`, puis la globale `gameplay_rally_loop_rallyLoopStars`

Gère les étoiles (bronze, silver, gold) d'une boucle de rallye. Les seuils de la boucle sont la somme des seuils des spéciales liées (jusqu'à 4 : stage1_rallyStage…stage4_rallyStage). Le module note aussi une tentative (étoiles débloquées si le temps total est inférieur ou égal au seuil) et choisit le texte de fin de mission correspondant.

## Remarques

- Les clés d'étoiles sont bronzeTime, silverTime, goldTime (temps en secondes, plus petit = meilleur).
- deriveThresholds renvoie nil (avec un log W) si une spéciale est introuvable, si une étoile n'est pas active (careerSetup.starsActive) ou n'a pas de valeur > 0, ou si l'ordre gold <= silver <= bronze n'est pas respecté.
- Les totaux sont arrondis au dixième de seconde.
- applyThresholds vide bronzeTime/silverTime/goldTime de la table si le calcul échoue.
- Dans deriveThresholds la comparaison d'ordre utilise stageData.goldTime directement (valeur brute, pas tonumber) : une valeur en chaîne provoquerait une erreur de comparaison (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData)` | Calcule les seuils et les écrit dans loopMissionTypeData ; les met à nil si le calcul échoue. | 68 |
| `gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData)` | Additionne les seuils bronze/silver/gold des spéciales liées à la boucle. Toutes les spéciales configurées doivent fournir les trois valeurs. | 29 |
| `gameplay_rally_loop_rallyLoopStars.extractMissionId(value)` | Extrait l'id de mission d'une valeur de champ : renvoie ce qui est entre parenthèses finales ("Nom (id)" donne "id"), sinon la chaîne telle quelle ; nil si la valeur n'est pas une chaîne, est vide ou vaut '<none>'. | 10 |
| `gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt)` | Renvoie le texte de fin : celui de 'noStarUnlocked' puis celui de la meilleure étoile débloquée (bronze, puis silver, puis gold), pris dans careerSetup.starOutroTexts ou à défaut defaultStarOutroTexts. nil si la mission n'a pas de goldTime ou aucune étoile active. | 108 |
| `gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt)` | Remplit attempt.unlockedStars[clé] = (temps total <= seuil) pour chaque étoile active. Ne fait rien pour un DNF, une mission sans missionTypeData ou un temps non valide (<= 0). | 82 |

### Détail des paramètres

#### `gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData)`

Calcule les seuils et les écrit dans loopMissionTypeData ; les met à nil si le calcul échoue.

- `loopMissionTypeData` (*table*) : missionTypeData de la boucle, modifié sur place.
- **renvoie** : table|nil Les totaux, ou nil.

#### `gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData)`

Additionne les seuils bronze/silver/gold des spéciales liées à la boucle. Toutes les spéciales configurées doivent fournir les trois valeurs.

- `loopMissionTypeData` (*table*) : missionTypeData de la boucle (champs stage1_rallyStage…stage4_rallyStage).
- **renvoie** : table|nil {bronzeTime, silverTime, goldTime, stageCount} ou nil.

#### `gameplay_rally_loop_rallyLoopStars.extractMissionId(value)`

Extrait l'id de mission d'une valeur de champ : renvoie ce qui est entre parenthèses finales ("Nom (id)" donne "id"), sinon la chaîne telle quelle ; nil si la valeur n'est pas une chaîne, est vide ou vaut '<none>'.

- `value` (*any*) : Valeur du champ stageN_rallyStage.
- **renvoie** : string|nil Id de mission.

#### `gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt)`

Renvoie le texte de fin : celui de 'noStarUnlocked' puis celui de la meilleure étoile débloquée (bronze, puis silver, puis gold), pris dans careerSetup.starOutroTexts ou à défaut defaultStarOutroTexts. nil si la mission n'a pas de goldTime ou aucune étoile active.

- `mission` (*table|nil*) : Mission de la boucle.
- `attempt` (*table|nil*) : Tentative notée (unlockedStars).
- **renvoie** : string|nil Texte de fin.

#### `gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt)`

Remplit attempt.unlockedStars[clé] = (temps total <= seuil) pour chaque étoile active. Ne fait rien pour un DNF, une mission sans missionTypeData ou un temps non valide (<= 0).

- `mission` (*table|nil*) : Mission de la boucle (missionTypeData, careerSetup.starsActive).
- `attempt` (*table*) : Tentative ; lit attempt.data.totalTime et attempt.dnf.
- **renvoie** : table La même tentative.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua`.*
