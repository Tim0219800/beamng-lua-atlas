# `core_cameraModes_shake`

*Fichier : `lua/ge/extensions/core/cameraModes/shake.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/shake")` (fichier sous extensions/ mais pas une extension classique)

Filtre de tremblement lent : ajoute à la position (amplitudes 0.08/0.05/0.03 m) et à la rotation (10 degrés par mètre de décalage) des oscillations sinusoïdales de fréquences 0.05/0.04/0.03 Hz avec décalages de phase aléatoires. Masqué. Renvoie un constructeur.

## Classe `C`

Filtre de tremblement. Champs : amp (vec3), freq (vec3), timeOffset (vec3), time.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_shake")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise amplitudes, fréquences et phases aléatoires. | 8 |
| `C:update(data)` | Applique le décalage de position et la rotation à data.res. | 17 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/shake.lua`.*
