---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/materialUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les huit jeux de matériaux (lettres A à H) du Track Builder. Chaque lettre correspond à deux matériaux de la scène, 'track_editor_<lettre>_center' et 'track_editor_<lettre>_border'. Le module lit et écrit leurs couleurs, textures (base, specular, normal, décalques centre/bordure), l'éclat (glow/emissive) et le type de sol (groundtype) ; il sait aussi revenir aux valeurs d'origine et ne renvoyer que les valeurs différentes des défauts.
--- Accès : extension `util_trackBuilder_materialUtil` : `extensions.load("util_trackBuilder_materialUtil")`, puis la globale `util_trackBuilder_materialUtil`
---@class util_trackBuilder_materialUtil
---@field currentMaterials table<string, table> État courant des matériaux, indexé par lettre (A à H).
---@field loadMaterials nil Toujours nil : référence à une fonction non définie (bug).
util_trackBuilder_materialUtil = {}

--- Relit les 8 matériaux depuis la scène et renvoie, par lettre, uniquement les valeurs qui diffèrent des valeurs d'origine (removeDefaults).
---Source : lua/ge/extensions/util/trackBuilder/materialUtil.lua:437
---@return table<string, table>  Matériaux allégés, indexés par lettre.
function util_trackBuilder_materialUtil.getMaterials() end

--- Remet les matériaux aux valeurs d'origine : tous si letter est nil, sinon seulement cette lettre.
---Source : lua/ge/extensions/util/trackBuilder/materialUtil.lua:426
---@param letter string|nil Lettre 'A' à 'H', ou nil pour tous.
function util_trackBuilder_materialUtil.resetMaterialsToDefault(letter) end

--- Applique plusieurs matériaux : complète chaque entrée avec les valeurs d'origine manquantes (fillDefaults) puis appelle setSingleMaterial. Sans argument, ne fait rien.
---Source : lua/ge/extensions/util/trackBuilder/materialUtil.lua:395
---@param materials table<string, table>|nil Matériaux indexés par lettre.
---@param skipSet boolean|nil Si vrai, ne relit pas l'état courant des objets de la scène avant d'appliquer.
function util_trackBuilder_materialUtil.setMaterials(materials, skipSet) end

--- Applique un matériau à la lettre donnée : textures, couleurs, glow, groundtype, puis flush et reload des matériaux centre et bordure ; met à jour currentMaterials.
---Source : lua/ge/extensions/util/trackBuilder/materialUtil.lua:402
---@param letter string Lettre 'A' à 'H'.
---@param material table Table de matériau complète (voir module).
---@param skipSet boolean|nil Voir setMaterials.
function util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet) end

