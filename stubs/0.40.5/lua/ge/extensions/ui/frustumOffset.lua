---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/frustumOffset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Décale le centre du frustum de la caméra (scenetree.OnlyGui:setFrustumCameraCenterOffset) pour que la vue 3D soit recentrée quand des panneaux UI recouvrent une partie de l'écran (voir BngFrustumMover.js). Accepte un décalage brut en unités moteur et/ou un décalage en fraction de demi-écran, converti en tenant compte du ratio d'écran et du FoV.
--- Accès : extension `ui_frustumOffset` : `extensions.load("ui_frustumOffset")`, puis la globale `ui_frustumOffset`
---@class ui_frustumOffset
ui_frustumOffset = {}

--- Hook par frame : si un décalage écran est actif et que le FoV a changé depuis la dernière application, réapplique le décalage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/frustumOffset.lua:44
function ui_frustumOffset.onUpdate() end

--- Définit les décalages et les applique immédiatement. Toute valeur absente vaut 0.
---Source : lua/ge/extensions/ui/frustumOffset.lua:38
---@param newRawX number|nil Décalage horizontal brut (unités moteur), transmis tel quel.
---@param newRawY number|nil Décalage vertical brut (unités moteur), transmis tel quel.
---@param newScreenX number|nil Décalage horizontal en fraction de la demi-largeur d'écran.
---@param newScreenY number|nil Décalage vertical en fraction de la demi-hauteur d'écran.
function ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY) end

