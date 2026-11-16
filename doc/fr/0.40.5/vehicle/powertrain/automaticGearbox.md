# `powertrain_automaticGearbox`

*Fichier : `lua/vehicle/powertrain/automaticGearbox.lua` · VM : Véhicule · 514 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `automaticGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Type de device powertrain `automaticGearbox` : boîte automatique à train planétaire/hydraulique simplifié. Elle a des rapports indexés (gearIndex), des modes drive / neutral / park, une interpolation progressive du rapport lors des changements (simule l'ouverture/fermeture des embrayages internes), un frottement, une perte à la montée en rapport, un verrouillage de parking, un amortisseur visqueux anti-recul et des sons de sifflement d'engrenages. Le parent doit être un dispositif de couplage visqueux (catégorie viscouscoupling, en pratique un convertisseur de couple). Le choix des rapports est piloté par un contrôleur (gearbox controller), pas par ce module.

## Exemple

```lua
local gb = powertrain.getDevice('transmission')
gb:setGearIndex(2, 0.3)   -- 2e rapport, changement en au moins 0.3 s
powertrain.setDeviceMode('transmission', 'neutral')
```

## Remarques

- CLÉS JBEAM : gearRatios (liste ; les valeurs >= 0 deviennent les rapports avant d'indice 0, 1, 2… dans l'ordre, les négatives les marches arrière), gearRatio (initial, défaut 1), friction (0), dynamicFriction (0), torqueLossCoef (0..1), shiftEfficiency (0.5 : fraction du couple transmis pendant un changement), gearChangeTime (0.5 s, durée minimale d'interpolation), parkLockTorque (1000 N·m), parkLockSpring, parkLockDampRatio (0.4), oneWayViscousCoef (5), oneWayViscousTorque (coef x 25), oneWayViscousSmoothing (50), gearboxNode_nodes (noeud de la boîte pour les sons), breakTriggerBeam, gearWhineCoefs / gearWhineCoefsInput / gearWhineCoefsOutput, gearWhineFixedCoefInput (0.4) / Output (0.7), gearWhineInputEvent / gearWhineOutputEvent, forward/reverse Input/OutputPitchCoef (1 / 0.7), gearWhine*Smoothing.
- INDEXATION : gearIndex 0 = neutre (rapport 0 ou premier élément), 1..N avant, -1..-M arrière, bornés par minGearIndex / maxGearIndex. Attention : pour les rapports arrière la boucle de new() associe gearRatios[-k] dans un ordre particulier (avec 2 marches arrière, [-2] reçoit la 1re valeur négative de la liste jbeam et [-1] la 2e), à vérifier avant de s'y fier.
- CHAMPS : gearRatio (rapport courant interpolé), desiredGearRatio, gearIndex, mode, isShifting / isShiftingUp / isShiftingDown, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), virtualMassAV (vitesse de la masse virtuelle en neutre/park), lockCoef (1 normal, 0 verrouillé par setLock), shiftLossCoef, parkClutchAngle / parkEngaged, wear/damage coefs, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, transmissionNodeID.
- Physique : en drive, inputAV = outputAV1 x gearRatio x lockCoef et outputTorque = ((couple d'entrée x shiftLossCoef - frottement) x gearRatio - couple anti-recul) x lockCoef. En neutral/park, une masse virtuelle prend la place (la boîte se déconnecte de la sortie) et le parking verrouille la sortie par un ressort quand le véhicule est quasi à l'arrêt (|outputAV1| < 100 rad/s).
- Incohérences repérées : le device n'a pas de méthode onBreak ; powertrain.breakDevice (poutre breakTriggerBeam cassée) et setPartCondition avec isBroken appellent device:onBreak(), ce qui planterait. En outre, powertrain.setDeviceMode / toggleDeviceMode utilisent device.availableModes (non défini ici) : les changements de mode passent par setMode appelé par le contrôleur de boîte.
- Catégorie du device : gearbox (le moteur ne l'accepte pas comme enfant direct : il faut un couplage visqueux ou un embrayage entre les deux).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_automaticGearbox.new(jbeamData)` | Fabrique du device appelée par powertrain.init pour le type 'automaticGearbox'. Construit les tables de rapports, de sons, de verrouillage de parking et d'anti-recul, puis sélectionne le rapport 0. *(interne)* | 366 |

### Détail des paramètres

#### `powertrain_automaticGearbox.new(jbeamData)`

Fabrique du device appelée par powertrain.init pour le type 'automaticGearbox'. Construit les tables de rapports, de sons, de verrouillage de parking et d'anti-recul, puis sélectionne le rapport 0.

- `jbeamData` (*table*) : Données jbeam ; gearRatios est obligatoire.
- **renvoie** : table Le device automaticGearbox.

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox = true}. |
| `outputPorts` | table<integer, boolean> | {[1] = true}. |
| `requiredExternalInertiaOutputs` | integer[] | {1} : powertrain ajoute un arbre factice sur ce port si rien n'y est connecté. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Applique un dégât de déformation : augmente le frottement, réduit la vitesse de changement de rapport (plancher 0.2). | 161 |
| `device:calculateInertia()` | Calcule l'inertie cumulée ramenée à l'entrée (inertie de l'enfant / rapport²), les paramètres du verrou de parking et les rapports cumulés. | 257 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et la table d'état {damageFrictionCoef, damageGearRatioChangeRateCoef, isBroken}. | 188 |
| `device:initSounds(jbeamData)` | Crée les boucles sonores de sifflement (entrée/sortie) et leurs lisseurs d'après les clés jbeam gearWhine*. | 292 |
| `device:reset(jbeamData)` | Remet tout à l'état initial (vitesses, mode 'drive', usure, dégâts, parking) et sélectionne le rapport 0. | 328 |
| `device:resetSounds()` | Remet à zéro les lisseurs et valeurs de bruit d'engrenages. | 280 |
| `device:setGearIndex(index, gearChangeTime)` | Choisit un rapport par son indice (borné à [minGearIndex, maxGearIndex]). Le rapport réel est ensuite interpolé dans updateGFX ; pendant le changement le couple est réduit par shiftEfficiency. | 241 |
| `device:setLock(enabled)` | Active (true) ou désactive le verrouillage : lockCoef = 0 déconnecte l'entrée et laisse seul le verrou de parking, 1 fonctionnement normal ; remet parkClutchAngle à 0. | 252 |
| `device:setMode(mode)` | Change le mode ('drive', 'neutral' ou 'park') et sélectionne les fonctions de mise à jour correspondantes. | 236 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure et intégrité (nombre ou table) : coefficients de friction et de vitesse de changement de rapport ; appelle onBreak si isBroken (méthode inexistante, voir notes). | 166 |
| `device:torqueUpdate(dt)` | Pas de physique (couples). Calcule outputTorque1 selon le mode, le frottement, le verrouillage de parking et l'anti-recul, et alimente les lisseurs de bruit d'engrenages. | 79 |
| `device:updateGFX(dt)` | Une fois par frame : fait progresser gearRatio vers desiredGearRatio à la vitesse gearRatioChangeRate (influencée par usure/dégâts), recalcule l'inertie quand le rapport est atteint, met à jour isShifting*, et engage le parking si mode 'park' et vitesse basse. | 115 |
| `device:updateSounds(dt)` | Appelée par powertrain.updateGFX : met à jour volume et hauteur des boucles de sifflement d'engrenages d'entrée et de sortie. | 19 |
| `device:validate()` | Vérifie que le parent est un couplage visqueux (viscouscoupling) ; calcule les couples/vitesses attendus (depuis le moteur grand-parent si présent, sinon 100 N·m et 6000 tr/min) pour normaliser les sons. | 204 |
| `device:velocityUpdate(dt)` | Pas de physique (vitesses). Fonction sélectionnée selon le mode : updateVelocity (drive), neutralUpdateVelocity ou parkUpdateVelocity (masse virtuelle). Écrit la vitesse d'entrée dans le parent. | 74 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/automaticGearbox.lua`.*
