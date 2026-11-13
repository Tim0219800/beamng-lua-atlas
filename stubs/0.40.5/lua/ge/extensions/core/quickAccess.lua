---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/quickAccess.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_quickAccess` : le menu radial (menu rapide) du jeu. Elle garde un arbre de menus (chemins du type '/root/sandbox/other/'), l'assemble à l'ouverture (entrées statiques, générateurs, entrées demandées au véhicule joueur), le positionne sur les 8 emplacements du cercle puis l'envoie à l'interface (guihooks 'radialMenuUpdated', route UI 'radial'). Elle ralentit le temps pendant que le menu est ouvert, mémorise les actions récentes et la configuration des emplacements dynamiques (settings/radialRecentActions.json et settings/radialDynamicSlotSettings.json). Un mod ajoute ses propres boutons avec core_quickAccess.addEntry, de préférence dans le hook onRegisterQuickAccessMenus.
--- Accès : extension `core_quickAccess` : `extensions.load("core_quickAccess")`, puis la globale `core_quickAccess`
---@class core_quickAccess
---@field dependencies string[] { 'core_vehicleTriggers', 'core_funstuff' }, chargées avant cette extension.
core_quickAccess = {}

--- Ajoute (ou remplace, si uniqueID identique au même level) une entrée dans l'arbre du menu radial. Voir notes pour tous les champs. Renvoie false seulement si `level` n'est pas une chaîne ; un avertissement est loggé si l'entrée n'a ni générateur, ni title avec onSelect/goto, mais l'entrée est quand même ajoutée.
---Source : lua/ge/extensions/core/quickAccess.lua:619
---@param _args table { level, generator | (title, onSelect|goto, icon, desc, uniqueID, priority, startSlot, endSlot, ... ) }
---@return boolean  true si ajoutée, false si level invalide.
function core_quickAccess.addEntry(_args) end

--- Callback de l'interface : demande au véhicule joueur d'ajuster la vitesse du régulateur (extension côté véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2480
---@param direction number Positif = augmenter, négatif = diminuer ; 0 ou non-nombre ignoré.
function core_quickAccess.adjustCruiseSpeed(direction) end

--- Revient au niveau précédent (historique), ou au niveau parent selon le chemin si l'historique est vide.
---Source : lua/ge/extensions/core/quickAccess.lua:2182
---@return boolean  true si on a changé de niveau, false sinon (menu fermé ou déjà en haut).
function core_quickAccess.back() end

--- Marque le passage du menu radial vers un écran enfant (ex. radial.mirrors) sans vraie fermeture, et masque temporairement l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2219
function core_quickAccess.beginRouteHandoff() end

--- Efface l'historique des actions récentes et émet onQuickAccessClearRecentActions.
---Source : lua/ge/extensions/core/quickAccess.lua:2279
function core_quickAccess.clearRecentActions() end

--- Appelée par l'interface pour l'action contextuelle d'un bouton (ex. ouvrir la configuration d'un emplacement dynamique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2499
---@param id integer Indice de l'item.
---@param buttonDown boolean Non utilisé (déduit du code).
---@param actionIndex integer|nil Non utilisé (déduit du code).
function core_quickAccess.contextAction(id, buttonDown, actionIndex) end

--- Termine le handoff et réaffiche le menu (temps ralenti de nouveau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2224
function core_quickAccess.endRouteHandoff() end

--- Nettoie l'état radial quand un écran enfant retourne directement au jeu, sans renaviguer vers 'play'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2237
function core_quickAccess.finishRouteHandoffExit() end

--- Prépare pour l'interface les données de configuration de l'emplacement ouvert par openDynamicSlotConfigurator (arbre de menus et réglage courant). Plante si aucun emplacement n'a été ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:467
---@return table  Données pour l'interface.
function core_quickAccess.getDynamicSlotConfigurationData() end

--- Renvoie les actions récentes (de la catégorie donnée) encore disponibles dans le menu, hors celles déjà affectées à un emplacement 'uniqueAction', limitées à `limit`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:1897
---@param category string Catégorie (ex. 'all').
---@param limit integer|nil Nombre max ; nil ou 0 renvoie {}.
---@param dynamicItems table[]|nil Items de type dynamicSlot du niveau courant.
---@return table[]  Enregistrements { uniqueID, level, title, timestamp, icon }.
function core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems) end

--- Renvoie l'instant (ms système) du dernier appel de moved().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2537
---@return number  Millisecondes (0 si jamais).
function core_quickAccess.getMovedRadialLastTimeMs() end

--- Renvoie les données envoyées à l'interface du menu : canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:1765
---@return table|nil  uiData, nil avant la première ouverture.
function core_quickAccess.getUiData() end

--- Construit un nom lisible du véhicule : marque, nom et configuration d'après core_vehicles.getModel ; sinon le nom JBeam.
---Source : lua/ge/extensions/core/quickAccess.lua:2660
---@param veh userdata|nil Objet véhicule ; nil renvoie la clé de traduction 'ui.radialmenu2.noVehicle'.
---@return string  Nom du véhicule.
function core_quickAccess.getVehicleName(veh) end

--- Va vers un autre niveau de menu en empilant le niveau actuel dans l'historique (pour back).
---Source : lua/ge/extensions/core/quickAccess.lua:2138
---@param level string Chemin du niveau cible.
function core_quickAccess.gotoLevel(level) end

--- Indique si le menu radial est actuellement affiché.
---Source : lua/ge/extensions/core/quickAccess.lua:275
---@return boolean  true si l'interface radiale est visible.
function core_quickAccess.isEnabled() end

--- Indique si un handoff vers un écran enfant est en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2230
---@return boolean  true si actif.
function core_quickAccess.isRouteHandoffActive() end

--- Enregistre l'instant actuel comme dernier mouvement du curseur radial (appelé par l'interface).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2541
function core_quickAccess.moved() end

--- Avant l'ouverture de la grande carte : ferme le menu radial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2656
function core_quickAccess.onBeforeBigMapActivated() end

--- À la fin d'un niveau : sauvegarde les actions récentes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2632
function core_quickAccess.onClientEndMission() end

--- À la fermeture du jeu : sauvegarde les actions récentes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2628
function core_quickAccess.onExit() end

--- Au chargement : émet onQuickAccessLoaded, lit les actions récentes et les réglages d'emplacements dynamiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2618
function core_quickAccess.onExtensionLoaded() end

--- Au déchargement : sauvegarde les actions récentes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2624
function core_quickAccess.onExtensionUnloaded() end

--- Hook d'initialisation de l'extension : au premier appel enregistre les menus par défaut (puis émet onRegisterQuickAccessMenus), puis ferme le menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2471
function core_quickAccess.onInit() end

--- Avant un rechargement Lua : ferme le menu et sauvegarde actions récentes et emplacements dynamiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2650
function core_quickAccess.onSerialize() end

--- Quand la route UI change : si une autre route prend le dessus pendant que le menu est visible, le ferme sans naviguer ; termine aussi un handoff quand l'état devient 'play'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2640
---@param toState string Nouvel état/route UI.
function core_quickAccess.onUiChangedState(toState) end

--- Appelé à chaque frame GFX : gère le délai d'attente des entrées du véhicule (4 frames) et force l'assemblage si le véhicule ne répond pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2590
function core_quickAccess.onUpdate() end

--- Quand un véhicule apparaît : sauvegarde les actions récentes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2636
function core_quickAccess.onVehicleSpawned() end

--- Au changement de véhicule joueur : recharge le menu s'il est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2611
function core_quickAccess.onVehicleSwitched() end

--- Ouvre l'écran de configuration d'un emplacement dynamique (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator).
---Source : lua/ge/extensions/core/quickAccess.lua:460
---@param dynamicSlotKey string Id de l'emplacement (ex. 'root_up').
function core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey) end

--- Obsolète : logge une erreur demandant d'utiliser addEntry, ne fait rien d'autre.
---Source : lua/ge/extensions/core/quickAccess.lua:2754
function core_quickAccess.registerMenu() end

--- Reconstruit et réaffiche le niveau courant (si le menu est ouvert).
---Source : lua/ge/extensions/core/quickAccess.lua:2178
function core_quickAccess.reload() end

--- Restaure la configuration par défaut des emplacements dynamiques, la sauvegarde et émet onQuickAccessResetDynamicSlotSettings.
---Source : lua/ge/extensions/core/quickAccess.lua:347
function core_quickAccess.resetDynamicSlotSettings() end

--- Remet le facteur de ralenti à sa valeur d'origine (0.01).
---Source : lua/ge/extensions/core/quickAccess.lua:26
function core_quickAccess.resetSlowMoFactor() end

--- Appelée par l'interface quand le joueur appuie/relâche un bouton : exécute l'action de l'item d'index id dans le menu courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2488
---@param id integer Indice (base 1) de l'item dans currentMenuItems.
---@param buttonDown boolean true à l'appui, false au relâchement.
---@param actionIndex integer|nil 1 = principale, 2 = secondaire, 3 = tertiaire (défaut 1).
function core_quickAccess.selectItem(id, buttonDown, actionIndex) end

--- Enregistre le choix du joueur pour un emplacement dynamique (modes uniqueAction, recentActions ou empty), émet les hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty puis onQuickAccessSetDynamicSlotConfiguration, sauvegarde et recharge le menu.
---Source : lua/ge/extensions/core/quickAccess.lua:534
---@param dynamicSlotKey string Id de l'emplacement.
---@param data table { mode, uniqueID, level } ou { mode, category }.
function core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data) end

--- Ouvre ou ferme le menu. L'ouverture n'a lieu que si l'état UI est 'play' ou inconnu, ou si le menu est déjà visible, ou si force. Émet le hook onQuickAccessOpened(level). La fermeture est ignorée pendant un route handoff.
---Source : lua/ge/extensions/core/quickAccess.lua:2511
---@param enabled boolean true pour ouvrir, false pour fermer.
---@param level string|nil Niveau à ouvrir (ex. '/root/sandbox/other/') ; nil = '/root/'.
---@param force boolean|nil Ouvre même si un autre écran est actif.
function core_quickAccess.setEnabled(enabled, level, force) end

--- Définit le facteur de temps (simTimeAuthority) appliqué pendant que le menu radial est ouvert. 0.01 par défaut.
---Source : lua/ge/extensions/core/quickAccess.lua:25
---@param factor number Facteur de vitesse de simulation (1 = temps réel).
function core_quickAccess.setSlowMoFactor(factor) end

--- Définit la liste d'identifiants à mettre en évidence dans le menu (tutoriel). Les valeurs non chaînes, vides ou en double sont filtrées. Rafraîchit l'interface si visible.
---Source : lua/ge/extensions/core/quickAccess.lua:1769
---@param targets string[] Identifiants de cibles.
function core_quickAccess.setTutorialHighlightTargets(targets) end

--- Transforme un identifiant en nom lisible : '_' devient espace, espace avant chaque majuscule collée à une minuscule, première lettre de chaque mot en majuscule, reste en minuscules.
---Source : lua/ge/extensions/core/quickAccess.lua:562
---@param str string Identifiant, ex. 'funStuff'.
---@return string  Ex. 'Fun Stuff'.
function core_quickAccess.toNiceName(str) end

--- Ouvre le menu s'il est fermé, le ferme sinon. Utilisée par l'action 'toggleRadialMenuMulti'.
---Source : lua/ge/extensions/core/quickAccess.lua:2528
---@param level string|nil Niveau à ouvrir.
function core_quickAccess.toggle(level) end

--- Exécute une action liée aux touches du menu parmi : toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignorée si core_input_actionFilter la bloque ; une action inconnue est loggée en erreur.
---Source : lua/ge/extensions/core/quickAccess.lua:2719
---@param action string Nom de l'action.
function core_quickAccess.tryAction(action) end

--- Rappel du véhicule après exécution d'une action d'item : traite l'ordre renvoyé ({'hide'}, {'goto', ...}, etc.).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2605
---@param objID integer Id du véhicule (inutilisé).
---@param args table Ordre à exécuter, même format que le retour de onSelect.
function core_quickAccess.vehicleItemSelectCallback(objID, args) end

--- Rappel du véhicule joueur avec ses entrées de menu pour un niveau : les mémorise et affiche le menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/quickAccess.lua:2125
---@param objID integer Id du véhicule.
---@param level string Niveau demandé.
---@param vehicleMenuTree table Table niveau -> liste d'entrées.
function core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree) end

