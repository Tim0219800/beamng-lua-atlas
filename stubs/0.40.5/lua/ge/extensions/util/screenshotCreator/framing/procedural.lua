---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/procedural.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de cadrage « Procedural » (mode par défaut) du créateur de captures. À partir des nœuds du véhicule, il calcule la caméra qui fait tenir le véhicule dans l'image avec des marges données : les nœuds désactivés par le module nodeOutpaint sont ignorés, ceux sous le sol et les rétroviseurs automatiques sont traités à part, puis une recherche par dichotomie trouve la distance minimale le long d'un rail de caméra. S'il n'y a aucune solution, une position de repli et une rotation optimisée sont utilisées. S'enregistre via le hook onScreenshotCreatorCollectFramingModes (id « procedural », ordre 100).
--- Accès : extension `util_screenshotCreator_framing_procedural` : `extensions.load("util_screenshotCreator_framing_procedural")`, puis la globale `util_screenshotCreator_framing_procedural`
---@class util_screenshotCreator_framing_procedural
---@field dependencies string[] Extensions chargées avant : thumbnailConfig, nodeOutpaint, settings, vehicleSetup (préfixe util_screenshotCreator_).
util_screenshotCreator_framing_procedural = {}

--- Alias de resolve (même fonction).
---Source : lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:438
---@param context table Voir resolve.
---@return table|nil  Voir resolve.
---@return string|nil  Message d'erreur.
function util_screenshotCreator_framing_procedural.frame(context) end

--- Prépare les données de cadrage : classe les nœuds du véhicule (activés, désactivés, sous le sol, rétroviseurs), calcule la boîte englobante, le point visé, le rail de caméra et les points d'extrémité servant au cadrage et à la rotation. Se replie sur les coins de la boîte du véhicule si aucun nœud n'est activé.
---Source : lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:135
---@param context table Même contexte que resolve (vehicle, configName, cameraHeight, cameraAxisDownOffset).
---@return table|nil  framingData.
---@return string|nil  « No above-ground framing points » si rien n'est exploitable.
function util_screenshotCreator_framing_procedural.getVehicleFramingData(context) end

--- Hook appelé par framingManager lors de la collecte des modes. Ajoute {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:522
---@param modes table[] Liste à compléter.
function util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes) end

--- Calcule la caméra de cadrage procédural pour context.vehicle. Renvoie {pos, rot, name = "procedural camera", debugData, framingData}, ou nil et un message d'erreur.
---Source : lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:438
---@param context table vehicle (obligatoire), resolution, fov/fieldOfView, nearPlane, aspectRatio, fixedRotation (quat), configName, cameraHeight, cameraAxisDownOffset, useFramingMargins/useMargins, margin ({left,right,top,bottom}).
---@return table|nil  Résultat de cadrage (pos: vec3, rot: quat, name, debugData, framingData).
---@return string|nil  Message d'erreur.
function util_screenshotCreator_framing_procedural.resolve(context) end

--- Test interne par assertions sur la sélection des nœuds de rotation (nœuds sous le sol et rétroviseurs conservés, nœuds désactivés exclus, repli sur les points de secours). Renvoie true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framing/procedural.lua:107
---@return boolean  Toujours true (sinon une assertion échoue).
function util_screenshotCreator_framing_procedural.selfCheck() end

