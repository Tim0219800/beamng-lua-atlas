# `flowgraph_nodes_gameplay_rally_registerRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/registerRace.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/registerRace")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Register Race » (catégorie once_instant, tag rally). Transmet les données de course au mode rally en déclenchant extensions.hook('onRallyRegisterRace', raceData). Entrée : raceData (table).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Émet le hook onRallyRegisterRace avec raceData. | 20 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyRegisterRace` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/registerRace.lua`.*
