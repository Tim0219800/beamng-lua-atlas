# `gameplay_rally_test_testRouteFix`

*Fichier : `lua/ge/extensions/gameplay/rally/test/testRouteFix.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_test_testRouteFix` : `extensions.load("gameplay_rally_test_testRouteFix")`, puis la globale `gameplay_rally_test_testRouteFix`

Extension de test de développement pour le module gameplay/route/route : au chargement, elle crée une Route avec un petit chemin de 3 points codés en dur, puis à chaque frame dessine le chemin (sphères, prismes, numéros) via debugDrawer et fait suivre le véhicule joueur par route:trackVehicle. Se charge avec extensions.load('gameplay_rally_test_testRouteFix'). Sans intérêt en jeu normal.

## Remarques

- Les coordonnées du chemin sont fixes (monde de test) ; les fonctions drawMousePos et drawPath existent mais leur appel est commenté dans onUpdate.
- Le commentaire d'en-tête du fichier mentionne « extension name: gameplay_rally », ce qui ne correspond pas au nom réel de l'extension.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_test_testRouteFix.onExtensionLoaded()` | Hook appelé au chargement de l'extension : crée la Route et appelle setupPathMulti sur le chemin de test. *(interne)* *(hook)* | 72 |
| `gameplay_rally_test_testRouteFix.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; corps vide. *(interne)* *(hook)* | 77 |
| `gameplay_rally_test_testRouteFix.onUpdate()` | Hook appelé à chaque frame : dessine la route et appelle route:trackVehicle sur le véhicule joueur 0 s'il existe. *(interne)* *(hook)* | 56 |
| `gameplay_rally_test_testRouteFix.onVehicleResetted()` | Hook appelé quand un véhicule est remis en place ; corps vide. *(interne)* *(hook)* | 69 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/test/testRouteFix.lua`.*
