# `flowgraph_nodes_activity_starsActive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/starsActive")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Stars Active » (catégorie repeat_instant, tags activity/mission). Chaque pin de sortie flow personnalisé (le nom du pin = clé d'étoile) laisse passer le flux si l'étoile correspondante est active pour les réglages utilisateur actuels de la mission (gameplay_missions_missionScreen.getActiveStarsForUserSettings). La liste est calculée une seule fois (coûteuse) puis mise en cache jusqu'au prochain démarrage du graphe. Sans flux d'entrée, tous les pins sont à faux.

## Remarques

- Sans activité associée, ne fait rien. Une clé absente de starInfo donne false (self.activeStars[pin.name] testé avant).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Efface le cache des étoiles actives. | 28 |
| `C:init()` | Active savePins et allowCustomOutPins. | 23 |
| `C:work()` | Calcule (une fois) starInfo puis met chaque pin de sortie flow à enabled de l'étoile correspondante. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua`.*
