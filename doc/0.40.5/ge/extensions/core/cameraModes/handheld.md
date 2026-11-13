# `core_cameraModes_handheld`

*Fichier : `lua/ge/extensions/core/cameraModes/handheld.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/handheld")` (fichier sous extensions/ mais pas une extension classique)

Filtre de caméra « à l'épaule » : la direction de visée suit la cible via un ressort amorti et l'horizon se penche légèrement selon la force (effet caméra portée à la main). Module masqué (isFilter, hidden). Renvoie un constructeur.

## Remarques

- La page extraite indique init(damping, rotspring) mais le code définit init(spring, damping, rotspring).
- Valeurs par défaut : k = 20, damping = 5, rotk = 3. Avec une session OpenXR, l'axe haut reste (0,0,1).

## Classe `C`

Filtre à ressort sur la direction de visée.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_handheld")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(spring, damping, rotspring)` | Initialise les paramètres du ressort et force une réinitialisation de la direction au prochain update. | 8 |
| `C:update(data)` | Calcule data.res.rot depuis la direction lissée de data.res.pos vers data.res.targetPos. | 18 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/handheld.lua`.*
