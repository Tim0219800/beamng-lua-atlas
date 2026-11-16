# `core_booster`

*Fichier : `lua/vehicle/extensions/core/booster.lua` · VM : Véhicule · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_booster` : `extensions.load (VM véhicule)("core_booster")`, puis la globale `core_booster`

Extension expérimentale de 'poussée' : simule une force sur le véhicule en plaçant des 'planètes' à masse négative très éloignées (obj:setPlanets), ce qui repousse le véhicule dans une direction donnée pendant une durée limitée. Un appel à boost(force, dt) ajoute une poussée qui dure dt secondes.

## Exemple

```lua
extensions.core_booster.boost(vec3(0, 1, 0), 2)  -- pousse pendant 2 s
```

## Remarques

- Pour chaque poussée, une planète est placée à (position du véhicule - force * 1000) avec rayon 10 et masse -1e18 ; obj:setPlanets reçoit la liste complète à chaque frame.
- BUG : dans updateGFX, `table.remove(boosts, i)` utilise une variable `i` qui n'existe pas (ipairs est écrit `_, boost`). À l'expiration d'une poussée, l'appel reçoit nil et lève une erreur Lua ; en outre la suppression pendant l'itération saute un élément.
- updateGFX affiche (print) la liste des planètes à chaque frame tant qu'il y a au moins une poussée : bruit dans le log.
- Quand la liste est vide, obj:setPlanets({}) est quand même appelé chaque frame.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_booster.boost(force, dt)` | Ajoute une poussée : la direction/force est donnée par un vecteur, dt est sa durée. | 35 |
| `core_booster.updateGFX(dtSim)` | Appelé chaque frame : met à jour les durées de vie, construit la liste des planètes et l'applique avec obj:setPlanets. *(interne)* | 9 |

### Détail des paramètres

#### `core_booster.boost(force, dt)`

Ajoute une poussée : la direction/force est donnée par un vecteur, dt est sa durée.

- `force` (*vec3|table*) : Vecteur de poussée (converti en vec3) ; il est multiplié par 1000 pour placer la planète.
- `dt` (*number*) : Durée de la poussée en secondes.

#### `core_booster.updateGFX(dtSim)`

Appelé chaque frame : met à jour les durées de vie, construit la liste des planètes et l'applique avec obj:setPlanets.

- `dtSim` (*number*) : Pas de temps de simulation en secondes.

## Appels vers le moteur (C++)

- `obj:` `getPosition`, `setPlanets`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/core/booster.lua`.*
