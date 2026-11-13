# `core_cameraModes_collision`

*Fichier : `lua/ge/extensions/core/cameraModes/collision.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/collision")` (fichier sous extensions/ mais pas une extension classique)

Filtre anti-traversée des décors : lance des rayons statiques (castRayStatic) depuis la cible vers les quatre coins du plan proche de la caméra et rapproche la caméra de la cible si un mur gêne (distance minimale 0.5 m). En l'absence d'obstacle, un seul coin est testé par image (tour de rôle) ; au premier contact, les quatre le sont à chaque image jusqu'à une image libre. Actif seulement si le réglage 'cameraCollision' est vrai. Renvoie un constructeur.

## Remarques

- État par instance (chaque vue/split-screen a son filtre). Marge de sécurité 0.1 m ; plan proche supposé 0.4 x 0.2 m. Le lissage n'agit que quand la caméra s'éloigne (retour progressif) ; le rapprochement est immédiat.
- La page extraite indique isObstacleInFrontOfCam(cornerIdx) mais le code prend (rayDestinations, cornerIdx).

## Classe `C`

Filtre de collision de caméra.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_collision")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:collidingCamDistance()` | Distance cible -> caméra imposée par la collision. | 142 |
| `C:init()` | Réinitialise l'état (distances, indice de rayon, lissage) et lit le réglage cameraCollision. | 18 |
| `C:isObstacleInFrontOfCam(rayDestinations, cornerIdx)` | Détecte une géométrie que les rayons de coin ne voient pas : traversée complète d'un mur en une image, ou arête du plan proche qui coupe une surface. | 36 |
| `C:onSettingsChanged()` | Hook : relit le réglage 'cameraCollision' (true par défaut). | 30 |
| `C:onVehicleSwitched()` | Hook : réinitialise le filtre (appelle init). | 138 |
| `C:update(data)` | Calcule la nouvelle position de caméra sur l'axe cible -> caméra et écrit data.res.pos. | 54 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/collision.lua`.*
