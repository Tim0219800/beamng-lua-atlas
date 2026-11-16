# `ui_cameraDistanceApp`

*Fichier : `lua/ge/extensions/ui/cameraDistanceApp.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_cameraDistanceApp` : `extensions.load("ui_cameraDistanceApp")`, puis la globale `ui_cameraDistanceApp`

Application UI de debug « distance caméra ». À chaque frame, mesure la distance entre le véhicule joueur et la caméra, la pousse à l'UI via guihooks.trigger('cameraDistance', distance) et dessine dans le monde une sphère rouge de rayon 0,5 m sur le véhicule avec l'étiquette « camera distance target ».

## Remarques

- Sans véhicule joueur, envoie cameraDistance(-1, "no vehicle") et ne dessine rien.
- Distance en mètres. Un TODO dans le code prévoit de remplacer le guihooks.trigger par un stream.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : dessine la sphère et le texte de debug sur le véhicule joueur et envoie la distance véhicule-caméra à l'UI. *(interne)* *(hook)* | 11 |

### Détail des paramètres

#### `ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : dessine la sphère et le texte de debug sur le véhicule joueur et envoie la distance véhicule-caméra à l'UI.

- `dtReal` (*number*) : Temps réel écoulé (s), inutilisé.
- `dtSim` (*number*) : Temps de simulation écoulé (s), inutilisé.
- `dtRaw` (*number*) : Temps brut écoulé (s), inutilisé.

**Évènements UI (guihooks.trigger) :** `cameraDistance`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/cameraDistanceApp.lua`.*
