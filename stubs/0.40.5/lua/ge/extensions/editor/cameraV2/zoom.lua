---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/zoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zoom de Camera V2 : remplace le mouvement de molette standard par un dolly lissé le long du centre de la vue. Chaque cran de molette change la distance au point focal de façon proportionnelle (en espace logarithmique), avec lissage exponentiel et collision contre le terrain et la géométrie statique pour ne pas traverser le décor. Lit les préférences camera.cameraV2.zoomMinDistance, zoomMaxDistance, zoomFactorPerNotch et zoomResponse.
--- Accès : extension `editor_cameraV2_zoom` : `extensions.load("editor_cameraV2_zoom")`, puis la globale `editor_cameraV2_zoom`
---@class editor_cameraV2_zoom
editor_cameraV2_zoom = {}

--- Abandonne le zoom en cours.
---Source : lua/ge/extensions/editor/cameraV2/zoom.lua:254
function editor_cameraV2_zoom.cancel() end

--- Indique si un zoom lissé est en cours.
---Source : lua/ge/extensions/editor/cameraV2/zoom.lua:258
---@return boolean  true si un état de zoom existe
function editor_cameraV2_zoom.isActive() end

--- Indique si le dernier zoom utilisait seulement la collision avec le terrain (voir notes : toujours false dans le code actuel).
---Source : lua/ge/extensions/editor/cameraV2/zoom.lua:262
---@return boolean  dernier terrainOnly
function editor_cameraV2_zoom.lastZoomUsedTerrainOnly() end

--- Démarre ou prolonge un zoom : calcule le point focal, la distance courante et la distance cible (distance * facteur^-value, bornée), puis mémorise l'état que update() fait converger. Les crans successifs dans le même sens s'accumulent.
---Source : lua/ge/extensions/editor/cameraV2/zoom.lua:171
---@param value number Crans de molette ; > 0 rapproche (zoom avant), < 0 éloigne. |value| <= 0,0001 est ignoré
---@param fixedFocus vec3|nil Point focal imposé (s'il est raisonnable) à la place du raycast central
---@return boolean  false si la valeur est négligeable, true sinon (événement traité, même en cas d'échec de validation)
function editor_cameraV2_zoom.onMouseWheel(value, fixedFocus) end

--- Fait avancer le zoom lissé d'une frame : déplace la caméra le long de la direction vers le focus. Met fin au zoom (état annulé) en cas de geste souris, de pose incohérente ou de collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2/zoom.lua:234
---@param deltaTime number|nil Secondes ; limité à [0 ; 0,05], à défaut ui_imgui.GetIO().DeltaTime
function editor_cameraV2_zoom.update(deltaTime) end

