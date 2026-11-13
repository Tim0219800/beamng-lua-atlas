# `controller_sound_airbrakes`

*Fichier : `lua/vehicle/controller/sound/airbrakes.lua` · VM : Véhicule · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `sound/airbrakes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de son de purge de freins pneumatiques simple (sans simulation d'air, contrairement à pneumatics/airbrakes). Surveille electrics.values[electricsBrakeName] ; si le frein se relâche de plus de 0.2 par seconde sur une fenêtre de 0.25 s, joue un « pschitt » dont l'intensité dépend de la vitesse de relâchement, puis attend un délai de recharge.

## Remarques

- Clés jbeam lues : soundNode_nodes (premier élément = nœud du son, 0 sinon), soundEvent ("event:>Vehicle>Pneumatics>Air_Brakes"), soundCoolDown (0.5 s), electricsBrakeName ("brake").
- L'intensité passée au son est -dBrake x 0.25 (non plafonnée, contrairement à pneumatics/airbrakes qui plafonne à 0.99).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_sound_airbrakes.init(jbeamData)` | Lit la configuration jbeam et remet l'état à zéro. *(interne)* | 56 |
| `controller_sound_airbrakes.reset()` | Remet l'état d'échantillonnage à zéro. *(interne)* | 49 |
| `controller_sound_airbrakes.updateGFX(dt)` | Chaque frame : détecte un relâchement rapide du frein et joue le son. *(interne)* | 23 |

### Détail des paramètres

#### `controller_sound_airbrakes.init(jbeamData)`

Lit la configuration jbeam et remet l'état à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_airbrakes.updateGFX(dt)`

Chaque frame : détecte un relâchement rapide du frein et joue le son.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnce`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/sound/airbrakes.lua`.*
