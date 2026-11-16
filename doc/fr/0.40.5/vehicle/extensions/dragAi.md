# `dragAi`

*Fichier : `lua/vehicle/extensions/dragAi.lua` · VM : Véhicule · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `dragAi` : `extensions.load (VM véhicule)("dragAi")`, puis la globale `dragAi`

Mini-IA de dragster : gaz à fond, direction proportionnelle vers un point cible, puis freinage et frein à main à l'arrivée. L'état évolue de 'ready' (gaz enclenchés, frein à main serré) à 'go' (frein à main relâché, roule vers la cible), 'stopping', 'finished'. Elle pilote le véhicule en envoyant des événements d'entrée (input.event).

## Exemple

```lua
extensions.dragAi.setTarget(vec3(0, 400, 0))
extensions.dragAi.getReady()
extensions.dragAi.go()
```

## Remarques

- États internes : nil/idle, 'ready', 'go', 'stopping', 'finished'. En 'go' la direction vaut (cos - sign(cos)) * 30 * sign(côté) (sans clamp) vers targetPosition (plan horizontal) ; passage en 'stopping' à moins de 10 m de la cible.
- En 'stopping' : frein et frein à main, gaz et direction à zéro ; 'finished' quand electrics.values.airspeed < 2 (m/s), puis frein à main maintenu.
- Si go() est appelé sans setTarget préalable, vec3(nil) provoquera une erreur.
- reset() met l'état à 'idle', coupe les gaz et serre le frein à main.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dragAi.getReady()` | Passe en état 'ready' : applique les gaz à fond. | 10 |
| `dragAi.go()` | Passe en état 'go' : relâche le frein à main, la boucle conduit vers la cible. | 14 |
| `dragAi.reset()` | Hook de reset du véhicule : état 'idle', gaz à zéro, frein à main serré. *(interne)* | 61 |
| `dragAi.setTarget(targetPos)` | Définit le point cible à atteindre. | 19 |
| `dragAi.updateGFX(dt)` | Appelé chaque frame : exécute la machine à états de conduite. *(interne)* | 23 |

### Détail des paramètres

#### `dragAi.setTarget(targetPos)`

Définit le point cible à atteindre.

- `targetPos` (*vec3*) : Position monde de la cible (x,y utilisés).

#### `dragAi.updateGFX(dt)`

Appelé chaque frame : exécute la machine à états de conduite.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/dragAi.lua`.*
