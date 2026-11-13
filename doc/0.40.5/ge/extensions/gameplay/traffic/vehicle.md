# `gameplay_traffic_vehicle`

*Fichier : `lua/ge/extensions/gameplay/traffic/vehicle.lua` · VM : Game Engine (GE) · 1029 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/vehicle")` (fichier sous extensions/ mais pas une extension classique)

Classe d'un véhicule géré par le système de trafic (gameplay_traffic). Elle suit l'état du véhicule (reset, active, fadeIn, fadeOut, queued, locked), son rôle de conducteur (standard, police, suspect, empty), son suivi de route (roadTracking), ses collisions, ses infractions et son état de poursuite policière (pursuit). Elle gère aussi le respawn hors de vue, les phares, le klaxon et la sirène, et le mode IA.

## Exemple

```lua
local veh = require('/lua/ge/extensions/gameplay/traffic/vehicle')({id = vehId})
if veh then veh:postInit(); veh:setAiMode('traffic') end
```

## Remarques

- Le module renvoie un constructeur : le paramètre (table) devient l'objet et init(o.id) est appelé ; renvoie nil si le véhicule est invalide (introuvable ou drapeau ignoreTraffic). Le second paramètre 'role' de init n'est pas utilisé.
- États (self.state) : 'reset', 'active', 'fadeIn', 'fadeOut', 'queued', 'locked'.
- Cadence : onTrafficTick est appelé toutes les 0,25 s de temps simulé (TICK_TIME) ; SLOW_SPEED vaut 2,5 m/s.
- pursuit.mode : 0 = aucune poursuite, 1 = passive, 2 = agressive, 3 = agressive avec barrages routiers, -1 = arrêté (arrestation).
- Infractions testées par checkOffenses : speeding (>= max(16,7 m/s, 1,2 x limite)), racing (>= max(27,8 m/s, 2 x limite)), reckless, wrongWay, intersection, hitPolice, hitTraffic. Elles ne comptent que si strictness de la police > 0.
- Valeurs de self.respawn : spawnValue (0 désactive le respawn), spawnDirBias (-1 à 1), spawnRandomization (0 à 1), activeRadius, finalRadius, innerRadius, staticVisibility.
- Les getters self.getTraffic, getPolice, getTrafficVars et getPoliceVars sont des références vers gameplay_traffic / gameplay_police, modifiables de l'extérieur.
- Hooks émis : onTrafficAction (changeRole), onPursuitOffense, onTrafficVehicleCrashed, onPursuitAction (arrest, release, roadblock, roadblockAlert, evade) pour les véhicules hors trafic principal.
- Dans onVehicleResetted, role.flags.freeze est mis à false (et non nil) alors que les autres rôles testent la valeur de vérité du drapeau.

## Classe `C`

Objet véhicule de trafic. Champs courants : id, state, isAi, isPerson, isVehicle, isPlayerControlled, model, modelName, drivability, autoRole, role, tracking (roadTracking), collisions, pursuit, respawn, pos/dirVec/vel/driveVec/targetPos, speed, damage, alpha, focus, focusDist, enableRespawn, enableTracking, enableAutoPooling, camVisible, headlights, queuedFuncs.

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_vehicle")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyModelConfigData()` | Déduit des données du modèle et de la config : nom d'affichage, drivability (à partir du score tout-terrain et de la taille), peinture aléatoire, taxi, statut de véhicule (types car, truck, automation, traffic, proptraffic, player) et rôle automatique ('police' pour les configs de police, sinon 'standard' ; 'empty' si non véhicule). | 98 |
| `C:checkCollisions()` | Détecte les contacts avec les autres objets de la carte (vérification OBB), crée et met à jour les tables de collision (compteur, vitesse, dégâts, produit scalaire), notifie le rôle (onCollision) et les autres véhicules de trafic (onOtherCollision) lorsque la vitesse >= 1 m/s, et gère le cas d'un piéton (unicycle) percuté (l'IA s'arrête puis repart). | 319 |
| `C:checkOffenses()` | Évalue les infractions du véhicule pour la police (excès de vitesse, course, conduite imprudente, mauvais sens, feu/stop, collision avec la police ou le trafic) à partir des fautes de roadTracking et des collisions. Sans effet si strictness <= 0. | 492 |
| `C:checkPoliceVisibility(dtSim)` | Détermine la police la plus proche, fait croître ou décroître sightValue (visibilité 0 à 1 ; policeVisible si >= 0,5) et met à jour le score de poursuite. | 550 |
| `C:checkRayCast(startPos, endPos)` | Teste la ligne de vue statique entre deux points (castRayStatic). | 412 |
| `C:checkTimeOfDay()` | Indique s'il fait jour d'après l'heure du jeu et la fenêtre de nuit solaire. | 599 |
| `C:fade(rate, isFadeOut)` | Fait varier l'opacité du véhicule ; à 0 en fondu sortant l'état passe à 'queued', à 1 en fondu entrant à 'active'. | 401 |
| `C:getBrakingDistance(speed, accel)` | Estime la distance de freinage : v² / (2 · accel · g), avec g borné pour éviter une division par zéro. | 311 |
| `C:getInteractiveDistance(pos, squared)` | Renvoie la distance entre le point « regarde devant » du véhicule (targetPos, 10 à 50 m devant selon la vitesse) et une position. | 297 |
| `C:honkHorn(duration)` | Active le klaxon puis l'arrête après la durée donnée (fonction différée 'horn'). | 213 |
| `C:init(id, role)` | Initialise le véhicule de trafic : force la visibilité, crée tables de collisions et de fonctions différées, l'objet roadTracking et les getters, appelle resetAll, relève largeur/longueur et définit le rôle par défaut 'empty'. Ne fait rien (et le constructeur renvoie nil) si le véhicule n'existe pas ou a ignoreTraffic. | 23 |
| `C:modifyRespawnValues(addActiveRadius, addInnerRadius)` | Augmente immédiatement les rayons de respawn pour garder le véhicule actif plus longtemps (utilisé après collision et pendant les poursuites). | 305 |
| `C:onActiveDone()` | Appelé après la disparition en fondu ou l'envoi dans le pool inactif ; relaie à role:onActiveDone(). | 618 |
| `C:onDeserialized(data)` | Restaure l'état depuis la table de onSerialize, recrée le rôle et restaure le suivi ; met l'état à 'queued' si l'objet n'est pas actif. | 994 |
| `C:onPursuitUpdate(dt, dtSim)` | Fait avancer la poursuite : alerte, arrestation (arrestTime), relâchement, barrages routiers (mode 3), évasion (evadeTime), rayons d'arrestation et d'évasion, et valeurs normalisées arrestValue et evadeValue. Pour un véhicule hors trafic principal, émet directement les hooks onPursuitAction. | 755 |
| `C:onRefresh()` | Appelé quand les données du véhicule doivent être rafraîchies (en général après respawn). Pour une IA : reset, réglage de playerUsable, mode debug IA, ajustement nocturne de spawnValue (x0,25), état active/fadeIn, réinitialisation de l'action et de la personnalité du rôle, paramètres IA. Appelle ensuite role:onRefresh(). | 632 |
| `C:onRespawn()` | Appelé après un respawn dans le trafic : repeint au hasard si permis, incrémente respawnCount, passe l'état à 'reset'. | 622 |
| `C:onSerialize()` | Sérialise l'état du véhicule de trafic (y compris suivi de route et rôle) pour la sauvegarde. | 966 |
| `C:onTrafficTick(tickTime)` | Tick de trafic (0,25 s) : met à jour le suivi de route, la visibilité, le rayon actif, les phares (nuit ou tunnel), détecte les dégâts de crash (hook onTrafficVehicleCrashed) et les quasi-accidents, puis appelle role:onTrafficTick. | 668 |
| `C:onUpdate(dt, dtSim)` | Mise à jour par frame : lit position, direction et vitesse depuis map.objects, calcule driveVec et targetPos, gère les états (locked, fadeIn, fadeOut), cadence les ticks de trafic, suit collisions et police, exécute les fonctions différées et appelle role:onUpdate. | 875 |
| `C:onVehicleResetted()` | Appelé quand le véhicule est réinitialisé (auto ou manuel) : dégèle le véhicule si besoin et réinitialise le suivi. | 610 |
| `C:postInit()` | À appeler après l'initialisation : applique les données du modèle/config (applyModelConfigData) puis le rôle automatique choisi (autoRole). | 93 |
| `C:resetAll()` | Appelle resetPursuit, resetTracking et resetValues. | 207 |
| `C:resetElectrics()` | Éteint la rampe lumineuse, les warnings et le klaxon du véhicule (commandes Lua véhicule). | 200 |
| `C:resetPursuit()` | Remet à zéro l'état de poursuite (mode 0, scores, compteurs, timers) ; si une poursuite était en cours, appelle d'abord gameplay_police.setPursuitMode(0, id). | 168 |
| `C:resetTracking()` | Rafraîchit roadTracking et remet à zéro compteurs de collisions et dégâts de crash ; mémorise les dégâts actuels comme référence. | 177 |
| `C:resetValues()` | Réinitialise les valeurs de respawn (depuis les variables de trafic), et vide collisions, fonctions différées et données actives. | 184 |
| `C:setAiMode(mode, ignoreParams)` | Définit le mode IA du véhicule (ai.setMode) et ses paramètres automatiques : 'traffic' (agressivité de base, vitesse légale, conduite dans la voie), 'random', 'flee' et 'chase' (agressivité >= 0,8 pour flee/chase, pas de limite de vitesse). Met isAi à false si le mode est 'disabled'. Termine par ai.reset(). | 225 |
| `C:setAiParameters(params)` | Applique à l'IA l'agressivité, la limite de vitesse (négative = vitesse légale) et le réglage aiAware (évitement de voitures) issus de params ou, par défaut, des variables de trafic. | 253 |
| `C:setRole(roleName)` | Change le rôle du conducteur : termine l'ancien rôle (onRoleEnded), crée le nouveau via trafficUtils.getRoleConstructor, appelle onRoleStarted et émet le hook onTrafficAction(id, 'changeRole', …). | 278 |
| `C:trackCollision(otherId, dt)` | Fait évoluer l'état d'une collision : 'active' puis 'resolved' (arrêt près du site pendant 5 s) ou 'abandoned' (le véhicule s'éloigne) ; efface la collision quand l'autre véhicule est à plus de 120 m. | 377 |
| `C:triggerOffense(data)` | Enregistre une infraction de poursuite (clé unique, score par défaut 100, divisé par 2 pour une IA), met à jour compteurs et score additionnel et émet le hook onPursuitOffense la première fois. | 473 |
| `C:tryRespawn()` | Teste si le véhicule est assez loin du foyer pour respawn (jamais le véhicule du joueur) et qu'aucun véhicule non-trafic n'est trop près ; passe alors à l'état 'fadeOut' et coupe klaxon et phares. | 439 |
| `C:updateActiveRadius(tickTime)` | Met à jour les rayons qui décident si le véhicule peut respawn : rayon actif décroissant selon spawnValue et visibilité, plus un rayon supplémentaire dépendant de la vitesse et de la direction du foyer. | 421 |
| `C:useSiren(duration, disableAfterUse)` | Allume la rampe lumineuse avec sirène (signal 2) puis la remet à 1 (ou 0 si disableAfterUse) après la durée donnée. Suppose que le véhicule a une rampe. Utilise la même entrée différée 'horn' que honkHorn : les deux s'écrasent mutuellement. | 218 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitOffense` — écouté par 1 module(s)
- `onTrafficAction` — écouté par 2 module(s)
- `onTrafficVehicleCrashed` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectActive`, `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTimeOfDay`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/vehicle.lua`.*
