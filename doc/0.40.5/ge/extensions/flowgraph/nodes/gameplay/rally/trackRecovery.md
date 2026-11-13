# `flowgraph_nodes_gameplay_rally_trackRecovery`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackRecovery.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/trackRecovery")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Track Recovery » (catégorie repeat_instant, tag rally). Suit les retournements et recoveries : à chaque frame, calcule recoveryType parmi 'flip', 'recovery', 'restart' (la dernière pin active l'emporte) et appelle extensions.hook('onRallyVehicleRecovery', recoveryType). Entrées flow : flip, recovery, restart.

## Remarques

- Le hook est appelé à chaque frame, y compris avec recoveryType = nil quand aucune pin n'est active.
- La description de la pin restart est « A recovery » (copier-coller).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Détermine le type de recovery et émet le hook onRallyVehicleRecovery. | 22 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyVehicleRecovery` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackRecovery.lua`.*
