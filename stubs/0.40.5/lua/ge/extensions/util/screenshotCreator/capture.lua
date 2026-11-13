---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de capture de l'outil screenshotCreator : prend une capture hors écran d'un véhicule depuis une caméra donnée, via une vue de rendu dédiée (render_renderViews, vue « thumbnailScreenshot »). L'interface et les marqueurs ne sont pas affichés ; la vue de rendu reprend l'exposition de la vue principale et attend 1 s par défaut pour que les effets de post-traitement convergent. La capture est rendue à résolution × sur-échantillonnage puis réduite.
--- Accès : extension `util_screenshotCreator_capture` : `extensions.load("util_screenshotCreator_capture")`, puis la globale `util_screenshotCreator_capture`
---@class util_screenshotCreator_capture
---@field dependencies table
util_screenshotCreator_capture = {}

--- Capture une vignette hors écran et attend sa fin (coroutine). Utilise la distance de plan éloigné de la vue principale pour que les effets basés sur la profondeur (flou de profondeur) restent cohérents.
---Source : lua/ge/extensions/util/screenshotCreator/capture.lua:16
---@param filepath string Fichier image de sortie
---@param camera table Caméra {pos, rot, ...}
---@param options table resolution {largeur, hauteur}, supersampling, fov, nearPlane, captureTimeout (secondes, défaut 5, minimum 0,1)
---@return boolean  true si la capture a réussi et si le fichier existe avec une taille non nulle
function util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options) end

--- Lance la capture via render_renderViews.takeScreenshot sans attendre (asynchrone). Avertit et appelle le callback sans argument si filepath ou camera (pos et rot) sont invalides.
---Source : lua/ge/extensions/util/screenshotCreator/capture.lua:33
---@param filepath string Fichier image de sortie
---@param camera table Caméra {pos, rot, fov?, nearPlane?, screenshotDelay?}
---@param callback function|nil Appelé à la fin avec le résultat de la capture
---@param uniqueId any Non utilisé dans cette fonction
---@param options table|nil resolution, supersampling, fov, nearPlane, farClip
function util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options) end

