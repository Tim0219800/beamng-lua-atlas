# `powertrain_multiShaft`

*Fichier : `lua/vehicle/powertrain/multiShaft.lua` · VM : Véhicule · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `multiShaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `multiShaft` : répartiteur de couple à N sorties (N = clé jbeam `numberOfOutputPorts`), par exemple pour un pont à plusieurs essieux ou une boîte de transfert à plus de deux sorties. Catégories `shaft` et `differential`. Le couple d'entrée est réparti à parts égales entre les sorties, corrigé par un couplage visqueux qui rapproche les vitesses de sortie de la moyenne. La vitesse d'entrée est la moyenne des vitesses de sortie. Il n'a ni mode, ni gestion des dégâts/usure, ni état sauvegardable.

## Exemple

```lua
-- jbeam : ["transferCase", "multiShaft", "gearbox", 1, {"numberOfOutputPorts":3, "viscousCoef":50}]
local d = powertrain.getDevice("transferCase")
print(d.outputTorque1, d.outputTorque2, d.outputTorque3)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction (lu mais non utilisé dans les calculs), electricsName, visualShaftAVName, viscousCoef (N·m par rad/s ; si absent : 100 * inertie de sortie totale, calculé dans calculateInertia), viscousSmoothing (25), defaultVirtualInertia, numberOfOutputPorts (défaut 0 !).
- Champs principaux : inputAV (rad/s côté parent), outputAV1..outputAV<N> (rad/s, posés par les enfants), outputTorque1..outputTorque<N> (N·m), torqueDiff[i] (N·m de couple de couplage visqueux par sortie), numberOfOutputPorts, outputPorts (table {[i]=true}), outputAVNames et outputTorqueNames (tableaux de noms), requiredExternalInertiaOutputs ({1..N}), viscousCoef, gearRatio, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, mode ('connected' uniquement).
- Couple de sortie i = (couple parent * gearRatio) / N - lissage((outputAV_i - inputAV/gearRatio) * viscousCoef). Il n'y a pas de limite de couple de couplage.
- Pièges : numberOfOutputPorts vaut 0 par défaut, ce qui donne un device sans sortie et une division par zéro dans velocityUpdate (inputAV = nan). calculateInertia suppose que cumulativeGearRatio et maxCumulativeGearRatio ont été trouvés (erreur Lua 'attempt to perform arithmetic on nil' s'il n'y a aucun enfant) et invCumulativeInertia = 1 / cumulativeInertia n'est pas protégé contre 0. Les fonctions applyDeformGroupDamage, setPartCondition, getPartCondition, setMode et onBreak n'existent pas sur ce device. Le frottement (friction) n'intervient pas dans le couple.
- Les enfants de numéros 1..N doivent exister (children[i]) ; les gear ratios cumulés des enfants doivent être identiques, sinon un avertissement 'non-matching gear ratios' est logué.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_multiShaft.new(jbeamData)` | Construit le répartiteur : crée les N ports de sortie, les noms outputAV<i>/outputTorque<i>, les lisseurs de couplage visqueux et la liste requiredExternalInertiaOutputs. *(interne)* | 87 |

### Détail des paramètres

#### `powertrain_multiShaft.new(jbeamData)`

Construit le répartiteur : crée les N ports de sortie, les noms outputAV<i>/outputTorque<i>, les lisseurs de couplage visqueux et la liste requiredExternalInertiaOutputs.

- `jbeamData` (*table*) : Données jbeam du composant (numberOfOutputPorts requis).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true, differential=true}. |
| `outputPorts` | table<integer, boolean> | Valeur par défaut du module {[1]=true}, remplacée dans chaque device par {[1..N]=true} selon numberOfOutputPorts. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Somme les inerties cumulées des N enfants (journalise un avertissement si leurs rapports cumulés diffèrent), puis calcule cumulativeInertia, viscousCoef (si non fourni) et les rapports cumulés. | 41 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couples, torqueDiff, lisseurs, mode 'connected' et relit gearRatio et friction. | 64 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : répartit le couple d'entrée (* gearRatio) à parts égales et soustrait le couple visqueux lissé de chaque sortie. | 20 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 37 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = moyenne des vitesses de sortie * gearRatio, écrit dans le champ de vitesse du parent. | 10 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/multiShaft.lua`.*
