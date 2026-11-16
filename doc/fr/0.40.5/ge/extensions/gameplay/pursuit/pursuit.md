# `gameplay_pursuit_pursuit`

*Fichier : `lua/ge/extensions/gameplay/pursuit/pursuit.lua` · VM : Game Engine (GE) · 784 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_pursuit_pursuit` : `extensions.load("gameplay_pursuit_pursuit")`, puis la globale `gameplay_pursuit_pursuit`

Gestionnaire de mode poursuite : événement de gameplay où plusieurs véhicules « chase » (police) poursuivent plusieurs véhicules « flee » (fuyards), joueurs ou IA. Une seule instance à la fois. Il insère les véhicules (rôles police/suspect), gère les objectifs (mode free, timed, score, destination), le démarrage (manuel ou à une vitesse donnée), les arrestations, la récupération des fuyards libérés et la détection de blocage. Les états du gestionnaire sont 'off', 'ready', 'active', 'inactive' et 'complete'.

## Exemple

```lua
local p = gameplay_pursuit_pursuit
p.setupPursuit(policeId, suspectId, {gameMode = 'timed', timeLimit = 120, recoveryMode = 'basic'})
p.start()
```

## Remarques

- Options lues : gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal, startSpeed (démarrage auto quand un fuyard atteint cette vitesse, m/s), recoveryMode ('none', 'basic', 'teleportRoad', 'teleportStart', 'teleportRandom', sinon fondu seul), autoRecovery, shuffleVehGroups, shuffleSpots, zoneName.
- Contraintes d'objectifs (setupGoals) : mode timed -> temps >= 30 s et arrestGoal = nombre de fuyards si <= 0 ; mode score -> score >= 100 ; mode destination -> locations >= 1.
- Gagnants passés à stop(winner) et au hook onPursuitGameplayFinished : 'flee' ou 'chase' ; temps écoulé en mode timed = victoire des fuyards, sinon des poursuivants ; 'none' si tous les véhicules sont bloqués.
- Une période de grâce de 10 s (defaults.graceTime) empêche les arrestations et la détection de blocage au début ; tous les véhicules à moins de 2,5 m/s pendant 10 s consécutives sont considérés bloqués.
- Hooks émis : onPursuitGameplayStarted, onPursuitGameplayFinished({winningTeam}), onPursuitGameplayEvent('recoverAll'|'stuckAll'), onPursuitAction (pour les fuyards).
- Bug probable dans onPursuitAction (arrest) : la boucle sur chaseVehs réutilise le nom vehId pour sa variable, donc `vehData.role.targetId == vehId` compare à l'id du poursuivant lui-même, pas à celui de l'arrêté.
- Bug probable dans onPursuitAction (evade) : la cible suivante teste `targetVeh.pursuitUsable` (déjà mis à false) au lieu de vehData.pursuitUsable : nextTargetId reste nil et les poursuivants sont simplement réinitialisés.
- Bug probable dans setupVehiclesFromFiles : parkingSpots est redéclarée en `local` dans le bloc if, la variable extérieure reste nil : les points de départ des fichiers de sites ne sont jamais utilisés (placement automatique 'roadAhead').
- Quand un véhicule est déjà dans le trafic, ses données sont partagées (isShared) ; il a ignorePursuit = true pour que le système de police principal l'ignore.
- reset() est appelé au chargement du module et réinitialise aussi les variables de poursuite de gameplay_police.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount)` | Copie la liste de points de parking et, si les deux quantités sont données, la réarrange en n points tagués 'chase' puis n points tagués 'flee' (sans tag inverse). Garde la liste d'origine si les deux listes ne sont pas assez remplies. | 280 |
| `gameplay_pursuit_pursuit.getManager()` | Renvoie l'objet gestionnaire (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}). | 507 |
| `gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options)` | Valide et insère un véhicule dans le gestionnaire. Réutilise les données de trafic s'il y en a (isShared), sinon crée un objet véhicule de trafic. Lui donne le rôle police ou suspect, désactive respawn et pooling, et met l'IA en mode 'stop' (ou 'disabled' pour un joueur). | 106 |
| `gameplay_pursuit_pursuit.onDeserialized(data)` | Hook après rechargement Lua : réinitialise puis restaure le gestionnaire et réinsère les véhicules. *(interne)* *(hook)* | 746 |
| `gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit)` | Hook émis par gameplay_police pour une action de poursuite. Actif seulement si l'état est 'active' et pour un fuyard : 'arrest' compte l'arrestation, 'evade' retire le fuyard du ciblage, 'release' applique le recoveryMode. *(interne)* *(hook)* | 511 |
| `gameplay_pursuit_pursuit.onSerialize()` | Hook avant rechargement Lua : renvoie l'état du gestionnaire (options, objectifs, données, état) et les données sérialisées des véhicules. *(interne)* *(hook)* | 719 |
| `gameplay_pursuit_pursuit.onTrafficAmountChanged()` | Hook de changement du nombre de véhicules de trafic ; ne fait rien. *(interne)* *(hook)* | 716 |
| `gameplay_pursuit_pursuit.onTrafficStarted()` | Hook au démarrage du trafic : remplace les entrées de trafic par les données du gestionnaire pour les véhicules qui en font partie. *(interne)* *(hook)* | 704 |
| `gameplay_pursuit_pursuit.onTrafficStopped()` | Hook à l'arrêt du trafic ; ne fait rien. *(interne)* *(hook)* | 713 |
| `gameplay_pursuit_pursuit.onUpdate(dt, dtSim)` | Appelé à chaque image. Met à jour les véhicules non partagés, déclenche le démarrage automatique (options.startSpeed), et en jeu actif : durée, ciblage chaque seconde, détection de blocage, récupération, fondus, score total et conditions de victoire. *(interne)* *(hook)* | 560 |
| `gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName)` | Hook de core_multiSpawn : quand les groupes 'autoPursuitChase' puis 'autoPursuitFlee' sont apparus, appelle setupPursuitMulti avec les données mémorisées ; échoue (reset) si l'un des groupes est vide. *(interne)* *(hook)* | 682 |
| `gameplay_pursuit_pursuit.removeVeh(vehId)` | Retire un véhicule du gestionnaire et lui rend son rôle automatique de trafic s'il en fait partie. | 159 |
| `gameplay_pursuit_pursuit.reset()` | Réinitialise complètement le gestionnaire (arrête le gameplay s'il tourne, vide les véhicules, remet l'état à 'off', réinitialise les véhicules et les variables de gameplay_police). | 221 |
| `gameplay_pursuit_pursuit.restart()` | Remet le gameplay à l'état 'ready' sans vider le gestionnaire : réinitialise les données, les poursuites et renvoie les véhicules à leur position d'origine (interactRecovery loadHome). Ne démarre pas. | 241 |
| `gameplay_pursuit_pursuit.setupGoals(options)` | Calcule les objectifs (mode, temps, score, arrestations, lieux) à partir des options ; applique des minimums selon le mode. | 70 |
| `gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars)` | Crée une poursuite avec un poursuivant et un fuyard existants (réinitialise d'abord le gestionnaire s'il n'est pas 'off'). Passe en état 'ready'. | 310 |
| `gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars)` | Crée une poursuite avec plusieurs poursuivants et fuyards. Échoue (reset) s'il n'y a aucun poursuivant ou aucun fuyard inséré ; avertit si certains ont échoué. | 342 |
| `gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars)` | Fait apparaître les groupes de véhicules (core_multiSpawn.spawnGroup, noms 'autoPursuitChase' et 'autoPursuitFlee') puis, via onVehicleGroupSpawned, appelle setupPursuitMulti. Utilise les points de parking fournis, sinon place les véhicules sur la route devant (écart 15 m). | 420 |
| `gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars)` | Comme setupVehicles mais lit les groupes de véhicules (champ data) dans des fichiers JSON, et éventuellement les points de parking d'un fichier de sites (zone optionnelle options.zoneName, mélange options.shuffleSpots, filtre par tags chase/flee). | 448 |
| `gameplay_pursuit_pursuit.start()` | Démarre le gameplay (états 'ready' ou 'inactive' seulement) : active les véhicules (poursuivants en action pursuitStart niveau 3, fuyards en fleePolice) et émet onPursuitGameplayStarted. | 250 |
| `gameplay_pursuit_pursuit.stop(winner)` | Arrête le gameplay actif. Avec un gagnant, l'état devient 'complete', les poursuites des fuyards sont réinitialisées et onPursuitGameplayFinished est émis ; sans gagnant, l'état devient 'inactive'. | 258 |

### Détail des paramètres

#### `gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount)`

Copie la liste de points de parking et, si les deux quantités sont données, la réarrange en n points tagués 'chase' puis n points tagués 'flee' (sans tag inverse). Garde la liste d'origine si les deux listes ne sont pas assez remplies.

- `parkingSpots` (*table[]*) : Points de parking avec customFields.tags.
- `chaseAmount` (*integer|nil*) : Nombre de points chase voulus.
- `fleeAmount` (*integer|nil*) : Nombre de points flee voulus.
- **renvoie** : table[] Liste filtrée (copie superficielle).

#### `gameplay_pursuit_pursuit.getManager()`

Renvoie l'objet gestionnaire (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}).

- **renvoie** : table Gestionnaire (référence directe).

#### `gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options)`

Valide et insère un véhicule dans le gestionnaire. Réutilise les données de trafic s'il y en a (isShared), sinon crée un objet véhicule de trafic. Lui donne le rôle police ou suspect, désactive respawn et pooling, et met l'IA en mode 'stop' (ou 'disabled' pour un joueur).

- `vehId` (*integer*) : Id du véhicule.
- `isChase` (*boolean*) : true = poursuivant, false = fuyard.
- `isAiControlled` (*boolean*) : true si piloté par l'IA (non utilisable par le joueur).
- `options` (*table|nil*) : Options (non utilisées dans la fonction).
- **renvoie** : boolean|nil true si inséré, false si les données n'ont pu être créées, nil si id absent ou déjà inséré.

#### `gameplay_pursuit_pursuit.onDeserialized(data)`

Hook après rechargement Lua : réinitialise puis restaure le gestionnaire et réinsère les véhicules.

- `data` (*table*) : Résultat de onSerialize.

#### `gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit)`

Hook émis par gameplay_police pour une action de poursuite. Actif seulement si l'état est 'active' et pour un fuyard : 'arrest' compte l'arrestation, 'evade' retire le fuyard du ciblage, 'release' applique le recoveryMode.

- `vehId` (*integer*) : Fuyard concerné.
- `action` (*string*) : 'start', 'arrest', 'evade', 'release', 'roadblockAlert', 'roadblock'.
- `pursuit` (*table*) : Données de poursuite du véhicule.

#### `gameplay_pursuit_pursuit.onSerialize()`

Hook avant rechargement Lua : renvoie l'état du gestionnaire (options, objectifs, données, état) et les données sérialisées des véhicules.

- **renvoie** : table {manager, vehicles}

#### `gameplay_pursuit_pursuit.onUpdate(dt, dtSim)`

Appelé à chaque image. Met à jour les véhicules non partagés, déclenche le démarrage automatique (options.startSpeed), et en jeu actif : durée, ciblage chaque seconde, détection de blocage, récupération, fondus, score total et conditions de victoire.

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName)`

Hook de core_multiSpawn : quand les groupes 'autoPursuitChase' puis 'autoPursuitFlee' sont apparus, appelle setupPursuitMulti avec les données mémorisées ; échoue (reset) si l'un des groupes est vide.

- `vehList` (*integer[]*) : Ids des véhicules apparus.
- `groupId` (*any*) : Id du groupe (inutilisé).
- `groupName` (*string*) : Nom du groupe.

#### `gameplay_pursuit_pursuit.removeVeh(vehId)`

Retire un véhicule du gestionnaire et lui rend son rôle automatique de trafic s'il en fait partie.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_pursuit_pursuit.setupGoals(options)`

Calcule les objectifs (mode, temps, score, arrestations, lieux) à partir des options ; applique des minimums selon le mode.

- `options` (*table|nil*) : gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal ; défaut manager.options.

#### `gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars)`

Crée une poursuite avec un poursuivant et un fuyard existants (réinitialise d'abord le gestionnaire s'il n'est pas 'off'). Passe en état 'ready'.

- `chaseVehId` (*integer*) : Id du poursuivant.
- `fleeVehId` (*integer*) : Id du fuyard.
- `options` (*table|nil*) : Options de gameplay.
- `pursuitVars` (*table|nil*) : Variables passées à gameplay_police.setPursuitVars.
- **renvoie** : boolean false si l'un des véhicules est introuvable.

#### `gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars)`

Crée une poursuite avec plusieurs poursuivants et fuyards. Échoue (reset) s'il n'y a aucun poursuivant ou aucun fuyard inséré ; avertit si certains ont échoué.

- `chaseVehIds` (*integer[]*) : Ids des poursuivants.
- `fleeVehIds` (*integer[]*) : Ids des fuyards.
- `options` (*table|nil*) : Options de gameplay.
- `pursuitVars` (*table|nil*) : Variables de poursuite.
- **renvoie** : boolean true si la configuration est prête.

#### `gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars)`

Fait apparaître les groupes de véhicules (core_multiSpawn.spawnGroup, noms 'autoPursuitChase' et 'autoPursuitFlee') puis, via onVehicleGroupSpawned, appelle setupPursuitMulti. Utilise les points de parking fournis, sinon place les véhicules sur la route devant (écart 15 m).

- `chaseAmount` (*integer|nil*) : Nombre de poursuivants (défaut 1).
- `fleeAmount` (*integer|nil*) : Nombre de fuyards (défaut 1).
- `chaseVehGroup` (*table|nil*) : Groupe de véhicules {model, config…} des poursuivants.
- `fleeVehGroup` (*table|nil*) : Groupe des fuyards.
- `parkingSpots` (*table[]|nil*) : Points {pos, rot}, les premiers pour les poursuivants.
- `options` (*table|nil*) : Options (shuffleVehGroups…).
- `pursuitVars` (*table|nil*) : Variables de poursuite.
- **renvoie** : boolean false si une quantité est inférieure à 1.

#### `gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars)`

Comme setupVehicles mais lit les groupes de véhicules (champ data) dans des fichiers JSON, et éventuellement les points de parking d'un fichier de sites (zone optionnelle options.zoneName, mélange options.shuffleSpots, filtre par tags chase/flee).

- `chaseAmount` (*integer*) : Nombre de poursuivants (>= 1).
- `fleeAmount` (*integer*) : Nombre de fuyards (>= 1).
- `chaseVehGroupFile` (*string*) : Chemin du JSON du groupe de poursuivants.
- `fleeVehGroupFile` (*string*) : Chemin du JSON du groupe de fuyards.
- `sitesFile` (*string|nil*) : Chemin du fichier de sites.
- `options` (*table|nil*) : Options (zoneName, shuffleSpots, shuffleVehGroups…).
- `pursuitVars` (*table|nil*) : Variables de poursuite.
- **renvoie** : boolean false si les quantités sont invalides ou un fichier de groupe est illisible.

#### `gameplay_pursuit_pursuit.stop(winner)`

Arrête le gameplay actif. Avec un gagnant, l'état devient 'complete', les poursuites des fuyards sont réinitialisées et onPursuitGameplayFinished est émis ; sans gagnant, l'état devient 'inactive'.

- `winner` (*string|nil*) : 'flee', 'chase' ou autre valeur non nil pour terminer ; nil pour simplement mettre en pause.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitGameplayEvent`
- `onPursuitGameplayFinished`
- `onPursuitGameplayStarted`

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/pursuit/pursuit.lua`.*
