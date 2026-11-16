# `controller`

*Fichier : `lua/vehicle/controller.lua` · VM : Véhicule · 1059 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `controller`

Gestionnaire des contrôleurs jbeam du véhicule (VM véhicule, globale `controller`). Au chargement, il lit la section `controller` du jbeam (`v.data.controller`), charge chaque fichier `lua/vehicle/controller/<fileName>.lua` avec `rerequire`, appelle son `init(jbeamData)` puis les étapes `initSecondStage`, `initSounds`, `initLastStage`. Il trie les contrôleurs (par rang du périphérique powertrain `relevantDevice`, puis `manualOrder`, puis `defaultOrder`, puis nom) et construit des listes de fonctions mises en cache pour appeler tous les `update`, `updateGFX`, `updateFixedStep`, etc. sans test à chaque frame. Un moddeur l'utilise surtout pour retrouver un contrôleur (`controller.getController("nom")`) ou en charger un à chaud (`loadControllerExternal`).

## Exemple

```lua
-- accès direct (erreur si absent)
local esc = controller.getController("esc")
-- accès tolérant : renvoie un objet 'nil' qui accepte tout appel
controller.getControllerSafe("jato").fire(true)
-- tous les contrôleurs d'un type
for _, c in ipairs(controller.getControllersByType("hydraulics/electricHydraulics")) do print(c.name) end
```

## Remarques

- Cycle de vie d'un contrôleur : (1) init(jbeamData) à la création ; (2) initSecondStage(jbeamData), initSounds(jbeamData), initLastStage(jbeamData) après que powertrain, électriques, etc. sont prêts ; (3) chaque pas physique `update(dt)` puis `updateWheelsIntermediate(dt)`, un `updateFixedStep(dt)` à 100 Hz fixe (accumulateur 1/100 s), chaque frame graphique `updateGFX(dt)`. Les hooks facultatifs sont beamBroken, beamDeformed, nodeCollision, onCouplerFound, onCouplerAttached, onCouplerDetached, onGameplayEvent, debugDraw, settingsChanged, serialize/deserialize, getState/setState.
- Au reset : si le contrôleur n'a pas de `reset`, `controller.reset` rappelle son `init` ; `resetSecondStage` appelle `reset(jbeamData)` s'il existe, sinon `initSecondStage` ; `resetLastStage` appelle `resetLastStage()` sinon `initLastStage`. `resetSounds` n'appelle que `resetSounds()` s'il existe.
- Attention : le nom du hook de rupture dans les contrôleurs est `beamBroken` (c'est ce que cherche cacheControllerFunctions), alors que la fonction du gestionnaire s'appelle `controller.beamBroke`.
- Contrôleur sans `type` standard : `M.type = "main"` désigne le contrôleur principal (un seul ; un second remplace le premier avec un avertissement). S'il n'y en a pas, le contrôleur `dummy` est ajouté. Un contrôleur sans section jbeam reçoit aussi `dummy`.
- Les contrôleurs `shiftLogic-*` (automaticGearbox, cvtGearbox, dctGearbox, manualGearbox, sequentialGearbox) sont ignorés (liste noire) ; le nom d'un contrôleur par défaut est son fileName, il faut donner `name` unique pour en instancier plusieurs du même type.
- Contrôleurs déplacés : registerRelocatedController garde la compatibilité des anciens noms (vehicleController, AVAS, airbrakes, reverseWarn, adaptiveBrakeLights, brakedDifferentialSteering, compressionBrake, postCrashBrake, transbrake) vers leurs nouveaux sous-dossiers.
- Les champs update, updateGFX, updateWheelsIntermediate, beamBroke, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent et debugDraw valent `nop` (fonction vide) tant qu'aucun contrôleur n'a la fonction correspondante ; ce ne sont donc pas des nil. Les champs mainController et nilController sont nil à la déclaration puis remplis par init().
- Anomalie : les logs de getControllerSafe pour le cas relocalisé annoncent `controller.getControllersByType` au lieu de `controller.getControllerSafe` (message de log seulement).
- onCouplerFound du gestionnaire transmet 4 arguments (dont nodeDist) alors que controllerTemplate et les versions debug n'en déclarent que 3.
- Si une version debug codée en dur (updateDebug, etc.) est décommentée en haut du fichier, elle remplace les boucles ; elle doit être générée avec controller.printDebugMethodCalls() pour le véhicule exact.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller.cacheAllControllerFunctions()` | Reconstruit les listes de fonctions appelées par update, updateGFX, updateFixedStep, updateWheelsIntermediate et les hooks, d'après les fonctions présentes sur chaque contrôleur trié. À rappeler si un contrôleur ajoute ou retire dynamiquement une de ces fonctions (ex. M.update = ...). | 708 |
| `controller.getAllControllers()` | Renvoie la table réelle (non copiée) de tous les contrôleurs chargés, indexée par nom. | 228 |
| `controller.getController(name)` | Renvoie le contrôleur de ce nom, ou nil s'il n'existe pas (à tester avant d'indexer, sinon erreur). | 232 |
| `controller.getControllerSafe(name)` | Comme getController mais ne renvoie jamais nil : gère les contrôleurs déplacés et, si rien n'est trouvé, renvoie `nilController` qui accepte tout index ou appel sans erreur. Pratique pour les appels du type `controller.getControllerSafe("x").fonction()`. | 236 |
| `controller.getControllersByType(typeName)` | Liste les contrôleurs dont le type (fileName) vaut typeName, en tenant compte des contrôleurs déplacés sans nom personnalisé. | 259 |
| `controller.getControllersFromPath(path)` | Liste les contrôleurs dont le typeName commence par le préfixe donné (recherche par dossier). | 272 |
| `controller.getState()` | Fusionne récursivement les résultats de `getState()` de chaque contrôleur qui la définit. | 995 |
| `controller.init()` | Charge tous les contrôleurs du jbeam (ou dummy), crée le nilController, enregistre les contrôleurs déplacés, ignore la liste noire, fusionne les données `v.data[nom]` avec la déclaration, appelle `init(data)`, désigne le contrôleur principal et trie les contrôleurs. Les erreurs d'un contrôleur sont loguées sans bloquer les autres. *(interne)* | 436 |
| `controller.initLastStage()` | Appelle `initLastStage(jbeamData)` de chaque contrôleur puis reconstruit les caches. *(interne)* | 743 |
| `controller.initSecondStage()` | Appelle `initSecondStage(jbeamData)` de chaque contrôleur puis reconstruit les caches. Appelée après l'init de tous les systèmes du véhicule. *(interne)* | 733 |
| `controller.initSounds()` | Appelle `initSounds(jbeamData)` de chaque contrôleur puis reconstruit les caches. *(interne)* | 753 |
| `controller.isPhysicsStepUsed()` | Indique si au moins un contrôleur a besoin de la boucle physique (update, updateFixedStep ou updateWheelsIntermediate). *(interne)* | 1006 |
| `controller.loadControllerExternal(fileName, controllerName, controllerData)` | Charge un contrôleur à chaud, en dehors du jbeam. Refuse un nom déjà pris et les contrôleurs de type `main`. Appelle ensuite init, initSecondStage, initSounds, initLastStage, retrie les contrôleurs et reconstruit les caches d'appel. Les erreurs sont loguées sans planter. | 297 |
| `controller.onDeserialize(data)` | Hook appelé au rechargement d'un état sauvegardé : passe à chaque contrôleur nommé dans `data` sa part via `deserialize(controllerData)`. *(interne)* *(hook)* | 961 |
| `controller.onSerialize()` | Hook appelé à la sauvegarde d'état : collecte `serialize()` de chaque contrôleur qui la définit. *(interne)* *(hook)* | 973 |
| `controller.printDebugMethodCalls(callType)` | Outil de développement : imprime du code Lua listant les appels directs (par index de sortedControllers) à coller en haut de controller.lua pour remplacer les boucles. *(interne)* | 807 |
| `controller.registerRelocatedController(originalPath, newPath)` | Déclare qu'un ancien chemin/nom de contrôleur est maintenant à un nouveau chemin, pour que les anciens jbeam continuent de fonctionner. | 62 |
| `controller.reset()` | Remet l'accumulateur du pas fixe à 0 et rappelle `init(jbeamData)` des contrôleurs qui n'ont pas de fonction `reset` (ceux qui en ont un sont traités dans resetSecondStage). *(interne)* | 763 |
| `controller.resetLastStage()` | Pour chaque contrôleur : `resetLastStage()` s'il existe, sinon `initLastStage(jbeamData)` ; puis reconstruit les caches. *(interne)* | 785 |
| `controller.resetSecondStage()` | Pour chaque contrôleur : `reset(jbeamData)` s'il existe, sinon `initSecondStage(jbeamData)` ; puis reconstruit les caches. *(interne)* | 773 |
| `controller.resetSounds()` | Appelle `resetSounds()` des contrôleurs qui la définissent puis reconstruit les caches. *(interne)* | 797 |
| `controller.setFreeze(mode)` | Met `isFrozen` à `mode == 1` et transmet l'appel au contrôleur principal. | 282 |
| `controller.setState(data)` | Passe `data` à la fonction `setState(data)` de chaque contrôleur qui la définit. | 983 |
| `controller.settingsChanged()` | Appelle `settingsChanged()` sur chaque contrôleur qui la définit. Appelée quand les réglages du jeu changent. *(interne)* | 220 |
| `controller.unloadControllerExternal(controllerName)` | Retire un contrôleur chargé du gestionnaire (sans appeler de fonction de nettoyage) et reconstruit les caches d'appel. | 376 |
| `controller.updateSimpleControlButtons()` | Appelle `updateSimpleControlButtons()` sur chaque contrôleur qui la possède (rafraîchit les boutons de contrôle simplifiés de l'UI). | 289 |

### Détail des paramètres

#### `controller.getAllControllers()`

Renvoie la table réelle (non copiée) de tous les contrôleurs chargés, indexée par nom.

- **renvoie** : table<string, table> nom -> module du contrôleur.

#### `controller.getController(name)`

Renvoie le contrôleur de ce nom, ou nil s'il n'existe pas (à tester avant d'indexer, sinon erreur).

- `name` (*string*) : Nom du contrôleur (par défaut le fileName, sinon la clé `name` du jbeam).
- **renvoie** : table|nil Le module du contrôleur.

#### `controller.getControllerSafe(name)`

Comme getController mais ne renvoie jamais nil : gère les contrôleurs déplacés et, si rien n'est trouvé, renvoie `nilController` qui accepte tout index ou appel sans erreur. Pratique pour les appels du type `controller.getControllerSafe("x").fonction()`.

- `name` (*string*) : Nom du contrôleur.
- **renvoie** : table Le contrôleur, ou nilController.

#### `controller.getControllersByType(typeName)`

Liste les contrôleurs dont le type (fileName) vaut typeName, en tenant compte des contrôleurs déplacés sans nom personnalisé.

- `typeName` (*string*) : Chemin de fichier, ex. "braking/transbrake".
- **renvoie** : table[] Liste (ordre non garanti) des contrôleurs.

#### `controller.getControllersFromPath(path)`

Liste les contrôleurs dont le typeName commence par le préfixe donné (recherche par dossier).

- `path` (*string*) : Préfixe, ex. "braking/".
- **renvoie** : table[] Liste des contrôleurs correspondants.

#### `controller.getState()`

Fusionne récursivement les résultats de `getState()` de chaque contrôleur qui la définit.

- **renvoie** : table|nil État fusionné, nil s'il est vide.

#### `controller.isPhysicsStepUsed()`

Indique si au moins un contrôleur a besoin de la boucle physique (update, updateFixedStep ou updateWheelsIntermediate).

- **renvoie** : boolean true si un de ces hooks existe.

#### `controller.loadControllerExternal(fileName, controllerName, controllerData)`

Charge un contrôleur à chaud, en dehors du jbeam. Refuse un nom déjà pris et les contrôleurs de type `main`. Appelle ensuite init, initSecondStage, initSounds, initLastStage, retrie les contrôleurs et reconstruit les caches d'appel. Les erreurs sont loguées sans planter.

- `fileName` (*string*) : Chemin du fichier relatif à controller/ (sans .lua).
- `controllerName` (*string|nil*) : Nom d'instance ; par défaut fileName.
- `controllerData` (*table|nil*) : Données passées à init comme jbeamData ; {} par défaut.
- **renvoie** : table|nil Le contrôleur chargé, nil en cas d'échec.

#### `controller.onDeserialize(data)`

Hook appelé au rechargement d'un état sauvegardé : passe à chaque contrôleur nommé dans `data` sa part via `deserialize(controllerData)`.

- `data` (*table<string, any>|nil*) : nom du contrôleur -> données retournées auparavant par son serialize().

#### `controller.onSerialize()`

Hook appelé à la sauvegarde d'état : collecte `serialize()` de chaque contrôleur qui la définit.

- **renvoie** : table<string, any> nom du contrôleur -> données sérialisées.

#### `controller.printDebugMethodCalls(callType)`

Outil de développement : imprime du code Lua listant les appels directs (par index de sortedControllers) à coller en haut de controller.lua pour remplacer les boucles.

- `callType` (*string|nil*) : "update", "updateGFX", "updateWheelsIntermediate", "beamBroke", "beamDeformed", "nodeCollision", "onCouplerFound", "onCouplerAttached", "onCouplerDetached", "onGameplayEvent", "debugDraw", "settingsChanged" ; nil = tous.

#### `controller.registerRelocatedController(originalPath, newPath)`

Déclare qu'un ancien chemin/nom de contrôleur est maintenant à un nouveau chemin, pour que les anciens jbeam continuent de fonctionner.

- `originalPath` (*string*) : Ancien nom (ex. "transbrake") ou chemin ("controller/transbrake").
- `newPath` (*string*) : Nouveau chemin relatif au dossier controller/ (ex. "braking/transbrake") ; pour loadControllerExternal c'est le chemin complet sans extension.

#### `controller.setFreeze(mode)`

Met `isFrozen` à `mode == 1` et transmet l'appel au contrôleur principal.

- `mode` (*integer*) : 1 = gelé, autre = non gelé.

#### `controller.setState(data)`

Passe `data` à la fonction `setState(data)` de chaque contrôleur qui la définit.

- `data` (*table|nil*) : État à appliquer ; nil ne fait rien.

#### `controller.unloadControllerExternal(controllerName)`

Retire un contrôleur chargé du gestionnaire (sans appeler de fonction de nettoyage) et reconstruit les caches d'appel.

- `controllerName` (*string*) : Nom d'instance.

## Champs

| Champ | Type | Description |
|---|---|---|
| `beamBroke` | function | Diffuse beamBroken(id, energy) aux contrôleurs qui l'ont. |
| `beamDeformed` | function | Diffuse beamDeformed(id, ratio) aux contrôleurs qui l'ont. |
| `debugDraw` | function | Diffuse debugDraw(focusPos) aux contrôleurs qui l'ont. |
| `isFrozen` | boolean | true si setFreeze(1) a été appelé. |
| `mainController` | table|nil | Contrôleur dont `type == "main"` (un seul), ou le contrôleur `dummy` si aucun. nil avant init(). |
| `nilController` | table|nil | Objet 'nul' créé par init() : toute indexation ou appel renvoie lui-même, l'écriture est ignorée. Renvoyé par getControllerSafe quand le contrôleur est introuvable. |
| `nodeCollision` | function | Diffuse nodeCollision(p) aux contrôleurs qui l'ont (p : paramètre venant du moteur). |
| `onCouplerAttached` | function | Diffuse onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy). |
| `onCouplerDetached` | function | Diffuse onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce). |
| `onCouplerFound` | function | Diffuse onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist). |
| `onGameplayEvent` | function | Diffuse onGameplayEvent(eventName, ...) aux contrôleurs qui l'ont. |
| `update` | function | Appelle update(dt) de chaque contrôleur puis, avec l'accumulateur 100 Hz, updateFixedStep. Vaut nop s'il n'y a rien à appeler. Appelée par la boucle physique. |
| `updateGFX` | function | Appelle updateGFX(dt) de chaque contrôleur, une fois par frame graphique. |
| `updateWheelsIntermediate` | function | Appelle updateWheelsIntermediate(dt) de chaque contrôleur concerné (étape physique intermédiaire des roues). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller.lua`.*
