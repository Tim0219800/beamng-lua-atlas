# `flowgraph_nodes_gameplay_rally_fireRallyEvent`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Fire Rally Event » (catégorie once_instant, tag rally). Déclenche un évènement rally : appelle extensions.hook('on' .. eventType, {show = show}) et guihooks.trigger(eventType, {show = show}). Entrées : eventType (string, nom de l'évènement sans le préfixe « on ») et show (bool, défaut true, afficher l'UI correspondante).

## Remarques

- Si eventType est nil, la concaténation 'on'..nil provoque une erreur Lua.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle le hook d'extension et le guihook correspondant à eventType avec {show = …}. | 20 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `on`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent.lua`.*
