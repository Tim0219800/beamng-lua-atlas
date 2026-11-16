# `core_cameraModes_autopoint`

*Fichier : `lua/ge/extensions/core/cameraModes/autopoint.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/autopoint")` (fichier sous extensions/ mais pas une extension classique)

Filtre de caméra (isFilter = true, hidden = true) : fait viser la caméra vers un point décalé du véhicule, exprimé en coordonnées locales du véhicule (localOffset), avec un lissage par ressort. Ce n'est PAS une caméra sélectionnable : camera.lua charge le fichier comme tout mode mais initCam ignore les filtres. Il est instancié par d'autres modes (ex. cameraModes/external.lua : self.autopoint = autopoint(), puis autopoint:update(data) à chaque frame). Le module renvoie un constructeur : require('core/cameraModes/autopoint')(options) qui crée l'objet C avec les options données comme valeurs initiales.

## Exemple

```lua
local autopoint = require('core/cameraModes/autopoint')
local ap = autopoint()
ap:setRefNodes(ref, left, back)
ap.localOffset = vec3(0, 0, 1)  -- viser 1 m au-dessus du point de référence
ap:setSpring(5, 1)
-- chaque frame : ap:update(data)
```

## Remarques

- L'index automatique donne des signatures abrégées (setRefNodes(leftNodeID, backNodeID), setSpring(accel), update()) : les vraies signatures sont setRefNodes(centerNodeID, leftNodeID, backNodeID), setSpring(rate, accel) et update(data).
- update modifie data.res.targetPos (ajoute le décalage lissé converti dans la base du véhicule) puis fixe data.res.rot pour regarder de data.res.pos vers targetPos. Il suppose data.res.pos et data.res.targetPos déjà remplis par la caméra appelante, et utilise data.veh:getNodePosition (positions locales au véhicule).
- La base locale est construite à partir des noeuds de référence : x = (gauche - ref), y = (arrière - ref), z = x cross y (le décalage y est donc positif vers l'arrière du véhicule, selon la convention du code).

## Classe `C`

Objet filtre renvoyé par le constructeur. Champs : isFilter, hidden, localOffset (vec3), refNodes {ref,left,back}, smX/smY/smZ (lisseurs).

Le module renvoie un constructeur : `local obj = require("core_cameraModes_autopoint")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise le filtre : isFilter et hidden à true, localOffset à (0,0,0) et ressort par défaut (rate 5, accel 1). Appelé par le constructeur. | 8 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Mémorise les noeuds de référence du véhicule utilisés pour construire la base locale. | 21 |
| `C:setSpring(rate, accel)` | Crée ou recrée les trois lisseurs temporels sigmoïdes (X, Y, Z) en conservant leur valeur courante. | 15 |
| `C:update(data)` | Applique le décalage lissé à data.res.targetPos et oriente data.res.rot vers lui. Appelé par la caméra qui possède ce filtre. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/autopoint.lua`.*
