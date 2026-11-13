---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Precision Parking ». Un bouton active/désactive le debug ; quand il est actif, le module cherche (toutes les 0,1 s) la place de parking de livraison la plus proche du véhicule joueur (accessPointsByName des deliveryProviders), calcule des données de précision de stationnement et les affiche en ImGui, avec des dessins 3D (sphères, lignes, flèches via debugDrawer).
--- Accès : extension `career_modules_debug_precisionParkingDebug` : `extensions.load("career_modules_debug_precisionParkingDebug")`, puis la globale `career_modules_debug_precisionParkingDebug`
---@class career_modules_debug_precisionParkingDebug
---@field debugName string 'Precision Parking'.
---@field debugOrder number Ordre de tri (10).
career_modules_debug_precisionParkingDebug = {}

--- Dessine le bouton d'activation et, si actif, met à jour puis affiche les données de précision de stationnement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:154
function career_modules_debug_precisionParkingDebug.drawDebugMenu() end

--- Dessine la visualisation 3D de debug si le mode est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:396
function career_modules_debug_precisionParkingDebug.drawDebugVisualization() end

--- Nettoyage quand le debug est désactivé : coupe le mode et vide debugData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:403
function career_modules_debug_precisionParkingDebug.onDebugDisabled() end

