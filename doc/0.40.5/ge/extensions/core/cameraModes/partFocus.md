# `core_cameraModes_partFocus`

*Fichier : `lua/ge/extensions/core/cameraModes/partFocus.lua` · VM : Game Engine (GE) · 192 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/partFocus")` (fichier sous extensions/ mais pas une extension classique)

Caméra qui cadre une pièce du véhicule quand le menu des pièces la met en évidence. Masquée (absente du cycle de caméras) : core_vehicle_partFocusCamera l'active et la désactive lui-même, et lui pousse le point visé (setRef) et la distance (setDefaultDistance). Le décalage par rapport au véhicule est lissé (le mouvement du véhicule est suivi exactement, seul le changement de pièce glisse). Orbite et zoom à la souris/clavier. update renvoie false quand le pilote n'est plus actif, ce qui fait retomber sur la caméra du véhicule. Renvoie un constructeur.

## Remarques

- Valeurs : lacet 135 degrés, tangage -14, FOV 35, distance de 0.6 à 80 m (4 par défaut), easeRate 3. Le zoom est proportionnel à la distance courante (0.007 par ms de pression, 0.12 par cran de molette).
- collisionCompatible = false (le point d'intérêt est souvent dans le véhicule). dt est plafonné à 0.1 s.
- La page extraite indique retarget(duration, brisk) ; le code est retarget(snap, duration, brisk).

## Classe `C`

Mode de cadrage de pièce. Champs : camRot, targetPos, currentPos, targetDistance, currentDistance, fov, transitionElapsed/Duration, hopDistance.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_partFocus")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Valeurs par défaut (voir notes). | 21 |
| `C:reset()` | Oublie le décalage et la distance courants (prochain update : saut) et remet l'orbite par défaut. | 83 |
| `C:retarget(snap, duration, brisk)` | Prépare le passage à la pièce suivante : snap saute directement (quand la transition de caméra globale fait le fondu) ; sinon la vue glisse depuis sa position actuelle pendant duration, avec un départ plus rapide si brisk. Pendant le glissement la caméra recule en proportion de la distance parcourue (jusqu'à 6 m). | 53 |
| `C:setDefaultDistance(d)` | Définit la distance cible, bornée à [0.6, 80] m. | 77 |
| `C:setRef(pos)` | Définit le point visé ; si la pièce s'est déplacée de plus de 5 m d'un coup hors glissement (reset/téléportation du véhicule), la vue saute dessus. | 66 |
| `C:update(data)` | Appelle extensions.core_vehicle_partFocusCamera.updateTarget(dt, self), lisse la position, gère orbite/zoom et écrit data.res.pos/rot/fov. | 90 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/partFocus.lua`.*
