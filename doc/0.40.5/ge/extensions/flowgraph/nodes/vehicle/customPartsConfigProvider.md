# `flowgraph_nodes_vehicle_customPartsConfigProvider`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua` · VM : Game Engine (GE) · 250 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/customPartsConfigProvider")` (fichier sous extensions/ mais pas une extension classique)

Nœud fournisseur « Custom Parts Config Provider » (catégorie `provider`). Permet de construire dans l'éditeur une configuration de pièces personnalisée (`partConfig = {parts, vars}`) : chargement depuis un fichier .pc, copie depuis le véhicule joueur (tout, pièces seules, variables seules) puis édition clé/valeur. Sorties : `model` (string) et `config` (table de type `vehicleConfig`), utilisables par « Spawn Vehicle ».

## Remarques

- `showKVPairs` : à la renommage d'une clé, la variable `old` n'est jamais définie (nil), donc la table n'est pas mise à jour correctement. À la suppression, `self.partConfig.vars[...]` est utilisé même pour le champ `parts`.
- Bouton « Read from File » : `partConfigFilename` reçoit `self.configPath` (peut être nil) au lieu du chemin du véhicule.
- Le nœud écrit ses sorties à chaque frame (`work`) sans notion de flux.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Appelé au chargement du projet ; restaure les réglages du nœud depuis `nodeData`. | 235 |
| `C:_onSerialize(res)` | Appelé à la sauvegarde du projet ; copie les réglages du nœud dans la table `res`. | 225 |
| `C:drawCustomProperties()` | Affichage ImGui des propriétés du nœud dans le panneau de l'éditeur ; renvoie une chaîne décrivant la modification faite, ou nil. | 44 |
| `C:drawMiddle(builder, style)` | Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel. | 214 |
| `C:init()` | Constructeur ; vide modèles/configs et crée `partConfig = {parts = {}, vars = {}}`. | 25 |
| `C:showKVPairs(name, field, tpe)` | Affiche un tableau éditable de paires clé/valeur (`field` = 'parts' avec valeurs string, ou 'vars' avec valeurs number), avec tri, ajout et suppression. | 122 |
| `C:sortKeys()` | Reconstruit `sortedKeys` (clés de `parts` et `vars` triées alphabétiquement). | 197 |
| `C:work()` | Copie `partConfig` et `model` sur les pins de sortie `config` et `model`. | 220 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua`.*
