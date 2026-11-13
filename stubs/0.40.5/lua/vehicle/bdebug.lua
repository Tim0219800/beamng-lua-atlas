---@meta
-- tim19Atlas stub generated from lua/vehicle/bdebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade légère de l'outil de debug visuel du véhicule (nœuds, poutres, triangles de collision, centre de gravité…). Tant que personne ne l'utilise, bdebugImpl.lua (gros module) n'est pas chargé : les fonctions marquées « initialisent » chargent bdebugImpl à leur premier appel et redirigent ensuite vers lui. Un moddeur s'en sert surtout pour afficher du texte sur des nœuds (setNodeDebugText) ou activer/désactiver l'outil. Le GE reçoit l'état via guihooks BdebugUpdate et extensions.hook onBDebugUpdate (envoyés par bdebugImpl).
--- Accès : globale `bdebug`
---@class bdebug
---@field beamBroke function Hook de rupture de poutre beamBroke(id, energy) ; nop avant l'init, puis redirection vers bdebugImpl.
---@field debugDraw function Dessin debug debugDraw(focusPos) appelé par la boucle principale ; nop avant l'init, puis redirection vers bdebugImpl.
---@field initState table Proxy vers bdebugImpl.initState (état par défaut des modes). Charge bdebugImpl à l'accès.
---@field nodeCollision function Hook de collision de nœud ; nop tant que bdebugImpl n'est pas chargé, puis redirige nodeCollision(p) vers bdebugImpl.
---@field onPlayersChanged function Hook de changement de joueur ; nop avant l'init, puis bdebugImpl.onPlayersChanged.
---@field reset function Reset du véhicule ; nop avant l'init, puis bdebugImpl.reset.
---@field state table Proxy vers bdebugImpl.state (état courant). Charge bdebugImpl à l'accès.
---@field stateNoReset table Proxy vers bdebugImpl.stateNoReset (état non remis à zéro par resetModes). Charge bdebugImpl à l'accès.
bdebug = {}

--- Supprime tous les groupes de textes debug de nœuds.
---Source : lua/vehicle/bdebug.lua:229
function bdebug.clearAllNodeDebugText() end

--- Supprime les textes d'un nœud dans un groupe.
---Source : lua/vehicle/bdebug.lua:200
---@param type string Nom du groupe.
---@param nodeCID integer ID du nœud à l'exécution.
function bdebug.clearNodeDebugText(type, nodeCID) end

--- Supprime un groupe de textes entier (et décale les index des groupes suivants).
---Source : lua/vehicle/bdebug.lua:209
---@param type string Nom du groupe.
function bdebug.clearTypeNodeDebugText(type) end

--- Change le mode d'affichage du centre de gravité (cogModes, dont 'off' et 'on').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:150
---@param change integer +1 / -1 (cyclique).
function bdebug.cogChange(change) end

--- Change le mode des triangles de collision (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:145
---@param change integer +1 / -1 (cyclique).
function bdebug.colTrisModeChange(change) end

--- Fonction vide appelée à l'initialisation du véhicule ; le chargement est paresseux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:250
function bdebug.init() end

--- Indique si l'outil est visible. Renvoie toujours false avant le chargement de bdebugImpl, puis bdebugImpl.isEnabled.
---Source : lua/vehicle/bdebug.lua:107
---@return boolean  true si vehicleDebugVisible.
function bdebug.isEnabled() end

--- Change le groupe de texte debug de nœuds affiché (off puis les groupes créés par setNodeDebugText).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:135
---@param change integer +1 / -1 (cyclique).
function bdebug.nodedebugtextModeChange(change) end

--- Passe au mode suivant/précédent du texte de nœuds (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Appelée par les actions d'entrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:125
---@param change integer +1 suivant, -1 précédent (cyclique).
function bdebug.nodetextModeChange(change) end

--- Change le mode de visualisation des nœuds (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:130
---@param change integer +1 / -1 (cyclique).
function bdebug.nodevisModeChange(change) end

--- Hook de restauration après rechargement : si un état bdebugImpl a été sauvegardé, initialise bdebugImpl avec lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:244
---@param data table Table renvoyée par onSerialize.
function bdebug.onDeserialize(data) end

--- Hook de sauvegarde avant rechargement du véhicule : renvoie {bdebugImplState = état} si bdebugImpl a déjà été initialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:238
---@return table  {bdebugImplState = table|nil}.
function bdebug.onSerialize() end

--- Fonction vide tant que bdebugImpl n'est pas chargé ; ensuite remplacée par bdebugImpl.receiveViewportSize(sizeX, sizeY).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:253
function bdebug.receiveViewportSize() end

--- Comme requestDrawnNodesGE mais pour les poutres : appelle geFuncName(beamsDrawn, beamScale) dans le GE.
---Source : lua/vehicle/bdebug.lua:102
---@param geFuncName string Nom de la fonction GE.
function bdebug.requestDrawnBeamsGE(geFuncName) end

--- Demande qu'au prochain dessin, la liste des nœuds dessinés soit envoyée à une fonction Lua du GE, appelée sous la forme geFuncName(nodesDrawn, nodeScale).
---Source : lua/vehicle/bdebug.lua:96
---@param geFuncName string Nom de la fonction GE (chemin global, ex. 'monModule.recoit').
function bdebug.requestDrawnNodesGE(geFuncName) end

--- Initialise bdebugImpl et demande l'envoi de l'état courant à l'UI/GE (BdebugUpdate).
---Source : lua/vehicle/bdebug.lua:85
function bdebug.requestState() end

--- Remet tous les modes à leur valeur par défaut (copie de initState) et affiche le message vehicle.bdebug.clear.
---Source : lua/vehicle/bdebug.lua:155
function bdebug.resetModes() end

--- Initialise bdebugImpl puis affiche/masque le debug visuel du véhicule.
---Source : lua/vehicle/bdebug.lua:111
---@param enabled boolean true pour afficher.
function bdebug.setEnabled(enabled) end

--- Ajoute un texte sur un nœud dans un groupe de texte debug (le groupe est créé s'il n'existe pas). Plusieurs appels sur le même nœud empilent les textes. Utilisable avant l'init de bdebugImpl.
---Source : lua/vehicle/bdebug.lua:172
---@param type string Nom du groupe de texte.
---@param nodeCID integer ID du nœud à l'exécution (cid).
---@param text string Texte à afficher.
function bdebug.setNodeDebugText(type, nodeCID, text) end

--- Définit les pièces sélectionnées dont les nœuds/poutres sont mis en valeur. Utilisable avant l'init de bdebugImpl.
---Source : lua/vehicle/bdebug.lua:164
---@param parts table Sélection de pièces (format de partsSelected utilisé par bdebugImpl, déduit du code).
function bdebug.setPartsSelected(parts) end

--- Initialise bdebugImpl puis lui applique un état venu de l'UI. Ignoré si state.objectId n'est pas l'objet courant.
---Source : lua/vehicle/bdebug.lua:90
---@param state table État (objectId, vehicleDebugVisible, vehicle = {…modes…}).
---@param stateNoReset table État conservé aux resets de modes.
---@param notSendBack boolean|nil true pour ne pas renvoyer l'état à l'UI.
function bdebug.setState(state, stateNoReset, notSendBack) end

--- Change le mode de visualisation des poutres (squelette) : off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:140
---@param change integer +1 / -1 (cyclique).
function bdebug.skeletonModeChange(change) end

--- Bascule l'affichage debug. Réservée au système d'input, ne pas appeler depuis l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/bdebug.lua:120
function bdebug.toggleEnabled() end

