# `controller_hydraulicSuspension`

*Fichier : `lua/vehicle/controller/hydraulicSuspension.lua` · VM : Véhicule · 328 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulicSuspension` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de suspension hydraulique (type "auxiliary") : pilote la longueur de référence de poutres (vérins de suspension) regroupées en groupes nommés. Une pompe virtuelle limite la vitesse d'extension ; la descente se fait à vitesse fixe ; en mode « bleed » la poutre est relâchée (ressort nul, amortissement variable) et suit librement. Il joue aussi les sons de pompe et de décharge. Un moddeur appelle setGroupsPosition / setGroupsBleed / setGroupsMomentaryIncrease depuis des entrées ou d'autres contrôleurs.

## Exemple

```lua
local hs = controller.getControllerSafe('hydraulicSuspension')
hs.setGroupsPosition({"front", "rear"}, 1)   -- tout en haut
hs.setGroupsBleed({"front"}, 1)              -- relâche l'avant
```

## Remarques

- Clés jbeam du contrôleur : hydraulicBeams (nom de la table de v.data qui décrit les poutres, défaut "hydraulicsData" ; chaque entrée contient beamName, groupName, min, max), basePumpSpeed (0.5, variation du ratio de longueur par seconde), maxPumpSpeed (défaut basePumpSpeed*20), pumpSample (événement sonore, défaut "event:>Vehicle>Hydraulics>Pump_01"), releaseSample (défaut "event:>Vehicle>Hydraulics>Release_01"), pumpNode (nœud d'émission du son).
- Clés jbeam portées par les poutres : name (obligatoire pour être trouvées), hydraulicsMinDamp (0, amortissement minimal en mode bleed), defaultBleedCoef (1, borné 0..1). Les positions sont des ratios de la longueur de référence de la poutre (obj:setBeamLengthRefRatio).
- Une poutre en mode bleed (bleedCoef > 0) a un ressort de 0 ; à bleedCoef = 0 elle reprend son ressort d'origine et un amortissement d'origine. La montée est limitée par min(basePumpSpeed*speedCoef, maxPumpSpeed) ; la descente se fait à 10 (ratio/s).
- Au reset toutes les poutres reviennent à leur position d'origine avec bleedCoef = 1 (relâchées).
- Les noms de groupe inexistants sont ignorés avec un avertissement dans le journal.
- getState/setState sauvegardent par poutre : currentPosition, targetPosition, bleedCoef, speedCoef.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulicSuspension.getState()` | Renvoie l'état de toutes les poutres pour la sauvegarde/synchronisation. | 238 |
| `controller_hydraulicSuspension.init(jbeamData)` | Construit les groupes de poutres à partir de la table hydraulique jbeam, mémorise les paramètres de pompe. *(interne)* | 166 |
| `controller_hydraulicSuspension.initSounds(jbeamData)` | Crée les sources sonores de pompe et de décharge sur pumpNode. Appelé par le gestionnaire de contrôleurs lors de l'initialisation des sons. *(interne)* | 289 |
| `controller_hydraulicSuspension.reset()` | Remet toutes les poutres à leur position d'origine et en mode relâché. *(interne)* | 153 |
| `controller_hydraulicSuspension.resetSounds()` | Remet à zéro l'état des sons de pompe et de décharge. *(interne)* | 305 |
| `controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef)` | Relâche les groupes : bleedCoef > 0 supprime le ressort et laisse la poutre suivre librement ; l'amortissement dépend de 1 - bleedCoef. | 61 |
| `controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef)` | Active/désactive l'augmentation continue de la cible des groupes (à la vitesse de base de la pompe) tant que enabled est vrai, dans les limites min/max de chaque poutre. | 77 |
| `controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef)` | Fixe la position cible de tous les groupes nommés : position 0 = extension min, 1 = extension max de chaque poutre. Désactive le bleed de ces poutres. | 42 |
| `controller_hydraulicSuspension.setState(data)` | Restaure l'état renvoyé par getState (valeurs numériques valides uniquement). | 248 |
| `controller_hydraulicSuspension.updateFixedStep(dt)` | Chaque pas physique : fait avancer chaque poutre vers sa position cible à la vitesse de pompe et applique la longueur et le ressort/amortissement. *(interne)* | 132 |
| `controller_hydraulicSuspension.updateGFX(dt)` | Chaque image : gère le son de pompe (volume 0.5, hauteur selon le débit) et le son de décharge selon les poutres relâchées qui raccourcissent. *(interne)* | 95 |

### Détail des paramètres

#### `controller_hydraulicSuspension.getState()`

Renvoie l'état de toutes les poutres pour la sauvegarde/synchronisation.

- **renvoie** : table<string, number> Table d'état (réutilisée).

#### `controller_hydraulicSuspension.init(jbeamData)`

Construit les groupes de poutres à partir de la table hydraulique jbeam, mémorise les paramètres de pompe.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulicSuspension.initSounds(jbeamData)`

Crée les sources sonores de pompe et de décharge sur pumpNode. Appelé par le gestionnaire de contrôleurs lors de l'initialisation des sons.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef)`

Relâche les groupes : bleedCoef > 0 supprime le ressort et laisse la poutre suivre librement ; l'amortissement dépend de 1 - bleedCoef.

- `groupNames` (*string[]*) : Noms de groupes.
- `bleedCoef` (*number*) : 0 (pas de relâchement) à 1 (relâchement complet), borné.

#### `controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef)`

Active/désactive l'augmentation continue de la cible des groupes (à la vitesse de base de la pompe) tant que enabled est vrai, dans les limites min/max de chaque poutre.

- `groupNames` (*string[]*) : Noms de groupes.
- `enabled` (*boolean*) : Vrai pour monter en continu.
- `speedCoef` (*number|nil*) : Multiplicateur de vitesse (1 par défaut).

#### `controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef)`

Fixe la position cible de tous les groupes nommés : position 0 = extension min, 1 = extension max de chaque poutre. Désactive le bleed de ces poutres.

- `groupNames` (*string[]*) : Noms de groupes (groupName dans la table hydraulique).
- `position` (*number*) : 0..1, interpolation entre min et max de chaque poutre.
- `speedCoef` (*number|nil*) : Multiplicateur de la vitesse de pompe (1 par défaut).

#### `controller_hydraulicSuspension.setState(data)`

Restaure l'état renvoyé par getState (valeurs numériques valides uniquement).

- `data` (*table|nil*) : Table d'état.

#### `controller_hydraulicSuspension.updateFixedStep(dt)`

Chaque pas physique : fait avancer chaque poutre vers sa position cible à la vitesse de pompe et applique la longueur et le ressort/amortissement.

- `dt` (*number*) : Pas de temps (s).

#### `controller_hydraulicSuspension.updateGFX(dt)`

Chaque image : gère le son de pompe (volume 0.5, hauteur selon le débit) et le son de décharge selon les poutres relâchées qui raccourcissent.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `getBeamCurLengthRefRatio`, `getBeamLengthRefRatio`, `playSFX`, `setBeamLengthRefRatio`, `setBeamSpringDamp`, `setVolumePitch`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulicSuspension.lua`.*
