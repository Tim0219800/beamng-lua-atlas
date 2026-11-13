---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/flowgraph/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide d'interface pour l'éditeur de flowgraph (ui_flowgraph_editor). Elle intègre l'API du moteur de nœuds (editor_api_luaintf), définit les couleurs/icônes des catégories de nœuds et des types de pins, les styles des types de graphes (state, graph, macro, instance), des utilitaires d'affichage de valeurs, un éditeur de variables, un sélecteur de véhicule et des tests sur les catégories de comportement des nœuds. Utile à un moddeur qui écrit un nœud ou un outil ImGui flowgraph personnalisé.
--- Accès : extension `ui_flowgraph_editor` : `extensions.load("ui_flowgraph_editor")`, puis la globale `ui_flowgraph_editor`
---@class ui_flowgraph_editor
---@field defaultTypeIconSize number Taille par défaut des icônes de type de pin : 18.
---@field detaultIconType string Icône de type par défaut : « fg_type_circle ».
---@field flowgraphVersion number Version du format flowgraph (0.2 : listes plates pour les graphes).
---@field nodeColors table<string, ImVec4> Couleur par catégorie de nœud (crash, ai, debug, vehicle, event, ui, camera, scene, default, career, traffic…).
---@field nodeIcons table<string, string> Nom d'icône par catégorie de nœud (vehicle, ai, camera, ui, event, scene, state, thread, logic, traffic, debug, button, timer, file, career, tech…).
ui_flowgraph_editor = {}

--- Affiche fullValueString dans ImGui ; pour un type color, dessine d'abord un carré coloré.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:273
---@param value any Valeur à afficher.
---@param tpe string|nil Type du pin.
function ui_flowgraph_editor.fullDisplay(value, tpe) end

--- Comme shortValueString mais sans troncature : nombres au format %f, vec3/quat/color avec %f. Renvoie « nil » si nil.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:238
---@param value any Valeur à formater.
---@param tpe string|table|nil Type du pin ; deviné si nil, any ou table.
---@return string  Texte formaté.
function ui_flowgraph_editor.fullValueString(value, tpe) end

--- Devine le type de pin d'après le nom (minuscules) : pos/scl/vec/position/scale/vector -> vec3 ; rot/quat/rotation/orientation -> quat ; clr/color -> color ; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number ; bool/enabled/disabled/contains/has…/uses…/with… -> bool ; sinon string.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:875
---@param name string Nom du pin ou du champ.
---@return string  Type deviné.
function ui_flowgraph_editor.getAutoTypeFromName(name) end

--- Texte anglais décrivant un comportement de nœud (once, duration, simple, singleActive, obsolete) ; nil sinon.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:871
---@param behaviour string Nom du comportement.
---@return string|nil  Description.
function ui_flowgraph_editor.getBehaviourDescription(behaviour) end

--- Icône d'un comportement de nœud : once, duration, simple, singleActive, obsolete ; nil sinon.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:867
---@param behaviour string Nom du comportement.
---@return string|nil  Nom d'icône.
function ui_flowgraph_editor.getBehaviourIcon(behaviour) end

--- Renvoie les styles des types de graphe (state, graph, macro, instance) : name, color, couleurs d'onglet, gridColor, abbreviation.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:186
---@return table<string, table>  Styles par type de graphe.
function ui_flowgraph_editor.getGraphTypes() end

--- Renvoie la liste des types simples : number, bool, string, vec3, quat, color.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:160
---@return string[]  Noms des types simples.
function ui_flowgraph_editor.getSimpleTypes() end

--- Couleur ImGui d'un type de pin ; brun (0.45, 0.35, 0.1, 1) si le type est inconnu.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:178
---@param dataType string Type de pin (flow, chainFlow, impulse, string, number, bool, any, table, vec3, quat, color, state).
---@return ImVec4  Couleur.
function ui_flowgraph_editor.getTypeColor(dataType) end

--- Nom de l'icône d'un type de pin, ou « fg_type_circle » par défaut.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:182
---@param dataType string Type de pin.
---@return string  Nom d'icône.
function ui_flowgraph_editor.getTypeIcon(dataType) end

--- Renvoie la table des types de pins avec leur couleur et icône.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:164
---@return table<string, table>  Par nom de type : {color, icon}.
function ui_flowgraph_editor.getTypes() end

--- Vrai pour les catégories *_p_duration et *_f_duration (repeat, once, dynamic).
---Source : lua/common/extensions/ui/flowgraph/editor.lua:833
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isDurationNode(category) end

--- Vrai pour dynamic_instant, dynamic_p_duration, dynamic_f_duration.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:854
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isDynamicNode(category) end

--- Vrai pour les catégories *_f_duration (repeat, once, dynamic).
---Source : lua/common/extensions/ui/flowgraph/editor.lua:842
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isF_DurationNode(category) end

--- Vrai pour les catégories repeat/once/dynamic × instant/p_duration/f_duration ainsi que 'simple' et 'provider'.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:814
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isFunctionalNode(category) end

--- Vrai pour once_instant, once_p_duration, once_f_duration.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:848
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isOnceNode(category) end

--- Vrai pour 'simple' et 'provider' (nœuds qui ne nécessitent pas de flux).
---Source : lua/common/extensions/ui/flowgraph/editor.lua:828
---@param category string Catégorie du nœud.
---@return boolean  Résultat.
function ui_flowgraph_editor.isSimpleNode(category) end

--- Affiche shortValueString dans ImGui (im.Text) ; pour un type color, dessine d'abord un petit carré coloré. Affiche « nil » si la valeur est nil.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:225
---@param value any Valeur à afficher.
---@param tpe string|nil Type du pin.
function ui_flowgraph_editor.shortDisplay(value, tpe) end

--- Représentation courte d'une valeur selon son type : chaînes tronquées à 10 caractères + « ... », nombres à 2 décimales, vec3/quat/color avec 1 décimale ; « (nil) » si nil, « Flowing / Not Flowing » pour flow, « ??? » si le type n'est pas géré. Si le type est absent/any/table, il est deviné.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:190
---@param value any Valeur à formater.
---@param tpe string|table|nil Type du pin ; deviné si nil, any ou table.
---@return string  Texte formaté.
function ui_flowgraph_editor.shortValueString(value, tpe) end

--- Affiche une infobulle ImGui pour l'élément survolé, uniquement si editor_flowgraphEditor.allowTooltip est vrai.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:168
---@param message string Texte de l'infobulle.
function ui_flowgraph_editor.tooltip(message) end

--- Dessine un widget ImGui pour modifier une variable flowgraph (string, number, etc. selon variable.type) à partir de source:getFull(name) ; propose aussi renommer/supprimer via menu contextuel. Affiche « Variable X not found! » si absente. En mode édition, modifie la valeur de base (changeBase) et ajoute une entrée d'historique ; sinon modifie la valeur courante (changeInstant).
---Source : lua/common/extensions/ui/flowgraph/editor.lua:286
---@param source table Objet porteur des variables (graphe ou gestionnaire) avec getFull, changeBase, changeInstant, renameVariable, mgr.
---@param name string Nom de la variable.
---@param displayOptions table|nil Options : global, allowEditing (par défaut source.mgr.allowEditing), onlyValue.
function ui_flowgraph_editor.variableEditor(source, name, displayOptions) end

--- Dessine un sélecteur de véhicule ImGui : bouton « Load Models and Configs » (charge core_vehicles.getModelList), recherche textuelle et choix du modèle puis de la config. Met à jour self.model, self.config, self.vehType, self.modelName, self.configName. Retourne une raison de changement (reason) ou nil.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:567
---@param self table Objet d'état du sélecteur.
---@param onlyModel boolean|nil Si vrai, ne choisit que le modèle, pas la configuration.
---@return string|nil  Raison de la modification (non vérifié en détail).
function ui_flowgraph_editor.vehicleSelector(self, onlyModel) end

--- Met à jour self.modelName et self.configName (et self.configs trié par nom) à partir de self.model / self.config / self.models.
---Source : lua/common/extensions/ui/flowgraph/editor.lua:522
---@param self table Objet de sélection (champs model, config, models, configs).
---@param onlyModel boolean|nil Non utilisé dans le corps de la fonction.
function ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel) end

