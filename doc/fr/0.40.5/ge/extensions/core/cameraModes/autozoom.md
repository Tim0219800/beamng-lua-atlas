# `core_cameraModes_autozoom`

*Fichier : `lua/ge/extensions/core/cameraModes/autozoom.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/autozoom")` (fichier sous extensions/ mais pas une extension classique)

Filtre de caméra (isFilter = true, hidden = true) : règle automatiquement le champ de vision selon la distance entre la caméra et sa cible, par paliers discrets (comme un zoom manuel par à-coups), avec lissage vers le palier. Ce n'est pas une caméra sélectionnable : il est instancié par d'autres modes (ex. cameraModes/external.lua avec ses propres paliers et son lisseur) qui appellent autozoom:update(data) à chaque frame. Le zoom manuel de l'utilisateur (entrées zoomIn/zoomOut de MoveManager, touches pavé numérique 9/3) s'ajoute au palier. Le module renvoie un constructeur : require('core/cameraModes/autozoom')(options).

## Exemple

```lua
local autozoom = require('core/cameraModes/autozoom')
local az = autozoom()
az:init(newTemporalSpring(15, 10))   -- facultatif : autre lisseur
az.steps = { {0, 60}, {3, 40}, {50, 15} } -- {distance en m, FOV en degrés}
-- chaque frame : az:update(data)  -> écrit data.res.fov
```

## Remarques

- L'index automatique abrège les signatures : les vraies sont init(smoother), getFov(distance, dt), reset() et update(data).
- Paliers par défaut (distance m -> FOV deg) : 0->120, 1.5->100, 3->70, 8->50, 20->20, 50->10, 125->4, 200->2. Le palier retenu est le dernier dont la distance est <= distance courante.
- Le delta utilisateur est limité de façon que le FOV final reste entre 2 et 100 degrés (avec une marge de tolérance de +20/-1).
- mustReset est vrai au départ : le premier appel de getFov fixe le FOV sans lissage. Il faut le remettre à true (ex. external le fait lors d'un reset) pour éviter un saut visible.
- Le lisseur peut avoir getUncapped (utilisé de préférence) ou get ; il doit exposer set(valeur).
- Incohérence : baseFov est initialisé à `self.fov or 90`, mais self.fov vaut déjà 60 juste avant, donc la valeur de repli 90 n'est jamais utilisée.

## Classe `C`

Objet filtre renvoyé par le constructeur. Champs : steps, fov, baseFov, userFov, mustReset, fovSmoother, smooth.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_autozoom")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getFov(distance, dt)` | Calcule le FOV pour une distance : choisit le palier, ajoute la correction manuelle de l'utilisateur (2.5 * dt * (zoomIn - zoomOut) * FOV actuel, limitée) puis lisse vers la cible (instantané si mustReset). | 37 |
| `C:init(smoother)` | Initialise (ou réinitialise) le filtre : choisit le lisseur de FOV (par défaut newTemporalSpring(30, 10)), remet mustReset, fov=60, userFov=0 et les paliers par défaut. Peut être rappelé pour changer de lisseur. | 8 |
| `C:reset()` | Annule le zoom manuel de l'utilisateur (userFov = 0), touches pavé numérique 9/3. | 65 |
| `C:update(data)` | Calcule la distance entre data.res.targetPos et data.res.pos et écrit data.res.fov. Appelé par la caméra propriétaire. | 68 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/autozoom.lua`.*
