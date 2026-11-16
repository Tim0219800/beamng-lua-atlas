# `ui_apps_minimap_vehicles`

*Fichier : `lua/ge/extensions/ui/apps/minimap/vehicles.lua` · VM : Game Engine (GE) · 225 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_vehicles` : `extensions.load("ui_apps_minimap_vehicles")`, puis la globale `ui_apps_minimap_vehicles`

Dessine les marqueurs de véhicules de la mini-carte : le joueur (véhicule, piéton à pied ou caméra libre) et les autres véhicules actifs (trafic, voitures garées, police, véhicules utilisables ou non). Le module minimap lui transmet son état de dessin via setMinimapState puis appelle drawPlayer et drawOtherVehicles à chaque frame. Chargé par require, il s'appuie sur ui_apps_minimap_utils et le td:vehicleMarker de la minimap.

## Remarques

- setMinimapState doit être appelé avant tout dessin : les variables locales (td, scale, camPos…) sont sinon nil.
- Ignorés si non forcés (trafic, garés, police active) : les modèles de type Prop, Unknown, Utility, PropTraffic et Traffic. Les véhicules hors zone (camPos ± cullRadius) sont aussi ignorés.
- Les voitures de police pulsent en rouge/bleu et sont dessinées sur la couche VEHICLES_POLICE ; les véhicules inutilisables (piéton : liste noire de gameplay_walk) sont gris et plus petits.
- Les véhicules de modèle 'unicycle' sont dessinés comme cercles ; le joueur à pied aussi.
- En caméra libre (commands.isFreeCamera()), drawPlayer dessine aussi un repère d'orientation de la caméra ; avec lookaheadEnabled, la position est décalée de la valeur d'anticipation.
- Dans drawOtherVehicles, les deux tests drawUnusableVehicles et drawOtherVehicles sont presque redondants (les deux n'écartent que les véhicules inutilisables).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim)` | Dessine tous les autres véhicules actifs visibles selon les réglages de debug (trafic, garés, police active, utilisables, inutilisables). *(interne)* | 153 |
| `ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim)` | Dessine le marqueur du joueur (véhicule ou piéton) et, en caméra libre, le repère de caméra. Calcule aussi une échelle dynamique (plus grande à vitesse élevée) renvoyée à l'appelant ; renvoie nil s'il n'y a pas de véhicule joueur. *(interne)* | 56 |
| `ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue)` | Reçoit de la minimap principale tout l'état de dessin (taille, centre, caméra, échelle, objet de dessin, réglages de debug, direction de la caméra, dpi) et récupère la palette et la transformation monde-carte courantes. *(interne)* | 31 |

### Détail des paramètres

#### `ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim)`

Dessine tous les autres véhicules actifs visibles selon les réglages de debug (trafic, garés, police active, utilisables, inutilisables).

- `dtReal` (*number*) : Temps réel écoulé (non utilisé).
- `dtSim` (*number*) : Temps de simulation écoulé (non utilisé).

#### `ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim)`

Dessine le marqueur du joueur (véhicule ou piéton) et, en caméra libre, le repère de caméra. Calcule aussi une échelle dynamique (plus grande à vitesse élevée) renvoyée à l'appelant ; renvoie nil s'il n'y a pas de véhicule joueur.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).
- **renvoie** : number|nil Échelle ajustée du marqueur joueur.

#### `ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue)`

Reçoit de la minimap principale tout l'état de dessin (taille, centre, caméra, échelle, objet de dessin, réglages de debug, direction de la caméra, dpi) et récupère la palette et la transformation monde-carte courantes.

- `w` (*number*) : Largeur de la carte en pixels.
- `h` (*number*) : Hauteur de la carte en pixels.
- `cx` (*number*) : Centre X.
- `cy` (*number*) : Centre Y.
- `cp` (*vec3*) : Position de la caméra.
- `cr` (*quat*) : Rotation de la caméra.
- `cri` (*quat*) : Rotation inverse de la caméra.
- `s` (*number*) : Échelle de la carte.
- `si` (*number*) : Inverse de l'échelle.
- `textureDraw` (*table*) : Objet de dessin (vehicleMarker, line…).
- `debugSettingsObj` (*table*) : Réglages de debug (drawPlayer, drawTrafficVehicles, drawParkedVehicles, drawOtherVehicles, drawUnusableVehicles, drawActivePoliceVehicles, lookaheadEnabled, lookaheadValue).
- `cameraLookObj` (*vec3*) : Direction de regard de la caméra.
- `dpiValue` (*number|nil*) : Facteur dpi, multiplié par la globale globalDpi si elle existe.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/vehicles.lua`.*
