# `controller_hydraulics_hydraulicsCombustionEngineControl`

*Fichier : `lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua` · VM : Véhicule · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/hydraulicsCombustionEngineControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui relève le ralenti d'un moteur thermique et connecte la pompe hydraulique quand une fonction hydraulique est commandée (mode "electricsRaiseAndConnect"). Il surveille des valeurs electrics, impose idleAVOverwrite/maxIdleThrottleOverwrite au moteur, connecte la pompe (setConnected) une fois le régime assez haut et écrit une valeur electrics d'état. Un relèvement de ralenti manuel est aussi possible.

## Remarques

- Clés jbeam (défaut) : mode (seule valeur gérée : "electricsRaiseAndConnect" ; sinon le contrôleur ne fait rien), controlledEngine ("mainEngine"), relevantPump ("pump1"), relevantElectrics (liste de noms), actOnPositiveElectric (vrai), actOnNegativeElectric (vrai), raisedIdleRPM (1800 tr/min, converti en rad/s), raisedIdleElectricsName ("raisedIdle").
- Le relèvement automatique est annulé si electrics.values.wheelspeed > 2 m/s. La pompe n'est connectée que si une électrique est active et que le régime moteur dépasse 70 % du ralenti relevé.
- M.updateGFX = nop à l'export ; il est remplacé par la version active à l'init si le mode est valide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_hydraulicsCombustionEngineControl.getState()` | Renvoie l'état (relèvement manuel). | 113 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData)` | Lit la configuration, retrouve le moteur et la pompe et active la boucle de contrôle. *(interne)* | 72 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData)` | Désactive le relèvement manuel. *(interne)* | 68 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled)` | Active/désactive le relèvement manuel du ralenti. | 60 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.setState(data)` | Restaure l'état renvoyé par getState. | 118 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.toggleIdleRaise()` | Inverse le relèvement manuel du ralenti. | 64 |
| `controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt)` | Applique le relèvement de ralenti et la connexion de pompe (défini dynamiquement à l'init). (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_hydraulics_hydraulicsCombustionEngineControl.getState()`

Renvoie l'état (relèvement manuel).

- **renvoie** : table Table d'état.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.init(jbeamData)`

Lit la configuration, retrouve le moteur et la pompe et active la boucle de contrôle.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.reset(jbeamData)`

Désactive le relèvement manuel.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.setIdleRaise(enabled)`

Active/désactive le relèvement manuel du ralenti.

- `enabled` (*boolean*) : Vrai pour relever.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.setState(data)`

Restaure l'état renvoyé par getState.

- `data` (*table|nil*) : Table d'état.

#### `controller_hydraulics_hydraulicsCombustionEngineControl.updateGFX(dt)`

Applique le relèvement de ralenti et la connexion de pompe (défini dynamiquement à l'init). (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/hydraulicsCombustionEngineControl.lua`.*
