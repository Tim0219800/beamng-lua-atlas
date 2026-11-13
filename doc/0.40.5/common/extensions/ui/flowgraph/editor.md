# `ui_flowgraph_editor`

*Fichier : `lua/common/extensions/ui/flowgraph/editor.lua` · VM : Commun (GE + véhicule) · 966 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_flowgraph_editor` : `extensions.load("ui_flowgraph_editor")`, puis la globale `ui_flowgraph_editor`

Aide d'interface pour l'éditeur de flowgraph (ui_flowgraph_editor). Elle intègre l'API du moteur de nœuds (editor_api_luaintf), définit les couleurs/icônes des catégories de nœuds et des types de pins, les styles des types de graphes (state, graph, macro, instance), des utilitaires d'affichage de valeurs, un éditeur de variables, un sélecteur de véhicule et des tests sur les catégories de comportement des nœuds. Utile à un moddeur qui écrit un nœud ou un outil ImGui flowgraph personnalisé.

## Remarques

- types[type].icon est rempli avec typeIcons[type] or M.IconType_Circle ; M.IconType_Circle vient de fge.enum, mais l'accès getTypeIcon() renvoie un nom d'icône (string) ou M.detaultIconType (« fg_type_circle »), pas la valeur de l'enum : les deux sources ne sont donc pas homogènes.
- fullValueString ne gère pas le type 'boolean' (seulement 'bool'), contrairement à shortValueString : une valeur typée 'boolean' renvoie « ??? » dans la version complète.
- Le champ detaultIconType est écrit avec cette faute (detault) dans le code.
- tooltip() n'affiche rien si editor_flowgraphEditor.allowTooltip est faux.
- Le commentaire du champ flowgraphVersion de la page auto vient d'un print commenté ; la valeur est 0.2 (0.1 : jusqu'à la sortie d'avril 2021 ; 0.2 : listes plates pour les graphes).
- Catégories de nœuds reconnues : repeat_/once_/dynamic_ combinées avec instant, p_duration, f_duration, plus 'simple' et 'provider'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_flowgraph_editor.fullDisplay(value, tpe)` | Affiche fullValueString dans ImGui ; pour un type color, dessine d'abord un carré coloré. | 273 |
| `ui_flowgraph_editor.fullValueString(value, tpe)` | Comme shortValueString mais sans troncature : nombres au format %f, vec3/quat/color avec %f. Renvoie « nil » si nil. | 238 |
| `ui_flowgraph_editor.getAutoTypeFromName(name)` | Devine le type de pin d'après le nom (minuscules) : pos/scl/vec/position/scale/vector -> vec3 ; rot/quat/rotation/orientation -> quat ; clr/color -> color ; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number ; bool/enabled/disabled/contains/has…/uses…/with… -> bool ; sinon string. | 875 |
| `ui_flowgraph_editor.getBehaviourDescription(behaviour)` | Texte anglais décrivant un comportement de nœud (once, duration, simple, singleActive, obsolete) ; nil sinon. | 871 |
| `ui_flowgraph_editor.getBehaviourIcon(behaviour)` | Icône d'un comportement de nœud : once, duration, simple, singleActive, obsolete ; nil sinon. | 867 |
| `ui_flowgraph_editor.getGraphTypes()` | Renvoie les styles des types de graphe (state, graph, macro, instance) : name, color, couleurs d'onglet, gridColor, abbreviation. | 186 |
| `ui_flowgraph_editor.getSimpleTypes()` | Renvoie la liste des types simples : number, bool, string, vec3, quat, color. | 160 |
| `ui_flowgraph_editor.getTypeColor(dataType)` | Couleur ImGui d'un type de pin ; brun (0.45, 0.35, 0.1, 1) si le type est inconnu. | 178 |
| `ui_flowgraph_editor.getTypeIcon(dataType)` | Nom de l'icône d'un type de pin, ou « fg_type_circle » par défaut. | 182 |
| `ui_flowgraph_editor.getTypes()` | Renvoie la table des types de pins avec leur couleur et icône. | 164 |
| `ui_flowgraph_editor.isDurationNode(category)` | Vrai pour les catégories *_p_duration et *_f_duration (repeat, once, dynamic). | 833 |
| `ui_flowgraph_editor.isDynamicNode(category)` | Vrai pour dynamic_instant, dynamic_p_duration, dynamic_f_duration. | 854 |
| `ui_flowgraph_editor.isF_DurationNode(category)` | Vrai pour les catégories *_f_duration (repeat, once, dynamic). | 842 |
| `ui_flowgraph_editor.isFunctionalNode(category)` | Vrai pour les catégories repeat/once/dynamic × instant/p_duration/f_duration ainsi que 'simple' et 'provider'. | 814 |
| `ui_flowgraph_editor.isOnceNode(category)` | Vrai pour once_instant, once_p_duration, once_f_duration. | 848 |
| `ui_flowgraph_editor.isSimpleNode(category)` | Vrai pour 'simple' et 'provider' (nœuds qui ne nécessitent pas de flux). | 828 |
| `ui_flowgraph_editor.shortDisplay(value, tpe)` | Affiche shortValueString dans ImGui (im.Text) ; pour un type color, dessine d'abord un petit carré coloré. Affiche « nil » si la valeur est nil. | 225 |
| `ui_flowgraph_editor.shortValueString(value, tpe)` | Représentation courte d'une valeur selon son type : chaînes tronquées à 10 caractères + « ... », nombres à 2 décimales, vec3/quat/color avec 1 décimale ; « (nil) » si nil, « Flowing / Not Flowing » pour flow, « ??? » si le type n'est pas géré. Si le type est absent/any/table, il est deviné. | 190 |
| `ui_flowgraph_editor.tooltip(message)` | Affiche une infobulle ImGui pour l'élément survolé, uniquement si editor_flowgraphEditor.allowTooltip est vrai. | 168 |
| `ui_flowgraph_editor.variableEditor(source, name, displayOptions)` | Dessine un widget ImGui pour modifier une variable flowgraph (string, number, etc. selon variable.type) à partir de source:getFull(name) ; propose aussi renommer/supprimer via menu contextuel. Affiche « Variable X not found! » si absente. En mode édition, modifie la valeur de base (changeBase) et ajoute une entrée d'historique ; sinon modifie la valeur courante (changeInstant). | 286 |
| `ui_flowgraph_editor.vehicleSelector(self, onlyModel)` | Dessine un sélecteur de véhicule ImGui : bouton « Load Models and Configs » (charge core_vehicles.getModelList), recherche textuelle et choix du modèle puis de la config. Met à jour self.model, self.config, self.vehType, self.modelName, self.configName. Retourne une raison de changement (reason) ou nil. | 567 |
| `ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel)` | Met à jour self.modelName et self.configName (et self.configs trié par nom) à partir de self.model / self.config / self.models. | 522 |

### Détail des paramètres

#### `ui_flowgraph_editor.fullDisplay(value, tpe)`

Affiche fullValueString dans ImGui ; pour un type color, dessine d'abord un carré coloré.

- `value` (*any*) : Valeur à afficher.
- `tpe` (*string|nil*) : Type du pin.

#### `ui_flowgraph_editor.fullValueString(value, tpe)`

Comme shortValueString mais sans troncature : nombres au format %f, vec3/quat/color avec %f. Renvoie « nil » si nil.

- `value` (*any*) : Valeur à formater.
- `tpe` (*string|table|nil*) : Type du pin ; deviné si nil, any ou table.
- **renvoie** : string Texte formaté.

#### `ui_flowgraph_editor.getAutoTypeFromName(name)`

Devine le type de pin d'après le nom (minuscules) : pos/scl/vec/position/scale/vector -> vec3 ; rot/quat/rotation/orientation -> quat ; clr/color -> color ; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number ; bool/enabled/disabled/contains/has…/uses…/with… -> bool ; sinon string.

- `name` (*string*) : Nom du pin ou du champ.
- **renvoie** : string Type deviné.

#### `ui_flowgraph_editor.getBehaviourDescription(behaviour)`

Texte anglais décrivant un comportement de nœud (once, duration, simple, singleActive, obsolete) ; nil sinon.

- `behaviour` (*string*) : Nom du comportement.
- **renvoie** : string|nil Description.

#### `ui_flowgraph_editor.getBehaviourIcon(behaviour)`

Icône d'un comportement de nœud : once, duration, simple, singleActive, obsolete ; nil sinon.

- `behaviour` (*string*) : Nom du comportement.
- **renvoie** : string|nil Nom d'icône.

#### `ui_flowgraph_editor.getGraphTypes()`

Renvoie les styles des types de graphe (state, graph, macro, instance) : name, color, couleurs d'onglet, gridColor, abbreviation.

- **renvoie** : table<string, table> Styles par type de graphe.

#### `ui_flowgraph_editor.getSimpleTypes()`

Renvoie la liste des types simples : number, bool, string, vec3, quat, color.

- **renvoie** : string[] Noms des types simples.

#### `ui_flowgraph_editor.getTypeColor(dataType)`

Couleur ImGui d'un type de pin ; brun (0.45, 0.35, 0.1, 1) si le type est inconnu.

- `dataType` (*string*) : Type de pin (flow, chainFlow, impulse, string, number, bool, any, table, vec3, quat, color, state).
- **renvoie** : ImVec4 Couleur.

#### `ui_flowgraph_editor.getTypeIcon(dataType)`

Nom de l'icône d'un type de pin, ou « fg_type_circle » par défaut.

- `dataType` (*string*) : Type de pin.
- **renvoie** : string Nom d'icône.

#### `ui_flowgraph_editor.getTypes()`

Renvoie la table des types de pins avec leur couleur et icône.

- **renvoie** : table<string, table> Par nom de type : {color, icon}.

#### `ui_flowgraph_editor.isDurationNode(category)`

Vrai pour les catégories *_p_duration et *_f_duration (repeat, once, dynamic).

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.isDynamicNode(category)`

Vrai pour dynamic_instant, dynamic_p_duration, dynamic_f_duration.

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.isF_DurationNode(category)`

Vrai pour les catégories *_f_duration (repeat, once, dynamic).

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.isFunctionalNode(category)`

Vrai pour les catégories repeat/once/dynamic × instant/p_duration/f_duration ainsi que 'simple' et 'provider'.

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.isOnceNode(category)`

Vrai pour once_instant, once_p_duration, once_f_duration.

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.isSimpleNode(category)`

Vrai pour 'simple' et 'provider' (nœuds qui ne nécessitent pas de flux).

- `category` (*string*) : Catégorie du nœud.
- **renvoie** : boolean Résultat.

#### `ui_flowgraph_editor.shortDisplay(value, tpe)`

Affiche shortValueString dans ImGui (im.Text) ; pour un type color, dessine d'abord un petit carré coloré. Affiche « nil » si la valeur est nil.

- `value` (*any*) : Valeur à afficher.
- `tpe` (*string|nil*) : Type du pin.

#### `ui_flowgraph_editor.shortValueString(value, tpe)`

Représentation courte d'une valeur selon son type : chaînes tronquées à 10 caractères + « ... », nombres à 2 décimales, vec3/quat/color avec 1 décimale ; « (nil) » si nil, « Flowing / Not Flowing » pour flow, « ??? » si le type n'est pas géré. Si le type est absent/any/table, il est deviné.

- `value` (*any*) : Valeur à formater.
- `tpe` (*string|table|nil*) : Type du pin ; deviné si nil, any ou table.
- **renvoie** : string Texte formaté.

#### `ui_flowgraph_editor.tooltip(message)`

Affiche une infobulle ImGui pour l'élément survolé, uniquement si editor_flowgraphEditor.allowTooltip est vrai.

- `message` (*string*) : Texte de l'infobulle.

#### `ui_flowgraph_editor.variableEditor(source, name, displayOptions)`

Dessine un widget ImGui pour modifier une variable flowgraph (string, number, etc. selon variable.type) à partir de source:getFull(name) ; propose aussi renommer/supprimer via menu contextuel. Affiche « Variable X not found! » si absente. En mode édition, modifie la valeur de base (changeBase) et ajoute une entrée d'historique ; sinon modifie la valeur courante (changeInstant).

- `source` (*table*) : Objet porteur des variables (graphe ou gestionnaire) avec getFull, changeBase, changeInstant, renameVariable, mgr.
- `name` (*string*) : Nom de la variable.
- `displayOptions` (*table|nil*) : Options : global, allowEditing (par défaut source.mgr.allowEditing), onlyValue.

#### `ui_flowgraph_editor.vehicleSelector(self, onlyModel)`

Dessine un sélecteur de véhicule ImGui : bouton « Load Models and Configs » (charge core_vehicles.getModelList), recherche textuelle et choix du modèle puis de la config. Met à jour self.model, self.config, self.vehType, self.modelName, self.configName. Retourne une raison de changement (reason) ou nil.

- `self` (*table*) : Objet d'état du sélecteur.
- `onlyModel` (*boolean|nil*) : Si vrai, ne choisit que le modèle, pas la configuration.
- **renvoie** : string|nil Raison de la modification (non vérifié en détail).

#### `ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel)`

Met à jour self.modelName et self.configName (et self.configs trié par nom) à partir de self.model / self.config / self.models.

- `self` (*table*) : Objet de sélection (champs model, config, models, configs).
- `onlyModel` (*boolean|nil*) : Non utilisé dans le corps de la fonction.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultTypeIconSize` | number | Taille par défaut des icônes de type de pin : 18. |
| `detaultIconType` | string | Icône de type par défaut : « fg_type_circle ». |
| `flowgraphVersion` | number | Version du format flowgraph (0.2 : listes plates pour les graphes). |
| `nodeColors` | table<string, ImVec4> | Couleur par catégorie de nœud (crash, ai, debug, vehicle, event, ui, camera, scene, default, career, traffic…). |
| `nodeIcons` | table<string, string> | Nom d'icône par catégorie de nœud (vehicle, ai, camera, ui, event, scene, state, thread, logic, traffic, debug, button, timer, file, career, tech…). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/flowgraph/editor.lua`.*
