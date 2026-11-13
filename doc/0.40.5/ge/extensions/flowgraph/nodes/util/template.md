# `flowgraph_nodes_util_template`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/template.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/template")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Template Node » : exemple documenté de tout ce qu'un programmeur peut utiliser pour créer un nœud flowgraph. Montre les catégories possibles (repeat_instant, repeat_p_duration, repeat_f_duration, once_instant, once_p_duration, once_f_duration, dynamic_*, simple, provider, logic), tous les types de pins (flow, number, bool, string, vec3, quat, color, table, any, multi-type), les options de pin (default, hidden, hardcoded, tableType), C.todo, C.dependencies, C.color, C.type, C.tags et les fonctions de cycle de vie. Chaque fonction se contente d'afficher un message avec print. Utile comme modèle pour un moddeur.

## Remarques

- Dans _onDeserialized, myField reste nil si l'ancien enregistrement n'avait pas ce champ, ce qui ferait échouer im.ArrayChar dans drawCustomProperties.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage du projet, avant tout work. | 121 |
| `C:_executionStopped()` | Appelé à l'arrêt du projet. | 130 |
| `C:_onClear()` | Appelé quand le nœud doit être nettoyé (avant sérialisation, avant démarrage...) ; par défaut appelle _executionStopped. | 135 |
| `C:_onDeserialized(data)` | Restaure les champs personnalisés (self.data est restauré automatiquement). | 189 |
| `C:_onSerialize(res)` | Sauvegarde les champs personnalisés dans res (self.data est sauvegardé automatiquement). | 182 |
| `C:destroy()` | Appelé quand le nœud est supprimé. | 195 |
| `C:drawCustomProperties()` | Code imgui affiché dans la fenêtre de propriétés (champ texte et curseur) ; renvoyer une chaîne crée un point d'historique (annuler/rétablir). | 148 |
| `C:drawMiddle(builder, style)` | Code imgui affiché dans le nœud ; doit commencer par builder:Middle(). | 166 |
| `C:hideProperties()` | Appelé quand les propriétés ne sont plus affichées. | 160 |
| `C:init(mgr)` | Appelé à la première création du nœud ; initialise myField, la table data et le curseur sliderWidth. | 109 |
| `C:showProperties()` | Appelé quand les propriétés du nœud sont affichées. | 141 |
| `C:work()` | Appelé quand le nœud doit exécuter sa fonction. | 125 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/template.lua`.*
