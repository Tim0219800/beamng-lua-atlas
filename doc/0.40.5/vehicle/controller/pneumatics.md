# `controller_pneumatics`

*Fichier : `lua/vehicle/controller/pneumatics.lua` · VM : Véhicule · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de suspension/vérins pneumatiques simples (type "auxiliary") : il pilote la pression de poutres « pressurées » (obj:setBeamPressureRel) regroupées en groupes nommés, avec niveaux de pression nommés (minPressure, maxPressure, defaultPressure…), vitesses de montée/descente et sons de gonflage/dégonflage. Contrairement à pneumatics/actuators, aucune physique de gaz ni réservoir n'est modélisée : la pression suit simplement la cible à vitesse limitée. Les fonctions publiques s'appellent depuis des entrées ou d'autres contrôleurs avec une liste de noms de groupes.

## Exemple

```lua
local p = controller.getControllerSafe('pneumatics')
p.setBeamMax({"suspension"})        -- gonfle au maximum
p.setBeamPressure({"suspension"}, 30) -- 30 PSI brut
```

## Remarques

- Unités : les pressions du jbeam et des fonctions sont en PSI ; la conversion en pascals (1 PSI = 6894.757 Pa) est faite en interne pour obj:setBeamPressureRel.
- Clés jbeam du contrôleur : pressuredBeams (nom de la table de v.data qui liste les poutres ; chaque entrée contient beamName, groupName et éventuellement des champs se terminant par « Pressure » (niveaux propres), increaseRate, decreaseRate), pressureLevels (table d'en-tête name/pressure pour des niveaux communs ; minPressure et maxPressure valent 0 par défaut), increaseRate (0), decreaseRate (0) en PSI/s, groupSounds (nom de table de v.data pour les sons : groupName, node, volumeUp, volumeDown, soundUp, soundDown, stopVelocityThresholdPressureIncrease, stopVelocityThresholdPressureDecrease).
- Champs de poutre lus sur la poutre elle-même : name, pressurePSI (pression par défaut), maxPressure, beamSpring, beamDamp.
- Si un taux increaseRate/decreaseRate vaut 0, la pression ne bouge pas.
- Les sons s'arrêtent soit quand la pression a atteint sa cible, soit quand la vitesse moyenne des poutres repasse sous un seuil (si défini). Les appels de son échouent si un groupe n'a pas de sons définis (soundLoopUp/soundLoopDown nil), déduit du code.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics.init(jbeamData)` | Construit les groupes de poutres à partir des tables jbeam et des niveaux de pression. *(interne)* | 245 |
| `controller_pneumatics.initSounds(jbeamData)` | Crée les sources sonores de montée/descente de chaque groupe. Appelé par le gestionnaire de contrôleurs. *(interne)* | 317 |
| `controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName)` | Indique si toutes les poutres d'un groupe sont exactement au niveau de pression nommé. | 167 |
| `controller_pneumatics.reset()` | Remet toutes les poutres à leur pression par défaut. *(interne)* | 235 |
| `controller_pneumatics.resetSounds()` | Coupe le volume des sons et réinitialise leur état. *(interne)* | 344 |
| `controller_pneumatics.setBeamDefault(groupNames)` | Cible la pression par défaut (defaultPressure) des groupes. | 104 |
| `controller_pneumatics.setBeamMax(groupNames)` | Cible la pression maximale (maxPressure) des groupes. | 100 |
| `controller_pneumatics.setBeamMin(groupNames)` | Cible la pression minimale (minPressure) des groupes. | 96 |
| `controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled)` | Active/désactive la diminution continue de pression des groupes ; désactive l'augmentation. | 147 |
| `controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled)` | Active/désactive l'augmentation continue de pression des groupes (tant que enabled est vrai) ; désactive la diminution. | 127 |
| `controller_pneumatics.setBeamPressure(groupNames, pressure)` | Fixe directement la pression cible des groupes, bornée par le min et le max de chaque poutre. | 61 |
| `controller_pneumatics.setBeamPressureLevel(groupNames, pressureName)` | Cible un niveau de pression nommé (clé de poutre, ex. "maxPressure" ou un niveau défini dans pressureLevels). | 90 |
| `controller_pneumatics.toggleBeamMinMax(groupNames)` | Pour chaque groupe : passe au minimum si tout est au maximum, sinon au maximum. | 108 |
| `controller_pneumatics.updateGFX(dt)` | Chaque image : applique les augmentations/diminutions momentanées, fait avancer la pression courante vers la cible à vitesse limitée et gère l'arrêt des sons. *(interne)* | 181 |

### Détail des paramètres

#### `controller_pneumatics.init(jbeamData)`

Construit les groupes de poutres à partir des tables jbeam et des niveaux de pression.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics.initSounds(jbeamData)`

Crée les sources sonores de montée/descente de chaque groupe. Appelé par le gestionnaire de contrôleurs.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName)`

Indique si toutes les poutres d'un groupe sont exactement au niveau de pression nommé.

- `groupName` (*string*) : Nom du groupe.
- `levelName` (*string*) : Nom du niveau (ex. "maxPressure").
- **renvoie** : boolean Vrai si le groupe est à ce niveau ; false aussi si le groupe n'existe pas.

#### `controller_pneumatics.setBeamDefault(groupNames)`

Cible la pression par défaut (defaultPressure) des groupes.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).

#### `controller_pneumatics.setBeamMax(groupNames)`

Cible la pression maximale (maxPressure) des groupes.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).

#### `controller_pneumatics.setBeamMin(groupNames)`

Cible la pression minimale (minPressure) des groupes.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).

#### `controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled)`

Active/désactive la diminution continue de pression des groupes ; désactive l'augmentation.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).
- `enabled` (*boolean*) : Vrai pour diminuer.

#### `controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled)`

Active/désactive l'augmentation continue de pression des groupes (tant que enabled est vrai) ; désactive la diminution.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).
- `enabled` (*boolean*) : Vrai pour augmenter.

#### `controller_pneumatics.setBeamPressure(groupNames, pressure)`

Fixe directement la pression cible des groupes, bornée par le min et le max de chaque poutre.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).
- `pressure` (*number*) : Pression cible en PSI.

#### `controller_pneumatics.setBeamPressureLevel(groupNames, pressureName)`

Cible un niveau de pression nommé (clé de poutre, ex. "maxPressure" ou un niveau défini dans pressureLevels).

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).
- `pressureName` (*string*) : Nom du niveau de pression.

#### `controller_pneumatics.toggleBeamMinMax(groupNames)`

Pour chaque groupe : passe au minimum si tout est au maximum, sinon au maximum.

- `groupNames` (*string[]*) : Noms de groupes de poutres (groupName de la table des poutres sous pression).

#### `controller_pneumatics.updateGFX(dt)`

Chaque image : applique les augmentations/diminutions momentanées, fait avancer la pression courante vers la cible à vitesse limitée et gère l'arrêt des sons.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource`, `cutSFX`, `getBeamVelocity`, `playSFX`, `setBeamPressureRel`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics.lua`.*
