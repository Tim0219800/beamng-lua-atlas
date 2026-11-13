# `flowgraph_nodes_scene_customLuaCommand`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/customLuaCommand")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Custom Lua Command » (once_instant). Compile avec loadstring le code Lua recu dans le pin func puis l'execute avec pcall. Sorties : flow (true si l'appel a reussi), return (any) valeur renvoyee par la fonction. Utile pour appeler du code arbitraire depuis un graphe.

## Remarques

- Si le texte ne compile pas, loadstring renvoie nil et pcall(nil) echoue : flow sera false, return contiendra le message d'erreur.
- Seule la premiere valeur de retour est conservee.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet le pin return a nil au demarrage du graphe. | 25 |
| `C:_onDeserialized(data)` | Compatibilite : convertit l'ancien data.func en pin code en dur 'func' de type string. | 38 |
| `C:init()` | Desactive le vidage des pins de sortie au demarrage (clearOutPinsOnStart = false). | 21 |
| `C:workOnce()` | Compile et execute le texte du pin func ; ecrit flow = succes du pcall et return = valeur retournee. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua`.*
