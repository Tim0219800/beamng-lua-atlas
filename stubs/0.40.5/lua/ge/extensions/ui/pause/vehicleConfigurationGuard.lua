---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garde de sortie de l'écran de configuration véhicule du menu pause. Quand l'UI signale des modifications non appliquées (setHasPendingChanges), toute navigation hors de l'écran est interceptée par confirmExit : un dialogue de confirmation (Annuler / Abandonner / Appliquer) est affiché et la navigation est mise en attente, puis reprise une fois la décision prise. Utile à un moddeur qui ajoute une sous-route de configuration ou veut comprendre pourquoi une navigation est bloquée.
--- Accès : extension `ui_pause_vehicleConfigurationGuard` : `extensions.load("ui_pause_vehicleConfigurationGuard")`, puis la globale `ui_pause_vehicleConfigurationGuard`
---@class ui_pause_vehicleConfigurationGuard
ui_pause_vehicleConfigurationGuard = {}

--- Callback du bouton Annuler : oublie la navigation en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:83
function ui_pause_vehicleConfigurationGuard.cancelExit() end

--- Appelée avant de quitter l'écran. Renvoie true (navigation autorisée) si le contournement est actif, s'il n'y a pas de changement en attente, si le nom de route est invalide ou s'il s'agit d'une sous-route de la configuration. Sinon mémorise la navigation demandée, affiche le dialogue showConfirmationDialog (boutons Annuler, Abandonner, Appliquer) et renvoie false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:39
---@param route table|any Route cible ; son champ name sert si context.routeName est absent
---@param params table|nil Paramètres de navigation à rejouer plus tard
---@param context table|nil Contexte du routeur : routeName et options (déduit du code)
---@return boolean  true si la navigation peut continuer, false si elle est suspendue en attendant le dialogue
function ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) end

--- Callback du bouton Appliquer : déclenche l'évènement UI VehicleConfigurationCombinedApplyAndExit. L'arbre de pièces et le tuning en attente vivent dans l'UI, qui les applique puis rappelle resumePendingExit().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:94
function ui_pause_vehicleConfigurationGuard.confirmExitApplying() end

--- Callback du bouton Abandonner : reprend la navigation en attente sans appliquer les changements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:88
---@return any  Résultat de la navigation rejouée, ou false s'il n'y avait rien en attente
function ui_pause_vehicleConfigurationGuard.confirmExitDiscarding() end

--- Navigue vers la route de retour : core_vehicle_configTarget.getReturnRoute() si l'extension est chargée, sinon « pause.vehicle ». Utilise l'option restoreLastScope = true.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:21
---@return any  Résultat de ui_router.navigate
function ui_pause_vehicleConfigurationGuard.navigateBack() end

--- Rejoue la navigation mise en attente en contournant la confirmation. Renvoie false s'il n'y a aucune navigation en attente.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:98
---@return any  Résultat de ui_router.navigate, ou false
function ui_pause_vehicleConfigurationGuard.resumePendingExit() end

--- Indique si l'écran de configuration contient des modifications non appliquées. Toute valeur différente de true est convertie en false.
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:17
---@param value boolean true s'il y a des changements en attente
function ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value) end

