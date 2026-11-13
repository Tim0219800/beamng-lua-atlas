---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/arrowGPS.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affiche une flèche GPS 3D (TSStatic art/shapes/interface/s_mm_arrow_floating.dae) flottant devant la caméra, à l'emplacement de l'app d'interface arrowGPS, et orientée vers une cible du monde. Plusieurs sources peuvent enregistrer une cible avec une priorité (setTarget) ; la plus prioritaire (nombre le plus petit) est suivie. La flèche est créée à la demande, cachée si aucune cible ou aucun véhicule joueur, et supprimée au déchargement.
--- Accès : extension `ui_arrowGPS` : `extensions.load("ui_arrowGPS")`, puis la globale `ui_arrowGPS`
---@class ui_arrowGPS
---@field dependencies table<integer, string> { "core_camera" } : chargé avant ce module.
ui_arrowGPS = {}

--- Hook de déchargement : supprime l'objet flèche et vide toutes les inscriptions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.lua:179
function ui_arrowGPS.onExtensionUnloaded() end

--- Hook appelé avant chaque rendu : crée la flèche si besoin, calcule sa position écran-vers-monde, l'oriente vers la cible active (quatFromDir) et l'affiche ; la cache si aucune cible ou aucun véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.lua:144
---@param dt number Temps écoulé (non utilisé).
function ui_arrowGPS.onPreRender(dt) end

--- Retire la cible d'une source et recalcule la cible active (la flèche se cache s'il n'en reste aucune).
---Source : lua/ge/extensions/ui/arrowGPS.lua:68
---@param key string Identifiant de la source.
function ui_arrowGPS.removeTarget(key) end

--- Fixe la position écran de l'app (fractions de 0 à 1) où la flèche est dessinée ; appelé côté interface.
---Source : lua/ge/extensions/ui/arrowGPS.lua:128
---@param sx number Position horizontale, 0 gauche, 1 droite.
---@param sy number Position verticale, 0 haut, 1 bas.
function ui_arrowGPS.setAppScreenPos(sx, sy) end

--- Change la distance devant la caméra à laquelle la flèche est placée (0.15 par défaut).
---Source : lua/ge/extensions/ui/arrowGPS.lua:140
---@param depth number Distance en mètres.
function ui_arrowGPS.setDepth(depth) end

--- Change l'échelle de la flèche (0.04 par défaut).
---Source : lua/ge/extensions/ui/arrowGPS.lua:133
---@param scale number Facteur d'échelle uniforme.
function ui_arrowGPS.setScale(scale) end

--- Enregistre ou remplace la cible d'une source (clé) avec sa priorité, puis recalcule la cible active et la couleur de la flèche.
---Source : lua/ge/extensions/ui/arrowGPS.lua:54
---@param key string Identifiant de la source.
---@param priority number Priorité ; la plus petite valeur l'emporte.
---@param data table|nil {pos=vec3|{x,y,z}, color={r,g,b}|nil}.
function ui_arrowGPS.setTarget(key, priority, data) end

