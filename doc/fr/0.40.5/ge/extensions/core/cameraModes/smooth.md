# `core_cameraModes_smooth`

*Fichier : `lua/ge/extensions/core/cameraModes/smooth.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/smooth")` (fichier sous extensions/ mais pas une extension classique)

Filtre de lissage de position : trois ressorts temporels (newTemporalSpring) sur x, y, z de data.res.pos. Masqué. Renvoie un constructeur.

## Remarques

- La page extraite indique init(damp, pos) mais le code définit init(spring, damp, pos). Valeurs par défaut : spring 30, damp 10.

## Classe `C`

Filtre de lissage de position.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_smooth")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(spring, damp, pos)` | Crée les ressorts ; si pos est donné, les initialise à cette position. | 8 |
| `C:update(data)` | Lisse data.res.pos axe par axe avec data.dt. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/smooth.lua`.*
