# `career_branches`

*Fichier : `lua/ge/extensions/career/branches.lua` · VM : Game Engine (GE) · 651 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_branches` : `extensions.load("career_branches")`, puis la globale `career_branches`

Arbre des domaines, branches et compétences (skills) du mode carrière. Il lit tous les fichiers info.json sous /gameplay/domains/ (récursivement) et en déduit, d'après l'arborescence des dossiers (domains / branches / skills), l'identifiant pathId (noms de dossiers joints par « - », par ex. « apm-motorsport »), le parent et le type (isDomain, isBranch, isSkill). Il calcule niveaux et XP à partir de la valeur de l'attribut du joueur (career_modules_playerAttributes), les multiplicateurs de récompense par niveau, les conditions de déverrouillage (flags) et sauvegarde l'état « unlocked » dans career/branchUnlocks.json.

## Remarques

- Un niveau d'une branche est défini par levels[i].requiredValue ; calcBranchLevelFromValue retourne -1 si aucun seuil n'est atteint. Un branch « missing » (id = « missing ») est retourné quand l'identifiant est inconnu.
- Anciens noms d'attributs (timeTrials, drift, delivery, police…) sont traduits vers les nouveaux chemins via oldAttributeNamesToNewNames, avec un avertissement dans le log.
- Une branche avec isInDevelopment est verrouillée (unlockCondition type « never »). Types de unlockCondition gérés dans checkUnlocks : unlockFlag, anyNunlockFlags (au moins n flags parmi une liste) et never.
- Ordre d'affichage : domaines triés par order, puis leurs enfants récursivement ; order[attributeKey] (money = 0, beamXP = 1, vouchers = 9999) sert à trier les attributs.
- Le niveau « max » est le dernier niveau dont isInDevelopment est faux (levels[i].isMaxLevel).
- Bug : M.onPlayerAttributesChanged = onPlayerAttributesChanged exporte une variable non définie (nil).
- Bug : onCareerActive relit branchUnlocks.json mais la boucle interne qui devrait réappliquer les champs est vide ; les valeurs « unlocked » sauvegardées ne sont donc pas restaurées ici (checkUnlocks les recalcule).
- Bug potentiel : getLevelRewardMultiplier indexe branch.levels[level] sans test ; si le niveau vaut -1 (aucun seuil atteint), l'index est nil et l'accès au champ échoue. getBranchSimpleInfo peut aussi diviser par neededForNext = -1 au dernier niveau.
- moduleVersion = 42 : une sauvegarde plus ancienne (info.json version < 42) est considérée périmée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_branches.calcBranchLevelFromValue(val, id)` | Calcule le niveau d'une branche pour une valeur d'XP : dernier niveau dont requiredValue <= val, plus la progression vers le suivant. | 294 |
| `career_branches.checkUnlocks()` | Recalcule unlocked, unlockInfo, lockedReason et unlockInfos de chaque branche selon unlockCondition et career_modules_unlockFlags. | 462 |
| `career_branches.expandUnlocks(skill, level, unlocks)` | Remplace dans la liste d'unlocks d'un niveau chaque entrée « automaticMission » par une carte « unlockCard » donnant le nombre de défis disponibles pour cette branche ; les autres entrées sont conservées. | 396 |
| `career_branches.extractBranchPathIdFromFilePath(filePath)` | Déduit le pathId d'un chemin de fichier situé sous /gameplay/domains/. | 624 |
| `career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId)` | Construit le pathId « domaine-branche-compétence » (les parties absentes sont omises) et retourne la branche. | 265 |
| `career_branches.getBranchById(id)` | Alias de getBranchByPath. | 248 |
| `career_branches.getBranchByPath(pathId)` | Cherche une branche par pathId ; accepte les anciens noms (avertissement journalisé). | 252 |
| `career_branches.getBranchIcon(id)` | Retourne l'icône de la branche (nil si « missing »). | 360 |
| `career_branches.getBranchLevel(id)` | Niveau actuel du joueur dans une branche (d'après son attribut). Retourne nil si la branche est inconnue ; renvoie aussi les valeurs de calcBranchLevelFromValue. | 331 |
| `career_branches.getBranchLevelByPath(pathId)` | Même chose que getBranchLevel, en passant un pathId. | 338 |
| `career_branches.getBranchSimpleInfo(id)` | Retourne un résumé pour l'UI : label, level, icon, curLvlProgress, neededForNext, processPercent et max (nombre de niveaux). | 315 |
| `career_branches.getBranchXP(id)` | Valeur de l'attribut (XP) du joueur pour la branche, -1 si elle est inconnue du système d'attributs, nil si la branche est « missing ». | 345 |
| `career_branches.getBranches()` | Retourne toutes les branches indexées par id. Au premier appel, charge les info.json de /gameplay/domains/, les trie (domaines puis enfants) et propage la couleur du parent. | 158 |
| `career_branches.getLevelLabel(id, level)` | Libellé d'un niveau : « ui.career.lvlLabelMax » pour le dernier, levelName du niveau sinon, ou un texte avec contexte {lvl}. | 366 |
| `career_branches.getLevelRewardMultiplier(id)` | Multiplicateur de récompense du niveau actuel du joueur (levels[niveau].rewardMultiplier). Les multiplicateurs par défaut vont de 1 à 5 par pas de 0,25 quand la branche déclare defaultRewardMultipliers. | 374 |
| `career_branches.getOrder(key)` | Retourne l'ordre d'une clé d'attribut (table order) ou -math.huge si inconnue. | 21 |
| `career_branches.getSortedBranches()` | Retourne la liste des branches triée par ordre (mise en cache). | 281 |
| `career_branches.getXPNeededForLevel(id, level)` | XP requis (requiredValue) pour atteindre un niveau, -1 si le niveau n'existe pas. | 352 |
| `career_branches.onCareerActive(active)` | Hook appelé à l'activation/désactivation de la carrière ; à l'activation lit branchUnlocks.json (voir notes : la restauration est vide). *(interne)* *(hook)* | 445 |
| `career_branches.onGetUnlockFlagDefinitions(flagDefinitions)` | Hook où chaque branche déclare des flags de déverrouillage : « <id>-level-<n> » pour chaque niveau (et unlockFlags du niveau) et un flag par certification (réussi quand la mission requise est passée). *(interne)* *(hook)* | 509 |
| `career_branches.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde du profil : écrit <save>/career/branchUnlocks.json avec le champ unlocked de chaque branche (career_saveSystem.jsonWriteFileSafe). *(interne)* *(hook)* | 432 |
| `career_branches.orderAttributeKeysByBranchOrder(list)` | Trie une liste de clés d'attributs sur place selon l'ordre des branches et la retourne. | 383 |
| `career_branches.orderBranchNamesKeysByBranchOrder(list)` | Trie une liste d'identifiants de branche (par défaut toutes) selon l'ordre des branches. | 389 |

### Détail des paramètres

#### `career_branches.calcBranchLevelFromValue(val, id)`

Calcule le niveau d'une branche pour une valeur d'XP : dernier niveau dont requiredValue <= val, plus la progression vers le suivant.

- `val` (*number*) : Valeur de l'attribut (XP).
- `id` (*string*) : Identifiant de la branche.
- **renvoie** : integer Niveau (-1 si aucun).
- **renvoie** : number Progression dans le niveau courant (-1 si pas de suivant).
- **renvoie** : number XP nécessaire pour passer au suivant (-1 si pas de suivant).
- **renvoie** : number Seuil du niveau courant (-1 si pas de suivant).
- **renvoie** : number Seuil du niveau suivant (-1 si pas de suivant).

#### `career_branches.expandUnlocks(skill, level, unlocks)`

Remplace dans la liste d'unlocks d'un niveau chaque entrée « automaticMission » par une carte « unlockCard » donnant le nombre de défis disponibles pour cette branche ; les autres entrées sont conservées.

- `skill` (*table*) : Branche (id utilisé).
- `level` (*integer*) : Niveau (non utilisé dans le calcul).
- `unlocks` (*table[]*) : Liste d'unlocks du niveau.
- **renvoie** : table[] Nouvelle liste.

#### `career_branches.extractBranchPathIdFromFilePath(filePath)`

Déduit le pathId d'un chemin de fichier situé sous /gameplay/domains/.

- `filePath` (*string*) : Chemin d'un fichier d'une branche.
- **renvoie** : string pathId.

#### `career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId)`

Construit le pathId « domaine-branche-compétence » (les parties absentes sont omises) et retourne la branche.

- `domainId` (*string*) : Domaine.
- `branchId` (*string|nil*) : Branche.
- `skillId` (*string|nil*) : Compétence (utilisée seulement si branchId est donné).
- **renvoie** : table La branche.

#### `career_branches.getBranchById(id)`

Alias de getBranchByPath.

- `id` (*string*) : Identifiant (pathId).
- **renvoie** : table La branche, ou la branche « missing ».

#### `career_branches.getBranchByPath(pathId)`

Cherche une branche par pathId ; accepte les anciens noms (avertissement journalisé).

- `pathId` (*string*) : Chemin comme « apm-motorsport ».
- **renvoie** : table La branche ou la branche « missing ».

#### `career_branches.getBranchIcon(id)`

Retourne l'icône de la branche (nil si « missing »).

- `id` (*string*) : Identifiant de la branche.
- **renvoie** : string|nil Icône.

#### `career_branches.getBranchLevel(id)`

Niveau actuel du joueur dans une branche (d'après son attribut). Retourne nil si la branche est inconnue ; renvoie aussi les valeurs de calcBranchLevelFromValue.

- `id` (*string*) : Identifiant de la branche.
- **renvoie** : integer|nil Niveau.

#### `career_branches.getBranchLevelByPath(pathId)`

Même chose que getBranchLevel, en passant un pathId.

- `pathId` (*string*) : Chemin de la branche.
- **renvoie** : integer|nil Niveau.

#### `career_branches.getBranchSimpleInfo(id)`

Retourne un résumé pour l'UI : label, level, icon, curLvlProgress, neededForNext, processPercent et max (nombre de niveaux).

- `id` (*string*) : Identifiant de la branche.
- **renvoie** : table Résumé.

#### `career_branches.getBranchXP(id)`

Valeur de l'attribut (XP) du joueur pour la branche, -1 si elle est inconnue du système d'attributs, nil si la branche est « missing ».

- `id` (*string*) : Identifiant de la branche.
- **renvoie** : number|nil XP.

#### `career_branches.getBranches()`

Retourne toutes les branches indexées par id. Au premier appel, charge les info.json de /gameplay/domains/, les trie (domaines puis enfants) et propage la couleur du parent.

- **renvoie** : table<string, table> Branches par id.

#### `career_branches.getLevelLabel(id, level)`

Libellé d'un niveau : « ui.career.lvlLabelMax » pour le dernier, levelName du niveau sinon, ou un texte avec contexte {lvl}.

- `id` (*string*) : Identifiant de la branche.
- `level` (*integer|nil*) : Niveau.
- **renvoie** : string|table|nil Clé de traduction ou table {txt, context}.

#### `career_branches.getLevelRewardMultiplier(id)`

Multiplicateur de récompense du niveau actuel du joueur (levels[niveau].rewardMultiplier). Les multiplicateurs par défaut vont de 1 à 5 par pas de 0,25 quand la branche déclare defaultRewardMultipliers.

- `id` (*string*) : Identifiant de la branche.
- **renvoie** : number|nil Multiplicateur.

#### `career_branches.getOrder(key)`

Retourne l'ordre d'une clé d'attribut (table order) ou -math.huge si inconnue.

- `key` (*string*) : Clé d'attribut (money, beamXP, ...).
- **renvoie** : number Rang d'ordre.

#### `career_branches.getSortedBranches()`

Retourne la liste des branches triée par ordre (mise en cache).

- **renvoie** : table[] Branches triées.

#### `career_branches.getXPNeededForLevel(id, level)`

XP requis (requiredValue) pour atteindre un niveau, -1 si le niveau n'existe pas.

- `id` (*string*) : Identifiant de la branche.
- `level` (*integer*) : Niveau visé.
- **renvoie** : number|nil XP requis.

#### `career_branches.onCareerActive(active)`

Hook appelé à l'activation/désactivation de la carrière ; à l'activation lit branchUnlocks.json (voir notes : la restauration est vide).

- `active` (*boolean*) : Carrière active ou non.

#### `career_branches.onGetUnlockFlagDefinitions(flagDefinitions)`

Hook où chaque branche déclare des flags de déverrouillage : « <id>-level-<n> » pour chaque niveau (et unlockFlags du niveau) et un flag par certification (réussi quand la mission requise est passée).

- `flagDefinitions` (*table<string, table>*) : Table à remplir avec les définitions de flags.

#### `career_branches.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde du profil : écrit <save>/career/branchUnlocks.json avec le champ unlocked de chaque branche (career_saveSystem.jsonWriteFileSafe).

- `currentSavePath` (*string*) : Dossier de la sauvegarde courante.

#### `career_branches.orderAttributeKeysByBranchOrder(list)`

Trie une liste de clés d'attributs sur place selon l'ordre des branches et la retourne.

- `list` (*string[]*) : Clés à trier.
- **renvoie** : string[] La même liste triée.

#### `career_branches.orderBranchNamesKeysByBranchOrder(list)`

Trie une liste d'identifiants de branche (par défaut toutes) selon l'ordre des branches.

- `list` (*string[]|nil*) : Identifiants ; défaut : toutes les branches.
- **renvoie** : string[] Liste triée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `newAttributeNamesToOldNames` | table<string, string> | Table inverse. Construite à partir de l'ancienne table ; si plusieurs anciens noms visent le même chemin, le dernier parcouru gagne. |
| `oldAttributeNamesToNewNames` | table<string, string> | Anciens noms d'attributs vers les chemins actuels (par ex. drift vers bmra-drift). |
| `onPlayerAttributesChanged` | nil | Toujours nil : référence à une variable non définie dans le fichier. ⚠ référence `onPlayerAttributesChanged` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/branches.lua`.*
