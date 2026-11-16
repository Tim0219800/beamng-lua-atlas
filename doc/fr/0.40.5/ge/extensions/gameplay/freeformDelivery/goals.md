# `gameplay_freeformDelivery_goals`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/goals.lua` · VM : Game Engine (GE) · 898 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_goals` : `extensions.load("gameplay_freeformDelivery_goals")`, puis la globale `gameplay_freeformDelivery_goals`

Évalue les objectifs (goals) du mode de livraison libre. À partir de delivery.goals, crée un objectif par entrée (types placement, playerInVehicle, engineRunning, coupled, unhitched, damage, distance), gère leurs prérequis (requires, logique ET) et leur état (active, completed), les réévalue à chaque frame en deux passes (complétion puis activation) et fournit l'avancement global et par objectif. Gère aussi le compte à rebours de fin automatique de 5 s quand tous les objectifs requis actifs sont remplis.

## Exemple

```lua
local p = gameplay_freeformDelivery_goals.getProgress()
if p.allRequiredComplete then print('livraison réussie') end
```

## Remarques

- Champs communs d'un objectif de delivery.goals : id (obligatoire), type (placement par défaut), required (vrai sauf si false), requires, label, subtext, stayCompleted, stayCompletedAfterGoalId, removeOnComplete, showInTasklist (vrai sauf si false), showRequiredProgress.
- placement : targetAreaId + vehicleId ou vehicleIds (+ requiredAmount, par défaut tous) ; réussi quand assez de véhicules sont dans la zone cible (zone, location ou parkingSpot). playerInVehicle et engineRunning : un seul véhicule ; playerInVehicle compare le véhicule du joueur, engineRunning lit l'électrique engineRunning > 0 via core_vehicleBridge. coupled/unhitched : vehicleId + trailerId (attelés si coupleur attaché ou core_trailerRespawn). damage : vehicleId(s), maxDamage (10000 par défaut), vrai tant qu'aucun véhicule ne dépasse. distance : vehicleListA et vehicleListB, failThreshold (1000 m par défaut), vrai tant que la distance maximale entre un véhicule de A et un de B reste <= failThreshold ; warningThreshold sert à l'avertissement.
- Prérequis : chaque élément de requires est un id (chaîne) ou une table {id|goalId, state}. state : "complete" (défaut) ou "completely_fulfilled" (complété) ; "not" ou "not_fulfilled" (non complété) ; tout autre (partial, any...) = partiellement ou totalement avancé.
- Un objectif n'est évalué que si ses prérequis sont remplis ; l'activation est recalculée après la passe de complétion pour éviter les artefacts d'ordre de parcours de pairs().
- Le compte à rebours de fin (completionTimerDuration) dure 5 s en temps réel (dtReal) ; il se réinitialise si un objectif requis redevient incomplet. Il s'appuie sur areAllRequiredGoalsCompleted : au moins un objectif requis actif et tous complétés.
- getProgress ne compte que les objectifs actifs ; allRequiredComplete exige required > 0.
- Les objectifs mal définis (id manquant, type inconnu, véhicule manquant...) sont ignorés avec une erreur loggée.
- Incohérence : checkDamageGoal lit veh.damage sur l'objet véhicule, alors que endScreen.collectStatistics lit map.objects[vehId].damage.
- update() logge un avertissement à chaque frame s'il n'y a aucun objectif.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `core_trailerRespawn`, `core_vehicles`, `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId)` | Indique si tous les objectifs d'une zone cible sont complétés (false s'il n'y en a aucun). | 771 |
| `gameplay_freeformDelivery_goals.cleanup()` | Nettoyage complet : vide objectifs, états, caches, requêtes en attente, le cache de véhicules d'utils et le message de fin. | 884 |
| `gameplay_freeformDelivery_goals.getAllGoals()` | Renvoie tous les objectifs créés, actifs ou non, indexés par id. | 732 |
| `gameplay_freeformDelivery_goals.getCompletionTimer()` | Renvoie le temps restant du compte à rebours de fin. | 871 |
| `gameplay_freeformDelivery_goals.getGoalProgress(goalId)` | Renvoie l'avancement détaillé d'un objectif : pour un placement multi-véhicules {total, requiredAmount, inArea, partial, complete}, sinon {total = 1, inArea, partial = false, complete}. | 740 |
| `gameplay_freeformDelivery_goals.getGoalState(goalId)` | Renvoie l'état d'un objectif. | 736 |
| `gameplay_freeformDelivery_goals.getGoals()` | Renvoie seulement les objectifs actifs (prérequis remplis), indexés par id. | 720 |
| `gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId)` | Liste les objectifs liés à une zone cible. | 751 |
| `gameplay_freeformDelivery_goals.getGoalsByType(goalType)` | Liste les objectifs d'un type donné. | 761 |
| `gameplay_freeformDelivery_goals.getProgress()` | Compte les objectifs actifs et complétés, avec la part des objectifs requis. | 692 |
| `gameplay_freeformDelivery_goals.hideFromTasklist()` | Retire le message de fin de la tasklist et arrête le compte à rebours, mais garde objectifs et états pour l'évaluation des résultats. | 876 |
| `gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal)` | Indique si la distance maximale d'un objectif de type distance dépasse 90 % de son warningThreshold (pour afficher un avertissement). | 280 |
| `gameplay_freeformDelivery_goals.isGoalActive(goalId)` | Indique si les prérequis d'un objectif sont remplis. | 746 |
| `gameplay_freeformDelivery_goals.setup(delivery)` | Réinitialise objectifs, états et caches, pré-remplit le cache des zones cibles et de leurs objets de site, crée les objectifs de delivery.goals et calcule l'activation initiale selon les prérequis. | 492 |
| `gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler)` | À appeler à chaque frame : met à jour le cache de position des véhicules concernés, évalue la complétion de chaque objectif actif (passe 1) puis recalcule l'activation (passe 2). | 553 |
| `gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal)` | Gère le compte à rebours de fin automatique : le démarre quand tous les objectifs requis actifs sont complétés (message dans la tasklist), l'annule si l'un redevient incomplet, et renvoie true quand il atteint 0. | 826 |

### Détail des paramètres

#### `gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId)`

Indique si tous les objectifs d'une zone cible sont complétés (false s'il n'y en a aucun).

- `areaId` (*string*) : Id de la zone cible.
- **renvoie** : boolean true si tous complétés.

#### `gameplay_freeformDelivery_goals.getAllGoals()`

Renvoie tous les objectifs créés, actifs ou non, indexés par id.

- **renvoie** : table<string, table> Tous les objectifs.

#### `gameplay_freeformDelivery_goals.getCompletionTimer()`

Renvoie le temps restant du compte à rebours de fin.

- **renvoie** : number|nil Secondes restantes, nil s'il n'est pas lancé.

#### `gameplay_freeformDelivery_goals.getGoalProgress(goalId)`

Renvoie l'avancement détaillé d'un objectif : pour un placement multi-véhicules {total, requiredAmount, inArea, partial, complete}, sinon {total = 1, inArea, partial = false, complete}.

- `goalId` (*string*) : Id de l'objectif.
- **renvoie** : table|nil Avancement, nil si l'objectif n'existe pas.

#### `gameplay_freeformDelivery_goals.getGoalState(goalId)`

Renvoie l'état d'un objectif.

- `goalId` (*string*) : Id de l'objectif.
- **renvoie** : table|nil {completed, lastCheck, active}

#### `gameplay_freeformDelivery_goals.getGoals()`

Renvoie seulement les objectifs actifs (prérequis remplis), indexés par id.

- **renvoie** : table<string, table> Objectifs actifs.

#### `gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId)`

Liste les objectifs liés à une zone cible.

- `targetAreaId` (*string*) : Id de la zone cible.
- **renvoie** : table[] Tableau d'objectifs.

#### `gameplay_freeformDelivery_goals.getGoalsByType(goalType)`

Liste les objectifs d'un type donné.

- `goalType` (*string*) : placement, playerInVehicle, engineRunning, coupled, unhitched, damage ou distance.
- **renvoie** : table[] Tableau d'objectifs.

#### `gameplay_freeformDelivery_goals.getProgress()`

Compte les objectifs actifs et complétés, avec la part des objectifs requis.

- **renvoie** : table {total, completed, required, requiredCompleted, allRequiredComplete}

#### `gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal)`

Indique si la distance maximale d'un objectif de type distance dépasse 90 % de son warningThreshold (pour afficher un avertissement).

- `goal` (*table*) : Objectif de type distance (vehicleListA, vehicleListB, warningThreshold).
- **renvoie** : boolean true si l'avertissement doit être actif.

#### `gameplay_freeformDelivery_goals.isGoalActive(goalId)`

Indique si les prérequis d'un objectif sont remplis.

- `goalId` (*string*) : Id de l'objectif.
- **renvoie** : boolean true si actif.

#### `gameplay_freeformDelivery_goals.setup(delivery)`

Réinitialise objectifs, états et caches, pré-remplit le cache des zones cibles et de leurs objets de site, crée les objectifs de delivery.goals et calcule l'activation initiale selon les prérequis.

- `delivery` (*table*) : Livraison chargée (goals, targetAreas, sites).

#### `gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler)`

À appeler à chaque frame : met à jour le cache de position des véhicules concernés, évalue la complétion de chaque objectif actif (passe 1) puis recalcule l'activation (passe 2).

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `dtSim` (*number*) : Delta temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta temps brut (inutilisé).
- `profiler` (*table|nil*) : LuaProfiler facultatif.

#### `gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal)`

Gère le compte à rebours de fin automatique : le démarre quand tous les objectifs requis actifs sont complétés (message dans la tasklist), l'annule si l'un redevient incomplet, et renvoie true quand il atteint 0.

- `dtReal` (*number*) : Delta temps réel en secondes.
- **renvoie** : boolean true quand la livraison doit se terminer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, core_trailerRespawn, core_vehicles, core_vehicleBridge. |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/goals.lua`.*
