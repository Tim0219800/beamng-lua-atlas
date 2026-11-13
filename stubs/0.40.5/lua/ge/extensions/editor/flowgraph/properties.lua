---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/properties.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_properties', windowDescription 'Properties').
---@class editor_flowgraph_properties_C
local editor_flowgraph_properties_C = {}

--- Dessine une table de données en deux colonnes clé/valeur (clés triées), ou une seule ligne si la seule clé est 'value'.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:158
---@param path string Préfixe d'identifiants.
---@param cdata table Cache ImGui.
---@param v table Table éditée.
---@param savePath string Chemin de base.
---@param saveCallback function|nil function(savePath, newValue).
---@param keysEditable boolean|nil Permettre le renommage des clés.
function editor_flowgraph_properties_C:_drawDataTable(path, cdata, v, savePath, saveCallback, keysEditable) end

--- Dessine un champ d'édition adapté au type de valeur et appelle saveCallback quand la saisie est validée.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:24
---@param path string Identifiant unique du champ.
---@param cdata table Cache des valeurs ImGui.
---@param type string Type Lua de la valeur ('number', 'string', 'boolean'…).
---@param v any Valeur courante.
---@param savePath string Chemin transmis au callback.
---@param saveCallback function function(savePath, newValue).
---@param enterOnly boolean|nil Valider seulement avec Entrée (déduit du nom).
---@param padRight number|nil Marge droite en pixels.
---@param pin table|nil Pin concerné (numericSetup).
function editor_flowgraph_properties_C:_drawInputField(path, cdata, type, v, savePath, saveCallback, enterOnly, padRight, pin) end

--- Dessine un sélecteur de couleur RGBA pour une propriété personnalisée et l'écrit dans item[customName] à la fin de l'édition.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:199
---@param item table Nœud ou graphe.
---@param customName string Nom du champ couleur.
---@param cdata table Tableau ImGui de 4 flottants.
---@return string|nil  Raison d'historique si modifié.
function editor_flowgraph_properties_C:customPropertyColor(item, customName, cdata) end

--- Dessine la fenêtre : surligne les liens des nœuds sélectionnés, gère le changement de sélection, affiche le nœud sélectionné ou les propriétés du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:1020
---@param dt number Delta temps réel (s), passé à node:drawCustomProperties.
function editor_flowgraph_properties_C:draw(dt) end

--- Dessine la section « Input Pins » éditable pour les nœuds à pins d'entrée personnalisés (allowCustomInPins).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:397
---@param item table Nœud.
function editor_flowgraph_properties_C:drawCustomInPins(item) end

--- Dessine la section de pins de sortie éditable (allowCustomOutPins).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:610
---@param item table Nœud.
function editor_flowgraph_properties_C:drawCustomOutPins(item) end

--- Dessine les propriétés d'un graphe (nom, avec mise à jour du nœud intégré pour une macro, etc.).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:1156
---@param graph table Graphe courant.
function editor_flowgraph_properties_C:drawGraphProperties(graph) end

--- Dessine le combo « ... » proposant des modèles de valeur codée en dur pour un pin (sélection de fichier si pin.allowFiles, chemin relatif au dossier du projet).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:745
---@param pin table Pin d'entrée.
---@param item table Nœud.
function editor_flowgraph_properties_C:drawHardTemplates(pin, item) end

--- Dessine la section « Input Pins » : visibilité, icône de type, nom, valeur codée en dur ou lien.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:804
---@param item table Nœud.
function editor_flowgraph_properties_C:drawInPins(item) end

--- Dessine l'en-tête coloré de l'élément avec son nom et le bouton de modification (mode_edit) du nom et des couleurs.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:231
---@param item table Nœud ou graphe.
function editor_flowgraph_properties_C:drawItemHeader(item) end

--- Dessine la table data de l'élément puis ses pins d'entrée et de sortie (éditables ou non).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:976
---@param itemType string Type d'élément (non utilisé directement).
---@param item table Nœud.
function editor_flowgraph_properties_C:drawItemProperties(itemType, item) end

--- Dessine la section « Output Pins » : visibilité (masquable si non lié), type, nom et valeur courante (pin._value).
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:934
---@param item table Nœud.
function editor_flowgraph_properties_C:drawOutPins(item) end

--- Renvoie le premier type (ordre alphabétique) autorisé d'une table de types ; 'number' si types est nil, 'bool' si aucun.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:388
---@param types table<string, boolean>|nil Types autorisés.
---@return string  Nom de type.
function editor_flowgraph_properties_C:getFirstAllowedType(types) end

--- Enregistre la fenêtre (visible par défaut) et charge la texture d'en-tête art/imgui_node_header.png.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:18
function editor_flowgraph_properties_C:init() end

--- Prépare les champs d'édition du nom et des couleurs (customColor/color, iconColor) d'un élément.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:211
---@param item table Nœud ou graphe.
function editor_flowgraph_properties_C:initCustomProperties(item) end

--- Liste les tags de macro du projet (mgr.macroTags) avec renommage et suppression.
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:1133
function editor_flowgraph_properties_C:showAvailableMacroTags() end

--- Appelle hideProperties sur le nœud précédemment affiché et réinitialise les états d'édition. Appelée à la fermeture de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/properties.lua:1124
function editor_flowgraph_properties_C:unselect() end

