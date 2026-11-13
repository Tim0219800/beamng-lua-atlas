---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/vibrationDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_vibrationDebug` : fenêtre ImGui de debug « Vibration Debug » pour régler en direct les paramètres des vibrations de manette (haptics) du véhicule du joueur. Chaque champ modifié envoie une commande à l'extension haptics côté véhicule. Utile pour tester le retour de force, pas pour une API durable.
--- Accès : extension `core_input_vibrationDebug` : `extensions.load("core_input_vibrationDebug")`, puis la globale `core_input_vibrationDebug`
---@class core_input_vibrationDebug
core_input_vibrationDebug = {}

--- Hook par image : dessine la fenêtre ImGui et envoie au véhicule joueur 0 les nouvelles valeurs de multiplicateur de force (glissement des roues, à-coups) et de seuils minimaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/vibrationDebug.lua:14
function core_input_vibrationDebug.onUpdate() end

--- Hook au changement de véhicule : remet les champs de la fenêtre à leurs valeurs par défaut (multiplicateurs 1, wheelSlipMin 4, jerkMin 30) sans les renvoyer au véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/vibrationDebug.lua:34
function core_input_vibrationDebug.onVehicleSwitched() end

