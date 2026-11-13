---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/firstDrive/moveOff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Didacticiel « démarrer et rouler » de l'expérience First Drive. Une fois activé, il suit le véhicule du joueur 0 (accélérateur, frein, embrayage, rapport, moteur, régime, vitesse des roues, lus via core_vehicleBridge) et affiche dans l'application « moveOff » du conteneur « topCenter » les touches à utiliser pour chaque étape : allumer le moteur, démarrer, s'arrêter, faire marche arrière, couper le moteur. Les instructions dépendent du mode de boîte : arcade, manuelle réaliste avec embrayage automatique, ou manuelle réaliste.
--- Accès : extension `ui_firstDrive_moveOff` : `extensions.load("ui_firstDrive_moveOff")`, puis la globale `ui_firstDrive_moveOff`
---@class ui_firstDrive_moveOff
---@field dependencies string[] Extensions chargées avant celle-ci : ui_appContainers.
ui_firstDrive_moveOff = {}

--- Indique si le didacticiel est actif.
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:654
---@return boolean  true si actif.
function ui_firstDrive_moveOff.getEnabled() end

--- Renvoie la dernière instruction publiée (label, steps, sectionIndex, sectionCount, active), ou nil si rien n'est affiché.
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:588
---@return table|nil  Dernier état envoyé à l'interface.
function ui_firstDrive_moveOff.getState() end

--- Hook appelé à la fin du niveau : désactive le didacticiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:649
function ui_firstDrive_moveOff.onClientEndMission() end

--- Hook appelé au déchargement de l'extension : désactive le didacticiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:645
function ui_firstDrive_moveOff.onExtensionUnloaded() end

--- Hook appelé quand les réglages changent. Si actif, relance le suivi du véhicule après 0,1 s, ce qui relit le mode de boîte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:636
function ui_firstDrive_moveOff.onSettingsChanged() end

--- Hook appelé à chaque image avec dtReal (secondes réelles). Reconfigure le suivi si le véhicule du joueur change, attend la fin des délais, calcule l'instruction courante, la publie à l'interface si elle a changé et émet onFirstDriveMoveOffSectionCompleted quand une section vient d'être validée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:592
---@param dtReal number Durée réelle de l'image en secondes.
function ui_firstDrive_moveOff.onUpdate(dtReal) end

--- Hook appelé quand un véhicule est détruit : arrête le suivi si c'est le véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:632
---@param vehicleId integer Identifiant du véhicule détruit.
function ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId) end

--- Hook appelé quand un véhicule est remplacé ; même traitement que onVehicleDestroyed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:632
---@param vehicleId integer Identifiant du véhicule remplacé.
function ui_firstDrive_moveOff.onVehicleReplaced(vehicleId) end

--- Hook appelé quand le véhicule du joueur change. Relance le suivi sur le nouveau véhicule (ignoré si inactif ou si player n'est pas 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:627
---@param _ any Identifiant de l'ancien véhicule (non utilisé).
---@param newVehicleId integer|nil Identifiant du nouveau véhicule.
---@param player integer|nil Indice du joueur concerné.
function ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player) end

--- Active ou désactive le didacticiel. À l'activation, commence à suivre le véhicule du joueur 0 (abonnements aux valeurs throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed) ; à la désactivation, désabonne, cache l'application et envoie { active = false }. Sans effet si l'état ne change pas.
---Source : lua/ge/extensions/ui/firstDrive/moveOff.lua:576
---@param value boolean Seul true active ; toute autre valeur désactive.
function ui_firstDrive_moveOff.setEnabled(value) end

