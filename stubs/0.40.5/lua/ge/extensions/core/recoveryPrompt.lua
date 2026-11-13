---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/recoveryPrompt.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Menu de « recovery » du joueur (remorquer sur la route, remettre sur les roues, réparer, retourner au garage, voyage rapide, réinitialiser le véhicule, recommencer ou valider une mission, rendre un véhicule de livraison ou de prêt). Il tient une table de boutons (buttonOptions) avec type de cible (vehicle, walk, none), conditions d'inclusion et d'activation, prix et fonction exécutée pendant un fondu d'écran. Les boutons sont exposés dans le menu radial (core_quickAccess) et dans les rails du menu pause. Un moddeur ajoute ses propres boutons avec addButton et pilote lesquels sont actifs.
--- Accès : extension `core_recoveryPrompt` : `extensions.load("core_recoveryPrompt")`, puis la globale `core_recoveryPrompt`
---@class core_recoveryPrompt
core_recoveryPrompt = {}

--- Ajoute un bouton personnalisé (type 'none' implicite car pas de champ type : il n'apparaît que dans la liste des cibles 'none'). Refuse d'écraser un bouton intégré.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:535
---@param id string Identifiant unique.
---@param label string|nil Clé de traduction ; défaut 'ui.career.recovery.noLabel'.
---@param atFadeFunction function|nil Fonction exécutée pendant le fondu ; reçoit la cible {type, vehId}.
---@param order number|nil Ordre d'affichage ; défaut = plus grand ordre existant + 1.
---@param message string|nil Clé de traduction du message affiché après l'action.
---@param active boolean|nil Actif, true par défaut.
---@param enabled boolean|function|nil Cliquable.
---@param fadeActive boolean|nil Jouer un fondu d'écran, true par défaut.
---@param icon string|nil Nom d'icône.
function core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon) end

--- Exécute le processus de recovery pour un bouton : snapshot de pièces éventuel, puis fondu d'écran (son de début puis ui_fadeScreen.start) avant l'action, ou action immédiate si fadeActive est faux.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:642
---@param buttonId string Identifiant du bouton.
---@param target {type: string, vehId: integer|nil} Cible : type 'vehicle', 'walk' ou 'none', et vehId pour un véhicule.
function core_recoveryPrompt.buttonPressed(buttonId, target) end

--- Désactive tous les boutons (le menu reste dans son état).
---Source : lua/ge/extensions/core/recoveryPrompt.lua:507
function core_recoveryPrompt.deactivateAllButtons() end

--- Restaure l'état produit par serializeState.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:629
---@param data table {active, buttons}.
function core_recoveryPrompt.deserializeState(data) end

--- Indique si un bouton est actif.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:514
---@param id string Identifiant du bouton.
---@return boolean|nil  nil si l'id est inconnu.
function core_recoveryPrompt.getButtonActiveById(id) end

--- Renvoie la limite et le compteur de chaque bouton.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:606
---@return table<string, {limit: integer|nil, count: integer|nil}>  Par id de bouton.
function core_recoveryPrompt.getButtonLimitsAndCounts() end

--- Renvoie une liste nettoyée des options de recovery (actives ou non) : active, enabled, label (traduit si texte), icon, isRecoveryOption.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:978
---@return table<string, table>  Par id de bouton.
function core_recoveryPrompt.getCustomRecoveryOptionsActiveState() end

--- Boutons du rail droit du menu pause en carrière : flipUpright et towToRoad pour le véhicule du joueur.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:863
---@return table[]  Boutons triés par ordre.
function core_recoveryPrompt.getPauseCareerRightRailButtons() end

--- Boutons à afficher dans le rail droit du menu pause en mission : restartMission, flipMission, recoverMission, towToRoad (cibles véhicule joueur et none). Chaque entrée : id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:841
---@return table[]  Boutons triés par ordre.
function core_recoveryPrompt.getPauseMissionRightRailButtons() end

--- Exécute l'option de recovery en cours (appelée à la fin du fondu) : hook onRecoveryPromptButtonPressed, atFadeFunction, compteur, message, fin du fondu et rechargement du routeur UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:669
function core_recoveryPrompt.handleCurrRecoveryOption() end

--- Indique si le menu de recovery est actif globalement.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:472
---@return boolean  État actif.
function core_recoveryPrompt.isActive() end

--- Hook appelé avant l'ouverture du menu radial : à la première fois, enregistre les entrées de recovery dans core_quickAccess (racine, quickTravel/, towing/).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:960
function core_recoveryPrompt.onBeforeRadialOpened() end

--- Hook de chargement : construit la table des boutons (setupButtonOptions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:955
function core_recoveryPrompt.onExtensionLoaded() end

--- Hook : le menu radial est fermé, les données du popup sont effacées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:969
function core_recoveryPrompt.onHideRadialMenu() end

--- Hook de fermeture du popup : oublie l'option courante et les données du popup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:663
function core_recoveryPrompt.onPopupClosed() end

--- Hook : core_quickAccess a été rechargé, les entrées devront être ré-enregistrées à la prochaine ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:973
function core_recoveryPrompt.onQuickAccessLoaded() end

--- Hook appelé à la réinitialisation du gameplay : si le menu est actif et qu'aucune recovery n'est en cours, ouvre le menu rapide (core_quickAccess) sur la racine carrière, mission ou quick selon le contexte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:879
---@param playerID integer Joueur concerné (non utilisé).
function core_recoveryPrompt.onResetGameplay(playerID) end

--- Hook de ui_fadeScreen : à chaque changement d'état, appelle handleCurrRecoveryOption (qui ne fait rien s'il n'y a pas de demande en cours).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryPrompt.lua:699
---@param state any État du fondu (non utilisé).
function core_recoveryPrompt.onScreenFadeState(state) end

--- Supprime un bouton personnalisé. Refusé pour les boutons intégrés.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:565
---@param id string Identifiant du bouton.
function core_recoveryPrompt.removeButtonById(id) end

--- Remet à 0 le compteur d'utilisations des boutons.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:598
---@param onlyFor table<string, boolean>|nil Ensemble d'ids concernés ; nil = tous.
function core_recoveryPrompt.resetButtonLimitCounters(onlyFor) end

--- Sérialise l'état (actif global et état actif de chaque bouton) pour la sauvegarde.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:619
---@return {active: boolean, buttons: table<string, boolean>}  État.
function core_recoveryPrompt.serializeState() end

--- Active ou désactive le menu de recovery globalement.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:473
---@param a boolean Nouvel état.
function core_recoveryPrompt.setActive(a) end

--- Active ou désactive un bouton. Journalise un avertissement si l'id est inconnu.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:509
---@param id string Identifiant du bouton.
---@param a boolean Actif ou non.
function core_recoveryPrompt.setButtonActiveById(id, a) end

--- Change l'état enabled d'un bouton ; si e est vrai, le bouton devient aussi actif.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:519
---@param id string Identifiant du bouton.
---@param e boolean Enabled.
function core_recoveryPrompt.setButtonEnabledById(id, e) end

--- Définit le nombre d'utilisations maximum par bouton (réinitialise toutes les limites d'abord ; -1 = illimité). Quand une limite existe, le libellé affiche les utilisations restantes.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:587
---@param limits table<string, integer>|nil Id de bouton -> limite.
function core_recoveryPrompt.setButtonLimits(limits) end

--- Réglage carrière : active le menu, ne garde actifs que towToRoad, flipUpright, getFavoriteVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle, et ajoute les boutons de remorquage et de voyage rapide vers les garages du niveau.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:479
function core_recoveryPrompt.setDefaultsForCareer() end

--- Réglage freeroam : désactive le menu et tous les boutons.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:474
function core_recoveryPrompt.setDefaultsForFreeroam() end

--- Réglage tutoriel : active le menu avec seulement towToRoad, repairHere et flipUpright.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:493
function core_recoveryPrompt.setDefaultsForTutorial() end

--- Active le menu et tous les boutons.
---Source : lua/ge/extensions/core/recoveryPrompt.lua:502
function core_recoveryPrompt.setEverythingActive() end

