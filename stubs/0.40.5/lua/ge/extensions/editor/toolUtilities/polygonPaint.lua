---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygonPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de polygone à main levée pour l'éditeur : l'utilisateur maintient le clic gauche et glisse sur le terrain pour poser des points, relâche pour terminer (la fermeture est implicite entre le dernier et le premier point). Le tracé est simplifié par RDP pour obtenir un polygone éditable propre. Dessine un aperçu (sphères et lignes bleues) et le curseur.
--- Accès : extension `editor_toolUtilities_polygonPaint` : `extensions.load("editor_toolUtilities_polygonPaint")`, puis la globale `editor_toolUtilities_polygonPaint`
---@class editor_toolUtilities_polygonPaint
editor_toolUtilities_polygonPaint = {}

--- Désarme l'outil et efface les points.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:61
function editor_toolUtilities_polygonPaint.cancel() end

--- Récupère le polygone simplifié terminé et efface le drapeau finished. Renvoie nil s'il n'y a rien de terminé.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:75
---@param out table|nil Table de sortie réutilisable, vidée puis remplie ; créée si nil.
---@return table|nil  Liste de vec3 du polygone.
function editor_toolUtilities_polygonPaint.consumePolygon(out) end

--- Indique si un polygone terminé attend d'être récupéré par consumePolygon.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:71
---@return boolean  true si un polygone est prêt.
function editor_toolUtilities_polygonPaint.hasFinished() end

--- Indique si l'outil est armé.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:67
---@return boolean  true si armé.
function editor_toolUtilities_polygonPaint.isActive() end

--- Arme l'outil et réinitialise les tables. stepMeters (défaut 2.0) est la distance minimale entre deux points capturés, rdpTolMeters (défaut 6.0) la tolérance de simplification.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:50
---@param opts table|nil { stepMeters = number, rdpTolMeters = number }
function editor_toolUtilities_polygonPaint.start(opts) end

--- À appeler chaque frame pendant que la peinture doit être possible : dessine l'aperçu et le curseur, capture les points tant que le clic gauche est enfoncé sur le terrain, termine au relâchement.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:128
---@return boolean  true si un polygone s'est terminé pendant cette frame.
function editor_toolUtilities_polygonPaint.update() end

