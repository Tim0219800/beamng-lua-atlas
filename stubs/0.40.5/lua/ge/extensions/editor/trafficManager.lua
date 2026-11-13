---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur « Traffic Manager » : permet de composer une session de trafic (véhicules et props placés sur la carte, feux de signalisation, panneaux), de lancer/arrêter la simulation (IA des véhicules non verrouillés, signaux), puis de sauvegarder la session en JSON avec un prefab associé. Fenêtres : principale (mode d'édition trafficEditMode), « Traffic Vehicles & Props », « Traffic Lights », « Traffic Signs » et « Options ». Les objets créés sont rangés dans le SimGroup « TrafficSession ». Un moddeur s'en sert via le menu de l'éditeur ; l'API Lua publique se limite au chargement/sauvegarde de session, à la lecture des données et à la simulation.
--- Accès : extension `editor_trafficManager` : `extensions.load("editor_trafficManager")`, puis la globale `editor_trafficManager`
---@class editor_trafficManager
---@field assertLevel boolean Vrai par défaut : loadSession compare le niveau du fichier au niveau courant et demande confirmation en cas de différence.
---@field debugMode boolean Faux par défaut : active le dessin de debug (cible IA, boîte sous le véhicule) même pour les véhicules actifs ; recopié depuis le fichier chargé.
editor_trafficManager = {}

--- Arrête la simulation : désactive l'IA des véhicules non verrouillés et les signaux, met session.play à false.
---Source : lua/ge/extensions/editor/trafficManager.lua:603
---@return boolean  Faux si aucune session n'existe, vrai sinon.
function editor_trafficManager.disableSimulation() end

--- Démarre la simulation : active l'IA de tous les véhicules non verrouillés et les signaux, recharge la collision si l'éditeur est modifié, met session.play à true.
---Source : lua/ge/extensions/editor/trafficManager.lua:586
---@return boolean  Faux si aucune session n'existe, vrai sinon.
function editor_trafficManager.enableSimulation() end

--- Renvoie la table de session courante (véhicules, feux, panneaux, nom, auteur, play…), non copiée.
---Source : lua/ge/extensions/editor/trafficManager.lua:2305
---@return table|nil  Session, nil tant qu'elle n'est pas créée.
function editor_trafficManager.getSessionData() end

--- Charge une session depuis un fichier JSON : réinitialise la session, restaure options et métadonnées, charge le prefab associé s'il existe puis recrée véhicules et signaux. Sans argument, reprend le fichier mémorisé après une demande de confirmation de niveau (et désactive assertLevel). Notification d'échec si le fichier est illisible.
---Source : lua/ge/extensions/editor/trafficManager.lua:2088
---@param filePath string|nil Chemin du fichier .json (ou .prefab.json, converti).
function editor_trafficManager.loadSession(filePath) end

--- Hook après rechargement Lua ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2554
---@param data table Valeur de onSerialize.
function editor_trafficManager.onDeserialized(data) end

--- Hook de frame de l'éditeur : dessine les fenêtres du Traffic Manager (seulement quand le mode d'édition courant est Traffic Manager) et le debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2341
function editor_trafficManager.onEditorGui() end

--- Hook d'initialisation de l'éditeur : crée le mode d'édition trafficEditMode (raccourcis clic, Maj+clic déplacer, Alt) et enregistre les fenêtres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2566
function editor_trafficManager.onEditorInitialized() end

--- Hook avant rechargement Lua ; renvoie une table vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2549
---@return table  Table vide.
function editor_trafficManager.onSerialize() end

--- Hook de mise à jour : si le SimGroup a disparu, réinitialise la session ; sinon range les véhicules apparus dans le SimGroup, met à jour les statistiques et un minuteur de 0.25 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2423
---@param dt number Delta de temps réel (s).
---@param dtSim number Delta de temps de simulation (s).
function editor_trafficManager.onUpdate(dt, dtSim) end

--- Hook appelé quand un véhicule est réinitialisé : recrée ses données de session (statistiques remises à zéro).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2526
---@param vehId integer Identifiant du véhicule.
function editor_trafficManager.onVehicleResetted(vehId) end

--- Hook appelé quand un véhicule apparaît : si la fenêtre véhicules ou panneaux est active, crée le SimGroup au besoin et met le véhicule en file pour l'ajouter à la session à la frame suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2513
---@param vehId integer Identifiant du véhicule.
function editor_trafficManager.onVehicleSpawned(vehId) end

--- Hook du menu : crée la session et vérifie le SimGroup si besoin, vide la sélection et affiche la fenêtre principale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficManager.lua:2557
function editor_trafficManager.onWindowMenuItem() end

--- Sauvegarde la session dans un fichier JSON et un prefab du même nom. Sans effet sans chemin.
---Source : lua/ge/extensions/editor/trafficManager.lua:2212
---@param filePath string Chemin du fichier .json (ou .prefab.json, converti).
function editor_trafficManager.saveSession(filePath) end

