---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/legacy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de cadrage « Legacy (pre-r186184) » du créateur de captures : calcule la position et l'orientation de la caméra pour qu'un véhicule tienne dans l'image, avec l'ancienne méthode (FOV fixe de 20°). Il s'enregistre auprès de util_screenshotCreator_framingManager via le hook onScreenshotCreatorCollectFramingModes (id « legacy », ordre 50). Il retient les nœuds du véhicule (hors antennes, drapeaux, nœuds non collidables et nœuds sous le sol), cherche par dichotomie la distance de caméra minimale qui garde tous les points d'extrémité dans les marges, puis relève la caméra si elle passe sous 0,75 m au-dessus du point le plus bas.
--- Accès : extension `util_screenshotCreator_framing_legacy` : `extensions.load("util_screenshotCreator_framing_legacy")`, puis la globale `util_screenshotCreator_framing_legacy`
---@class util_screenshotCreator_framing_legacy
---@field dependencies string[] Extensions chargées avant : core_vehicle_manager, util_screenshotCreator_settings, util_screenshotCreator_thumbnailConfig.
util_screenshotCreator_framing_legacy = {}

--- Alias de resolve (même fonction).
---Source : lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:276
---@param context table Voir resolve.
---@return table|nil  Voir resolve.
---@return string|nil  Message d'erreur.
function util_screenshotCreator_framing_legacy.frame(context) end

--- Construit les données géométriques de cadrage d'un véhicule : boîte englobante orientée selon les axes de référence, centre, demi-étendues, point visé, direction de caméra et points d'extrémité (jusqu'à 100 nœuds max et 100 min par axe). Ne calcule pas la distance de caméra.
---Source : lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:45
---@param vehicle table Objet véhicule.
---@param fixedRotation quat|nil Orientation de caméra imposée ; sinon calculée à partir de la direction (-0.75, -0.66, 0.07) dans le repère du véhicule.
---@param configName string|nil Nom de configuration passé à thumbnailConfig.getReferenceAxes pour choisir les axes de référence.
---@return table  framingData (bb, center, axis0..2, halfExtents, floorZ, lookAtPoint, camRot, camRight/Forward/Up, framingPoints…).
function util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName) end

--- Hook appelé par framingManager lors de la collecte des modes. Ajoute à la liste le mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:342
---@param modes table[] Liste à compléter.
function util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes) end

--- Calcule la caméra de cadrage legacy pour context.vehicle. Renvoie une table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, ou nil et un message d'erreur si context.vehicle manque.
---Source : lua/ge/extensions/util/screenshotCreator/framing/legacy.lua:276
---@param context table Contexte de cadrage : vehicle (obligatoire), resolution ({largeur, hauteur}), aspectRatio, nearPlane, fixedRotation (quat imposé), configName, useFramingMargins/useMargins (boolean), margin ({left,right,top,bottom,extraBottom}).
---@return table|nil  Résultat de cadrage (pos: vec3, rot: quat, fov, name, debugData, framingData).
---@return string|nil  Message d'erreur.
function util_screenshotCreator_framing_legacy.resolve(context) end

