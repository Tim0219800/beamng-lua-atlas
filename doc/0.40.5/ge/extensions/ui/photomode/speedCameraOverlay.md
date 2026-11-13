# `ui_photomode_speedCameraOverlay`

*Fichier : `lua/ge/extensions/ui/photomode/speedCameraOverlay.lua` · VM : Game Engine (GE) · 153 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_speedCameraOverlay` : `extensions.load("ui_photomode_speedCameraOverlay")`, puis la globale `ui_photomode_speedCameraOverlay`

Fournit les données affichées par la surcouche « radar / caméra de vitesse » du mode photo : carte courante, nom du lieu, heure du niveau, plaque d'immatriculation du véhicule joueur, limitation de vitesse de la route la plus proche et position. Tout est lu en lecture seule avec des accès protégés (pcall) : aucune valeur n'est modifiée.

## Exemple

```lua
local d = ui_photomode_speedCameraOverlay.getData()
print(d.mapName, d.locationName, d.speedLimit, d.licensePlate)
```

## Remarques

- La position vient du véhicule joueur 0, sinon de la caméra (core_camera.getPosition ou getPositionXYZ).
- La limitation vient du graphe de routes (map.findClosestRoad dans un rayon de 120 m) ; elle vaut nil si <= 0, infinie ou > 200 (unité de l'arête du graphe, m/s d'après le code du graphe de routes — non vérifié ici).
- Les textes (titre du niveau, nom de zone) passent par _tr s'il existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_speedCameraOverlay.getData()` | Construit la table de données de la surcouche. Les chaînes absentes valent "", levelTime vaut {} si l'heure est indisponible, roadDistance/speedLimit/position valent nil si inconnus. | 129 |

### Détail des paramètres

#### `ui_photomode_speedCameraOverlay.getData()`

Construit la table de données de la surcouche. Les chaînes absentes valent "", levelTime vaut {} si l'heure est indisponible, roadDistance/speedLimit/position valent nil si inconnus.

- **renvoie** : table {mapId=string, mapName=string, locationName=string (zone de gameplay_city de plus haute priorité, sinon mapName), levelTime={time,year,month,day} issu de core_environment.getTimeOfDay, licensePlate=string, roadDistance=number|nil (distance à la route la plus proche), speedLimit=number|nil, position={x,y,z}|nil}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/speedCameraOverlay.lua`.*
