# `powertrain_torsionReactor`

*Fichier : `lua/vehicle/powertrain/torsionReactor.lua` · VM : Véhicule · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `torsionReactor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Device « arbre fictif » qui sert de réacteur de torsion : il transmet le couple de son parent à ses enfants (multiplié par gearRatio) en conservant les noeuds de réaction du couple (torqueReactionNodes_nodes) qui permettent d'appliquer la réaction du couple moteur sur la carrosserie. Le powertrain l'utilise comme point d'ancrage des réactions de couple. Catégorie shaft, un seul port de sortie.

## Exemple

```lua
-- jbeam : ["torsionReactor", "torsionReactor", "mainEngine", 1, {"torqueReactionNodes_nodes":[10,11,12]}]
```

## Remarques

- Clés jbeam : gearRatio (1), torqueReactionNodes_nodes (liste de 3 numéros de noeuds, seuls les nombres sont conservés ; absent = nil), electricsName, visualShaftAVName, inputName, inputIndex. breakTriggerBeam vaut toujours nil.
- validate : si le nombre de noeuds de réaction n'est pas exactement 3, un avertissement est loggé et torqueUpdate est remplacé par updateTorqueDisabled, qui fait EXACTEMENT la même chose que updateTorque (aucun effet réel, les deux fonctions sont identiques).
- velocityUpdate écrit device.parent[device.parentOutputAVName] = inputAV (champ du parent, nom renseigné par le powertrain), et torqueUpdate lit device.parent[device.parentOutputTorqueName] : ces deux noms sont posés par powertrain.lua lors du câblage.
- Bug mineur : new() lit shallowcopy(M.requiredExternalInertiaOutputs) alors que M.requiredExternalInertiaOutputs n'est pas défini dans ce fichier (nil) : device.requiredExternalInertiaOutputs vaut donc nil (shallowcopy de nil).
- Bug mineur : new() ne copie pas gearRatio vers reset ; reset(device, jbeamData) relit jbeamData.gearRatio (1 par défaut), cohérent. Mais onBreak = nop (nop est un global du jeu).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_torsionReactor.new(jbeamData)` | Construit le device à partir du jbeam. Filtre torqueReactionNodes_nodes pour ne garder que les valeurs numériques. *(interne)* | 67 |

### Détail des paramètres

#### `powertrain_torsionReactor.new(jbeamData)`

Construit le device à partir du jbeam. Filtre torqueReactionNodes_nodes pour ne garder que les valeurs numériques.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Objet device.

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |

## Classe `device`

Objet renvoyé par new(jbeamData). Champs : gearRatio, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), torqueReactionNodes (liste de 3 noeuds ou nil), cumulativeInertia (kg·m²), cumulativeGearRatio, parent/children (posés par le powertrain).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Calcule l'inertie cumulée (celle de l'enfant divisée par gearRatio²), son inverse et les rapports cumulés à partir du premier enfant. | 37 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple et inerties ; relit gearRatio depuis le jbeam. | 54 |
| `device:torqueUpdate()` | Pas de physique : outputTorque1 = couple de sortie du parent * gearRatio. | 15 |
| `device:validate()` | Vérifie la présence du parent et que torqueReactionNodes contient 3 noeuds (sinon avertissement et torqueUpdate désactivé en nom seulement). | 23 |
| `device:velocityUpdate(dt)` | Pas de physique : inputAV = outputAV1 * gearRatio, puis recopie dans le champ du parent désigné par parentOutputAVName. | 10 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/torsionReactor.lua`.*
