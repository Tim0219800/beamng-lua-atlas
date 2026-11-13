---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Descriptor de back-end gridSelector partagé par quickrace et lightRunner. Les deux tirent leurs listes de niveaux et de pistes de scenario_quickRaceLoader.getQuickraceList() et ne diffèrent que par le nom du back-end (les restrictions de véhicules et le comportement au départ sont gérés ailleurs). Le résultat de build est destiné à ui_oneshotRaceSelector_core.createBackend.
--- Accès : extension `ui_oneshotRaceSelector_quickRaceTrackDescriptor` : `extensions.load("ui_oneshotRaceSelector_quickRaceTrackDescriptor")`, puis la globale `ui_oneshotRaceSelector_quickRaceTrackDescriptor`
---@class ui_oneshotRaceSelector_quickRaceTrackDescriptor
ui_oneshotRaceSelector_quickRaceTrackDescriptor = {}

--- Renvoie la table descriptor (backendName, middlePathKey = "tracks", clés de titre quickrace, getLevels, getMiddleItems, middleName, noms d'affichage, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) pour le back-end nommé.
---Source : lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua:21
---@param backendName string Nom du back-end ; sert aussi de base au fichier de sauvegarde des options d'affichage.
---@return table  Descriptor à passer à ui_oneshotRaceSelector_core.createBackend.
function ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName) end

