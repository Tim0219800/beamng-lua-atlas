---@meta
-- tim19Atlas stub generated from lua/vehicle/bdebugImpl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Implémentation complète de l'outil de debug visuel du véhicule (chargée paresseusement par bdebug.lua). Dessine nœuds, poutres, barres de torsion, triangles de collision, rails/slidenodes, centre de gravité, aérodynamique, thermique des roues, point de contact des pneus et géométrie de direction via debugDrawer, selon M.state.vehicle (modes numérotés à partir de 1 ; 1 = 'off'). Il envoie l'état au GE (guihooks BdebugUpdate et extensions.hook onBDebugUpdate). Les moddeurs passent en général par bdebug.*, pas directement par bdebugImpl.
--- Accès : globale `bdebugImpl`
---@class bdebugImpl
---@field beamBroke function Hook beamBroke(id, energy) appelé quand une poutre casse ; nop sauf mode poutres cassées.
---@field debugDraw function Dessin debug debugDraw(focusPos) appelé à chaque frame par la boucle principale ; nop si aucun mode actif.
---@field initState table État par défaut : vehicleDebugVisible=false, objectId, et vehicle = tous les modes (nodeTextModes, nodeVisModes, beamTextModes, beamVisModes, collisionTriangleVisModes, torsionBarVisModes, railsSlideNodesVisModes, cogModes, aérodynamique…), échelles (aerodynamicsScale 0.1, nodeTextMaxDist 10), tireContactPoint, steeringGeometry (steeringGeometryLineLength 20), wheelThermals.
---@field nodeCollision function Hook nodeCollision(p) appelé par le moteur sur collision de nœud ; nop par défaut, activé par le mode de visualisation correspondant.
---@field partsState table {partsSelected = table} : pièces sélectionnées à mettre en valeur.
---@field stateNoReset table État conservé aux resets de modes (reçu avec setState).
bdebugImpl = {}

--- Supprime tous les groupes de textes debug de nœuds (ne reste que 'off').
---Source : lua/vehicle/bdebugImpl.lua:2765
function bdebugImpl.clearAllNodeDebugText() end

--- Supprime les textes d'un nœud dans un groupe.
---Source : lua/vehicle/bdebugImpl.lua:2734
---@param type string Nom du groupe.
---@param nodeCID integer ID du nœud à l'exécution.
function bdebugImpl.clearNodeDebugText(type, nodeCID) end

--- Supprime un groupe de textes entier et recale les index des groupes suivants ainsi que le mode sélectionné.
---Source : lua/vehicle/bdebugImpl.lua:2744
---@param type string Nom du groupe.
function bdebugImpl.clearTypeNodeDebugText(type) end

--- Décale le mode d'affichage du centre de gravité (cyclique) avec message UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2825
---@param change integer +1 / -1.
function bdebugImpl.cogChange(change) end

--- Décale le mode des triangles de collision (cyclique) avec message UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2818
---@param change integer +1 / -1.
function bdebugImpl.colTrisModeChange(change) end

--- Initialise l'outil : compte nœuds, poutres, triangles, barres de torsion, rails et slidenodes de v.data, copie l'état sauvegardé, récupère les textes de debug et les pièces sélectionnées de bdebug.lua et envoie l'état à l'UI. Appelée par bdebug.lua au chargement paresseux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2838
---@param savedState table|nil État sauvegardé avant rechargement ; nil pour partir de initState.
---@param newPartialState table État partiel accumulé par bdebug avant l'init (vehicle.nodeDebugText*, partsSelected).
function bdebugImpl.init(savedState, newPartialState) end

--- Indique si le debug visuel est affiché.
---Source : lua/vehicle/bdebugImpl.lua:2772
---@return boolean  M.state.vehicleDebugVisible.
function bdebugImpl.isEnabled() end

--- Décale le groupe de textes debug de nœuds affiché (cyclique) avec message UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2804
---@param change integer +1 / -1.
function bdebugImpl.nodedebugtextModeChange(change) end

--- Décale le mode de texte de nœuds (cyclique) et affiche un message UI avec le nom du mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2790
---@param change integer +1 suivant, -1 précédent.
function bdebugImpl.nodetextModeChange(change) end

--- Décale le mode de visualisation des nœuds (cyclique) avec message UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2797
---@param change integer +1 / -1.
function bdebugImpl.nodevisModeChange(change) end

--- Hook appelé quand le joueur change de véhicule (m = true si ce véhicule est concerné) : met à jour le dessin et renvoie l'état à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2648
---@param m boolean Vrai si ce véhicule est (devient) le véhicule joueur (déduit du code).
function bdebugImpl.onPlayersChanged(m) end

--- Mémorise la taille du viewport (utile au placement des textes/légendes). Appelée par le GE en réponse à bdebugRequestViewportSize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2568
---@param sizeX number Largeur en pixels.
---@param sizeY number Hauteur en pixels.
function bdebugImpl.receiveViewportSize(sizeX, sizeY) end

--- Enregistre une fonction GE à appeler au prochain dessin avec la liste des poutres dessinées : geFuncName(beamsDrawn, beamScale).
---Source : lua/vehicle/bdebugImpl.lua:2643
---@param geFuncName string Nom de la fonction GE.
function bdebugImpl.requestDrawnBeamsGE(geFuncName) end

--- Enregistre une fonction GE à appeler au prochain dessin avec la liste des nœuds dessinés : geFuncName(nodesDrawn, nodeScale).
---Source : lua/vehicle/bdebugImpl.lua:2637
---@param geFuncName string Nom de la fonction GE.
function bdebugImpl.requestDrawnNodesGE(geFuncName) end

--- Envoie l'état courant (state et stateNoReset) au GE (guihooks BdebugUpdate et hook onBDebugUpdate).
---Source : lua/vehicle/bdebugImpl.lua:2560
function bdebugImpl.requestState() end

--- Au reset du véhicule : vide les mémoires des poutres cassées/déformées et groupes déclenchés pour que les messages se répètent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2861
function bdebugImpl.reset() end

--- Remet l'état à une copie de initState (tous modes sur 'off'), affiche le message vehicle.bdebug.clear et met à jour l'UI.
---Source : lua/vehicle/bdebugImpl.lua:2832
function bdebugImpl.resetModes() end

--- Affiche ou masque le debug visuel, met à jour le dessin et l'UI.
---Source : lua/vehicle/bdebugImpl.lua:2776
---@param enabled boolean true pour afficher.
function bdebugImpl.setEnabled(enabled) end

--- Ajoute un texte sur un nœud dans le groupe donné (créé si absent), puis met à jour le dessin et l'UI.
---Source : lua/vehicle/bdebugImpl.lua:2701
---@param type string Nom du groupe de textes.
---@param nodeCID integer ID du nœud à l'exécution.
---@param text string Texte à afficher.
function bdebugImpl.setNodeDebugText(type, nodeCID, text) end

--- Définit les pièces sélectionnées (M.partsState.partsSelected) utilisées pour mettre en valeur nœuds, poutres, etc.
---Source : lua/vehicle/bdebugImpl.lua:2693
---@param parts table Sélection de pièces.
function bdebugImpl.setPartsSelected(parts) end

--- Remplace l'état par celui reçu de l'UI (ignoré si state.objectId diffère de l'objet courant), recalcule vehicleDebugVisible et le dessin, puis renvoie l'état à l'UI sauf si notSendBack.
---Source : lua/vehicle/bdebugImpl.lua:2654
---@param state table Nouvel état (avec objectId et vehicle).
---@param stateNoReset table Nouvel état non remis à zéro.
---@param notSendBack boolean|nil true pour ne pas renvoyer l'état à l'UI.
function bdebugImpl.setState(state, stateNoReset, notSendBack) end

--- Décale le mode de visualisation des poutres (beamVisMode, cyclique) avec message UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2811
---@param change integer +1 / -1.
function bdebugImpl.skeletonModeChange(change) end

--- Inverse l'affichage du debug. Réservée au système d'input, pas à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebugImpl.lua:2785
function bdebugImpl.toggleEnabled() end

