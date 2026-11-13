# `flowgraph_nodes_debug_log`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/log.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/log")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Log » (catégorie dynamic_instant, tags util/print). Écrit la valeur reçue dans la console du jeu (log) et dans le journal d'évènements du graphe (mgr:logEvent). Entrées : value (any ; les tables sont converties par dumps), logTag (string, défaut « Node #<id> »), logType (I Info, D Debug, W Warning, E Error ; défaut I). En mode dynamique 'repeat', le message est écrit à chaque frame.

## Exemple

```lua
-- le nœud équivaut à : log('I', 'Node #12', msg)
```

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:createLogEntry()` | Convertit la valeur en texte (dumps pour une table), appelle log(type, tag, msg) et mgr:logEvent. | 49 |
| `C:drawMiddle(builder, style)` | Éditeur : affiche ('type','tag',...). | 58 |
| `C:postInit()` | Prépare les modèles du pin logType, masque logType et logTag, et fixe le tag par défaut « Node #id ». | 25 |
| `C:work()` | Si dynamicMode vaut 'repeat', écrit une entrée de log. | 43 |
| `C:workOnce()` | Écrit une entrée de log. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/log.lua`.*
