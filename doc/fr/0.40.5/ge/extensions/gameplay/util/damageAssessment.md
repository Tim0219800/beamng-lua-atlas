# `gameplay_util_damageAssessment`

*Fichier : `lua/ge/extensions/gameplay/util/damageAssessment.lua` · VM : Game Engine (GE) · 444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_damageAssessment` : `extensions.load("gameplay_util_damageAssessment")`, puis la globale `gameplay_util_damageAssessment`

Évalue les dégâts d'un véhicule : niveau global (aucun, léger, modéré, sévère) d'après map.objects[id].damage, et répartition par zone. Pour la répartition, la boîte orientée du véhicule est découpée en 27 cellules (3x3x3) dont on lit les dégâts de poutres et de collision ; les cellules sont regroupées en zones nommées (Front, Front Left, Rear, Top, Left…). Utilisé par gameplay_util_crashDetection pour dire où un impact a eu lieu.

## Exemple

```lua
local lvl = gameplay_util_damageAssessment.getOverallDamageLevel(be:getPlayerVehicleID(0))
print(lvl.damageName, lvl.damageSeverity)
local avant = gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)
-- ... collision ...
local res = gameplay_util_damageAssessment.getTextualCollisionDamageLocations({vehId = vehId, oldSectionsDamageRaw = avant})
print(res.mostDamagedLocation)
```

## Remarques

- Seuils de getOverallDamageLevel : <= 50 « No damage » (gravité 0) ; au-dessus, Minor jusqu'à 10000, Moderate dès 10000, Severe dès 30000 (et au-delà de 50000).
- Les cellules sont indexées de 0 à 26 ; x = floor((i%9)/3), y = floor(i/9), z = i%3.
- BUG probable : damageLocationScore n'est jamais renseigné (seul damageScore l'est), donc bestDamageLocation vaut toujours nil et bestDamageScore 0 ; seul mostDamagedLocation est exploitable.
- BUG probable : la clé de zone s'appelle `fontLeft` (faute de frappe, sans effet sur le nom affiché « Front Left »). Les ids 7 sont dupliqués (rearCenter et top) et le nom « Rear » est utilisé à la fois par rearCenter et rear : dans damagedLocations, la seconde entrée écrase la première.
- Si aucune cellule n'a subi de dégât, intensity divise par 0 (maxCellDamage = 0) et peut produire NaN.
- getTextualCollisionDamageLocations / getTextualBeamDamageLocations modifient la table `data` reçue : ses oldSectionsDamageRaw (et newSectionsDamageInfoRaw s'il est fourni) sont remplacés par de simples nombres par cellule.
- Sans oldSectionsDamageRaw, l'état précédent est supposé à 0 pour toutes les cellules ; sans vehId, le véhicule du joueur 0 est utilisé.
- Les dégâts affichés en debug (setDebug(true)) dessinent les 27 cellules en magenta chaque image.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue)` | Mesure l'hétérogénéité d'une série de dégâts : écart-type divisé par la moitié de maxValue, plafonné à 1. | 272 |
| `gameplay_util_damageAssessment.getOverallDamageLevel(vehId)` | Renvoie le niveau de dégâts global d'un véhicule d'après map.objects[vehId].damage. | 149 |
| `gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)` | Lit les dégâts de poutres et de collision des 27 cellules du véhicule. | 182 |
| `gameplay_util_damageAssessment.getTextualBeamDamageLocations(data)` | Identique à getTextualCollisionDamageLocations mais sur les dégâts de poutres (déformation), pour savoir où le véhicule s'est abîmé. | 408 |
| `gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data)` | Compare les dégâts de collision actuels à un état précédent et renvoie, par zone nommée, total, maximum, moyenne, variation, intensité et score. Sert à savoir où un impact a eu lieu. | 403 |
| `gameplay_util_damageAssessment.onDeserialized(data)` | Hook appelé après rechargement : restaure le drapeau debug. *(interne)* *(hook)* | 418 |
| `gameplay_util_damageAssessment.onSerialize()` | Hook appelé lors du rechargement des extensions : sauvegarde le drapeau debug. *(interne)* *(hook)* | 412 |
| `gameplay_util_damageAssessment.onUpdate()` | Hook appelé à chaque image ; en mode debug, redessine les cellules du véhicule du joueur. *(interne)* *(hook)* | 422 |
| `gameplay_util_damageAssessment.setDebug(newDebug)` | Active ou désactive le dessin de debug des cellules de dégâts. | 428 |

### Détail des paramètres

#### `gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue)`

Mesure l'hétérogénéité d'une série de dégâts : écart-type divisé par la moitié de maxValue, plafonné à 1.

- `tableNumbers` (*number[]*) : Dégâts par cellule.
- `maxValue` (*number|nil*) : Valeur de référence (500000 par défaut).
- **renvoie** : number 0 (uniforme ou moins de 2 valeurs) à 1.

#### `gameplay_util_damageAssessment.getOverallDamageLevel(vehId)`

Renvoie le niveau de dégâts global d'un véhicule d'après map.objects[vehId].damage.

- `vehId` (*integer*) : Id du véhicule (doit exister dans map.objects).
- **renvoie** : table {damageName = "No damage"|"Minor"|"Moderate"|"Severe", damageSeverity = 0..3}

#### `gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)`

Lit les dégâts de poutres et de collision des 27 cellules du véhicule.

- `vehId` (*integer|nil*) : Id du véhicule ; joueur 0 si nil.
- **renvoie** : table<integer, table> Indices 0 à 26 -> {sectionBeamDamage, sectionCollisionDamage}.

#### `gameplay_util_damageAssessment.getTextualBeamDamageLocations(data)`

Identique à getTextualCollisionDamageLocations mais sur les dégâts de poutres (déformation), pour savoir où le véhicule s'est abîmé.

- `data` (*table|nil*) : Même format.
- **renvoie** : table Même format.

#### `gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data)`

Compare les dégâts de collision actuels à un état précédent et renvoie, par zone nommée, total, maximum, moyenne, variation, intensité et score. Sert à savoir où un impact a eu lieu.

- `data` (*table|nil*) : {vehId, oldSectionsDamageRaw (sortie de getSectionsDamageInfoRaw), newSectionsDamageInfoRaw (facultatif)}.
- **renvoie** : table {damagedLocations (par nom de zone), mostDamagedLocation, totalDamage, bestDamageLocation, bestDamageScore}

#### `gameplay_util_damageAssessment.onDeserialized(data)`

Hook appelé après rechargement : restaure le drapeau debug.

- `data` (*table*) : Table de onSerialize.

#### `gameplay_util_damageAssessment.onSerialize()`

Hook appelé lors du rechargement des extensions : sauvegarde le drapeau debug.

- **renvoie** : table {debug}

#### `gameplay_util_damageAssessment.setDebug(newDebug)`

Active ou désactive le dessin de debug des cellules de dégâts.

- `newDebug` (*boolean*) : true pour activer.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/damageAssessment.lua`.*
