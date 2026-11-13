---@meta
-- tim19Atlas stub generated from lua/vehicle/sensors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Expose les accélérations mesurées au noeud de référence du véhicule (gx, gy, gz) ainsi que leur version lissée (gx2, gy2, gz2). Les valeurs brutes viennent d'une structure FFI fournie par le moteur (obj:getSensorsFFI()) et sont recopiées à chaque updateGFX. Utilisé par l'IA, l'ESC, le freinage post-crash, les jauges et les protocoles de simulateur.
--- Accès : globale `sensors`
---@class sensors
---@field ffiSensors table|number Structure FFI renvoyée par obj:getSensorsFFI() (champs sensorX, sensorY, sensorZnonInertial…). Vaut 0 avant init().
---@field gx number Accélération brute sur l'axe X du capteur (ffiSensors.sensorX).
---@field gx2 number gx lissé temporellement (lissage non linéaire, paramètre 7).
---@field gy number Accélération brute sur l'axe Y du capteur (ffiSensors.sensorY).
---@field gy2 number gy lissé temporellement.
---@field gz number Accélération brute verticale hors inertie (ffiSensors.sensorZnonInertial).
---@field gz2 number gz lissé temporellement.
sensors = {}

--- Récupère la structure FFI des capteurs auprès du moteur puis appelle reset(). Appelée au chargement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sensors.lua:36
function sensors.init() end

--- Remet à zéro les trois lisseurs temporels. Appelée à la réinitialisation du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sensors.lua:19
function sensors.reset() end

--- Copie les accélérations brutes depuis ffiSensors dans gx/gy/gz et met à jour les valeurs lissées gx2/gy2/gz2. Appelée à chaque frame graphique par la boucle principale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sensors.lua:25
---@param dt number Pas de temps de la frame en secondes.
function sensors.updateGFX(dt) end

