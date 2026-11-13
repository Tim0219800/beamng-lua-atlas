---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/customFieldsUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du widget de champs personnalisés.
---@class editor_util_customFieldsUtil
local editor_util_customFieldsUtil = {}

--- Ajoute le tag saisi aux fields (ignoré si vide) puis vide la zone de saisie.
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:168
function editor_util_customFieldsUtil:addTag() end

--- Dessine la table des champs (Nom, Valeur, Type, bouton Remove) et la ligne d'ajout avec choix du type et bouton Add.
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:38
function editor_util_customFieldsUtil:drawCustomFields() end

--- Dessine la liste des tags (clic : popup « Remove Tag »), la saisie d'un tag, le combo des presetTags et le bouton Add Tag.
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:105
function editor_util_customFieldsUtil:drawTags() end

--- Initialise le widget : nom unique (utilisé dans les identifiants imgui), textes, drapeaux enableTags/enableFields, liste presetTags, types autorisés ; applique les options puis setFields et refresh.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:9
---@param name string|nil Nom unique de l'instance, défaut « Custom Fields ».
---@param fields table|nil Objet customFields à éditer.
---@param options table|nil Surcharges des attributs existants.
function editor_util_customFieldsUtil:init(name, fields, options) end

--- Callback pour le mode d'édition ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:188
function editor_util_customFieldsUtil:onActivate() end

--- Callback pour le mode d'édition ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:191
function editor_util_customFieldsUtil:onDeactivate() end

--- Réinitialise les zones de saisie (nom, valeur, tag) et le type courant à « string ».
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:27
function editor_util_customFieldsUtil:refresh() end

--- Définit l'objet customFields édité (en crée un vide si nil).
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:34
---@param fields table|nil Objet customFields.
function editor_util_customFieldsUtil:setFields(fields) end

--- Dessine les tags puis les champs, selon enableTags et enableFields.
---Source : lua/ge/extensions/editor/util/customFieldsUtil.lua:178
function editor_util_customFieldsUtil:widget() end

