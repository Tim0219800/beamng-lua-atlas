---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/missionInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la fenêtre d'information de mission et l'invite d'activité (« activity accept ») affichée en jeu. Il mémorise les boutons actifs, envoie le contenu à l'interface par guihooks, joue le son d'ouverture, suit l'état ouvert/fermé et émet les hooks correspondants. Il bloque aussi, pendant l'invite sur la route « play », les actions qui partagent les mêmes touches que gameplay_interact.
--- Accès : extension `ui_missionInfo` : `extensions.load("ui_missionInfo")`, puis la globale `ui_missionInfo`
---@class ui_missionInfo
---@field buttonsTable table|nil Boutons/fonctions du dialogue courant (indexés par action ou par numéro selon le type d'ouverture).
---@field openState string|nil « opened » ou « closed » ; nil avant la première ouverture.
ui_missionInfo = {}

--- Ferme la fenêtre/l'invite : dépile MissionUIActionMap, vide buttonsTable, lève le blocage des actions, envoie MissionInfoUpdate(nil) et ActivityAcceptClose, passe à l'état « closed ».
---Source : lua/ge/extensions/ui/missionInfo.lua:82
function ui_missionInfo.closeDialogue() end

--- Hook appelé après un changement de route de l'interface ; active le blocage des actions en conflit seulement si l'invite a du contenu et que la route est « play ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/missionInfo.lua:109
---@param routeEntry table Entrée de route (resolved.name).
function ui_missionInfo.onAfterRouteChange(routeEntry) end

--- Hook appelé quand les liaisons de touches changent ; recalcule le filtre d'actions si le blocage est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/missionInfo.lua:105
function ui_missionInfo.onInputBindingsChanged() end

--- Affiche l'invite d'activités : mémorise elem.buttonFun et elem.data de chaque élément, active ou non le blocage des actions en conflit, émet onActivityAcceptUpdate puis ActivityAcceptUpdate et passe à l'état « opened ».
---Source : lua/ge/extensions/ui/missionInfo.lua:58
---@param content table Liste d'éléments {buttonFun, data, ...} ; vide pour retirer l'invite.
function ui_missionInfo.openActivityAcceptDialogue(content) end

--- Ouvre la fenêtre d'information : pousse l'action map MissionUIActionMap (sauf si content.actionMap == false), mémorise content.buttons, envoie MissionInfoUpdate à l'UI et joue le son UI>Missions>Info_Open.
---Source : lua/ge/extensions/ui/missionInfo.lua:38
---@param content table|nil Contenu à afficher, avec éventuellement buttons et actionMap.
function ui_missionInfo.openDialogue(content) end

--- Cherche dans buttonsTable le bouton dont action vaut actionName et exécute sa commande Lua (button.cmd).
---Source : lua/ge/extensions/ui/missionInfo.lua:26
---@param actionName string Nom de l'action du bouton.
function ui_missionInfo.performAction(actionName) end

--- Appelle la fonction du bouton d'index id dans buttonsTable (rien si elle n'existe pas).
---Source : lua/ge/extensions/ui/missionInfo.lua:51
---@param id integer Index du bouton (missionInfoPerformActionIndex de l'élément).
function ui_missionInfo.performActivityAction(id) end

--- Signale quel élément de l'invite est visible : émet onActivityIndexVisible avec ses données, ou nil si index vaut -1.
---Source : lua/ge/extensions/ui/missionInfo.lua:96
---@param index integer Index à partir de 0 côté interface (-1 pour aucun) ; converti en index Lua +1.
function ui_missionInfo.setActivityIndexVisible(index) end

