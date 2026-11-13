# `flowgraph_nodes_gameplay_rally_finish`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/finish.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/finish")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Finish » (catégorie once_instant, tag rally, sans pin). Quand il reçoit du flux, déclenche une fois le hook extensions.hook('onRallyStageFlyingFinish') signalant que le véhicule a franchi l'arrivée lancée de la spéciale.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle extensions.hook('onRallyStageFlyingFinish'). | 18 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyStageFlyingFinish`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/finish.lua`.*
