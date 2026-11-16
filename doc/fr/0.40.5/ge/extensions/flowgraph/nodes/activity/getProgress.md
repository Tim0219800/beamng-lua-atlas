# `flowgraph_nodes_activity_getProgress`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/getProgress.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/getProgress")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Progress » (catégorie once_p_duration, tag activity). Lit la progression agrégée de la mission pour la clé de progression courante (saveData.progress[clé].aggregate) et la met en pins : « aggregate » (table), « aggText » (texte simple), « aggHtml » (liste HTML), et pins cachés bestType, passed, completed, attemptCount, mostRecentDate. Des pins de sortie personnalisés reçoivent le champ de l'agrégat du même nom.

## Remarques

- Sans activité associée, ne fait rien.
- Le pin « aggregate » n'est jamais renseigné par le code (pas de clé aggregate dans l'agrégat lui-même) ; utiliser aggText/aggHtml ou les pins nommés.
- Les nombres sont formatés avec %0.2d (entier sur 2 chiffres minimum).
- La description du pin mostRecentDate dit « Completed » (copier-coller).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Active savePins. | 27 |
| `C:workOnce()` | Construit aggText et aggHtml (clés triées) et copie chaque valeur de l'agrégat vers le pin de sortie du même nom. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/getProgress.lua`.*
