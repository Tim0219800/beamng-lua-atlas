# `core_cameraModes_topDown`

*Fichier : `lua/ge/extensions/core/cameraModes/topDown.lua` · VM : Game Engine (GE) · 133 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/topDown")` (fichier sous extensions/ mais pas une extension classique)

Caméra vue de dessus (désactivée par défaut), présentée dans le code comme « un exemple de mode de caméra personnalisé ». Suit le véhicule d'en haut avec une anticipation vers la direction réelle de déplacement (jusqu'à 10 m), lisse la position et le cap. Options : alignToCar (le haut de l'écran suit le cap du véhicule au lieu du nord +Y), tilt (0 à 80 degrés par rapport à la verticale ; 45 + ortho = isométrique), ortho (projection orthographique, data.res.ortho). Distance de la caméra = 50 + 0.9 * vitesse lissée. FOV par défaut 20. Renvoie un constructeur.

## Remarques

- Un mode minimal à copier pour créer sa caméra : update doit remplir data.res.pos (vec3), data.res.rot (quat), data.res.fov, et peut remplir targetPos ; renvoyer true.
- init appelle `C:onVehicleCameraConfigChanged()` (avec la classe C, pas self) : le FOV par défaut est donc écrit dans la classe C et pas sur l'instance, ce qui fonctionne seulement parce que self.fov retombe sur C.fov par métatable (déduit du code).

## Classe `C`

Mode vue de dessus. Champs : alignToCar, tilt, ortho, fov, refNodes.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_topDown")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deserialize(s)` | Restaure l'état de serialize. | 99 |
| `C:init()` | Crée les lisseurs et valeurs par défaut. | 10 |
| `C:listParams()` | Réglages UI : align, tilt (0-80), ortho, fov (10-140). | 109 |
| `C:onVehicleCameraConfigChanged()` | Hook : FOV par défaut à 20. | 28 |
| `C:serialize()` | État pour les vues flux vidéo : alignToCar, fov, tilt, ortho. | 95 |
| `C:setParam(key, value)` | Modifie align, tilt, ortho ou fov. | 118 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Définit les nœuds de référence du véhicule (utilisés pour alignToCar). | 86 |
| `C:update(data)` | Calcule la pose d'après la vitesse et le cap, écrit data.res (pos, rot, fov, targetPos, ortho). | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/topDown.lua`.*
