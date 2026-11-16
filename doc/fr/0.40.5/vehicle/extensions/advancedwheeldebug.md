# `advancedwheeldebug`

*Fichier : `lua/vehicle/extensions/advancedwheeldebug.lua` · VM : Véhicule · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `advancedwheeldebug` : `extensions.load (VM véhicule)("advancedwheeldebug")`, puis la globale `advancedwheeldebug`

Extension de débogage qui calcule pour chaque roue les angles de carrossage (camber), de pincement (toe), de chasse (caster), d'inclinaison de pivot (SAI) et la pression de la roue, par rapport à la surface sous le véhicule, et les envoie à l'UI via gui.send('advancedWheelDebugData'). Actif seulement si au moins un 'utilisateur de debug' l'a activé par registerDebugUser.

## Exemple

```lua
extensions.advancedwheeldebug.registerDebugUser('monOutil', true)  -- active
extensions.advancedwheeldebug.registerDebugUser('monOutil', false) -- désactive
```

## Remarques

- Format de l'envoi : liste de {name, caster?, sai?, camber, toe, pressure}. Angles en degrés ; pressure en psi (Pa * 0.000145038), 0 si la roue n'a pas de groupe de pression.
- caster et sai ne sont fournis que si la roue a steerAxisUp et steerAxisDown. Les valeurs NaN/inf de toe et camber sont remplacées par 0.
- Le plan de référence est calculé en moyennant la normale de surface (mapmgr.surfaceNormalBelow) sous chaque roue ayant un lastTreadContactNode ; si aucune roue ne touche le sol, la division par count = 0 produit des valeurs non finies.
- N'envoie à l'UI que si le premier joueur est assis (playerInfo.firstPlayerSeated).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `advancedwheeldebug.onInit()` | Hook appelé à l'initialisation de l'extension : efface les utilisateurs de debug et désactive le calcul. *(interne)* *(hook)* | 12 |
| `advancedwheeldebug.registerDebugUser(user, value)` | Enregistre ou retire un demandeur du debug ; le calcul est actif tant qu'au moins une valeur est vraie. | 17 |
| `advancedwheeldebug.updateGFX(dt)` | Appelé chaque frame : calcule et envoie les données de roue si le debug est actif. *(interne)* | 26 |

### Détail des paramètres

#### `advancedwheeldebug.registerDebugUser(user, value)`

Enregistre ou retire un demandeur du debug ; le calcul est actif tant qu'au moins une valeur est vraie.

- `user` (*string*) : Identifiant du demandeur.
- `value` (*boolean*) : true pour demander l'affichage, false pour le retirer.

#### `advancedwheeldebug.updateGFX(dt)`

Appelé chaque frame : calcule et envoie les données de roue si le debug est actif.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorRight`, `getGroupPressure`, `getNodePosition`, `getPosition`, `nodeVecCos`, `nodeVecPlanarCos`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/advancedwheeldebug.lua`.*
