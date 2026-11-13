---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framingManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des modes de cadrage du créateur de captures. Il collecte les modes en diffusant le hook onScreenshotCreatorCollectFramingModes (chaque mode est une table {id, label, order, resolve, ...}), garde le mode choisi (par défaut « procedural ») et délègue le calcul de caméra à mode.resolve(context). Il sérialise le mode choisi pour survivre au rechargement des extensions.
--- Accès : extension `util_screenshotCreator_framingManager` : `extensions.load("util_screenshotCreator_framingManager")`, puis la globale `util_screenshotCreator_framingManager`
---@class util_screenshotCreator_framingManager
util_screenshotCreator_framingManager = {}

--- Restaure le mode sélectionné depuis un état sauvegardé (clés selectedModeId, framingModeId ou ancien skipCustomCameras) ; retombe sur « procedural » si invalide. Alias : migrateLegacyState, onDeserialized.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil État sauvegardé.
function util_screenshotCreator_framingManager.deserialize(data) end

--- Alias de getSelected.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Id du mode.
function util_screenshotCreator_framingManager.get() end

--- Renvoie l'id du mode sélectionné (« procedural » si le mode mémorisé n'existe plus). Alias : get, getSelectedModeId.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Id du mode.
function util_screenshotCreator_framingManager.getSelected() end

--- Alias de getSelected.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Id du mode.
function util_screenshotCreator_framingManager.getSelectedModeId() end

--- Renvoie la liste triée des modes de cadrage valides collectés par le hook. Alias : listModes.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:50
---@return table[]  Modes {id, label, order, resolve, ...}.
function util_screenshotCreator_framingManager.list() end

--- Alias de list.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:50
---@return table[]  Modes de cadrage.
function util_screenshotCreator_framingManager.listModes() end

--- Alias de deserialize (migration d'anciens états).
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil État sauvegardé.
function util_screenshotCreator_framingManager.migrateLegacyState(data) end

--- Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil État sauvegardé.
function util_screenshotCreator_framingManager.onDeserialized(data) end

--- Hook de sérialisation avant rechargement des extensions ; identique à serialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:84
---@return table  {selectedModeId}.
function util_screenshotCreator_framingManager.onSerialize() end

--- Calcule la caméra de cadrage avec le mode donné (ou le mode sélectionné). On peut appeler resolve(context) en omettant modeId : si le premier argument est une table et le second nil, il est pris comme contexte.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:66
---@param modeId string|table|nil Id du mode, ou directement le contexte.
---@param context table Contexte de cadrage transmis à mode.resolve (vehicle, resolution, fov…).
---@return table|nil  Résultat du mode (pos, rot, ...).
---@return string|nil  Erreur : mode inconnu ou contexte qui n'est pas une table.
function util_screenshotCreator_framingManager.resolve(modeId, context) end

--- Renvoie l'état à sauvegarder : {selectedModeId = ...}. Alias de onSerialize.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:84
---@return table  {selectedModeId = string}.
function util_screenshotCreator_framingManager.serialize() end

--- Alias de setSelected.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Id du mode.
---@return boolean  Succès.
---@return string|nil  Erreur.
function util_screenshotCreator_framingManager.set(modeId) end

--- Sélectionne le mode de cadrage par son id. Alias : set, setSelectedModeId.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Id d'un mode enregistré.
---@return boolean  true si le mode a été sélectionné.
---@return string|nil  « Unknown framing mode: … » en cas d'échec.
function util_screenshotCreator_framingManager.setSelected(modeId) end

--- Alias de setSelected.
---Source : lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Id du mode.
---@return boolean  Succès.
---@return string|nil  Erreur.
function util_screenshotCreator_framingManager.setSelectedModeId(modeId) end

