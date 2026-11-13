# `core_input_actions`

*Fichier : `lua/ge/extensions/core/input/actions.lua` · VM : Game Engine (GE) · 374 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_actions` : `extensions.load("core_input_actions")`, puis la globale `core_input_actions`

Extension GE `core_input_actions` : registre des actions d'entrée (ce que les touches/manettes peuvent déclencher). Il lit les fichiers lua/ge/extensions/core/input/actions/*.json (actions communes) et vehicles/<véhicule>/input_actions*.json plus les inputActions des fichiers jbeam (actions spécifiques à un véhicule), les met en cache, crée côté C++ les ActionMap nécessaires et traduit une action en paramètres de commande pour le moteur. Un moddeur s'en sert pour déclencher une action par son nom ou lister les actions disponibles.

## Exemple

```lua
extensions.load('core_input_actions')
local actions = core_input_actions.getActiveActions()   -- table uniqueName -> définition
core_input_actions.triggerDownUp('toggleMenues')       -- simule appui + relâchement
```

## Remarques

- Nom unique : une action de véhicule est renommée '<véhicule>__<action>' (nameToUniqueName) pour éviter les collisions entre véhicules ; les actions communes gardent leur nom.
- Champs d'une définition d'action (lus dans le code) : cat (catégorie, voir core_input_categories), ctx ('vlua' défaut pour véhicule, 'tlua', 'elua', 'bvlua' ; 'slua' remplacé par 'elua', 'ts' et 'ui' dépréciés), actionMap, onDown / onUp / onChange / onRelative (chaînes de code Lua), isCentered, vehicle, namespace ('common' = non spécifique), source (ajouté = chemin du fichier).
- Jetons remplacés dans les chaînes de commande par executeCommand : VALUE, VEHICLEID, FILTERTYPE (-1), PLAYER (0 par défaut), TRIGGERID, ANGLE (900), LOCKTYPE (0). Remplacement par simple gsub de sous-chaîne : éviter ces mots dans le code d'une action.
- Actif/inactif : une action est inactive si license.isAllowedActionsPath refuse son fichier, ou si le chemin contient '_nonshipping' dans une version shipping.
- Les caches sont vidés au premier update, au changement de véhicule et à la modification d'un fichier de actions/*.json.
- Incohérences : le commentaire de executeCommand annonce 'returns the executed action count' mais pour le contexte vlua il renvoie le retour de queueCmd, qui ne retourne rien (nil) ; les messages de doublon d'action utilisent `vid`, hors de portée dans la boucle des actions normales (affiche nil).

**Dépendances (chargées avant) :** `core_input_categories`, `core_input_deprecatedActions`, `license`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_actions.actionToCommands(actionName, actionCache)` | Convertit une action en paramètres utilisés par le moteur lors d'un déclenchement. Détermine l'ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, ou celle de l'action), les callbacks onChange/onDown/onUp, le contexte de commande et isCentered. Loggue les catégories invalides et les contextes dépréciés. | 203 |
| `core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId)` | Exécute le code d'une action : vlua -> envoyé au véhicule vehicleId ; elua/tlua -> Lua:queueLuaCommand (GE) ; bvlua -> à tous les objets. onDown est utilisé si actionValue == 1, onUp si actionValue == 0, sinon onChange. Les jetons VALUE, VEHICLEID, PLAYER, TRIGGERID… sont remplacés dans le code. | 307 |
| `core_input_actions.getActiveActions()` | Actions actuellement actives : actions des véhicules existants (marquées cat 'vehicle_specific' si utilisables, sinon 'vehicle_specific_unusable') plus les actions communes. Crée au passage les ActionMap C++ manquantes. | 360 |
| `core_input_actions.getInactiveActions()` | Actions désactivées (licence ou fichiers _nonshipping en version shipping). | 361 |
| `core_input_actions.nameToUniqueName(actionName, vehicleName)` | Préfixe le nom d'action par le nom du véhicule : '<véhicule>__<action>'. | 16 |
| `core_input_actions.onFileChanged(filename)` | Hook de modification de fichier : si un JSON sous /lua/ge/extensions/core/input/actions change, vide les caches. *(interne)* *(hook)* | 265 |
| `core_input_actions.onFirstUpdate()` | Hook au premier update : vide le cache des actions. *(interne)* *(hook)* | 257 |
| `core_input_actions.onVehicleSwitched(oldId, newId, player)` | Hook au changement de véhicule joueur : vide le cache des actions (les actions spécifiques changent). *(interne)* *(hook)* | 261 |
| `core_input_actions.triggerDown(actionName)` | Simule l'appui d'une action nommée (ActionMap.triggerBindingByNameDigital(name, true)). | 273 |
| `core_input_actions.triggerDownUp(actionName)` | Simule un appui puis un relâchement immédiats. | 279 |
| `core_input_actions.triggerUp(actionName)` | Simule le relâchement d'une action nommée. | 276 |
| `core_input_actions.uniqueNameToName(uniqueActionName, vehicleName)` | Opération inverse : retire le préfixe '<véhicule>__'. Loggue une erreur et renvoie le nom inchangé si le préfixe manque. | 20 |
| `core_input_actions.upgradeAction(action)` | Résout un nom d'action : renvoie le nom s'il est actif ; suit récursivement les remplacements de core_input_deprecatedActions ; renvoie nil (avec log) si l'action est inactive, obsolète ou inconnue. | 171 |

### Détail des paramètres

#### `core_input_actions.actionToCommands(actionName, actionCache)`

Convertit une action en paramètres utilisés par le moteur lors d'un déclenchement. Détermine l'ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, ou celle de l'action), les callbacks onChange/onDown/onUp, le contexte de commande et isCentered. Loggue les catégories invalides et les contextes dépréciés.

- `actionName` (*string*) : Nom unique de l'action.
- `actionCache` (*table|nil*) : Définition déjà connue de l'action ; nécessaire uniquement quand l'appel vient de getActions (évite une récursion infinie).
- **renvoie** : boolean true.
- **renvoie** : string Nom de l'actionmap.
- **renvoie** : boolean actsOnChange.
- **renvoie** : string Code onChange (ou onRelative).
- **renvoie** : boolean actsOnDown.
- **renvoie** : string Code onDown.
- **renvoie** : boolean actsOnUp.
- **renvoie** : string Code onUp.
- **renvoie** : boolean isRelative (onRelative utilisé).
- **renvoie** : userdata ActionMapCommandContext (type VLUA/ELUA/TLUA/BVLUA/TS).
- **renvoie** : boolean isCentered.

#### `core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId)`

Exécute le code d'une action : vlua -> envoyé au véhicule vehicleId ; elua/tlua -> Lua:queueLuaCommand (GE) ; bvlua -> à tous les objets. onDown est utilisé si actionValue == 1, onUp si actionValue == 0, sinon onChange. Les jetons VALUE, VEHICLEID, PLAYER, TRIGGERID… sont remplacés dans le code.

- `evt` (*table*) : Définition d'action avec ctx (nil = vlua), onDown, onUp, onChange.
- `actionValue` (*number*) : Valeur de l'action (1 = appui, 0 = relâché, ou valeur analogique pour onChange).
- `vehicleId` (*integer*) : Id du véhicule cible (contexte vlua).
- `player` (*integer|nil*) : Indice du joueur ; défaut 0.
- `triggerId` (*any*) : Valeur pour TRIGGERID (chaîne vide si nil).
- **renvoie** : integer|nil 1 pour GE/bvlua si une commande a été envoyée, 0 sinon ; pour vlua le retour de queueCmd, donc nil (voir notes).

#### `core_input_actions.getActiveActions()`

Actions actuellement actives : actions des véhicules existants (marquées cat 'vehicle_specific' si utilisables, sinon 'vehicle_specific_unusable') plus les actions communes. Crée au passage les ActionMap C++ manquantes.

- **renvoie** : table<string, table> Nom unique de l'action -> définition.

#### `core_input_actions.getInactiveActions()`

Actions désactivées (licence ou fichiers _nonshipping en version shipping).

- **renvoie** : table<string, table> Nom unique -> définition.

#### `core_input_actions.nameToUniqueName(actionName, vehicleName)`

Préfixe le nom d'action par le nom du véhicule : '<véhicule>__<action>'.

- `actionName` (*string*) : Nom court.
- `vehicleName` (*string|nil*) : Nom du véhicule ; nil = nom inchangé.
- **renvoie** : string Nom unique.

#### `core_input_actions.onFileChanged(filename)`

Hook de modification de fichier : si un JSON sous /lua/ge/extensions/core/input/actions change, vide les caches.

- `filename` (*string*) : Chemin du fichier modifié.

#### `core_input_actions.onVehicleSwitched(oldId, newId, player)`

Hook au changement de véhicule joueur : vide le cache des actions (les actions spécifiques changent).

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Indice du joueur.

#### `core_input_actions.triggerDown(actionName)`

Simule l'appui d'une action nommée (ActionMap.triggerBindingByNameDigital(name, true)).

- `actionName` (*string*) : Nom de l'action.

#### `core_input_actions.triggerDownUp(actionName)`

Simule un appui puis un relâchement immédiats.

- `actionName` (*string*) : Nom de l'action.

#### `core_input_actions.triggerUp(actionName)`

Simule le relâchement d'une action nommée.

- `actionName` (*string*) : Nom de l'action.

#### `core_input_actions.uniqueNameToName(uniqueActionName, vehicleName)`

Opération inverse : retire le préfixe '<véhicule>__'. Loggue une erreur et renvoie le nom inchangé si le préfixe manque.

- `uniqueActionName` (*string*) : Nom unique.
- `vehicleName` (*string|nil*) : Nom du véhicule.
- **renvoie** : string Nom court.

#### `core_input_actions.upgradeAction(action)`

Résout un nom d'action : renvoie le nom s'il est actif ; suit récursivement les remplacements de core_input_deprecatedActions ; renvoie nil (avec log) si l'action est inactive, obsolète ou inconnue.

- `action` (*string*) : Nom unique de l'action.
- **renvoie** : string|nil Nom valide ou nil.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_input_categories', 'core_input_deprecatedActions', 'license'}. |
| `menuActionMapNames` | table<string, boolean> | Ensemble des noms d'ActionMap 'menu indépendants' (poussés/pushés dès leur création). Vidé et reconstruit à chaque lecture des actions actives. |
| `menuIndependentPrefix` | string | 'MenuIndependent_' : préfixe des ActionMap dont l'action déclare actionMap = 'MenuIndependent'. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Lua:` `queueLuaCommand`
- `be:` `getPlayerVehicleID`, `queueAllObjectLua`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/actions.lua`.*
