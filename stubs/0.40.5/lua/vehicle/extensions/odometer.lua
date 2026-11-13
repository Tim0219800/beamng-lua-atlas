---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/odometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compteur kilométrique 'relatif' pour les statistiques : intègre la distance parcourue à partir de electrics.values.wheelspeed avec un filtre de 'corde' (±5 cm) pour ignorer les oscillations avant/arrière, puis soumet la distance à gameplayStatistic (métriques 'vehicle/odometer/<modèle>.length' et 'vehicle/total_odometer.length'). Ne compte que quand l'IA est désactivée.
--- Accès : extension `odometer` : `extensions.load (VM véhicule)("odometer")`, puis la globale `odometer`
---@class odometer
odometer = {}

--- Renvoie la distance relative cumulée.
---Source : lua/vehicle/extensions/odometer.lua:39
---@return number  Distance en mètres.
function odometer.getRelativeRecording() end

--- Hook de chargement ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/odometer.lua:43
function odometer.onExtensionLoaded() end

--- Hook de reset du véhicule : soumet la distance accumulée aux statistiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/odometer.lua:15
function odometer.onReset() end

--- Prévu pour remettre l'enregistrement à zéro ; ne fait rien (code commenté).
---Source : lua/vehicle/extensions/odometer.lua:35
function odometer.startRecording() end

--- Envoie la distance non encore soumise à gameplayStatistic (conditions décrites dans les notes).
---Source : lua/vehicle/extensions/odometer.lua:46
function odometer.submitStatistic() end

--- Appelé chaque frame : intègre la distance et déclenche l'envoi périodique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/odometer.lua:19
---@param dt number Pas de temps en secondes.
function odometer.updateGFX(dt) end

