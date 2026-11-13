# `gameplayInterfaceModules_interactCargoContainers`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua` · VM : Véhicule · 352 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactCargoContainers` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactCargoContainers")`, puis la globale `gameplayInterfaceModules_interactCargoContainers`

Module de gameplayInterface pour les conteneurs de cargaison (section jbeam cargoStorage) : permet au gameplay GE de remplir virtuellement les conteneurs (volume et densité cibles) et de lire leur état. Le remplissage est lissé dans le temps et se traduit par des changements de masse des nœuds et de raideur/amortissement/résistance des poutres liés au groupe via des fonctions jbeam (nodeWeightFunction, beamSpringFunction…).

## Exemple

```lua
-- cible : 0.5 de volume pour le conteneur 12
gameplayInterface.executeAction(0, 5, 'setCargoContainers', {[12] = {containerId = 12, volume = 0.5, density = 1}}, 'updateExplicit')
gameplayInterface.getSystemData(0, 6, 'getCargoContainers')
```

## Remarques

- Action 'setCargoContainers'(data:table, mode:string) : data est indexé par id de conteneur (cid), chaque entrée doit contenir containerId et volume (density facultatif, défaut 1) ; sinon {failReason}. mode (défaut 'updateExplicit') : 'updateExplicit' garde la cible des conteneurs non cités ; tout autre mode remet les non cités à volume 0/densité 1 ; 'updateDelivery' ignore les conteneurs réservés aux passagers (cargoTypes tous 'passenger') et garde leur cible.
- Lookup 'getCargoContainers'() : renvoie une liste (dans une table englobante) d'entrées {id, cargoTypes, capacity, name, groupId, partPath, nodeId, reachTargetDuration, reachTargetTimeRemaining, targetVolume, currentVolume, rateVolume, targetDensity, currentDensity}.
- Le cache des conteneurs est construit au premier appel depuis v.data.cargoStorage, v.data.nodes et v.data.beams (via cargoGroup + partPath) ; il est détruit au reset et au chargement.
- Le lissage utilise newTemporalSmoothing : volume (vitesse maxVolumeRate du conteneur, défaut 1000) et densité (vitesse 2). Les fonctions jbeam sont évaluées par jbeam/expressionParser avec les variables $volume et $density (valeurs lissées), puis appliquées via obj:setNodeMass, setBeamSpringDamp, setBeamStrength, setBeamDeform, setBoundedBeamShortBound/LongBound, setPrecompressionRatio.
- La mise à jour (updateGFX) n'est active que tant qu'un conteneur n'a pas atteint sa cible : setUpdateEnabled active/désactive le hook updateGFX de cette extension.
- Anomalie : dans buildContainerCache, hasValidFunction est initialisé à true et jamais mis à false : le filtre est sans effet, tous les nœuds et poutres du groupe sont enregistrés.
- Anomalie : setUpdateEnabled(false) met M.updateGFX à nil (et non nop) avant extensions.hookUpdate.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactCargoContainers.onExtensionLoaded()` | Appelé au chargement : désactive la mise à jour, remplit moduleActions/moduleLookups et vide le cache. *(interne)* *(hook)* | 332 |
| `gameplayInterfaceModules_interactCargoContainers.onReset()` | Appelé au reset du véhicule : désactive la mise à jour et vide le cache des conteneurs. *(interne)* *(hook)* | 340 |
| `gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 328 |
| `gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled)` | Active ou désactive la boucle updateGFX de cette extension (avec extensions.hookUpdate('updateGFX')). *(interne)* | 238 |
| `gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim)` | Appelé chaque frame pendant le remplissage : fait avancer les lisseurs de chaque conteneur n'ayant pas atteint sa cible et applique masses/propriétés de poutres ; se désactive quand tout est à la cible. Vaut nop sinon. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

#### `gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled)`

Active ou désactive la boucle updateGFX de cette extension (avec extensions.hookUpdate('updateGFX')).

- `enabled` (*boolean*) : true pour démarrer le lissage des conteneurs.

#### `gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim)`

Appelé chaque frame pendant le remplissage : fait avancer les lisseurs de chaque conteneur n'ayant pas atteint sa cible et applique masses/propriétés de poutres ; se désactive quand tout est à la cible. Vaut nop sinon. (assignée dynamiquement)

- `dtSim` (*number*) : Pas de temps de simulation en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions exposées : setCargoContainers. |
| `moduleLookups` | table<string, function> | Lookups exposés : getCargoContainers. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `updateGFX`

## Appels vers le moteur (C++)

- `obj:` `setBeamDeform`, `setBeamSpringDamp`, `setBeamStrength`, `setBoundedBeamLongBound`, `setBoundedBeamShortBound`, `setBoundedBeamSpringDampLimits`, `setNodeMass`, `setPrecompressionRatio`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua`.*
