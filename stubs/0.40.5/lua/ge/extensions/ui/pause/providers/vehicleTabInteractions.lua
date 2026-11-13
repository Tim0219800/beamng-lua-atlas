---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données et d'actions pour l'onglet « Véhicule » (et la gestion des véhicules) du menu pause. Il liste les véhicules apparus (hors personnage à pied « unicycle », véhicules inactifs ou non utilisables par le joueur), leur contrôleur (joueur, IA, multijoueur), leur mode IA (interrogé toutes les 8 s via core_vehicleBridge), et construit pour chaque véhicule les boutons d'action (changer de véhicule, quitter, modes IA, réparer, réinitialiser, cloner, supprimer, tout supprimer sauf celui-ci, ouvrir les détails) en tenant compte des permissions multijoueur et de l'état de la première conduite. Il surligne aussi en orange le véhicule survolé ou sélectionné avec le debugDrawer. Les charges utiles sont envoyées à l'UI soit par appel direct, soit par flux (guihooks.triggerStream) pour l'hydratation asynchrone.
--- Accès : extension `ui_pause_providers_vehicleTabInteractions` : `extensions.load("ui_pause_providers_vehicleTabInteractions")`, puis la globale `ui_pause_providers_vehicleTabInteractions`
---@class ui_pause_providers_vehicleTabInteractions
---@field dependencies string[] {'core_vehicleBridge', 'core_locales'}
ui_pause_providers_vehicleTabInteractions = {}

--- Exécute le bouton d'action identifié par buttonId (champ buttonId des entrées d'action renvoyées dans les charges utiles), avec une charge utile facultative.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1607
---@param buttonId any Identifiant de bouton fourni par buttonModule (déduit du code)
---@param payload any Données transmises au callback du bouton (déduit du code)
---@return boolean  false si buttonId est absent, sinon résultat de l'exécution du bouton
function ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload) end

--- Renvoie le délai de débogage d'hydratation asynchrone actuel, en secondes.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1650
---@return number  Délai en secondes (0 = désactivé)
function ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay() end

--- Détails du véhicule sélectionné : vehicleId, label, rawName, vehicle (entrée de liste) et groups (groupes d'actions). La sélection vient du paramètre vehicleId de la route, sinon du dernier véhicule choisi, sinon du véhicule du joueur, sinon du premier de la liste.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1662
---@param context table|nil Contexte de pause
---@return table  {vehicleId, label, rawName, vehicle, groups}
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context) end

--- Squelette des détails du véhicule sélectionné (étiquette, groupes d'actions désactivés, loading = true), sans calcul complet.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1629
---@param context table|nil Contexte de pause
---@return table  Charge utile de chargement
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context) end

--- Charge utile complète des véhicules apparus : mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (actions globales) et lowPerformance. Effets de bord : réinitialise l'état et relance l'interrogation des modes IA.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1612
---@param context table|nil Contexte de pause ; seul context.mode est lu (défaut « freeroam »)
---@return table  Charge utile des véhicules
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context) end

--- Version « squelette » de la charge utile, sans interroger les véhicules : asyncHydration et loading valent true, liste vide, actions désactivées. Sert à afficher l'écran immédiatement avant l'hydratation.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1616
---@param context table|nil Contexte de pause (mode)
---@return table  Charge utile de chargement
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context) end

--- Renvoie seulement summary et vehicles de la charge utile des véhicules apparus.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1654
---@param context table|nil Contexte de pause
---@return table  {summary, vehicles}
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context) end

--- Hook appelé par routeLifecycleCallbacks à l'entrée et à la sortie d'une route de pause, avec le nom de la route cible. Active ou désactive le suivi (survol, interrogation IA) et réinitialise la numérotation des véhicules si on sort de la famille pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1666
---@param routeName string|nil Nom de la route cible
function ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName) end

--- Hook appelé à chaque image. Quand le suivi est actif sur une route de véhicule : traite les requêtes différées, relance l'interrogation des modes IA toutes les 8 s de temps de simulation et dessine un cadre pulsant blanc-orange (12 arêtes de la boîte englobante, épaisseur 3) autour du véhicule survolé ou affiché en détails, via debugDrawer.drawLineInstance. À défaut de boîte, trace une ligne verticale de 2 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1697
---@param dtReal number Temps réel (s)
---@param dtSim number Temps de simulation (s)
---@param dtRaw number Temps brut (s)
function ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un véhicule est détruit : recalcule l'état des véhicules pour l'UI si le suivi est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1685
function ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed() end

--- Appelé par l'UI quand le curseur quitte la carte : supprime le surlignage si c'est ce véhicule (ou si vehicleId est nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1693
---@param vehicleId number|nil Identifiant du véhicule
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId) end

--- Appelé par l'UI quand le curseur survole la carte d'un véhicule : ce véhicule sera surligné dans le monde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1689
---@param vehicleId number Identifiant du véhicule survolé
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId) end

--- Hook appelé à l'apparition d'un véhicule : recalcule l'état si la route le demande et déclenche l'évènement UI VehicleTabSpawnFinished.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1680
function ui_pause_providers_vehicleTabInteractions.onVehicleSpawned() end

--- Hook émis après un changement de véhicule demandé par l'utilisateur depuis le menu : même traitement que onVehicleSwitched.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1675
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser() end

--- Hook appelé quand le véhicule du joueur change : réémet l'état des véhicules vers l'UI et remet à zéro le minuteur d'interrogation IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1670
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitched() end

--- Version asynchrone des détails du véhicule sélectionné : émet le résultat dans le flux ui_pause_vehicleTabInteractions_spawned_selected_payload.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1633
---@param payload table|nil {requestId, context}
---@return table  Charge utile émise, ou accusé de chargement en mode délai de débogage
function ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload) end

--- Demande l'hydratation asynchrone : calcule la charge utile et l'envoie dans le flux ui_pause_vehicleTabInteractions_spawned_payload (avec asyncHydration, loading = false, requestId). Si un délai de débogage est actif, la réponse est mise en file et un accusé de chargement est renvoyé.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1620
---@param payload table|nil {requestId, context}
---@return table  Charge utile émise, ou accusé de chargement en mode délai de débogage
function ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload) end

--- Règle un délai artificiel (secondes, minimum 0) avant la réponse aux requêtes asynchrones ; 0 le désactive et vide la file.
---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1642
---@param delaySec number Délai en secondes
---@return number  Délai effectivement appliqué
function ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec) end

