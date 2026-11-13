# `gameplay_police`

*Fichier : `lua/ge/extensions/gameplay/police.lua` · VM : Game Engine (GE) · 806 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_police` : `extensions.load("gameplay_police")`, puis la globale `gameplay_police`

Logique de police du trafic : suit les véhicules ayant le rôle 'police', gère les poursuites (niveaux -1 à 3 selon le score d'infractions), l'arrestation, l'évasion, la libération, les barrages routiers (véhicules et accessoires), et la file d'attente des suspects aléatoires. Elle s'appuie sur gameplay_traffic (données de trafic, rôles). Un moddeur s'en sert pour lancer ou terminer une poursuite, régler les variables de poursuite ou installer un barrage.

## Exemple

```lua
gameplay_police.setPursuitVars({arrestTime = 3, evadeTime = 30})
gameplay_police.setupPursuitGameplay(suspectId, {policeId1, policeId2})
gameplay_police.setPursuitMode(2, suspectId)
local ok, isPolice = gameplay_police.isVehicleInPursuit(suspectId)
```

## Remarques

- Niveaux de poursuite : -1 arrêté (busted), 0 aucun, 1 à 3 niveaux ; le mode est borné par clamp(-1, 3). Le niveau est déclenché par pursuit.score face à vars.scoreLevels (défaut {100, 500, 2000}).
- Variables de poursuite par défaut (vars) : scoreLevels, strictness 0.5, arrestTime 5, arrestRadius 20, evadeTime 45, evadeRadius 80, suspectFrequency 0.5, roadblockFrequency 0.5, useVisibility true, autoRelease true.
- setPoliceVars/getPoliceVars et getPolice sont des alias de setPursuitVars/getPursuitVars et getPoliceVehicles.
- setPursuitVars(nil) ou (false) réinitialise les variables ; une table est fusionnée dans les variables actuelles.
- Les variables sont réinitialisées à la fin du niveau (onClientEndMission) ; elles sont conservées par onSerialize/onDeserialized.
- L'extension ne fait rien si M.enabled est false, si la physique est désactivée (be:getEnabled) ou si le trafic n'est pas à l'état 'on'.
- Le minuteur de suspect aléatoire n'avance que si gameplay_traffic.getTrafficVars().enableRandomEvents est vrai et vars.suspectFrequency > 0.
- Hooks émis : onPursuitAction(id, 'start'|'arrest'|'evade'|'release', pursuit) et onPursuitModeUpdate(id, {mode}).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_police.arrestVehicle(id, showMessages)` | Déclare immédiatement un véhicule arrêté : messages optionnels (contravention ou arrestation, liste des infractions), émet onPursuitAction 'arrest' puis setPursuitMode(-1) pour les policiers qui le ciblent. Fonctionne comme prévu si la cible a le rôle suspect. | 456 |
| `gameplay_police.checkRoadblock(vehIds, rbWidth, useLength)` | Indique combien des véhicules fournis tiennent dans la largeur d'un barrage (du plus court au plus long, longueur = plus grande étendue de la boîte, ou l'axe choisi par useLength). | 56 |
| `gameplay_police.evadeVehicle(id, showMessages)` | Déclare immédiatement qu'un véhicule a échappé à la police : émet onPursuitAction 'evade' puis setPursuitMode(0). | 493 |
| `gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable)` | Police active la plus proche de la cible, d'après les distances mises en cache dans role.validTargets. | 277 |
| `gameplay_police.getPolice()` | Alias de getPoliceVehicles. | 273 |
| `gameplay_police.getPoliceVars()` | Alias de getPursuitVars. | 603 |
| `gameplay_police.getPoliceVehicles()` | Table des véhicules de police du trafic, par id de véhicule (données de gameplay_traffic). Alias : getPolice. | 273 |
| `gameplay_police.getPursuitData(id)` | Données de poursuite (veh.pursuit) d'un véhicule du trafic. Conservée pour compatibilité. | 594 |
| `gameplay_police.getPursuitVars()` | Variables de poursuite actuelles. Alias : getPoliceVars. | 603 |
| `gameplay_police.insertProp(propId)` | Ajoute un objet comme accessoire de barrage, s'il existe, n'est pas déjà un véhicule de trafic et n'est pas déjà enregistré. | 235 |
| `gameplay_police.isVehicleInPursuit(id, targetId)` | Statut de poursuite d'un véhicule du trafic : pour un policier, vrai s'il poursuit (éventuellement targetId) ; pour un suspect, vrai si pursuit.mode > 0. | 299 |
| `gameplay_police.onClientEndMission()` | Hook de fin de niveau : vide la liste de police et réinitialise les variables de poursuite. *(interne)* *(hook)* | 707 |
| `gameplay_police.onDeserialized(data)` | Hook après rechargement Lua : restaure vars et policePropIds. *(interne)* *(hook)* | 762 |
| `gameplay_police.onSerialize()` | Hook avant rechargement Lua : renvoie {vars, propIds} et vide la liste de police (reconstruite ensuite). *(interne)* *(hook)* | 756 |
| `gameplay_police.onTrafficAction(id, action, data)` | Hook de trafic : suit les changements de rôle (action 'changeRole') pour ajouter ou retirer un véhicule de la liste de police. *(interne)* *(hook)* | 607 |
| `gameplay_police.onTrafficSpecialVehiclesProviders()` | Hook de gameplay_traffic : enregistre le fournisseur de véhicules spéciaux 'police' (priorité 10, au moins 3 véhicules de trafic au total, 25 % du total arrondi au supérieur si options.police). Le groupe vient d'un fichier de groupe (si options.autoLoadFromFile ou le réglage trafficSmartSelections), sinon de trafficUtils.createPoliceGroup, sinon des fullsize/police. *(interne)* *(hook)* | 26 |
| `gameplay_police.onTrafficStarted()` | Hook au démarrage du trafic : logue le nombre de véhicules de police et d'accessoires. *(interne)* *(hook)* | 635 |
| `gameplay_police.onTrafficStopped()` | Hook à l'arrêt du trafic : vide la liste de police. *(interne)* *(hook)* | 642 |
| `gameplay_police.onTrafficVehicleAdded(id)` | Hook : ajoute le véhicule à la liste de police si son rôle est 'police'. *(interne)* *(hook)* | 623 |
| `gameplay_police.onTrafficVehicleRemoved(id)` | Hook : retire le véhicule de la liste de police. *(interne)* *(hook)* | 629 |
| `gameplay_police.onUpdate(dt, dtSim)` | Appelé à chaque image. Pour chaque véhicule du trafic, déclenche setPursuitMode quand le score atteint un nouveau palier de scoreLevels (avec un court délai au début). Gère aussi le minuteur de suspect aléatoire. *(interne)* *(hook)* | 712 |
| `gameplay_police.onVehicleDestroyed(id)` | Hook : retire l'objet détruit de la liste d'accessoires. *(interne)* *(hook)* | 700 |
| `gameplay_police.onVehicleResetted(id)` | Hook de réinitialisation d'un véhicule IA : choisit éventuellement un suspect aléatoire parmi les véhicules 'standard' quand le minuteur est écoulé, ou ramène un suspect non 'wanted' au rôle standard. *(interne)* *(hook)* | 683 |
| `gameplay_police.onVehicleSwitched(oldId, newId)` | Hook de changement de véhicule contrôlé : insère le nouveau véhicule dans le trafic si besoin ; lors d'un passage à pied/en véhicule (jbeam 'unicycle') pendant une poursuite, transfère les données de poursuite au nouveau véhicule, relance le mode, et force l'arrestation en cas de retour dans un véhicule sous les yeux de la police. Marque ignorePolice pour éviter l'auto-arrestation d'un policier descendant. *(interne)* *(hook)* | 646 |
| `gameplay_police.placeRoadblock(vehIds, pos, rot, placeData)` | Place des véhicules en rang en travers d'une route (centrés sur pos, répartis sur placeData.width), puis les téléporte avec core_multiSpawn.placeGroup. | 91 |
| `gameplay_police.releaseVehicle(id, showMessages)` | Libère un véhicule après arrestation : émet onPursuitAction 'release' et remet le mode de poursuite à 0. Si le véhicule n'est pas du trafic, envoie controller.setFreeze(0) à son VM. | 519 |
| `gameplay_police.removeProp(propId)` | Retire un accessoire de la liste de barrage. | 242 |
| `gameplay_police.setPoliceVars(data)` | Alias de setPursuitVars. | 265 |
| `gameplay_police.setPropsActive(active, reset)` | Active ou désactive tous les accessoires de barrage enregistrés ; avec reset, appelle recovery.loadHome() sur chacun. | 226 |
| `gameplay_police.setPursuitMode(mode, targetId, policeIds)` | Fixe le mode de poursuite d'une cible : -1 arrêté, 0 fin, 1 à 3 niveau. Met la cible au rôle suspect (action fleePolice), met à jour les policiers (pursuitStart, pursuitEnd, resetAction) et le score, puis émet onPursuitModeUpdate. Au passage de 0 à >0, émet onPursuitAction 'start'. Sans effet si la cible n'est pas du trafic ou a ignorePursuit. | 325 |
| `gameplay_police.setPursuitVars(data)` | Fusionne data dans les variables de poursuite ; sans table valide (nil/false), les remet par défaut. Alias : setPoliceVars. | 265 |
| `gameplay_police.setSuspect(id)` | Passe un véhicule de trafic au rôle 'suspect' avec l'action 'watchPolice' (conservée au rafraîchissement du rôle). | 429 |
| `gameplay_police.setSuspectTimer(time)` | Règle le délai avant le prochain suspect aléatoire. Sans argument : 120 * coef * (1 - suspectFrequency)^2 + 15 à 45 s ; coef vaut 2, 1 après une arrestation du joueur policier, 5 après une évasion. | 439 |
| `gameplay_police.setupPursuitGameplay(suspectId, policeIds, options)` | Prépare un scénario de poursuite : insère le suspect dans le trafic (sans désactivation par le pool de véhicules), désactive son respawn, lui donne le rôle suspect (pursuitMode), force le rôle 'police' aux policeIds fournis, et lance l'action 'watchPolice' sauf si preventAutoStart. | 544 |
| `gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist)` | Prépare et place un barrage devant la cible. Choisit les véhicules de police actifs, éloignés de plus de activeDist et derrière l'origine, qui peuvent cibler targetId. Cherche un point de route à spawnDist devant, calcule la largeur de route, ajuste l'angle aléatoirement, met les policiers en action 'roadblock' et place aussi des accessoires (propIds). | 136 |

### Détail des paramètres

#### `gameplay_police.arrestVehicle(id, showMessages)`

Déclare immédiatement un véhicule arrêté : messages optionnels (contravention ou arrestation, liste des infractions), émet onPursuitAction 'arrest' puis setPursuitMode(-1) pour les policiers qui le ciblent. Fonctionne comme prévu si la cible a le rôle suspect.

- `id` (*integer*) : Véhicule arrêté.
- `showMessages` (*boolean|nil*) : Afficher les messages d'interface.

#### `gameplay_police.checkRoadblock(vehIds, rbWidth, useLength)`

Indique combien des véhicules fournis tiennent dans la largeur d'un barrage (du plus court au plus long, longueur = plus grande étendue de la boîte, ou l'axe choisi par useLength).

- `vehIds` (*integer[]*) : Ids de véhicules ou d'accessoires.
- `rbWidth` (*number|nil*) : Largeur maximale du barrage en mètres (défaut 10).
- `useLength` (*boolean|nil*) : nil = meilleur axe ; true = étendue Y ; false = étendue X.
- **renvoie** : integer[] Ids qui tiennent dans le barrage (nil si vehIds n'est pas une table).
- **renvoie** : number Longueur totale occupée en mètres.

#### `gameplay_police.evadeVehicle(id, showMessages)`

Déclare immédiatement qu'un véhicule a échappé à la police : émet onPursuitAction 'evade' puis setPursuitMode(0).

- `id` (*integer*) : Véhicule.
- `showMessages` (*boolean|nil*) : Afficher les messages d'interface.

#### `gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable)`

Police active la plus proche de la cible, d'après les distances mises en cache dans role.validTargets.

- `targetId` (*integer|nil*) : Id de la cible.
- `isVisible` (*boolean|nil*) : Ne garder que les policiers voyant la cible (ignoré si vars.useVisibility est false).
- `isUsable` (*boolean|nil*) : Exclure les policiers à l'état 'disabled'.
- **renvoie** : integer|nil Id du policier.
- **renvoie** : number Distance (math.huge si aucun).
- **renvoie** : number Distance interactive (le policier regarde devant).

#### `gameplay_police.getPolice()`

Alias de getPoliceVehicles.

- **renvoie** : table<integer, table> Véhicules de police.

#### `gameplay_police.getPoliceVars()`

Alias de getPursuitVars.

- **renvoie** : table Variables (référence directe).

#### `gameplay_police.getPoliceVehicles()`

Table des véhicules de police du trafic, par id de véhicule (données de gameplay_traffic). Alias : getPolice.

- **renvoie** : table<integer, table> Véhicules de police.

#### `gameplay_police.getPursuitData(id)`

Données de poursuite (veh.pursuit) d'un véhicule du trafic. Conservée pour compatibilité.

- `id` (*integer|nil*) : Véhicule (défaut joueur 0).
- **renvoie** : table|nil Table pursuit (mode, score, timers, offensesList…).

#### `gameplay_police.getPursuitVars()`

Variables de poursuite actuelles. Alias : getPoliceVars.

- **renvoie** : table Variables (référence directe).

#### `gameplay_police.insertProp(propId)`

Ajoute un objet comme accessoire de barrage, s'il existe, n'est pas déjà un véhicule de trafic et n'est pas déjà enregistré.

- `propId` (*integer*) : Id de l'objet.

#### `gameplay_police.isVehicleInPursuit(id, targetId)`

Statut de poursuite d'un véhicule du trafic : pour un policier, vrai s'il poursuit (éventuellement targetId) ; pour un suspect, vrai si pursuit.mode > 0.

- `id` (*integer|nil*) : Véhicule (défaut joueur 0).
- `targetId` (*integer|nil*) : Filtre sur la cible poursuivie (policiers seulement).
- **renvoie** : boolean En poursuite.
- **renvoie** : boolean Le véhicule est un policier.

#### `gameplay_police.onDeserialized(data)`

Hook après rechargement Lua : restaure vars et policePropIds.

- `data` (*table*) : Résultat de onSerialize.

#### `gameplay_police.onSerialize()`

Hook avant rechargement Lua : renvoie {vars, propIds} et vide la liste de police (reconstruite ensuite).

- **renvoie** : table {vars, propIds}

#### `gameplay_police.onTrafficAction(id, action, data)`

Hook de trafic : suit les changements de rôle (action 'changeRole') pour ajouter ou retirer un véhicule de la liste de police.

- `id` (*integer*) : Véhicule.
- `action` (*string*) : Nom de l'action.
- `data` (*table*) : Pour 'changeRole' : name, prevName.

#### `gameplay_police.onTrafficVehicleAdded(id)`

Hook : ajoute le véhicule à la liste de police si son rôle est 'police'.

- `id` (*integer*) : Véhicule ajouté.

#### `gameplay_police.onTrafficVehicleRemoved(id)`

Hook : retire le véhicule de la liste de police.

- `id` (*integer*) : Véhicule retiré.

#### `gameplay_police.onUpdate(dt, dtSim)`

Appelé à chaque image. Pour chaque véhicule du trafic, déclenche setPursuitMode quand le score atteint un nouveau palier de scoreLevels (avec un court délai au début). Gère aussi le minuteur de suspect aléatoire.

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_police.onVehicleDestroyed(id)`

Hook : retire l'objet détruit de la liste d'accessoires.

- `id` (*integer*) : Objet détruit.

#### `gameplay_police.onVehicleResetted(id)`

Hook de réinitialisation d'un véhicule IA : choisit éventuellement un suspect aléatoire parmi les véhicules 'standard' quand le minuteur est écoulé, ou ramène un suspect non 'wanted' au rôle standard.

- `id` (*integer*) : Véhicule réinitialisé.

#### `gameplay_police.onVehicleSwitched(oldId, newId)`

Hook de changement de véhicule contrôlé : insère le nouveau véhicule dans le trafic si besoin ; lors d'un passage à pied/en véhicule (jbeam 'unicycle') pendant une poursuite, transfère les données de poursuite au nouveau véhicule, relance le mode, et force l'arrestation en cas de retour dans un véhicule sous les yeux de la police. Marque ignorePolice pour éviter l'auto-arrestation d'un policier descendant.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `gameplay_police.placeRoadblock(vehIds, pos, rot, placeData)`

Place des véhicules en rang en travers d'une route (centrés sur pos, répartis sur placeData.width), puis les téléporte avec core_multiSpawn.placeGroup.

- `vehIds` (*integer[]*) : Ids à placer.
- `pos` (*vec3*) : Centre du barrage.
- `rot` (*quat*) : Orientation (la direction avant doit suivre la route).
- `placeData` (*table|nil*) : width (défaut 10 m), angle (degrés, défaut 0), centerAngle (angle du véhicule central).

#### `gameplay_police.releaseVehicle(id, showMessages)`

Libère un véhicule après arrestation : émet onPursuitAction 'release' et remet le mode de poursuite à 0. Si le véhicule n'est pas du trafic, envoie controller.setFreeze(0) à son VM.

- `id` (*integer*) : Véhicule.
- `showMessages` (*boolean|nil*) : Afficher le message « drive away » si c'est le joueur.

#### `gameplay_police.removeProp(propId)`

Retire un accessoire de la liste de barrage.

- `propId` (*integer*) : Id de l'objet.

#### `gameplay_police.setPoliceVars(data)`

Alias de setPursuitVars.

- `data` (*table|nil|false*) : Voir setPursuitVars.

#### `gameplay_police.setPropsActive(active, reset)`

Active ou désactive tous les accessoires de barrage enregistrés ; avec reset, appelle recovery.loadHome() sur chacun.

- `active` (*boolean*) : true pour activer.
- `reset` (*boolean|nil*) : true pour remettre à leur position d'origine.

#### `gameplay_police.setPursuitMode(mode, targetId, policeIds)`

Fixe le mode de poursuite d'une cible : -1 arrêté, 0 fin, 1 à 3 niveau. Met la cible au rôle suspect (action fleePolice), met à jour les policiers (pursuitStart, pursuitEnd, resetAction) et le score, puis émet onPursuitModeUpdate. Au passage de 0 à >0, émet onPursuitAction 'start'. Sans effet si la cible n'est pas du trafic ou a ignorePursuit.

- `mode` (*integer*) : -1 à 3 (borné).
- `targetId` (*integer|nil*) : Cible (défaut joueur 0).
- `policeIds` (*integer[]|integer|nil*) : Policiers concernés (défaut tous ; un nombre seul est accepté).

#### `gameplay_police.setPursuitVars(data)`

Fusionne data dans les variables de poursuite ; sans table valide (nil/false), les remet par défaut. Alias : setPoliceVars.

- `data` (*table|nil|false*) : Variables à modifier (scoreLevels, strictness, arrestTime, arrestRadius, evadeTime, evadeRadius, suspectFrequency, roadblockFrequency, useVisibility, autoRelease).

#### `gameplay_police.setSuspect(id)`

Passe un véhicule de trafic au rôle 'suspect' avec l'action 'watchPolice' (conservée au rafraîchissement du rôle).

- `id` (*integer*) : Id du véhicule.

#### `gameplay_police.setSuspectTimer(time)`

Règle le délai avant le prochain suspect aléatoire. Sans argument : 120 * coef * (1 - suspectFrequency)^2 + 15 à 45 s ; coef vaut 2, 1 après une arrestation du joueur policier, 5 après une évasion.

- `time` (*number|nil*) : Délai en secondes ; nil = calcul automatique.

#### `gameplay_police.setupPursuitGameplay(suspectId, policeIds, options)`

Prépare un scénario de poursuite : insère le suspect dans le trafic (sans désactivation par le pool de véhicules), désactive son respawn, lui donne le rôle suspect (pursuitMode), force le rôle 'police' aux policeIds fournis, et lance l'action 'watchPolice' sauf si preventAutoStart.

- `suspectId` (*integer|nil*) : Suspect (défaut véhicule du joueur 0).
- `policeIds` (*integer[]|nil*) : Policiers (défaut : policiers existants).
- `options` (*table|nil*) : playerId, pursuitMode (défaut 2), preventAutoStart (défaut false).
- **renvoie** : boolean false si le suspect est introuvable ou s'il n'existe aucun policier.

#### `gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist)`

Prépare et place un barrage devant la cible. Choisit les véhicules de police actifs, éloignés de plus de activeDist et derrière l'origine, qui peuvent cibler targetId. Cherche un point de route à spawnDist devant, calcule la largeur de route, ajuste l'angle aléatoirement, met les policiers en action 'roadblock' et place aussi des accessoires (propIds).

- `targetId` (*integer|nil*) : Cible (défaut véhicule du joueur 0).
- `roadblockVehIds` (*integer[]|nil*) : Véhicules candidats (défaut tous les véhicules de police).
- `roadblockPropIds` (*integer[]|nil*) : Accessoires (défaut ceux de insertProp).
- `originPos` (*vec3|nil*) : Origine (défaut position caméra).
- `originDirVec` (*vec3|nil*) : Direction de l'origine (défaut avant de la caméra).
- `activeDist` (*number|nil*) : Distance rayonnante (défaut 100 m) ; 0 ignore les tests de distance et de direction.
- `spawnDist` (*number|nil*) : Distance minimale de placement (défaut 120 m) ; 0 force le placement à l'origine.
- **renvoie** : table|nil {vehIds, propIds} des éléments placés ; nil en cas d'échec.

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean | Si false, la logique de police à l'exécution (onUpdate) est suspendue. Vaut true par défaut. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitModeUpdate`

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getPlayerVehicleID`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/police.lua`.*
