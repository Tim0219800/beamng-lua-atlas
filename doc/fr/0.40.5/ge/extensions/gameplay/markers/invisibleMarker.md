# `gameplay_markers_invisibleMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/invisibleMarker.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/markers/invisibleMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur « nul » : implémente toute l'interface d'un marqueur de mode jeu (init, setup, update, show, hide, clearObjects, interactInPlayMode...) avec des méthodes vides, sauf setup qui mémorise le cluster. Sert de marqueur par défaut pour des POI qui n'ont aucune représentation visible ni interaction. Le module renvoie directement un constructeur : require(...)(options) renvoie l'instance.

## Remarques

- Ce module ne fournit pas de fonction cluster : il ne regroupe aucun POI.
- Toutes les méthodes sont des coquilles vides, hormis setup (self.cluster = cluster).

## Classe `C`

Marqueur sans effet, instance renvoyée par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_markers_invisibleMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Ne fait rien. | 38 |
| `C:createObjects()` | Ne fait rien. | 23 |
| `C:hide()` | Ne fait rien. | 30 |
| `C:init()` | Ne fait rien. | 8 |
| `C:instantFade(visible)` | Ne fait rien. | 42 |
| `C:interactInPlayMode(interactData, interactableElements)` | Ne fait rien : n'ajoute aucun élément interactif. | 47 |
| `C:setHidden(value)` | Ne fait rien. | 27 |
| `C:setup(cluster)` | Mémorise le cluster dans self.cluster. | 18 |
| `C:show()` | Ne fait rien. | 33 |
| `C:update(data)` | Ne fait rien (appelée chaque frame par le gestionnaire de marqueurs). | 13 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/invisibleMarker.lua`.*
