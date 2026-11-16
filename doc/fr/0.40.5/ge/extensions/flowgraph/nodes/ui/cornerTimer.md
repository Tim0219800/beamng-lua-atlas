# `flowgraph_nodes_ui_cornerTimer`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/cornerTimer.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/cornerTimer")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set UI Timer » (catégorie repeat_instant, auteur BeamNG, durée) : affiche un temps dans l'app UI chronomètre. Entrées : « value » (secondes ; si non connecté, efface), « color » (white/red/green/blue ; vide = blanc), « useGenericMissionDataApp » (utilise l'app Generic Mission Data au lieu du minuteur d'angle). Hooks utilisés : 'raceTime' et 'ScenarioResetTimer' ; ou ui_apps_genericMissionData.setData.

## Remarques

- En mode Generic Mission Data, le temps est formaté MM:SS (sans millisecondes) avec catégorie 'cornerTimer_virtual' et order 100.
- En mode ancien minuteur, 'time' est envoyé en secondes et la couleur en 'timeColor'.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit les modèles du pin color (white, red, green, blue). | 24 |
| `C:work()` | Envoie le temps à l'UI (app Generic Mission Data ou hook 'raceTime'), ou efface l'affichage si 'value' est nil. | 33 |

**Évènements UI (guihooks.trigger) :** `ScenarioResetTimer`, `raceTime`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/cornerTimer.lua`.*
