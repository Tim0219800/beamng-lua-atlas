# `util_trackBuilder_quickraceSetup`

*Fichier : `lua/ge/extensions/util/trackBuilder/quickraceSetup.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_quickraceSetup` : `extensions.load("util_trackBuilder_quickraceSetup")`, puis la globale `util_trackBuilder_quickraceSetup`

Extension de liaison entre le mode course rapide (scénario) et le Track Builder : quand un scénario est chargé, elle décharge les pistes en place, charge la piste personnalisée du scénario (sc.track.customData.name) via util_trackBuilder_splineTrack, ajoute les checkpoints et positionne le véhicule, éventuellement dans le sens inverse.

## Remarques

- Un drapeau done évite de refaire l'installation tant que onClientStartMission n'a pas été rappelé.
- Les arguments passés à load(…, true, true, true) ne sont pas nommés dans ce fichier ; voir splineTrack.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_quickraceSetup.onClientStartMission()` | Hook appelé au début du chargement d'un niveau ; réinitialise le drapeau done pour permettre une nouvelle installation. *(interne)* *(hook)* | 23 |
| `util_trackBuilder_quickraceSetup.onScenarioLoaded(sc)` | Hook appelé quand un scénario est chargé. Si l'installation n'est pas déjà faite : unloadAll, load de la piste du scénario, addCheckPointPositions(reverse), positionVehicle(reverse). *(interne)* *(hook)* | 10 |

### Détail des paramètres

#### `util_trackBuilder_quickraceSetup.onScenarioLoaded(sc)`

Hook appelé quand un scénario est chargé. Si l'installation n'est pas déjà faite : unloadAll, load de la piste du scénario, addCheckPointPositions(reverse), positionVehicle(reverse).

- `sc` (*table*) : Scénario ; utilise sc.track.customData.name (nom de la piste) et sc.track.reverse (sens inverse).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/quickraceSetup.lua`.*
