---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/freeroam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la session multi-sièges (écran partagé) en balade libre : choix des véhicules suggérés, plan d'apparition (positions du niveau, sinon groupe de places de parking proches, sinon route), ouverture des réglages multiseat, activation/désactivation du split screen et du trafic, sortie vers le mode solo, et restauration après rechargement de l'interface (Lua/UI). Un niveau peut fournir mainLevel.getMultiseatSuggestedVehicles(playerCount) et mainLevel.getMultiseatSpawnPositions(playerCount), ou multiseat.suggestedVehicles dans info.json.
--- Accès : extension `ui_multiseat_freeroam` : `extensions.load("ui_multiseat_freeroam")`, puis la globale `ui_multiseat_freeroam`
---@class ui_multiseat_freeroam
---@field dependencies table<integer, string> Extensions chargées avant : gameplay_city, gameplay_parking, gameplay_traffic, ui_multiseat_multiseatSettings, ui_multiseat_multiseatVehicles.
ui_multiseat_freeroam = {}

--- Charge gameplay_multiseat_gamemodeManager et marque la session freeroam multiseat comme active.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:109
function ui_multiseat_freeroam.activate() end

--- Marque la session comme inactive et annule toute restauration en attente.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:114
function ui_multiseat_freeroam.deactivate() end

--- Revient au freeroam solo : arrête le gamemode multiseat, applique éventuellement un cache d'affectations (options.assignmentCache), arrête les courses de drag et un crawl hors mission, supprime tous les véhicules sauf celui du joueur 0, vide la session, coupe multiseat et rend le véhicule au joueur 0 avec la caméra de jeu.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:191
---@param options table|nil Options ; assignmentCache = affectations de joueurs à mettre en cache avant la sortie.
---@return boolean  false si la session n'était pas active ou si le cache n'a pas pu être enregistré, sinon true.
function ui_multiseat_freeroam.exitMultiseat(options) end

--- Indique si la session freeroam multiseat est active.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:119
---@return boolean  true si active.
function ui_multiseat_freeroam.isActive() end

--- Hook appelé à la fin du niveau ; désactive la session et annule toute restauration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:343
function ui_multiseat_freeroam.onClientEndMission() end

--- Hook appelé après un rechargement Lua ; si le marqueur restoreAsFreeroam est présent, appelle restoreAfterReload.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:295
---@param data table Données renvoyées par onSerialize.
function ui_multiseat_freeroam.onDeserialized(data) end

--- Hook appelé quand les réglages multiseat ont été appliqués. Active la session ; avec plus d'un joueur, charge render_splitScreen, lui donne les joueurs et ajoute les joueurs aux sources de trafic ; avec un seul joueur, décharge split screen et trafic. Ferme ensuite le menu. Sans effet si result.success == false ou result.exitAfterApply == true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:164
---@param changeSet table Changements appliqués (non utilisé ici).
---@param result table Résultat de l'application (success, exitAfterApply).
function ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result) end

--- Hook appelé à la fermeture des réglages multiseat ; ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:250
function ui_multiseat_freeroam.onMultiseatSettingsClosed() end

--- Hook du rail d'accueil du menu pause : ajoute les boutons « home.changeMultiseatSettings » (ouvre pause.multiseatSettings) et « home.exitMultiseat » (confirmation, puis exitMultiseat et retour à « play »). Rien n'est ajouté si ni la session ni un gamemode multiseat n'est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:253
---@param actions table Liste d'actions à compléter.
---@param _context table Contexte (non utilisé).
---@param registerButton function Fonction qui enregistre un bouton et son callback.
function ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton) end

--- Hook appelé avant un rechargement Lua ; renvoie {restoreAsFreeroam = true} si une session est active, sinon rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:280
---@param reason string Raison de la sérialisation (log).
---@return table|nil  Marqueur de restauration.
function ui_multiseat_freeroam.onSerialize(reason) end

--- Hook appelé quand l'interface est prête ; si une restauration est en attente, rétablit multiseat, le split screen, le trafic et recharge la route UI « multiseat » (définie comme route de jeu).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:304
function ui_multiseat_freeroam.onUiReady() end

--- Démarre une configuration multiseat (source « settings ») et navigue vers la route « pause.multiseatSettings ». Si la navigation échoue, la configuration est abandonnée.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:155
---@return boolean  false si la navigation a échoué, sinon true.
function ui_multiseat_freeroam.openSettings() end

--- Marque la session active et met en file une restauration, exécutée au prochain onUiReady.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:123
function ui_multiseat_freeroam.restoreAfterReload() end

--- Lance le freeroam en écran partagé : attribue à chaque joueur inscrit un véhicule suggéré pour le niveau, construit un plan d'apparition (niveau, puis parking, sinon route), fait apparaître les véhicules et active la session en cas de succès. En cas d'échec d'apparition, les véhicules sont retirés.
---Source : lua/ge/extensions/ui/multiseat/freeroam.lua:129
---@param levelName string Nom du niveau, utilisé pour trouver les véhicules suggérés.
---@return boolean  true si tout a réussi.
---@return string|nil  Raison de l'échec (voir notes).
function ui_multiseat_freeroam.startSplitscreenFreeroam(levelName) end

