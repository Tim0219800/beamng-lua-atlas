---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/mirror.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_mirror` : réglage des angles des rétroviseurs d'un véhicule. Lit la liste des miroirs de vdata.mirrors, applique un décalage d'angle (offsetNormal) aux miroirs via veh:getMirror(id), mémorise les réglages par modèle et par config dans settings/mirrorOffsets.json, les réapplique à chaque apparition du véhicule, gère le glisser à la souris (vehicleEvent) et déplace la caméra conducteur vers un miroir (focusOnMirror). Contient aussi une petite fenêtre imgui de debug.
--- Accès : extension `core_vehicle_mirror` : `extensions.load("core_vehicle_mirror")`, puis la globale `core_vehicle_mirror`
---@class core_vehicle_mirror
---@field dependencies string[] {'ui_imgui', 'core_vehicle_configTarget'}
---@field onClientEndMission nil Vaut nil (variable locale non définie, voir notes).
---@field onExtensionUnloaded nil Vaut nil (variable locale non définie, voir notes).
core_vehicle_mirror = {}

--- Passe en caméra conducteur et, si le miroir est hors du champ de vision, oriente la caméra (relativeYaw/relativePitch) vers lui. Sans nom, restaure l'orientation d'avant la mise au point.
---Source : lua/ge/extensions/core/vehicle/mirror.lua:250
---@param mirror_name string|nil nom du mesh du miroir ; nil = revenir à l'orientation précédente
function core_vehicle_mirror.focusOnMirror(mirror_name) end

--- Liste les miroirs du véhicule avec leur décalage d'angle actuel (réglage mémorisé ou 0) et leurs bornes.
---Source : lua/ge/extensions/core/vehicle/mirror.lua:73
---@param vid integer|nil id du véhicule ; nil = celui de `v`
---@param v userdata|nil objet véhicule ; nil = véhicule configuré
---@return table<string, table>  [nomMesh] = {name, id, angleOffset = {x, z}, clampX, clampZ, position (UiColumn), icon, row (UiRow), label} ; {} si pas de miroirs
function core_vehicle_mirror.getAnglesOffset(vid, v) end

--- Hook : restaure la fenêtre de debug et recalcule le ratio d'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:49
---@param data table données de onSerialize
function core_vehicle_mirror.onDeserialized(data) end

--- Hook : charge les réglages depuis settings/mirrorOffsets.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:297
function core_vehicle_mirror.onExtensionLoaded() end

--- Hook : sauvegarde l'état d'ouverture de la fenêtre de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:43
---@return table  {windowOpen}
function core_vehicle_mirror.onSerialize() end

--- Hook : recalcule le ratio degrés/pixel de la souris d'après la résolution (20° sur la moyenne largeur+hauteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:54
function core_vehicle_mirror.onSettingsChanged() end

--- Hook par frame : applique le glisser souris en cours et affiche la fenêtre de debug si ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:166
---@param dtReal number temps réel (s)
---@param dtSim number temps de simulation (s)
---@param dtRaw number temps brut (s)
function core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : un véhicule est détruit (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:59
---@param vid integer véhicule
function core_vehicle_mirror.onVehicleDestroyed(vid) end

--- Hook : un véhicule apparaît ; réapplique les réglages mémorisés de tous ses miroirs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/mirror.lua:62
---@param vid integer véhicule
---@param veh userdata objet véhicule
function core_vehicle_mirror.onVehicleSpawned(vid, veh) end

--- Applique un décalage d'angle à un miroir (offsetNormal = (0,1,0) tourné de x et z) et mémorise le réglage pour le modèle/la config.
---Source : lua/ge/extensions/core/vehicle/mirror.lua:119
---@param mirrorName string nom du mesh du miroir
---@param x number angle X en degrés
---@param z number angle Z en degrés
---@param v userdata|nil véhicule ; nil = véhicule configuré
---@param save boolean|nil true : écrit settings/mirrorOffsets.json
function core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save) end

--- Ouvre ou ferme la fenêtre imgui « core_vehicle_mirror Debugger » (curseurs X/Z par miroir).
---Source : lua/ge/extensions/core/vehicle/mirror.lua:215
---@param newValue boolean true pour ouvrir
function core_vehicle_mirror.setDebug(newValue) end

--- Évènement de souris sur un miroir dans le monde : 'onDown' commence un réglage par glisser, 'onUp' le termine et sauvegarde. Autre valeur : log d'erreur.
---Source : lua/ge/extensions/core/vehicle/mirror.lua:223
---@param evtType string 'onDown' ou 'onUp'
---@param vid integer véhicule
---@param mirror_name string nom du mesh du miroir
function core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name) end

