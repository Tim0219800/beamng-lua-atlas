# `career_modules_branches_leagues`

*Fichier : `lua/ge/extensions/career/modules/branches/leagues.lua` · VM : Game Engine (GE) · 486 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_branches_leagues` : `extensions.load("career_modules_branches_leagues")`, puis la globale `career_modules_branches_leagues`

Gère les « ligues » de la carrière : groupes de missions (et de spots de drift) rattachés à une compétence, chargés depuis les fichiers /gameplay/**/*.leagues.json à l'activation de la carrière. Calcule si une ligue est débloquée (conditions leagueStars, branchLevel, skillStars, branchStars, inDevelopment), les étoiles obtenues/disponibles, l'ordre d'affichage, et vérifie la cohérence des missions (une seule ligue, skill, showInCareer).

## Remarques

- Les ligues sont chargées par loadLeagues dans onCareerActive(true) ; getLeagueById/getLeagueOfMission échouent si appelées avant (leaguesById est nil).
- Le statut de déblocage est mis en cache (league._unlocked) ; clearLeagueUnlockCache le réinitialise ainsi que le cache d'étoiles par compétence.
- isLeagueUnlocked écrit aussi condition.met/progress/label sur les conditions de la ligue et league.unlockLabels.
- getLeaguesForUnlockChange débloque le succès NEW_TERRITORY si au moins une ligue passe de verrouillée à débloquée.
- Une ligue 'inDevelopment' reçoit unlock = {{type='inDevelopment'}} et une liste de missions vide.
- Incohérence probable : checkStartConditionLeague teste table.getn(lMap) > 1 sur une table à clés (toujours 0), donc l'erreur 'plusieurs ligues dans startCondition' ne se déclenche jamais.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_branches_leagues.addLeagueSortOrder()` | Calcule league._order : groupe par compétence, tri par étoiles requises puis ordre de fichier, ligues 'highlightIfUnlocked' débloquées en tête, puis ordre des compétences (career_branches.getOrder). | 223 |
| `career_modules_branches_leagues.checkMission(mission)` | Vérifie la configuration d'une mission par rapport aux ligues (startCondition cohérente avec la ligue, careerSetup.skill égal à la compétence de la ligue, showInCareer vrai) et logue des erreurs 'E'. | 455 |
| `career_modules_branches_leagues.clearLeagueUnlockCache()` | Efface le cache de déblocage de chaque ligue et le cache d'étoiles par compétence. | 15 |
| `career_modules_branches_leagues.formatLeague(l)` | Copie profonde d'une ligue enrichie pour l'UI : totalStarsAvailable, totalStarsObtained (missions et objectifs de drift), icon et accentColor de la compétence ('badgeRoundStar' si certification). | 129 |
| `career_modules_branches_leagues.getLeagueById(id)` | Renvoie la ligue d'id donné (table brute, non formatée). | 9 |
| `career_modules_branches_leagues.getLeagueOfMission(mId)` | Renvoie la ligue qui contient la mission donnée. | 10 |
| `career_modules_branches_leagues.getLeaguesForMission(missionId)` | Liste les ligues formatées (triées) qui contiennent la mission donnée. | 206 |
| `career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills)` | Liste les ligues formatées d'une branche (et de ses sous-compétences sauf si ignoreSubSkills), triées par _order. Sans branchId, toutes les ligues. | 167 |
| `career_modules_branches_leagues.getLeaguesForUnlockChange(before, after)` | Compare deux statuts de déblocage et renvoie les ligues nouvellement débloquées (formatées, triées) ; débloque le succès NEW_TERRITORY s'il y en a. | 183 |
| `career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots)` | Obsolète : logue l'erreur 'Deprecated' et ne fait rien. | 200 |
| `career_modules_branches_leagues.getSimpleUnlockedStatus()` | Vide le cache puis renvoie une table id de ligue -> débloquée (booléen) pour toutes les ligues. | 19 |
| `career_modules_branches_leagues.getStarsForSkill(skillId)` | Raccourci de getStarsForSkills pour une seule compétence. | 389 |
| `career_modules_branches_leagues.getStarsForSkills(skillIds)` | Somme des étoiles par défaut disponibles et débloquées pour toutes les missions dont careerSetup.skill est dans la table donnée. | 376 |
| `career_modules_branches_leagues.getStartConditionLeagueId(cond, map)` | Remplit map[leagueId] = true pour chaque condition de type 'league' trouvée dans une startCondition (récursif sur cond.nested). | 391 |
| `career_modules_branches_leagues.isLeagueUnlocked(id)` | Évalue (avec cache) les conditions de déblocage d'une ligue ; sans condition elle est débloquée. | 28 |
| `career_modules_branches_leagues.onCareerActive(active)` | Hook : quand la carrière devient active, charge les ligues depuis les fichiers *.leagues.json de /gameplay/. *(interne)* *(hook)* | 367 |

### Détail des paramètres

#### `career_modules_branches_leagues.checkMission(mission)`

Vérifie la configuration d'une mission par rapport aux ligues (startCondition cohérente avec la ligue, careerSetup.skill égal à la compétence de la ligue, showInCareer vrai) et logue des erreurs 'E'.

- `mission` (*table*) : Mission à vérifier.

#### `career_modules_branches_leagues.formatLeague(l)`

Copie profonde d'une ligue enrichie pour l'UI : totalStarsAvailable, totalStarsObtained (missions et objectifs de drift), icon et accentColor de la compétence ('badgeRoundStar' si certification).

- `l` (*table*) : Ligue brute.
- **renvoie** : table Ligue formatée.

#### `career_modules_branches_leagues.getLeagueById(id)`

Renvoie la ligue d'id donné (table brute, non formatée).

- `id` (*string*) : Id de la ligue.
- **renvoie** : table|nil Ligue ou nil.

#### `career_modules_branches_leagues.getLeagueOfMission(mId)`

Renvoie la ligue qui contient la mission donnée.

- `mId` (*string*) : Id de la mission.
- **renvoie** : table|nil Ligue ou nil.

#### `career_modules_branches_leagues.getLeaguesForMission(missionId)`

Liste les ligues formatées (triées) qui contiennent la mission donnée.

- `missionId` (*string*) : Id de la mission.
- **renvoie** : table[] Ligues formatées.

#### `career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills)`

Liste les ligues formatées d'une branche (et de ses sous-compétences sauf si ignoreSubSkills), triées par _order. Sans branchId, toutes les ligues.

- `branchId` (*string|nil*) : Id de la branche ou compétence.
- `ignoreSubSkills` (*boolean|nil*) : Si vrai, ne retient que les ligues de la compétence elle-même.
- **renvoie** : table[] Ligues formatées triées.

#### `career_modules_branches_leagues.getLeaguesForUnlockChange(before, after)`

Compare deux statuts de déblocage et renvoie les ligues nouvellement débloquées (formatées, triées) ; débloque le succès NEW_TERRITORY s'il y en a.

- `before` (*table<string, boolean>*) : Statut avant.
- `after` (*table<string, boolean>*) : Statut après.
- **renvoie** : table[] Ligues nouvellement débloquées.

#### `career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots)`

Obsolète : logue l'erreur 'Deprecated' et ne fait rien.

- `skill` (*any*) : Non utilisé.
- `missions` (*any*) : Non utilisé.
- `driftSpots` (*any*) : Non utilisé.

#### `career_modules_branches_leagues.getSimpleUnlockedStatus()`

Vide le cache puis renvoie une table id de ligue -> débloquée (booléen) pour toutes les ligues.

- **renvoie** : table<string, boolean> Statut de déblocage par ligue.

#### `career_modules_branches_leagues.getStarsForSkill(skillId)`

Raccourci de getStarsForSkills pour une seule compétence.

- `skillId` (*string*) : Id de la compétence.
- **renvoie** : integer Total d'étoiles par défaut.
- **renvoie** : integer Étoiles débloquées.

#### `career_modules_branches_leagues.getStarsForSkills(skillIds)`

Somme des étoiles par défaut disponibles et débloquées pour toutes les missions dont careerSetup.skill est dans la table donnée.

- `skillIds` (*table<string, boolean>*) : Ensemble d'ids de compétences.
- **renvoie** : integer Total d'étoiles par défaut.
- **renvoie** : integer Étoiles par défaut débloquées.

#### `career_modules_branches_leagues.getStartConditionLeagueId(cond, map)`

Remplit map[leagueId] = true pour chaque condition de type 'league' trouvée dans une startCondition (récursif sur cond.nested).

- `cond` (*table*) : Condition de démarrage d'une mission.
- `map` (*table<string, boolean>*) : Table de sortie.

#### `career_modules_branches_leagues.isLeagueUnlocked(id)`

Évalue (avec cache) les conditions de déblocage d'une ligue ; sans condition elle est débloquée.

- `id` (*string*) : Id de la ligue.
- **renvoie** : boolean true si toutes les conditions sont remplies (false si la ligue n'existe pas).
- **renvoie** : table[]|nil Libellés des conditions (unlockLabels).

#### `career_modules_branches_leagues.onCareerActive(active)`

Hook : quand la carrière devient active, charge les ligues depuis les fichiers *.leagues.json de /gameplay/.

- `active` (*boolean*) : true à l'activation.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/branches/leagues.lua`.*
