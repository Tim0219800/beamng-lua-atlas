# `controller_beamNavigator`

*Fichier : `lua/vehicle/controller/beamNavigator.lua` · VM : Véhicule · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `beamNavigator` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui affiche une carte de navigation en direct sur un écran du véhicule. Il crée une texture HTML (module `htmlTexture`) sur un matériau d'écran, demande au jeu la carte du tableau de bord (`ui_uinavi.requestVehicleDashboardMap`) et lui envoie 15 fois par seconde la position, l'orientation, la vitesse et l'allumage du véhicule, tant qu'un joueur est assis.

## Remarques

- Clés jbeam lues par init : `screenMaterialName` ("@screen_gps"), `htmlFilePath` ("local://local/vehicles/common/navi_screen.html"), `textureWidth` (256), `textureHeight` (128), `textureFPS` (30), `bootscreenImage` (URL facultative de l'écran de démarrage).
- Données envoyées à `map.updateData` : x, y, rotation (degrés = direction + 180), speed (km/h = airspeed × 3.6), zoom (min(150 + vitesse × 1.5, 250), inutilisé sur le tableau de bord), ignitionLevel.
- `M.reset = nop` (fonction vide) : sans cela controller.reset rappellerait init et recréerait la texture. Le champ `reset` n'est donc pas nil.
- L'appel utilise `obj:getID()` pour l'identifiant du véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_beamNavigator.init(jbeamData)` | Crée la texture HTML de l'écran, demande la carte au jeu et affiche l'image de démarrage si `bootscreenImage` est fournie. *(interne)* | 40 |
| `controller_beamNavigator.updateGFX(dt)` | Envoie les données GPS à la texture HTML à 15 Hz quand un joueur est assis. *(interne)* | 21 |

### Détail des paramètres

#### `controller_beamNavigator.init(jbeamData)`

Crée la texture HTML de l'écran, demande la carte au jeu et affiche l'image de démarrage si `bootscreenImage` est fournie.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_beamNavigator.updateGFX(dt)`

Envoie les données GPS à la texture HTML à 15 Hz quand un joueur est assis.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `reset` | function | nop : évite de rappeler init au reset du véhicule. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getDirection`, `getID`, `getPosition`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/beamNavigator.lua`.*
