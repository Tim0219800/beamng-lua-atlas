---@meta
-- tim19Atlas stub generated from lua/vehicle/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des contrôleurs jbeam du véhicule (VM véhicule, globale `controller`). Au chargement, il lit la section `controller` du jbeam (`v.data.controller`), charge chaque fichier `lua/vehicle/controller/<fileName>.lua` avec `rerequire`, appelle son `init(jbeamData)` puis les étapes `initSecondStage`, `initSounds`, `initLastStage`. Il trie les contrôleurs (par rang du périphérique powertrain `relevantDevice`, puis `manualOrder`, puis `defaultOrder`, puis nom) et construit des listes de fonctions mises en cache pour appeler tous les `update`, `updateGFX`, `updateFixedStep`, etc. sans test à chaque frame. Un moddeur l'utilise surtout pour retrouver un contrôleur (`controller.getController("nom")`) ou en charger un à chaud (`loadControllerExternal`).
--- Accès : globale `controller`
---@class controller
---@field beamBroke function Diffuse beamBroken(id, energy) aux contrôleurs qui l'ont.
---@field beamDeformed function Diffuse beamDeformed(id, ratio) aux contrôleurs qui l'ont.
---@field debugDraw function Diffuse debugDraw(focusPos) aux contrôleurs qui l'ont.
---@field isFrozen boolean true si setFreeze(1) a été appelé.
---@field mainController table|nil Contrôleur dont `type == "main"` (un seul), ou le contrôleur `dummy` si aucun. nil avant init().
---@field nilController table|nil Objet 'nul' créé par init() : toute indexation ou appel renvoie lui-même, l'écriture est ignorée. Renvoyé par getControllerSafe quand le contrôleur est introuvable.
---@field nodeCollision function Diffuse nodeCollision(p) aux contrôleurs qui l'ont (p : paramètre venant du moteur).
---@field onCouplerAttached function Diffuse onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy).
---@field onCouplerDetached function Diffuse onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce).
---@field onCouplerFound function Diffuse onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist).
---@field onGameplayEvent function Diffuse onGameplayEvent(eventName, ...) aux contrôleurs qui l'ont.
---@field update function Appelle update(dt) de chaque contrôleur puis, avec l'accumulateur 100 Hz, updateFixedStep. Vaut nop s'il n'y a rien à appeler. Appelée par la boucle physique.
---@field updateGFX function Appelle updateGFX(dt) de chaque contrôleur, une fois par frame graphique.
---@field updateWheelsIntermediate function Appelle updateWheelsIntermediate(dt) de chaque contrôleur concerné (étape physique intermédiaire des roues).
controller = {}

--- Reconstruit les listes de fonctions appelées par update, updateGFX, updateFixedStep, updateWheelsIntermediate et les hooks, d'après les fonctions présentes sur chaque contrôleur trié. À rappeler si un contrôleur ajoute ou retire dynamiquement une de ces fonctions (ex. M.update = ...).
---Source : lua/vehicle/controller.lua:708
function controller.cacheAllControllerFunctions() end

--- Renvoie la table réelle (non copiée) de tous les contrôleurs chargés, indexée par nom.
---Source : lua/vehicle/controller.lua:228
---@return table<string, table>  nom -> module du contrôleur.
function controller.getAllControllers() end

--- Renvoie le contrôleur de ce nom, ou nil s'il n'existe pas (à tester avant d'indexer, sinon erreur).
---Source : lua/vehicle/controller.lua:232
---@param name string Nom du contrôleur (par défaut le fileName, sinon la clé `name` du jbeam).
---@return table|nil  Le module du contrôleur.
function controller.getController(name) end

--- Comme getController mais ne renvoie jamais nil : gère les contrôleurs déplacés et, si rien n'est trouvé, renvoie `nilController` qui accepte tout index ou appel sans erreur. Pratique pour les appels du type `controller.getControllerSafe("x").fonction()`.
---Source : lua/vehicle/controller.lua:236
---@param name string Nom du contrôleur.
---@return table  Le contrôleur, ou nilController.
function controller.getControllerSafe(name) end

--- Liste les contrôleurs dont le type (fileName) vaut typeName, en tenant compte des contrôleurs déplacés sans nom personnalisé.
---Source : lua/vehicle/controller.lua:259
---@param typeName string Chemin de fichier, ex. "braking/transbrake".
---@return table[]  Liste (ordre non garanti) des contrôleurs.
function controller.getControllersByType(typeName) end

--- Liste les contrôleurs dont le typeName commence par le préfixe donné (recherche par dossier).
---Source : lua/vehicle/controller.lua:272
---@param path string Préfixe, ex. "braking/".
---@return table[]  Liste des contrôleurs correspondants.
function controller.getControllersFromPath(path) end

--- Fusionne récursivement les résultats de `getState()` de chaque contrôleur qui la définit.
---Source : lua/vehicle/controller.lua:995
---@return table|nil  État fusionné, nil s'il est vide.
function controller.getState() end

--- Charge tous les contrôleurs du jbeam (ou dummy), crée le nilController, enregistre les contrôleurs déplacés, ignore la liste noire, fusionne les données `v.data[nom]` avec la déclaration, appelle `init(data)`, désigne le contrôleur principal et trie les contrôleurs. Les erreurs d'un contrôleur sont loguées sans bloquer les autres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:436
function controller.init() end

--- Appelle `initLastStage(jbeamData)` de chaque contrôleur puis reconstruit les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:743
function controller.initLastStage() end

--- Appelle `initSecondStage(jbeamData)` de chaque contrôleur puis reconstruit les caches. Appelée après l'init de tous les systèmes du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:733
function controller.initSecondStage() end

--- Appelle `initSounds(jbeamData)` de chaque contrôleur puis reconstruit les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:753
function controller.initSounds() end

--- Indique si au moins un contrôleur a besoin de la boucle physique (update, updateFixedStep ou updateWheelsIntermediate).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:1006
---@return boolean  true si un de ces hooks existe.
function controller.isPhysicsStepUsed() end

--- Charge un contrôleur à chaud, en dehors du jbeam. Refuse un nom déjà pris et les contrôleurs de type `main`. Appelle ensuite init, initSecondStage, initSounds, initLastStage, retrie les contrôleurs et reconstruit les caches d'appel. Les erreurs sont loguées sans planter.
---Source : lua/vehicle/controller.lua:297
---@param fileName string Chemin du fichier relatif à controller/ (sans .lua).
---@param controllerName string|nil Nom d'instance ; par défaut fileName.
---@param controllerData table|nil Données passées à init comme jbeamData ; {} par défaut.
---@return table|nil  Le contrôleur chargé, nil en cas d'échec.
function controller.loadControllerExternal(fileName, controllerName, controllerData) end

--- Hook appelé au rechargement d'un état sauvegardé : passe à chaque contrôleur nommé dans `data` sa part via `deserialize(controllerData)`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:961
---@param data table<string, any>|nil nom du contrôleur -> données retournées auparavant par son serialize().
function controller.onDeserialize(data) end

--- Hook appelé à la sauvegarde d'état : collecte `serialize()` de chaque contrôleur qui la définit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:973
---@return table<string, any>  nom du contrôleur -> données sérialisées.
function controller.onSerialize() end

--- Outil de développement : imprime du code Lua listant les appels directs (par index de sortedControllers) à coller en haut de controller.lua pour remplacer les boucles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:807
---@param callType string|nil "update", "updateGFX", "updateWheelsIntermediate", "beamBroke", "beamDeformed", "nodeCollision", "onCouplerFound", "onCouplerAttached", "onCouplerDetached", "onGameplayEvent", "debugDraw", "settingsChanged" ; nil = tous.
function controller.printDebugMethodCalls(callType) end

--- Déclare qu'un ancien chemin/nom de contrôleur est maintenant à un nouveau chemin, pour que les anciens jbeam continuent de fonctionner.
---Source : lua/vehicle/controller.lua:62
---@param originalPath string Ancien nom (ex. "transbrake") ou chemin ("controller/transbrake").
---@param newPath string Nouveau chemin relatif au dossier controller/ (ex. "braking/transbrake") ; pour loadControllerExternal c'est le chemin complet sans extension.
function controller.registerRelocatedController(originalPath, newPath) end

--- Remet l'accumulateur du pas fixe à 0 et rappelle `init(jbeamData)` des contrôleurs qui n'ont pas de fonction `reset` (ceux qui en ont un sont traités dans resetSecondStage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:763
function controller.reset() end

--- Pour chaque contrôleur : `resetLastStage()` s'il existe, sinon `initLastStage(jbeamData)` ; puis reconstruit les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:785
function controller.resetLastStage() end

--- Pour chaque contrôleur : `reset(jbeamData)` s'il existe, sinon `initSecondStage(jbeamData)` ; puis reconstruit les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:773
function controller.resetSecondStage() end

--- Appelle `resetSounds()` des contrôleurs qui la définissent puis reconstruit les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:797
function controller.resetSounds() end

--- Met `isFrozen` à `mode == 1` et transmet l'appel au contrôleur principal.
---Source : lua/vehicle/controller.lua:282
---@param mode integer 1 = gelé, autre = non gelé.
function controller.setFreeze(mode) end

--- Passe `data` à la fonction `setState(data)` de chaque contrôleur qui la définit.
---Source : lua/vehicle/controller.lua:983
---@param data table|nil État à appliquer ; nil ne fait rien.
function controller.setState(data) end

--- Appelle `settingsChanged()` sur chaque contrôleur qui la définit. Appelée quand les réglages du jeu changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller.lua:220
function controller.settingsChanged() end

--- Retire un contrôleur chargé du gestionnaire (sans appeler de fonction de nettoyage) et reconstruit les caches d'appel.
---Source : lua/vehicle/controller.lua:376
---@param controllerName string Nom d'instance.
function controller.unloadControllerExternal(controllerName) end

--- Appelle `updateSimpleControlButtons()` sur chaque contrôleur qui la possède (rafraîchit les boutons de contrôle simplifiés de l'UI).
---Source : lua/vehicle/controller.lua:289
function controller.updateSimpleControlButtons() end

