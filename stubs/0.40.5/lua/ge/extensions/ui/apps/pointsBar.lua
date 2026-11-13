---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/pointsBar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente l'app d'interface pointsBar (barre de points avec paliers). Il garde le nombre de points et les paliers (100, 200, 300 par défaut) et publie dans le flux 'pointsBar' le pourcentage de remplissage, le libellé, les paliers atteints et la position des paliers en pourcentage.
--- Accès : extension `ui_apps_pointsBar` : `extensions.load("ui_apps_pointsBar")`, puis la globale `ui_apps_pointsBar`
---@class ui_apps_pointsBar
ui_apps_pointsBar = {}

--- Remet les paliers par défaut {100, 200, 300} et les points à 0.
---Source : lua/ge/extensions/ui/apps/pointsBar.lua:55
function ui_apps_pointsBar.clearData() end

--- Hook d'initialisation : place l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/pointsBar.lua:6
function ui_apps_pointsBar.onInit() end

--- Republie paliers et points courants (utile quand l'app se monte).
---Source : lua/ge/extensions/ui/apps/pointsBar.lua:60
function ui_apps_pointsBar.requestAllData() end

--- Met à jour les points courants et le libellé, recalcule remplissage et paliers atteints, puis publie dans le flux 'pointsBar'.
---Source : lua/ge/extensions/ui/apps/pointsBar.lua:26
---@param points number Points actuels.
---@param pointsLabel string|nil Texte affiché ; par défaut tostring(points).
function ui_apps_pointsBar.setPoints(points, pointsLabel) end

--- Définit la liste des paliers (si fournie), recalcule leur position en pourcentage et publie dans le flux.
---Source : lua/ge/extensions/ui/apps/pointsBar.lua:41
---@param thresholds table<integer, number>|nil Paliers croissants ; le dernier fixe l'échelle.
function ui_apps_pointsBar.setThresholds(thresholds) end

