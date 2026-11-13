---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/other.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des petites fonctionnalités de gameplay qui n'ont pas leur propre suiveur : le constructeur de pistes (activité « trackBuilder ») et le taxi (évènement « taxiCalled » et activité « taxiRide »). La durée d'une session ou d'une course est portée par l'activité.
--- Accès : extension `telemetry_trackers_gameplay_other` : `extensions.load("telemetry_trackers_gameplay_other")`, puis la globale `telemetry_trackers_gameplay_other`
---@class telemetry_trackers_gameplay_other
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_other = {}

--- Hook appelé à la fermeture du jeu : ferme les activités ouvertes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExit() end

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:64
function telemetry_trackers_gameplay_other.onExtensionLoaded() end

--- Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc les activités sont fermées ici aussi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExtensionUnloaded() end

--- Hook appelé quand le joueur appelle un taxi : émet taxiCalled avec le résultat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:34
---@param result string dispatched, noTaxiAvailable ou tooFarFromRoad.
function telemetry_trackers_gameplay_other.onTaxiCalled(result) end

--- Hook appelé à la fin d'une course : termine l'activité taxiRide avec les données reçues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:53
---@param data table {reason, phase, distances…}
function telemetry_trackers_gameplay_other.onTaxiRideEnded(data) end

--- Hook appelé au début d'une course : démarre l'activité taxiRide (appelé ou non, mode carrière ou non, niveau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:42
---@param called boolean false pour un taxi hélé au bord de la route.
function telemetry_trackers_gameplay_other.onTaxiRideStarted(called) end

--- Hook appelé à l'ouverture/fermeture de la fenêtre du constructeur de pistes : démarre ou termine l'activité trackBuilder (avec le niveau courant).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:20
---@param open boolean true si la fenêtre est ouverte.
function telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open) end

