# `core_cameraModes_crash`

*Fichier : `lua/ge/extensions/core/cameraModes/crash.lua` · VM : Game Engine (GE) · 117 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/crash")` (fichier sous extensions/ mais pas une extension classique)

Caméra de rediffusion d'accident (masquée). Selon camMode : 1 = caméra proche au-dessus du point d'impact (hitPoint + camOffset, fov 50) ; 2 = caméra fixe au sol à environ 10-20 m du point d'impact (fov aléatoire 20-25). Si veh2Id est fourni et que le conducteur du second véhicule regarde le premier, démarre en vue cockpit (fov 40) jusqu'à ce que les boîtes englobantes se touchent. Renvoie un constructeur.

## Remarques

- update ne vérifie pas que veh1Id existe (erreur Lua si le véhicule disparaît).

## Classe `C`

Caméra de crash. Champs : camMode, veh1Id, veh2Id, hitPoint, camOffset, camPos, fov, cockpitView.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_crash")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | camMode = 1, hidden = true, cockpitView = false. | 8 |
| `C:setCustomData(data)` | Configure la prise de vue (appelé lors du choix de la caméra globale). | 43 |
| `C:update(data)` | Écrit data.res.pos / rot / fov selon le mode. | 73 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/crash.lua`.*
