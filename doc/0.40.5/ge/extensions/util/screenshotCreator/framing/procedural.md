# `util_screenshotCreator_framing_procedural`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framing/procedural.lua` · VM : Game Engine (GE) · 539 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framing_procedural` : `extensions.load("util_screenshotCreator_framing_procedural")`, puis la globale `util_screenshotCreator_framing_procedural`

Mode de cadrage « Procedural » (mode par défaut) du créateur de captures. À partir des nœuds du véhicule, il calcule la caméra qui fait tenir le véhicule dans l'image avec des marges données : les nœuds désactivés par le module nodeOutpaint sont ignorés, ceux sous le sol et les rétroviseurs automatiques sont traités à part, puis une recherche par dichotomie trouve la distance minimale le long d'un rail de caméra. S'il n'y a aucune solution, une position de repli et une rotation optimisée sont utilisées. S'enregistre via le hook onScreenshotCreatorCollectFramingModes (id « procedural », ordre 100).

## Exemple

```lua
local res, err = util_screenshotCreator_framing_procedural.resolve({vehicle = veh, resolution = {1280, 720}, fov = 20, useFramingMargins = true})
if not res then log('E', 'framing', err) end
```

## Remarques

- Valeurs par défaut : fov 20°, nearPlane 0,1, résolution {500, 281}, hauteur de caméra 1,6 m au-dessus du sol, décalage de l'axe de 0,10 m vers le bas.
- Erreurs renvoyées : résolution non positive, fov hors de ]0,180[, nearPlane négatif ou aspectRatio non positif, aucun point de cadrage au-dessus du sol.
- Marges nulles sauf si context.useFramingMargins (ou useMargins) vaut true ; alors context.margin ou settings.getFramingMargin(resolution) est utilisé. Les rétroviseurs ont une marge fixe de 2 pixels.
- Un selfCheck() (assertions) est exécuté une seule fois au premier resolve ; une assertion échouée lèverait une erreur Lua.

**Dépendances (chargées avant) :** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framing_procedural.frame(context)` | Alias de resolve (même fonction). | 438 |
| `util_screenshotCreator_framing_procedural.getVehicleFramingData(context)` | Prépare les données de cadrage : classe les nœuds du véhicule (activés, désactivés, sous le sol, rétroviseurs), calcule la boîte englobante, le point visé, le rail de caméra et les points d'extrémité servant au cadrage et à la rotation. Se replie sur les coins de la boîte du véhicule si aucun nœud n'est activé. | 135 |
| `util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes)` | Hook appelé par framingManager lors de la collecte des modes. Ajoute {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}. *(interne)* *(hook)* | 522 |
| `util_screenshotCreator_framing_procedural.resolve(context)` | Calcule la caméra de cadrage procédural pour context.vehicle. Renvoie {pos, rot, name = "procedural camera", debugData, framingData}, ou nil et un message d'erreur. | 438 |
| `util_screenshotCreator_framing_procedural.selfCheck()` | Test interne par assertions sur la sélection des nœuds de rotation (nœuds sous le sol et rétroviseurs conservés, nœuds désactivés exclus, repli sur les points de secours). Renvoie true. *(interne)* | 107 |

### Détail des paramètres

#### `util_screenshotCreator_framing_procedural.frame(context)`

Alias de resolve (même fonction).

- `context` (*table*) : Voir resolve.
- **renvoie** : table|nil Voir resolve.
- **renvoie** : string|nil Message d'erreur.

#### `util_screenshotCreator_framing_procedural.getVehicleFramingData(context)`

Prépare les données de cadrage : classe les nœuds du véhicule (activés, désactivés, sous le sol, rétroviseurs), calcule la boîte englobante, le point visé, le rail de caméra et les points d'extrémité servant au cadrage et à la rotation. Se replie sur les coins de la boîte du véhicule si aucun nœud n'est activé.

- `context` (*table*) : Même contexte que resolve (vehicle, configName, cameraHeight, cameraAxisDownOffset).
- **renvoie** : table|nil framingData.
- **renvoie** : string|nil « No above-ground framing points » si rien n'est exploitable.

#### `util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes)`

Hook appelé par framingManager lors de la collecte des modes. Ajoute {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}.

- `modes` (*table[]*) : Liste à compléter.

#### `util_screenshotCreator_framing_procedural.resolve(context)`

Calcule la caméra de cadrage procédural pour context.vehicle. Renvoie {pos, rot, name = "procedural camera", debugData, framingData}, ou nil et un message d'erreur.

- `context` (*table*) : vehicle (obligatoire), resolution, fov/fieldOfView, nearPlane, aspectRatio, fixedRotation (quat), configName, cameraHeight, cameraAxisDownOffset, useFramingMargins/useMargins, margin ({left,right,top,bottom}).
- **renvoie** : table|nil Résultat de cadrage (pos: vec3, rot: quat, name, debugData, framingData).
- **renvoie** : string|nil Message d'erreur.

#### `util_screenshotCreator_framing_procedural.selfCheck()`

Test interne par assertions sur la sélection des nœuds de rotation (nœuds sous le sol et rétroviseurs conservés, nœuds désactivés exclus, repli sur les points de secours). Renvoie true.

- **renvoie** : boolean Toujours true (sinon une assertion échoue).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : thumbnailConfig, nodeOutpaint, settings, vehicleSetup (préfixe util_screenshotCreator_). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framing/procedural.lua`.*
