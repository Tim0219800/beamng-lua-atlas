# `core_cameraModes_noise`

*Fichier : `lua/ge/extensions/core/cameraModes/noise.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/noise")` (fichier sous extensions/ mais pas une extension classique)

Effet de bruit : ajoute à data.res.pos un décalage aléatoire (± factor/2 par axe) renouvelé toutes les 0,1 s. Mode masqué, pas un filtre au sens isFilter. Renvoie un constructeur.

## Classe `C`

Bruit de position de la caméra.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_noise")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(factor)` | Prépare le décalage ; chaque appel force un nouveau tirage au premier update. | 8 |
| `C:update(data)` | Ajoute le décalage courant à data.res.pos. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/noise.lua`.*
