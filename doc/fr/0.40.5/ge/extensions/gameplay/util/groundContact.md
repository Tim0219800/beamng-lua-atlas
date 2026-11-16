# `gameplay_util_groundContact`

*Fichier : `lua/ge/extensions/gameplay/util/groundContact.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_groundContact` : `extensions.load("gameplay_util_groundContact")`, puis la globale `gameplay_util_groundContact`

Utilitaire minimal pour savoir si un véhicule repose sur ses roues. Il lance un rayon statique vers le bas depuis le bas de la boîte englobante du véhicule (relevé de 0,3 m) et compare la distance au sol à un seuil de 1,1 m.

## Remarques

- Le rayon mesure 1,5 m de long ; la méthode ne regarde pas l'orientation du véhicule, seulement la présence de sol sous le centre de la boîte : un véhicule renversé mais proche du sol peut donc être jugé « sur ses roues ».
- Si le rayon ne touche rien, castRayStatic renvoie une distance supérieure ou égale à la longueur du rayon, donc la fonction renvoie false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_groundContact.isOnWheels(vehId)` | Teste la proximité du sol sous le centre du véhicule par un rayon statique vers le bas. | 20 |

### Détail des paramètres

#### `gameplay_util_groundContact.isOnWheels(vehId)`

Teste la proximité du sol sous le centre du véhicule par un rayon statique vers le bas.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean true si le sol est à 1,1 m ou moins ; false si le véhicule est absent de map.objects.

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/groundContact.lua`.*
