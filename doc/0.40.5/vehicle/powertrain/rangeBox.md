# `powertrain_rangeBox`

*Fichier : `lua/vehicle/powertrain/rangeBox.lua` · VM : Véhicule · 236 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `rangeBox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `rangeBox` : boîte de gamme (réducteur à deux plages « high » / « low », ex. boîte de transfert 4x4 réduite ou gamme de camion). Le rapport ne change que par setMode : 'high' sélectionne le rapport le plus petit, 'low' le plus grand. La transmission reste toujours engagée (pas de neutre ni de synchro). Un moddeur l'utilise pour basculer entre gamme haute et basse ; le contrôle utilisateur passe par powertrain.toggleDeviceMode(nom) ou le bouton d'interface simple.

## Exemple

```lua
local rb = powertrain.getDevice("rangebox")
rb:setMode("low")  -- gamme basse (rapport le plus grand)
print(rb.mode, rb.gearRatio)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (valeur initiale, remplacée), friction (N·m), dynamicFriction (N·m par rad/s), torqueLossCoef (0..1), gearRatios (liste obligatoire de rapports ; les valeurs >= 0 prennent les indices 0, 1, 2…, les valeurs < 0 les indices -1, -2… dans l'ordre de la liste).
- Champs principaux : inputAV (rad/s côté parent = outputAV1 * gearRatio), outputAV1 (rad/s, posé par l'enfant), outputTorque1 (N·m), gearRatio, gearIndex, gearRatios (table indexée), lowGearIndex, highGearIndex, minGearIndex, maxGearIndex, minGearRatio, maxGearRatio, gearCount, mode ('low' ou 'high'), availableModes ({'high','low'}), defaultMode, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken.
- À la construction, le mode initial est 'low' si l'indice de gamme basse est 0, sinon 'high'. L'indice de rapport est mis à 0 (setGearIndex(0, true), sans recalcul d'inertie).
- Particularité d'indexation par rapport à manualGearbox : ici gearRatios[0] est le premier élément de la liste (il n'y a pas de neutre à rapport 0) ; les marches arrière négatives sont numérotées -1, -2… dans l'ordre de la liste.
- Bugs / pièges : lowGearIndex/highGearIndex sont déterminés pendant l'itération (comparaison à maxGearRatio/minGearRatio mis à jour après), ce qui donne le bon résultat pour des rapports croissants mais pas forcément pour une liste désordonnée. reset ne remet pas gearIndex, gearRatio ni le mode à leurs valeurs initiales. new ne définit ni onBreak ni validate alors que setPartCondition peut appeler onBreak. setMode ignore toute valeur autre que 'high' ou 'low' (silencieusement) et ne tient pas compte de availableModes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_rangeBox.new(jbeamData)` | Construit la boîte de gamme : table des rapports (avant et arrière), indices de gamme haute et basse, mode initial et état sauvegardable. *(interne)* | 143 |

### Détail des paramètres

#### `powertrain_rangeBox.new(jbeamData)`

Construit la boîte de gamme : table des rapports (avant et arrière), indices de gamme haute et basse, mode initial et état sauvegardable.

- `jbeamData` (*table*) : Données jbeam du composant (gearRatios obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 82 |
| `device:calculateInertia()` | Prend l'inertie et les rapports cumulés du premier enfant ; cumulativeInertia = inertie / gearRatio² (maxGearRatio si le rapport est 0). | 110 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}. | 101 |
| `device:getState()` | Renvoie stateData avec la clé '<nom>Mode' = mode courant (pour la sauvegarde). | 66 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, inertie cumulée, coefficients d'usure/dégâts et isBroken ; relit friction. Ne remet pas le rapport. | 127 |
| `device:setGearIndex(index, omitInertiaCaculation)` | Choisit le rapport par son indice (borné à [minGearIndex, maxGearIndex]) et recalcule l'inertie du groupe motopropulseur, sauf si omitInertiaCaculation est vrai. | 24 |
| `device:setMode(mode)` | Passe en gamme 'high' (rapport le plus petit) ou 'low' (rapport le plus grand). Toute autre valeur est ignorée. Met à jour le bouton UI. | 52 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table) ; appelle onBreak si isBroken, qui n'est pas défini sur ce device. | 86 |
| `device:setState(data)` | Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel. | 71 |
| `device:torqueUpdate()` | Appelée à chaque pas physique : outputTorque1 = (couple parent - frottements) * gearRatio. | 20 |
| `device:updateSimpleControlButtons()` | Si plusieurs modes et uiSimpleModeControl : met à jour le bouton d'interface simple (icônes powertrain_rangebox_high / low) pour powertrain.toggleDeviceMode(nom). | 33 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le parent. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/rangeBox.lua`.*
