---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/policeInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui alimente l'interface des poursuites de police : elle lit gameplay_police.getPursuitData à chaque frame GUI et publie le flux 'policePursuit' (niveau, visibilité, jauges d'arrestation et de fuite, durée, drapeaux). Elle pousse aussi des alertes (PoliceAlertPush / PoliceAlertClear) pour les infractions et pour la fin de poursuite. Par défaut elle suit le véhicule du joueur, sauf si M.targetId est défini.
--- Accès : extension `ui_policeInfo` : `extensions.load("ui_policeInfo")`, puis la globale `ui_policeInfo`
---@class ui_policeInfo
---@field enabled boolean Défaut true. Mettre à false pour désactiver les mises à jour et alertes automatiques.
---@field showFinalStats boolean Défaut true. Mettre à false pour ne pas afficher le récapitulatif (score, infractions, unités) en fin de poursuite.
---@field targetId integer|nil Si défini, utilise les données de poursuite de ce véhicule au lieu de celles du joueur.
ui_policeInfo = {}

--- Indique si une poursuite est ou a été active (état de liveData > 0, y compris l'écran de fin).
---Source : lua/ge/extensions/ui/policeInfo.lua:40
---@return boolean  true si state > 0.
function ui_policeInfo.isPursuit() end

--- Hook appelé à chaque frame GUI : lit les données de poursuite, met à jour niveau, visibilité, jauges, durée (format m:ss ou h:mm:ss) et drapeaux, puis publie 'policePursuit'. Ne fait rien si be:getEnabled() est faux ou si l'extension est désactivée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:154
---@param dt number Delta de temps en secondes (non utilisé).
function ui_policeInfo.onGuiUpdate(dt) end

--- Hook appelé pour une action de poursuite. Sur 'arrest' ou 'evade' : passe en état 2, met la jauge correspondante à 1, efface les alertes et affiche soit le récapitulatif (score, nombre d'infractions, barrages ou unités de police), soit un simple échec/succès selon showFinalStats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:77
---@param vehId integer Véhicule concerné.
---@param action string 'arrest' ou 'evade' (les autres actions sont ignorées).
---@param data table Non utilisé.
function ui_policeInfo.onPursuitAction(vehId, action, data) end

--- Hook appelé quand une infraction est commise pendant une poursuite ; pousse une alerte de 3 s (texte ui.apps.police.offenseAlert avec le nom traduit ui.traffic.infractions.<name>) si le véhicule est la cible ou le joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:64
---@param vehId integer Véhicule en infraction.
---@param name string Nom de l'infraction.
---@param data table Données supplémentaires (non utilisées).
function ui_policeInfo.onPursuitOffense(vehId, name, data) end

--- Hook appelé quand les statistiques de fin de poursuite sont terminées ; remet la table à zéro si on est en état 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:144
function ui_policeInfo.onPursuitStatsEnded() end

--- Hook appelé quand l'interface change d'état ; remet la table à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:150
function ui_policeInfo.onUiChangedState() end

--- Hook appelé au changement de véhicule contrôlé ; remet la table à zéro si l'extension est activée et sans targetId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/policeInfo.lua:58
---@param _ any Ignoré (déduit du code).
---@param id integer Id du nouveau véhicule (non utilisé).
function ui_policeInfo.onVehicleSwitched(_, id) end

--- Remet à zéro tous les nombres et drapeaux de liveData, efface les alertes (PoliceAlertClear) et republie le flux 'policePursuit'.
---Source : lua/ge/extensions/ui/policeInfo.lua:44
function ui_policeInfo.resetPursuitTable() end

