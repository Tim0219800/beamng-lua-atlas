---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/graphicsQualityGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Groupe de qualité. Champs d'instance : currentQualityLevel (string, "" au départ), qualityLevels (copie de group.qualityLevels), name (string, 'unnamed_quality_group' par défaut), onApply (fonction du module, nop sinon).
---@class core_settings_graphicsQualityGroup
local core_settings_graphicsQualityGroup = {}

--- Pour chaque paire clé/valeur du préréglage, lit VariableRegistry.get(clé), compare par tostring, puis VariableRegistry.set(clé, valeur). Si au moins une valeur a changé, appelle self:onApply().
---Source : lua/ge/extensions/core/settings/graphicsQualityGroup.lua:36
---@param qualityLevel table Table clé VariableRegistry -> valeur.
function core_settings_graphicsQualityGroup:apply(qualityLevel) end

--- Applique le niveau nommé (via apply) puis le mémorise comme niveau courant. Ne fait rien si levelString est nil.
---Source : lua/ge/extensions/core/settings/graphicsQualityGroup.lua:20
---@param levelString string|nil Nom du niveau, clé de qualityLevels.
function core_settings_graphicsQualityGroup:applyLevel(levelString) end

--- Renvoie la table de préréglage du niveau courant.
---Source : lua/ge/extensions/core/settings/graphicsQualityGroup.lua:28
---@param levelString any Ignoré.
---@return table|nil  Préréglage courant.
function core_settings_graphicsQualityGroup:getCurrentLevel(levelString) end

--- Renvoie le nom du niveau courant.
---Source : lua/ge/extensions/core/settings/graphicsQualityGroup.lua:32
---@return string  Nom du niveau, "" si aucun appliqué.
function core_settings_graphicsQualityGroup:getCurrentLevelId() end

--- Constructeur appelé par la fabrique : require(qualityLevelsFilename) puis copie qualityLevels et récupère onApply. Sans nom de fichier, le groupe est vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/graphicsQualityGroup.lua:7
---@param qualitiyLevelsFilename string|nil Nom du module à charger (chemin require ou nom d'extension).
---@param groupName string|nil Nom du groupe.
function core_settings_graphicsQualityGroup:init(qualitiyLevelsFilename, groupName) end

