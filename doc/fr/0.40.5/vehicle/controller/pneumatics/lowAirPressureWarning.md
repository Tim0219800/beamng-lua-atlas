# `controller_pneumatics_lowAirPressureWarning`

*Fichier : `lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua` · VM : Véhicule · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/lowAirPressureWarning` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'alerte de basse pression d'air (poids lourds). Surveille la pression d'un réservoir : sous airTooLowPressure et contact mis (ignitionLevel > 0), il met l'electric d'alerte à 1, joue une boucle sonore et affiche un message ; au-dessus de airOkPressure ou contact coupé il remet tout à zéro (hystérésis).

## Remarques

- Clés jbeam lues : lowAirWarningElectric ("lowAirPressure"), airTooLowPressure (600000 Pa relatifs) et airOkPressure (650000 Pa), tous deux additionnés à powertrain.currentEnvPressure, relevantPressureTankName ("mainAirTank"), lowAirWarningSoundEvent (nom d'évènement audio, facultatif), lowAirWarningSoundNode (nom de nœud, 0 si absent), lowAirWarningSoundVolume (0.5).
- Si le réservoir n'existe pas, la pression est considérée à 0 et l'alerte se déclenche dès que le contact est mis.
- Le son est une source en boucle « AudioDefaultLoop3D » créée dans initSounds.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_lowAirPressureWarning.init(jbeamData)` | Lit les seuils de pression et le réservoir surveillé. *(interne)* | 60 |
| `controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData)` | Crée la source sonore d'alerte (si lowAirWarningSoundEvent est défini) et règle son volume. Appelé par le moteur à l'initialisation des sons. *(interne)* | 47 |
| `controller_pneumatics_lowAirPressureWarning.reset(jbeamData)` | Remet l'electric d'alerte à 0. *(interne)* | 43 |
| `controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData)` | Arrête le son d'alerte et réinitialise l'état de lecture. *(interne)* | 36 |
| `controller_pneumatics_lowAirPressureWarning.updateGFX(dt)` | Chaque frame : compare la pression du réservoir aux seuils et met à jour l'electric d'alerte, le son et le message. *(interne)* | 18 |

### Détail des paramètres

#### `controller_pneumatics_lowAirPressureWarning.init(jbeamData)`

Lit les seuils de pression et le réservoir surveillé.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData)`

Crée la source sonore d'alerte (si lowAirWarningSoundEvent est défini) et règle son volume. Appelé par le moteur à l'initialisation des sons.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_lowAirPressureWarning.reset(jbeamData)`

Remet l'electric d'alerte à 0.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData)`

Arrête le son d'alerte et réinitialise l'état de lecture.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_lowAirPressureWarning.updateGFX(dt)`

Chaque frame : compare la pression du réservoir aux seuils et met à jour l'electric d'alerte, le son et le message.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua`.*
