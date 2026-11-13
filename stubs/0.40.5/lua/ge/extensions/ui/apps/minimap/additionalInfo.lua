---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/additionalInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule les informations complémentaires affichées par la mini-carte : distance restante jusqu'à la destination (routePlanner de core_groundMarkers), nom du lieu (zone de gameplay_city la plus prioritaire sous la caméra, sinon titre du niveau) et état de la poursuite de police (disabled, visibleToPolice, hiddenFromPolice). Les changements sont envoyés au flux 'minimap' via guihooks.queueStream.
--- Accès : extension `ui_apps_minimap_additionalInfo` : `extensions.load("ui_apps_minimap_additionalInfo")`, puis la globale `ui_apps_minimap_additionalInfo`
---@class ui_apps_minimap_additionalInfo
ui_apps_minimap_additionalInfo = {}

--- Hook de fin de niveau : vide les infos (visible remis à true) et force un renvoi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:100
function ui_apps_minimap_additionalInfo.onClientEndMission() end

--- Hook appelé quand la destination est atteinte : efface la distance à la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:42
function ui_apps_minimap_additionalInfo.onReachedTargetPos() end

--- Hook appelé quand le focus de navigation de la grande carte change ; si pos est nil, efface la distance à la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:106
---@param pos vec3|nil Position visée, ou nil si la navigation est retirée.
function ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos) end

--- Hook de frame : vérifie la route, le nom de lieu et la police, puis envoie les infos si l'une a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:89
function ui_apps_minimap_additionalInfo.onUpdate() end

--- Force le renvoi des informations au flux 'minimap' à la prochaine mise à jour (appelé quand l'interface se monte).
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:7
function ui_apps_minimap_additionalInfo.requestAdditionalInfo() end

--- Affiche ou masque le bloc d'informations dans l'interface ; ne renvoie rien si la valeur ne change pas. Tout ce qui n'est pas false est traité comme true.
---Source : lua/ge/extensions/ui/apps/minimap/additionalInfo.lua:11
---@param visible boolean|nil false pour masquer.
function ui_apps_minimap_additionalInfo.setVisible(visible) end

