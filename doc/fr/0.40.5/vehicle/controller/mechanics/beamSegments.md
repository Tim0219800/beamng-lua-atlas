# `controller_mechanics_beamSegments`

*Fichier : `lua/vehicle/controller/mechanics/beamSegments.lua` · VM : Véhicule · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `mechanics/beamSegments` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur de mécanique (type "auxiliary") qui répartit la longueur d'une poutre « capteur » sur plusieurs poutres « segments » : à chaque image, chaque segment reçoit la longueur du capteur divisée par le nombre de segments, multipliée par un facteur. Sert à construire des éléments téléscopiques ou des chaînes de segments dont la longueur totale suit un capteur.

## Remarques

- Clés jbeam (défaut) : segmentBeamTag (obligatoire, tag des segments), sensorBeamTag (obligatoire, la première poutre trouvée sert de capteur), sensorBeamLengthMultiplier (1, mettre le nombre de portées parallèles).
- Si aucun segment ou pas de capteur, une erreur est journalisée et le contrôleur reste inactif.
- Incohérence : beamBroken met isActiveCoef à 0 mais updateGFX ne le consulte jamais, donc rien ne s'arrête quand une poutre casse.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_mechanics_beamSegments.beamBroken(id, energy)` | Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est un segment ou le capteur (voir notes). *(interne)* | 29 |
| `controller_mechanics_beamSegments.init(jbeamData)` | Retrouve les poutres de segments et de capteur par tag. *(interne)* | 40 |
| `controller_mechanics_beamSegments.reset(jbeamData)` | Réactive le contrôleur. *(interne)* | 36 |
| `controller_mechanics_beamSegments.updateGFX(dt)` | Règle la longueur de chaque segment d'après celle du capteur. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_mechanics_beamSegments.beamBroken(id, energy)`

Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est un segment ou le capteur (voir notes).

- `id` (*integer*) : Identifiant (cid) de la poutre cassée.
- `energy` (*number*) : Énergie de rupture.

#### `controller_mechanics_beamSegments.init(jbeamData)`

Retrouve les poutres de segments et de capteur par tag.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamSegments.reset(jbeamData)`

Réactive le contrôleur.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_mechanics_beamSegments.updateGFX(dt)`

Règle la longueur de chaque segment d'après celle du capteur. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`, `setBeamLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/mechanics/beamSegments.lua`.*
