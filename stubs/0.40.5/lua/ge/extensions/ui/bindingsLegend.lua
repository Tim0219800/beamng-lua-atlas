---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/bindingsLegend.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente l'app « légende des commandes » (bindings legend) de l'interface. Elle regroupe des jeux d'actions (nommés par un label et classés par priorité) et les envoie à l'UI via `setActionsForLegend` : actions liées aux modificateurs maintenus (Shift, Ctrl, Alt, modifier1 à 6), actions propres au véhicule, commandes de conduite de base et actions constantes. Un moddeur ou un autre module s'en sert pour afficher ses propres actions à l'écran avec addActions. Dépend de `core_input_actions` et `core_input_bindings`.
--- Accès : extension `ui_bindingsLegend` : `extensions.load("ui_bindingsLegend")`, puis la globale `ui_bindingsLegend`
---@class ui_bindingsLegend
---@field dependencies table<integer, string> Extensions chargées avant : core_input_actions et core_input_bindings.
ui_bindingsLegend = {}

--- Ajoute (ou remplace) un jeu d'actions affiché dans la légende, puis envoie les données à l'UI. Un jeu vide supprime simplement l'ancien jeu de même label.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:754
---@param label string Nom du jeu d'actions (clé de remplacement).
---@param actions table<integer, table> Actions ; chaque entrée a au moins `action` (nom de l'action d'entrée) et éventuellement `label`, `inputActionOnClick`.
---@param additionalData table|nil Options : priority, ttl, removeIfOverwrittenWithHigherPriority, resetFade, modifiersActive…
function ui_bindingsLegend.addActions(label, actions, additionalData) end

--- Active ou désactive l'affichage des actions propres au véhicule (priorité 10). Sans effet si l'app est masquée dans les réglages, si l'état demandé est déjà actif, ou si le véhicule n'a pas de telles actions.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:925
---@param enable boolean true pour afficher.
function ui_bindingsLegend.enableShowVehicleSpecificActions(enable) end

--- Hook appelé quand le filtre d'actions change. Invalide les caches et renvoie les données à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:979
function ui_bindingsLegend.onActionFilterUpdated() end

--- Hook appelé à la fin d'une mission/niveau. Vide les jeux d'actions et les caches, et désenregistre les modes de boîte de vitesses.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:951
function ui_bindingsLegend.onClientEndMission() end

--- Hook appelé au début d'une mission/niveau. Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:948
function ui_bindingsLegend.onClientStartMission() end

--- Hook appelé après un rechargement Lua. Lance un job qui invalide le cache des actions de modificateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1069
---@param data any Données désérialisées (non utilisées).
function ui_bindingsLegend.onDeserialized(data) end

--- Hook appelé quand le périphérique d'entrée change. Invalide les caches et renvoie les données à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1063
function ui_bindingsLegend.onDeviceChanged() end

--- Hook appelé au chargement de l'extension. Lit `ui/bindingAppActions.json` et calcule les actions disponibles du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1050
function ui_bindingsLegend.onExtensionLoaded() end

--- Hook appelé quand les touches modificatrices maintenues changent. Cherche, parmi les bindings des périphériques récents, les actions dont les modificateurs correspondent exactement et les affiche comme jeu `modified` (priorité 9).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:791
---@param newModifiers integer Masque de bits : 1 Shift G, 2 Shift D, 4 Ctrl G, 8 Ctrl D, 16 Alt G, 32 Alt D, 64 à 2048 modifier1 à modifier6.
function ui_bindingsLegend.onModifierChanged(newModifiers) end

--- Hook appelé quand les réglages changent. Réinitialise la signature des commandes de base et renvoie les données à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:996
function ui_bindingsLegend.onSettingsChanged() end

--- Hook appelé à chaque frame. Avance le minuteur de fade, rafraîchit les commandes de conduite de base (changement de mode de boîte), décompte le `ttl` des jeux d'actions et affiche la fenêtre de debug. Sort tôt s'il n'y a pas de véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:869
---@param dtReal number Delta de temps réel en secondes.
---@param dtSim number Delta de temps de simulation en secondes (non utilisé).
---@param dtRaw number Delta brut en secondes (non utilisé).
function ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un véhicule est réinitialisé. Même fonction que onVehicleSpawned : si c'est le véhicule du joueur 0 (ou sans id), invalide les caches et renvoie les données à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId integer Id du véhicule.
function ui_bindingsLegend.onVehicleResetted(vehId) end

--- Hook appelé quand un véhicule est créé. Voir onVehicleResetted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId integer Id du véhicule.
function ui_bindingsLegend.onVehicleSpawned(vehId) end

--- Hook appelé quand le véhicule contrôlé change. Recalcule les actions du véhicule et, s'il en a, les affiche brièvement (jeu `vehicleSpecific`, ttl 10 s) avec un message d'aide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1027
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Joueur concerné (non utilisé).
function ui_bindingsLegend.onVehicleSwitched(oldId, newId, player) end

--- Remet à zéro le minuteur de masquage de la légende.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:107
function ui_bindingsLegend.resetFade() end

--- Fusionne les jeux d'actions (en gardant ceux de plus haute priorité), ajoute infos de modificateurs et état `showApp`, puis envoie le tout à l'UI par le hook `setActionsForLegend`.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:630
---@param forceResetFade boolean|nil Force la remise à zéro du délai de masquage.
function ui_bindingsLegend.sendDataToUI(forceResetFade) end

--- Active ou désactive la fenêtre ImGui « BindingsLegend Debug » (délai de masquage, état de fade).
---Source : lua/ge/extensions/ui/bindingsLegend.lua:82
---@param enabled boolean true pour afficher la fenêtre.
function ui_bindingsLegend.setDebug(enabled) end

--- Active ou désactive l'affichage des commandes de conduite de base (jeu `basicDriving`), mis à jour selon le mode de boîte de vitesses.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:901
---@param enable boolean true pour activer.
function ui_bindingsLegend.setShowBasicDrivingControls(enable) end

--- Affiche deux messages UI (`Message`, 10 s) indiquant comment afficher les actions du véhicule, un pour manette et un pour clavier. Ignoré pendant l'expérience de première conduite ou si l'app est masquée.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1007
function ui_bindingsLegend.showToggleVehicleSpecificActionsMessage() end

--- Bascule le réglage `bindingsLegendShowApp`, masque les actions du véhicule, remet le minuteur à zéro et renvoie les données à l'UI.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1075
function ui_bindingsLegend.toggleShowApp() end

--- Affiche ou masque les actions propres au véhicule du joueur.
---Source : lua/ge/extensions/ui/bindingsLegend.lua:944
function ui_bindingsLegend.toggleShowVehicleSpecificActions() end

--- Exécute une action d'entrée comme si elle était déclenchée, sur le véhicule du joueur 0 (appelée depuis l'UI quand on clique une action).
---Source : lua/ge/extensions/ui/bindingsLegend.lua:1058
---@param action string Nom de l'action d'entrée.
---@param value number|nil Valeur transmise à `core_input_actions.executeCommand`.
function ui_bindingsLegend.triggerInputAction(action, value) end

