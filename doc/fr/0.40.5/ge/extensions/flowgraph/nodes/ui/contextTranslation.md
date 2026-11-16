# `flowgraph_nodes_ui_contextTranslation`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/contextTranslation")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Context Translation » (catégorie repeat_instant) : crée un objet de traduction avec contexte. Entrée « translationString » (clé de traduction, pin fixe) plus des pins d'entrée personnalisés (tous types sauf flow) : chacun devient une variable de contexte. Sortie « value » (table de type translationObject) : {txt = clé, context = {nom = valeur}}. Le bouton « Load Variables » des propriétés crée un pin string par variable {{nom}} trouvée dans la traduction.

## Remarques

- La clé de traduction est résolue avec _tr() pour trouver les variables {{%a+}} (lettres uniquement).
- drawCustomProperties appelle dump('string: ...') à chaque chargement (trace de debug).
- Les pins personnalisés sont sauvegardés (savePins = true).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawCustomProperties()` | Affiche l'état de chargement des variables (icône rouge/verte/blanche) et le bouton « Load Variables » qui recrée les pins de contexte. | 51 |
| `C:init()` | Active savePins et allowCustomInPins ; crée la table de sortie réutilisée {context = {}}. | 33 |
| `C:work()` | Remplit txt et context (valeur de chaque pin personnalisé) dans la table de sortie réutilisée et l'écrit sur « value ». | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua`.*
