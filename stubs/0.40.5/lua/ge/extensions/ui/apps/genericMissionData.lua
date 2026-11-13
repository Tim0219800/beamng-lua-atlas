---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/genericMissionData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stocke des lignes d'information de mission (titre, texte, chrono) classées par catégorie et les envoie à l'app d'interface « genericMissionData » via guihooks.trigger('SetGenericMissionData'). Sert aux missions et au flowgraph pour afficher des données arbitraires triées par ordre. L'extension reste chargée en permanence (setExtensionUnloadMode manual).
--- Accès : extension `ui_apps_genericMissionData` : `extensions.load("ui_apps_genericMissionData")`, puis la globale `ui_apps_genericMissionData`
---@class ui_apps_genericMissionData
ui_apps_genericMissionData = {}

--- Efface toutes les données et envoie 'SetGenericMissionDataResetAll' à l'interface.
---Source : lua/ge/extensions/ui/apps/genericMissionData.lua:17
function ui_apps_genericMissionData.clearData() end

--- Hook d'initialisation : place l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/genericMissionData.lua:6
function ui_apps_genericMissionData.onInit() end

--- Renvoie à l'interface tous les éléments, dans l'ordre d'affichage (utile quand l'app se monte après coup).
---Source : lua/ge/extensions/ui/apps/genericMissionData.lua:26
function ui_apps_genericMissionData.sendAllData() end

--- Ajoute, met à jour ou efface (clear=true) un élément de mission, puis envoie à l'interface les éléments concernés avec leur index.
---Source : lua/ge/extensions/ui/apps/genericMissionData.lua:37
---@param args table {category=string|nil ('default'), order=number|nil, clear=boolean|nil, title, txt, style, minutes, seconds, milliseconds}.
function ui_apps_genericMissionData.setData(args) end

