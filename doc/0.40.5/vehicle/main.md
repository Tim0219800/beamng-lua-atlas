# `main`

*Fichier : `lua/vehicle/main.lua` · VM : Véhicule · 555 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("main")`

Point d'entrée de la VM Lua d'un véhicule : c'est le premier script exécuté. Il configure LuaJIT et package.path, charge les utilitaires communs, crée les globales de base (extensions, settings, playerInfo, lastDt, physicsDt), puis définit des fonctions GLOBALES que le moteur C++ appelle directement (init, onPhysicsStep, onGraphicsStep, onDebugDraw, onVehicleReset, callbacks de poutres/coupleurs, etc.). Chaque callback relaie l'évènement aux modules internes (wheels, powertrain, controller, beamstate…) puis, en général, aux extensions via extensions.hook. Un moddeur n'appelle presque jamais ces fonctions : il écrit des extensions qui reçoivent les hooks (updateGFX, onPhysicsStep, onReset…) ou lit les globales.

## Exemple

```lua
-- une extension véhicule reçoit les hooks émis par main.lua
local M = {}
M.onReset = function(retainDebug) end
M.updateGFX = function(dtSim) end
M.onPlayersChanged = function(anyPlayerSeated) end
return M
```

## Remarques

- ORDRE de la boucle graphique onGraphicsStep(dtSim) : sensors.updateGFX -> mapmgr.sendTracking -> wheels.updateGFX -> ai.updateGFX -> input.updateGFX -> electrics.updateGFX -> controller.updateGFX -> electrics.updateGFXSecondStep -> extensions.hook('updateGFX') -> hydros.updateGFX -> powertrain.updateGFX -> energyStorage.updateGFX -> drivetrain.updateGFX -> beamstate.updateGFX -> protocols.updateGFX -> sounds.updateGFX -> thrusters.updateGFX -> (guihooks.sendStreams si des flux sont actifs) -> damageTracker.updateGFX (seulement si le premier joueur est assis) -> props.updateGFX -> material.updateGFX -> fire.updateGFX -> recovery.updateGFX -> powertrain.updateGFXLastStage. Les commentaires du code imposent : sensors avant input et ai, input le plus tôt possible, extensions après electrics et avant drivetrain/hydros.
- ORDRE de la boucle physique onPhysicsStep(dtPhys) : wheels.updateWheelVelocities -> powertrain.update -> controller.updateWheelsIntermediate -> wheels.updateWheelTorques -> controller.update -> thrusters.update -> hydros.update -> beamstate.update -> protocols.update -> extensions.hook('onPhysicsStep') (seulement si enablePhysicsStepHook() a été appelé). Le moteur C++ n'appelle onPhysicsStep que si obj:setPhysicsStepEnabled(true), calculé par updateCorePhysicsStepEnabled() (au moins un module ou le hook d'extension en a besoin).
- ORDRE de l'initialisation (initSystems) : backwardsCompatibility.init, material.init, bdebug.init, electrics.init, damageTracker.init, beamstate.init, protocols.init, wheels.init, powertrain.init, energyStorage.init, input.init, controller.init, wheels.initSecondStage, controller.initSecondStage, drivetrain.init, sensors.reset, thrusters.init, hydros.init, sounds.init, props.init, input.initSecondStage, recovery.init, sensors.init, fire.init, wheels.initSounds, powertrain.initSounds, controller.initSounds, extensions.hook('onInit'), mapmgr.init, electrics.initLastStage, controller.initLastStage, powertrain.sendTorqueData, detectGlobalWrites(), updateCorePhysicsStepEnabled.
- ORDRE du reset (onVehicleReset) : guihooks.reset, extensions.hook('onReset'), ai.reset, mapmgr.reset, damageTracker, beamstate, protocols, wheels, electrics, powertrain, energyStorage, controller, wheels.resetSecondStage, controller.resetSecondStage, drivetrain, props, sensors, bdebug, thrusters, input, hydros, material, fire, powertrain.resetSounds, controller.resetSounds, sounds, partCondition, electrics.resetLastStage, controller.resetLastStage, powertrain.sendTorqueData, updateCorePhysicsStepEnabled. Remarque : les extensions reçoivent onReset AVANT les modules cœur.
- MODULES CHARGÉS EN GLOBALES par init() (dans cet ordre) : damageTracker, drivetrain, powertrain, energyStorage, controller, wheels, sounds, bdebug, input, props, particles, particlefilter, material, v (= require('jbeam/stage2')), electrics, beamstate, protocols, sensors, bullettime (à déprécier), thrusters, hydros, guihooks (nom à ne pas changer sinon le callback GUI casse), streams (= guistreams), gui (alias de guihooks), ai, recovery, mapmgr, fire, partCondition. Globales créées avant init : extensions, settings, backwardsCompatibility, playerInfo, lastDt, physicsDt, vehiclePath, ghostOnReset, ghostOnTp, float3 (alias de vec3), profilerPushEvent/PopEvent(1), shippingBuild, vmType='vehicle'.
- Extensions chargées par init : toutes celles de <véhicule>/lua (sauf controller, powertrain, energyStorage), core_quickAccess, input_haptics (avant les modules), puis skeleton, tout le dossier lua/vehicle/extensions/auto, gameplayStatistic ; hook onVehicleLoaded émis juste après le dossier auto.
- init renvoie false (le moteur décharge alors le Lua du véhicule) si les données de spawn sont invalides, si le chargement stage2 échoue ou si v.data.information.simpleObject == true. Si aucun noeud n'existe (nodesMissing), init lève error('nodesMissing') à la fin pour afficher l'échec du spawn.
- playerInfo : seatedPlayers (table index joueur -> true, indexé depuis 0, nil au départ), persona, firstPlayerSeated (joueur 0 assis), anyPlayerSeated.
- Bug repéré : `profilerPopEvent1 = profilerPushEvent or nop` et `profilerPushEvent1 = profilerPushEvent or nop` (le Pop1 reçoit en fait la fonction Push) ; si le profileur existe, profilerPopEvent1 empile au lieu de dépiler.
- Bug mineur : init passe `retainDebug` à extensions.hook('onVehicleLoaded', retainDebug) alors que cette variable n'est définie nulle part dans main.lua (globale nil sauf si définie ailleurs).
- print est redéfini : print(...) appelle log('A','print',tostring(...)) et n'affiche donc que le PREMIER argument.
- onNodeCollision remplit la table partagée particlefilter.particleData (champs id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2) puis la passe à wheels, fire, controller, particlefilter, bdebug (pas aux extensions).
- onDynamicBeamAdded/onDynamicBeamDeleted/onDynamicBeamBroke existent mais sont vides.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `enablePhysicsStepHook()` | Fait en sorte que onPhysicsStep relaie extensions.hook('onPhysicsStep', dt) et force la réévaluation du flag moteur. À appeler dans onExtensionLoaded par toute extension qui définit onPhysicsStep (le hook n'est jamais désactivé ensuite). | 65 |
| `exportPersistentData()` | Appelée par le moteur avant un rechargement du Lua : sérialise les extensions (serializePackages('reload')) et les confie au moteur via obj:setPersistentData. | 533 |
| `importPersistentData(s)` | Appelée par le moteur après un rechargement : désérialise les données persistantes et les redonne aux extensions (deserializePackages). | 539 |
| `init(path, initData)` | Appelée par le moteur au spawn du véhicule. Ajuste package.path vers le dossier du véhicule, charge les modules en globales, décode initData (lpack) et construit les données du véhicule (v.loadVehicleStage2), appelle initSystems, charge les extensions de base (skeleton, dossier auto, gameplayStatistic) et émet 'onVehicleLoaded'. | 206 |
| `initSystems()` | Initialise tous les sous-systèmes dans l'ordre décrit en notes, émet le hook 'onInit', active la détection d'écritures globales (detectGlobalWrites) et règle le flag de step physique. Appelée par init(). | 139 |
| `onBeamBroke(id, energy)` | Appelé par le moteur quand une poutre casse. Relaye à beamstate, wheels, powertrain, energyStorage, controller, bdebug, puis extensions.hook('onBeamBroke'). | 366 |
| `onBeamDeformed(id, ratio)` | Appelé par le moteur seulement pour les poutres ayant des déclencheurs de déformation. Relaye à beamstate et controller puis au hook 'onBeamDeformed'. | 377 |
| `onCallEvent(funName, data)` | Callback générique utilisé par le moteur pour appeler une fonction Lua par nom. Résout `funName` soit comme globale ("maFonction") soit comme "module.fonction" (un seul niveau, le module doit être une table globale) et l'appelle avec `data`. Ignore silencieusement tout ce qui n'est pas une fonction. | 345 |
| `onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Appelé par le moteur quand un coupleur s'attache. Relaye aux mêmes modules que onCouplerFound puis au hook 'onCouplerAttached'. | 397 |
| `onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Appelé par le moteur quand un coupleur se détache. Relaye aux mêmes modules puis au hook 'onCouplerDetached'. | 406 |
| `onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist)` | Appelé par le moteur quand un coupleur trouve un coupleur compatible à portée. Relaye à beamstate, controller, powertrain, energyStorage puis au hook 'onCouplerFound'. | 388 |
| `onDebugDraw(x, y, z)` | Appelé par le moteur à chaque frame de dessin debug. Met à jour la position de focus partagée, appelle bdebug.debugDraw, ai.debugDraw, beamstate.debugDraw, controller.debugDraw, hydros.debugDraw, puis extensions.hook('onDebugDraw', focusPos) et, si un joueur est assis, 'onDebugDrawActive'. | 126 |
| `onDespawnObject()` | Appelé par le moteur quand le véhicule est supprimé : hydros.destroy(), protocols.destroy() et, si la globale odometer existe, odometer.submitStatistic(). | 430 |
| `onDynamicBeamAdded(dbId, nodeId, tag)` | Callback moteur lors de l'ajout d'une poutre dynamique ; corps vide. | 420 |
| `onDynamicBeamBroke(dbId, energy)` | Callback moteur quand une poutre dynamique casse ; corps vide. | 426 |
| `onDynamicBeamDeleted(dbId)` | Callback moteur lors de la suppression d'une poutre dynamique ; corps vide. | 423 |
| `onGraphicsStep(dtSim)` | Appelé par le moteur à chaque frame graphique (une fois par rendu/frame de simulation). Mémorise lastDt, met à jour flux GUI, capteurs, roues, IA, entrées, electrics, contrôleurs, extensions (hook 'updateGFX'), hydros, powertrain, etc. dans l'ordre décrit dans les notes. | 86 |
| `onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2)` | Appelé par le moteur à chaque collision de noeud filtrée. Remplit particlefilter.particleData et le passe à wheels, fire, controller, particlefilter et bdebug. | 491 |
| `onPhysicsStep(dtPhys)` | Appelé par le moteur à chaque pas de physique (haute fréquence) si le step est activé. Exécute la chaîne physique (voir notes) puis le hook d'extensions 'onPhysicsStep'. | 73 |
| `onSetClusterPosRelRot(cNodeId, pos, relRot)` | Appelé par le moteur quand un cluster de noeuds est téléporté/repositionné. Active le mode fantôme (obj:setGhostEnabled(true)) si ghostOnTp, puis émet le hook 'onSetClusterPosRelRot'. | 439 |
| `onSettingsChanged()` | Appelée par le moteur quand les réglages changent : settings.settingsChanged, hook 'onSettingsChanged', puis controller, input, wheels et protocols.settingsChanged. | 545 |
| `onSlidenodeDetached(nodeId, railId, energy)` | Appelé par le moteur quand un slidenode quitte son rail ; relaye uniquement au hook d'extension 'onSlidenodeDetached'. | 415 |
| `onTorsionbarBroken(id, energy)` | Appelé par le moteur quand une barre de torsion casse ; relaye à beamstate et au hook 'onTorsionbarBroken'. | 383 |
| `onVehicleReset(retainDebug)` | Appelé par le moteur au reset du véhicule (touche I, récupération…). Réactive le mode fantôme si ghostOnReset, remet à zéro tous les modules (ordre dans les notes) et émet le hook 'onReset'. | 448 |
| `print(...)` | Remplace print standard : envoie le premier argument converti en chaîne au log (niveau 'A', tag 'print'). | 16 |
| `setControllingPlayers(players)` | Appelée par le moteur quand la liste des joueurs assis dans ce véhicule change. Met à jour playerInfo (seatedPlayers, anyPlayerSeated, firstPlayerSeated), prévient le contrôleur principal/powertrain/damageTracker si un joueur est assis, notifie bdebug, protocols, ai, sounds, puis émet 'onPlayersChanged'. | 504 |
| `setPlayerPersona(persona)` | Définit playerInfo.persona (identifiant de persona du joueur). | 529 |
| `updateCorePhysicsStepEnabled()` | Active ou désactive côté moteur l'appel de onPhysicsStep : obj:setPhysicsStepEnabled(true) si controller, powertrain, wheels, thrusters, hydros, beamstate ou protocols en ont besoin (isPhysicsStepUsed) ou si le hook d'extension est actif. Appelée en fin d'init et de reset. | 61 |

**Globales affectées :** `backwardsCompatibility`, `extensions`, `float3`, `lastDt`, `physicsDt`, `playerInfo`, `profilerPopEvent`, `profilerPopEvent1`, `profilerPushEvent`, `profilerPushEvent1`, `settings`, `shippingBuild`, `vmType`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeamBroke`
- `onBeamDeformed` — écouté par 1 module(s)
- `onCouplerAttached` — écouté par 10 module(s)
- `onCouplerDetached` — écouté par 10 module(s)
- `onCouplerFound` — écouté par 5 module(s)
- `onDebugDraw` — écouté par 3 module(s)
- `onDebugDrawActive`
- `onInit` — écouté par 14 module(s)
- `onPlayersChanged` — écouté par 3 module(s)
- `onReset` — écouté par 15 module(s)
- `onSetClusterPosRelRot`
- `onSettingsChanged`
- `onSlidenodeDetached`
- `onTorsionbarBroken`
- `onVehicleLoaded` — écouté par 1 module(s)
- `updateGFX`

## Appels vers le moteur (C++)

- `obj:` `getPhysicsDt`, `getUpdateUIflag`, `setGhostEnabled`, `setPersistentData`, `setPhysicsStepEnabled`, `setSlipTireMarkThreshold`

**Charge les extensions :** `core_quickAccess`, `gameplayStatistic`, `input_haptics`, `skeleton`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/main.lua`.*
