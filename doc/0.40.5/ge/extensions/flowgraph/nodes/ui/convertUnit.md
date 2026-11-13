# `flowgraph_nodes_ui_convertUnit`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/convertUnit.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/convertUnit")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « ConvertUnit » (catégorie repeat_instant) : convertit une valeur en SI vers l'unité préférée du joueur (réglage de l'UI) avec translateDistance ou translateVelocity. Entrées : « value », « velocity » (vitesse au lieu de distance), « big » (grande unité : km, mi, h), « format » (défaut '%0.2f%s'). Sorties : « value » (nombre converti), « unit » (chaîne) et « full » (valeur+unité formatées, calculée seulement si le pin est utilisé).

## Remarques

- Le pin d'entrée et le pin de sortie s'appellent tous deux « value » (directions différentes).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Convertit pinIn.value et écrit value, unit et (si le pin est connecté) full via string.format. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/convertUnit.lua`.*
