# `controller_mechanics_linearToAngularTransform`

*Fichier : `lua/vehicle/controller/mechanics/linearToAngularTransform.lua` · VM : Véhicule · 94 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `mechanics/linearToAngularTransform` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur de mécanique (type "auxiliary") qui convertit le déplacement d'une poutre capteur en rotation de poulie : la variation de longueur depuis le départ, divisée par un rayon effectif, donne un angle ; la fraction de tour (0..1, modulo 1) est multipliée par un facteur (360 par défaut) et écrite dans une valeur electrics pour animer une pièce rotative.

## Remarques

- Clés jbeam (défaut) : sensorBeamTag (obligatoire), effectiveRadius (m, obligatoire > 0), angularOutputElectricsName (obligatoire), angularOutputElectricsMultiplier (360).
- Les messages d'erreur du code mentionnent « beamSegments » et « pulleyRadius » (copier-coller) bien qu'ils concernent ce contrôleur.
- Incohérence : isActiveCoef et beamBroken ne servent à rien (updateGFX ne le consulte pas) ; reset appelle obj:getBeamLength(sensorBeamId) sans vérifier que sensorBeamId existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_mechanics_linearToAngularTransform.beamBroken(id, energy)` | Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est le capteur (sans effet réel, voir notes). *(interne)* | 31 |
| `controller_mechanics_linearToAngularTransform.init(jbeamData)` | Retrouve la poutre capteur et valide la configuration. *(interne)* | 46 |
| `controller_mechanics_linearToAngularTransform.reset(jbeamData)` | Mémorise la longueur de départ du capteur et remet la sortie à 0. *(interne)* | 38 |
| `controller_mechanics_linearToAngularTransform.updateGFX(dt)` | Écrit la fraction de tour convertie dans la valeur electrics de sortie. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_mechanics_linearToAngularTransform.beamBroken(id, energy)`

Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est le capteur (sans effet réel, voir notes).

- `id` (*integer*) : Identifiant (cid) de la poutre cassée.
- `energy` (*number*) : Énergie de rupture.

#### `controller_mechanics_linearToAngularTransform.init(jbeamData)`

Retrouve la poutre capteur et valide la configuration.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_linearToAngularTransform.reset(jbeamData)`

Mémorise la longueur de départ du capteur et remet la sortie à 0.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_linearToAngularTransform.updateGFX(dt)`

Écrit la fraction de tour convertie dans la valeur electrics de sortie. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/mechanics/linearToAngularTransform.lua`.*
