# `freeroam_specialTriggers`

*Fichier : `lua/ge/extensions/freeroam/specialTriggers.lua` · VM : Game Engine (GE) · 547 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_specialTriggers` : `extensions.load("freeroam_specialTriggers")`, puis la globale `freeroam_specialTriggers`

Déclencheurs spéciaux pilotés par données : relie des BeamNGTrigger (ou zones) à l'affichage/masquage d'objets de scène (TSStatic, lumières PointLight/SpotLight, SimGroup) avec délais, ordre aléatoire et pas aléatoires, et à des commandes Lua (GE ou VM véhicule) à l'entrée/sortie d'un véhicule. Au démarrage du niveau il lit `triggers.json` dans le dossier du niveau. Un moddeur l'utilise pour animer des éclairages ou décors quand le joueur entre dans une zone, sans écrire de Lua. Global : freeroam_specialTriggers.

## Exemple

```lua
freeroam_specialTriggers.addTrigger('monTrigger', {
  subjectType = 'player',
  objects = { MonGroupeLumieres = { enterDelay = 0.5, exitDelay = 2, enterRandomMin = 0.05, enterRandomMax = 0.2, randomOrder = true } },
  enterCommand = "print('entre')",
  enterVehCommand = "electrics.set_warn_signal(1)"
})
```

## Remarques

- Format de triggers.json : objet { nomDuTrigger = { type, triggers, subjectType, subjectIds, objects, enterCommand, exitCommand, enterVehCommand, exitVehCommand } }. `type` = 'trigger' ou 'zone'. `triggers` (liste de noms) crée des alias : plusieurs BeamNGTrigger pilotent le même déclencheur, qui ne passe à inactif que si tous les triggers du groupe sont inactifs. subjectType : 'player' (défaut), 'notPlayer', 'all' ; subjectIds : ids de véhicules acceptés en plus.
- `objects` : table nomObjetScène -> {enterDelay, exitDelay, enterRandomMin, enterRandomMax, exitRandomMin, exitRandomMax, randomOrder}. Les délais sont en secondes de simulation (dtSim). Si Random Max vaut 0 ou si l'objet n'est pas un groupe, l'état est appliqué d'un coup après le délai ; sinon les enfants du SimGroup sont activés un par un avec un délai aléatoire entre min et max (ordre mélangé si randomOrder). Les SimGroup imbriqués sont traités en parallèle (isNested).
- setState mémorise l'état d'origine de chaque objet (`isEnabled` pour PointLight/SpotLight, `hidden` pour les autres) ; si l'état d'origine est « caché/éteint », la logique est inversée pour que « actif » rende l'objet visible. reset(true) restaure l'état d'origine.
- enterCommand/exitCommand sont du Lua GE compilé avec load() et exécuté sous pcall ; enterVehCommand/exitVehCommand sont envoyés par queueLuaCommand à la VM du véhicule concerné.
- Le test des zones (onTick) est désactivé : la fonction fait `if true then return end` juste après la vérification d'activité, donc les triggers de type 'zone' ne se déclenchent pas automatiquement.
- onSerialize utilise `ipairs(triggers)` sur une table indexée par noms : la boucle ne s'exécute jamais (restauration d'états inactive lors d'un rechargement Lua).
- setTriggerActive contient un print(tostring(active)) de debug quand `active` est nil (bascule).
- M.active (true par défaut) désactive toutes les réactions aux hooks ; M.debugMode ajoute des logs détaillés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_specialTriggers.addTrigger(key, data)` | Crée un trigger (état initial inactif, activé) avec ses objets liés, ses alias et ses commandes ; calcule pour chaque groupe d'objets le nombre maximal d'enfants (maxIdx). | 109 |
| `freeroam_specialTriggers.getTriggers()` | Renvoie la table interne de tous les triggers (y compris les alias). | 206 |
| `freeroam_specialTriggers.loadTriggers(filePath)` | Lit un fichier de triggers (par défaut `triggers.json` dans le dossier du niveau courant, via getMissionFilename) et appelle setupTriggers. | 195 |
| `freeroam_specialTriggers.onBeamNGTrigger(data)` | Hook des BeamNGTrigger : traite l'évènement enter/exit/tick d'un trigger connu (useTrigger). *(interne)* *(hook)* | 512 |
| `freeroam_specialTriggers.onClientEndMission()` | Hook de fin de niveau : reset(true). *(interne)* *(hook)* | 399 |
| `freeroam_specialTriggers.onClientStartMission()` | Hook de démarrage de niveau : charge triggers.json du niveau. *(interne)* *(hook)* | 395 |
| `freeroam_specialTriggers.onDeserialized(data)` | Après rechargement Lua : restaure la table des triggers. *(interne)* *(hook)* | 525 |
| `freeroam_specialTriggers.onSerialize()` | Avant rechargement Lua : renvoie {triggers} (voir bug dans les notes). *(interne)* *(hook)* | 518 |
| `freeroam_specialTriggers.onUpdate(dt, dtSim)` | Hook par frame : fait avancer les délais et pas aléatoires de chaque groupe d'objets en temps simulé, applique les états, et appelle onTick (zones) toutes les 0,25 s s'il existe un trigger de type zone. *(interne)* *(hook)* | 403 |
| `freeroam_specialTriggers.onVehicleActiveChanged(vehId, active)` | Hook : si un véhicule devient inactif, le retire des triggers. *(interne)* *(hook)* | 387 |
| `freeroam_specialTriggers.onVehicleDestroyed(vehId)` | Hook : retire le véhicule des listes d'occupants de tous les triggers. *(interne)* *(hook)* | 377 |
| `freeroam_specialTriggers.onVehicleSwitched(oldId, newId)` | Hook de changement de véhicule : envoie un évènement « exit » valide aux triggers pour lesquels le nouveau véhicule est un sujet valide (évite qu'un état reste bloqué). *(interne)* *(hook)* | 362 |
| `freeroam_specialTriggers.removeTrigger(key, useOrigState)` | Supprime un trigger et ses alias ; restaure l'état d'origine des objets liés si useOrigState. | 155 |
| `freeroam_specialTriggers.reset(useOrigState)` | Réinitialise : avec useOrigState, supprime tous les triggers en restaurant l'état d'origine des objets ; efface la mémoire des états d'origine. | 170 |
| `freeroam_specialTriggers.setTriggerActive(tName, active, instant)` | Active/désactive manuellement un trigger (simule un évènement enter/exit valide avec vehId 0, ce qui le maintient actif). Avec instant=true, applique immédiatement l'état aux objets sans délai. | 313 |
| `freeroam_specialTriggers.setupTriggers(data)` | Remet tout à zéro (reset(true)) puis crée un trigger par entrée de la table de données. | 184 |

### Détail des paramètres

#### `freeroam_specialTriggers.addTrigger(key, data)`

Crée un trigger (état initial inactif, activé) avec ses objets liés, ses alias et ses commandes ; calcule pour chaque groupe d'objets le nombre maximal d'enfants (maxIdx).

- `key` (*string*) : Nom du trigger ou de la zone.
- `data` (*table|nil*) : Données (voir notes).

#### `freeroam_specialTriggers.getTriggers()`

Renvoie la table interne de tous les triggers (y compris les alias).

- **renvoie** : table<string, table> Triggers.

#### `freeroam_specialTriggers.loadTriggers(filePath)`

Lit un fichier de triggers (par défaut `triggers.json` dans le dossier du niveau courant, via getMissionFilename) et appelle setupTriggers.

- `filePath` (*string|nil*) : Chemin du fichier JSON.

#### `freeroam_specialTriggers.onBeamNGTrigger(data)`

Hook des BeamNGTrigger : traite l'évènement enter/exit/tick d'un trigger connu (useTrigger).

- `data` (*table*) : {triggerName, event, subjectID}

#### `freeroam_specialTriggers.onDeserialized(data)`

Après rechargement Lua : restaure la table des triggers.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `freeroam_specialTriggers.onSerialize()`

Avant rechargement Lua : renvoie {triggers} (voir bug dans les notes).

- **renvoie** : table {triggers = ...}

#### `freeroam_specialTriggers.onUpdate(dt, dtSim)`

Hook par frame : fait avancer les délais et pas aléatoires de chaque groupe d'objets en temps simulé, applique les états, et appelle onTick (zones) toutes les 0,25 s s'il existe un trigger de type zone.

- `dt` (*number*) : Durée réelle (s).
- `dtSim` (*number*) : Durée simulée (s).

#### `freeroam_specialTriggers.onVehicleActiveChanged(vehId, active)`

Hook : si un véhicule devient inactif, le retire des triggers.

- `vehId` (*integer*) : Id.
- `active` (*boolean*) : Nouvel état actif.

#### `freeroam_specialTriggers.onVehicleDestroyed(vehId)`

Hook : retire le véhicule des listes d'occupants de tous les triggers.

- `vehId` (*integer*) : Id du véhicule.

#### `freeroam_specialTriggers.onVehicleSwitched(oldId, newId)`

Hook de changement de véhicule : envoie un évènement « exit » valide aux triggers pour lesquels le nouveau véhicule est un sujet valide (évite qu'un état reste bloqué).

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `freeroam_specialTriggers.removeTrigger(key, useOrigState)`

Supprime un trigger et ses alias ; restaure l'état d'origine des objets liés si useOrigState.

- `key` (*string*) : Nom du trigger.
- `useOrigState` (*boolean|nil*) : Restaurer les objets.

#### `freeroam_specialTriggers.reset(useOrigState)`

Réinitialise : avec useOrigState, supprime tous les triggers en restaurant l'état d'origine des objets ; efface la mémoire des états d'origine.

- `useOrigState` (*boolean|nil*) : true pour restaurer les objets.

#### `freeroam_specialTriggers.setTriggerActive(tName, active, instant)`

Active/désactive manuellement un trigger (simule un évènement enter/exit valide avec vehId 0, ce qui le maintient actif). Avec instant=true, applique immédiatement l'état aux objets sans délai.

- `tName` (*string*) : Nom du trigger.
- `active` (*boolean|nil*) : Nouvel état ; nil = inverser.
- `instant` (*boolean|nil*) : Appliquer sans délai.

#### `freeroam_specialTriggers.setupTriggers(data)`

Remet tout à zéro (reset(true)) puis crée un trigger par entrée de la table de données.

- `data` (*table*) : Table nom -> données de trigger (voir notes).

## Champs

| Champ | Type | Description |
|---|---|---|
| `active` | boolean | Interrupteur général : si false, les hooks de triggers sont ignorés. |
| `debugMode` | boolean | Active les logs de debug (changements d'état, fins de délais). |

## Appels vers le moteur (C++)

- `be:` `getObjectActive`, `getPlayerVehicleID`
- `obj:` `getClassName`, `getCount`, `getGroup`, `getID`, `getLightEnabled`, `getObjects`
- `scenetree.` `findObject`, `findObjectById`, `objectExists`, `objectExistsById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/specialTriggers.lua`.*
