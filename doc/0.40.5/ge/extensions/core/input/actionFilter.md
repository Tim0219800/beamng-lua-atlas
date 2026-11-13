# `core_input_actionFilter`

*Fichier : `lua/ge/extensions/core/input/actionFilter.lua` · VM : Game Engine (GE) · 241 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_actionFilter` : `extensions.load("core_input_actionFilter")`, puis la globale `core_input_actionFilter`

Extension GE `core_input_actionFilter` : bloque ou autorise des actions d'entrée par « filtre » nommé (ex. scénario, mode compétitif). Gère des groupes d'actions, des modèles d'actions prédéfinis (téléportation, menus véhicule, caméras, triche…) et des masques de joueurs par ActionMap (pour le split-screen). Un moddeur l'utilise pour désactiver temporairement des touches (reset, menus, caméra libre) pendant une activité.

## Exemple

```lua
local f = core_input_actionFilter
local tpl = f.getActionTemplates()
f.setGroup('noCheats', tpl.competitive)
f.addAction('myMod', 'noCheats', true)   -- bloque tout le groupe sous le filtre 'myMod'
-- plus tard
f.clear('myMod')
```

## Remarques

- Le premier argument `filter` est un nom (chaîne) de filtre ; chaque filtre garde sa propre liste de blocages, donc plusieurs mods peuvent bloquer sans s'écraser. Une action est bloquée tant qu'au moins un filtre la bloque (isActionBlocked).
- addAction(filter, name, filtered): `name` peut être un groupe défini par setGroup (alors toutes ses actions sont filtrées) ou un nom d'action seul.
- Masques joueur : un masque est un entier bit-à-bit (bit n = joueur n autorisé, -1 = tous). Plusieurs propriétaires (`owner`) peuvent définir un masque pour la même ActionMap ; le masque effectif est le ET binaire de tous. Le nom d'ActionMap reçoit le suffixe 'ActionMap' s'il manque.
- Piège dans createActionTemplate : le paramètre actionWhitelist agit comme une LISTE D'EXCLUSION (les actions du modèle qui sont dans la liste ne sont PAS ajoutées), et actionBlackList est AJOUTÉE telle quelle au résultat. Les noms sont inversés par rapport à leur sens.
- Piège : actionTemplates.physicsControls reçoit par arrayConcat les actions de nodegrabber à la création du module, donc physicsControls inclut déjà nodegrabber.
- Modèles prédéfinis (clés de getActionTemplates) : vehicleTeleporting, vehicleMenues, nodegrabber, physicsControls, aiControls, vehicleSwitching, editor, freeCam, gameCam, funStuff, walkingMode, photoMode, trackBuilder, bigMap, couplers, vehicleTriggers, radialMenu, pause, missionPopup, resetPhysics, vehicleRecovery, vehicleTeleportOnly, appedit, miniMap, radialMenuActivate, setShifterMode, uiReloading, competitive (= teleporting + menus véhicule + physique + IA + changement de véhicule + caméra libre + fun + éditeur).
- Hook émis : `onActionFilterUpdated` après chaque mise à jour d'un filtre.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_actionFilter.addAction(filter, actionName, filtered)` | Ajoute (ou retire si filtered = false) une action ou un groupe au filtre, puis reconstruit entièrement ce filtre côté C++ et émet onActionFilterUpdated. | 96 |
| `core_input_actionFilter.clear(filter)` | Supprime tous les blocages d'un filtre (ActionMap.clearFilters). N'émet pas onActionFilterUpdated. | 102 |
| `core_input_actionFilter.clearActionMapPlayerMask(owner, mapName)` | Retire le masque d'un propriétaire pour une ActionMap et réapplique. | 146 |
| `core_input_actionFilter.clearActionMapPlayerMasks(owner)` | Retire tous les masques d'un propriétaire sur toutes les ActionMap. | 155 |
| `core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList)` | Fabrique une liste d'actions à partir de modèles existants. Voir notes : les noms des paramètres facultatifs sont inversés par rapport à leur effet. | 13 |
| `core_input_actionFilter.getActionTemplates()` | Renvoie la table des modèles d'actions (clé = nom du modèle, valeur = liste d'actions). | 212 |
| `core_input_actionFilter.getBlockedActions()` | Debug : table filtre -> {action = true} des actions réellement bloquées côté C++. | 216 |
| `core_input_actionFilter.getGroup(name)` | Renvoie la liste d'un groupe. | 111 |
| `core_input_actionFilter.isActionBlocked(actionName)` | Indique si une action est bloquée par au moins un filtre. | 115 |
| `core_input_actionFilter.onDeserialized(v)` | Hook de restauration : recharge les données sauvegardées et réapplique les masques de joueurs. *(interne)* *(hook)* | 190 |
| `core_input_actionFilter.onExtensionUnloaded()` | Hook de déchargement de l'extension : remet playerMask à -1 sur les ActionMap touchées. *(interne)* *(hook)* | 205 |
| `core_input_actionFilter.onInputBindingsChanged()` | Hook appelé quand les bindings changent : réapplique les masques de joueurs (les ActionMap ont pu être recréées). *(interne)* *(hook)* | 199 |
| `core_input_actionFilter.onSerialize()` | Hook de sauvegarde avant rechargement : renvoie groupes, blocages et masques. *(interne)* *(hook)* | 182 |
| `core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked)` | Bloque ou débloque un joueur (un bit) dans le masque d'un propriétaire pour une ActionMap. | 168 |
| `core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask)` | Définit le masque de joueurs autorisés d'une ActionMap pour un propriétaire et applique le ET de tous les masques à actionMap.playerMask. | 137 |
| `core_input_actionFilter.setGroup(name, arrayValues)` | Définit un groupe d'actions nommé, utilisable ensuite dans addAction. | 107 |

### Détail des paramètres

#### `core_input_actionFilter.addAction(filter, actionName, filtered)`

Ajoute (ou retire si filtered = false) une action ou un groupe au filtre, puis reconstruit entièrement ce filtre côté C++ et émet onActionFilterUpdated.

- `filter` (*string*) : Nom du filtre.
- `actionName` (*string*) : Nom d'action, ou nom d'un groupe défini par setGroup.
- `filtered` (*boolean*) : true = bloquer, false/nil = ne plus bloquer.

#### `core_input_actionFilter.clear(filter)`

Supprime tous les blocages d'un filtre (ActionMap.clearFilters). N'émet pas onActionFilterUpdated.

- `filter` (*string*) : Nom du filtre.

#### `core_input_actionFilter.clearActionMapPlayerMask(owner, mapName)`

Retire le masque d'un propriétaire pour une ActionMap et réapplique.

- `owner` (*string*) : Propriétaire.
- `mapName` (*string*) : Nom de l'ActionMap.

#### `core_input_actionFilter.clearActionMapPlayerMasks(owner)`

Retire tous les masques d'un propriétaire sur toutes les ActionMap.

- `owner` (*string*) : Propriétaire.

#### `core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList)`

Fabrique une liste d'actions à partir de modèles existants. Voir notes : les noms des paramètres facultatifs sont inversés par rapport à leur effet.

- `templateNames` (*string[]*) : Noms de modèles à concaténer.
- `actionWhitelist` (*string[]|nil*) : Si fourni : actions à EXCLURE des modèles (déduit du code).
- `actionBlackList` (*string[]|nil*) : Actions ajoutées à la fin du résultat.
- **renvoie** : string[] Liste d'actions.

#### `core_input_actionFilter.getActionTemplates()`

Renvoie la table des modèles d'actions (clé = nom du modèle, valeur = liste d'actions).

- **renvoie** : table<string, string[]> Modèles.

#### `core_input_actionFilter.getBlockedActions()`

Debug : table filtre -> {action = true} des actions réellement bloquées côté C++.

- **renvoie** : table<string, table<string, boolean>> Blocages.

#### `core_input_actionFilter.getGroup(name)`

Renvoie la liste d'un groupe.

- `name` (*string*) : Nom du groupe.
- **renvoie** : string[]|nil Actions du groupe.

#### `core_input_actionFilter.isActionBlocked(actionName)`

Indique si une action est bloquée par au moins un filtre.

- `actionName` (*string*) : Nom d'action (pas un groupe).
- **renvoie** : boolean|nil true si bloquée, sinon nil.

#### `core_input_actionFilter.onDeserialized(v)`

Hook de restauration : recharge les données sauvegardées et réapplique les masques de joueurs.

- `v` (*table*) : Table renvoyée par onSerialize.

#### `core_input_actionFilter.onSerialize()`

Hook de sauvegarde avant rechargement : renvoie groupes, blocages et masques.

- **renvoie** : table {actionGroups, blockedActionGroups, actionMapPlayerMasks}.

#### `core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked)`

Bloque ou débloque un joueur (un bit) dans le masque d'un propriétaire pour une ActionMap.

- `owner` (*string*) : Propriétaire.
- `mapName` (*string*) : Nom de l'ActionMap.
- `player` (*integer*) : Indice du joueur (0, 1…).
- `blocked` (*boolean*) : true = retire le bit du joueur, false = le remet.
- **renvoie** : boolean false si arguments invalides.

#### `core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask)`

Définit le masque de joueurs autorisés d'une ActionMap pour un propriétaire et applique le ET de tous les masques à actionMap.playerMask.

- `owner` (*string*) : Nom du propriétaire du masque.
- `mapName` (*string*) : Nom de l'ActionMap (suffixe 'ActionMap' ajouté si absent).
- `playerMask` (*integer*) : Masque binaire (bit n = joueur n), -1 = tous.
- **renvoie** : boolean false si un argument est invalide.

#### `core_input_actionFilter.setGroup(name, arrayValues)`

Définit un groupe d'actions nommé, utilisable ensuite dans addAction.

- `name` (*string*) : Nom du groupe.
- `arrayValues` (*string[]*) : Noms d'actions du groupe.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActionFilterUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/actionFilter.lua`.*
