---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/walk.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode « marche » du joueur : sortir du véhicule fait apparaître un véhicule spécial « unicycle » (le personnage) que le joueur contrôle à pied ; remonter dans un véhicule proche le désactive. Gère par joueur (multi-siège/écran partagé compris) l'unicycle, son visage (face part) et sa couleur, détecte le véhicule le plus proche à moins de 2 m (distance aux arêtes de sa boîte orientée), affiche le message « walkingmode » et expose une liste noire de véhicules. Un moddeur s'en sert pour téléporter/placer le joueur, forcer le mode marche ou l'interdire.
--- Accès : extension `gameplay_walk` : `extensions.load("gameplay_walk")`, puis la globale `gameplay_walk`
---@class gameplay_walk
gameplay_walk = {}

--- Exclut un véhicule des candidats à l'entrée en mode marche.
---Source : lua/ge/extensions/gameplay/walk.lua:561
---@param vehId integer Id du véhicule.
function gameplay_walk.addVehicleToBlacklist(vehId) end

--- Comme canToggleWalkingMode, mais exige aussi que l'état demandé diffère de l'état actif.
---Source : lua/ge/extensions/gameplay/walk.lua:306
---@param enabled boolean État demandé.
---@param force boolean|nil Ignore les restrictions.
---@param player integer|nil Indice de joueur.
---@return boolean
function gameplay_walk.canSetWalkingMode(enabled, force, player) end

--- Indique si le joueur peut changer de mode : force, ou vitesse de stationnement + toggling activé + action non bloquée + pas de lecture de replay.
---Source : lua/ge/extensions/gameplay/walk.lua:298
---@param force boolean|nil Ignore toutes les restrictions.
---@param player integer|nil Indice de joueur.
---@return boolean
function gameplay_walk.canToggleWalkingMode(force, player) end

--- Vide la liste noire.
---Source : lua/ge/extensions/gameplay/walk.lua:573
function gameplay_walk.clearBlacklist() end

--- Autorise ou interdit le basculement manuel entre véhicule et marche.
---Source : lua/ge/extensions/gameplay/walk.lua:553
---@param enabled boolean true pour autoriser.
function gameplay_walk.enableToggling(enabled) end

--- Renvoie la table de la liste noire (id -> true), pas une copie.
---Source : lua/ge/extensions/gameplay/walk.lua:577
---@return table<integer, boolean>
function gameplay_walk.getBlacklist() end

--- Renvoie l'unicycle que le joueur contrôle en ce moment, qu'il soit ou non celui mémorisé dans unicycleIds.
---Source : lua/ge/extensions/gameplay/walk.lua:114
---@param player integer|nil Indice de joueur.
---@return userdata|nil  Objet véhicule unicycle, nil sinon.
function gameplay_walk.getCurrentUnicycle(player) end

--- Calcule une position près de la portière conducteur d'un véhicule (côté gauche ou droit selon la conduite), orientée vers le centre du véhicule.
---Source : lua/ge/extensions/gameplay/walk.lua:215
---@param veh userdata Objet véhicule.
---@return vec3  Position.
---@return vec3  Direction avant (z = 0).
---@return vec3  Vecteur haut (0,0,1).
function gameplay_walk.getDoorsidePosRot(veh) end

--- Visage du personnage. Priorité : pièce de l'unicycle (sélecteur de pièces), réglage playerCharacterFace (par persona en écran partagé), dernier visage connu, visage aléatoire.
---Source : lua/ge/extensions/gameplay/walk.lua:135
---@param player integer|nil Indice de joueur.
---@return string  Nom de la pièce skin_character_face.
function gameplay_walk.getFacePart(player) end

--- Fait monter le joueur dans un véhicule (be:enterVehicle) en mémorisant son unicycle actuel.
---Source : lua/ge/extensions/gameplay/walk.lua:252
---@param vehicle userdata Véhicule à rejoindre.
---@param player integer|nil Indice de joueur.
function gameplay_walk.getInVehicle(vehicle, player) end

--- Peinture du personnage. Priorité : peinture du persona (multi-siège), peinture de l'unicycle (menu de config), dernière peinture connue, couleur enregistrée playerCharacterColor.
---Source : lua/ge/extensions/gameplay/walk.lua:150
---@param player integer|nil Indice de joueur.
---@return table  Peinture de véhicule.
function gameplay_walk.getPaint(player) end

--- Position de l'unicycle et orientation de la caméra du joueur à pied.
---Source : lua/ge/extensions/gameplay/walk.lua:530
---@param player integer|nil Indice de joueur.
---@return vec3|nil  Position.
---@return quat|nil  Rotation caméra.
function gameplay_walk.getPosRot(player) end

--- Position de l'unicycle en trois nombres (sans allocation).
---Source : lua/ge/extensions/gameplay/walk.lua:538
---@param player integer|nil Indice de joueur.
---@return number|nil  x, y, z (nil si le joueur n'est pas à pied).
function gameplay_walk.getPosXYZ(player) end

--- Orientation de la caméra du joueur à pied en quatre nombres.
---Source : lua/ge/extensions/gameplay/walk.lua:546
---@param player integer|nil Indice de joueur.
---@return number|nil  x, y, z, w (nil si le joueur n'est pas à pied).
function gameplay_walk.getRotXYZW(player) end

--- Id de l'unicycle mémorisé pour ce joueur (même s'il est inactif, par exemple pendant qu'il conduit).
---Source : lua/ge/extensions/gameplay/walk.lua:357
---@param player integer|nil Indice de joueur.
---@return integer|nil
function gameplay_walk.getStoredUnicycleId(player) end

--- Véhicule le plus proche (moins de 2 m) que le joueur à pied peut rejoindre.
---Source : lua/ge/extensions/gameplay/walk.lua:510
---@param player integer|nil Indice de joueur.
---@return userdata|nil
function gameplay_walk.getVehicleInFront(player) end

--- Indique si le véhicule le plus proche (ou celui du joueur) est assez lent pour permettre de basculer en mode marche.
---Source : lua/ge/extensions/gameplay/walk.lua:181
---@param player integer|nil Indice de joueur.
---@return boolean  false seulement si la vitesse a dépassé 6 km/h sans repasser sous 5 km/h.
function gameplay_walk.isAtParkingSpeed(player) end

--- Indique si le basculement est autorisé.
---Source : lua/ge/extensions/gameplay/walk.lua:557
---@return boolean
function gameplay_walk.isTogglingEnabled() end

--- Teste si un véhicule est dans la liste noire.
---Source : lua/ge/extensions/gameplay/walk.lua:569
---@param vehId integer Id du véhicule.
---@return boolean|nil  true ou nil.
function gameplay_walk.isVehicleBlacklisted(vehId) end

--- Indique si le joueur contrôle actuellement un unicycle.
---Source : lua/ge/extensions/gameplay/walk.lua:177
---@param player integer|nil Indice de joueur (0 par défaut).
---@return boolean
function gameplay_walk.isWalking(player) end

--- Hook appelé au changement de caméra d'un joueur : masque l'unicycle dans la vue du joueur quand il utilise la caméra unicycle, ou quand la transition de la grande carte s'éloigne de lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:598
---@param player integer Indice de joueur.
---@param camName string Nom du mode de caméra.
---@param vid integer|nil Id du véhicule suivi.
function gameplay_walk.onCameraChanged(player, camName, vid) end

--- Hook appelé à la fin d'un niveau : oublie unicycles, visages et peintures.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:586
---@param levelPath string Chemin du niveau.
function gameplay_walk.onClientEndMission(levelPath) end

--- Hook appelé au début d'un niveau : vide la liste noire, réactive le toggling.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:581
---@param levelPath string Chemin du niveau.
function gameplay_walk.onClientStartMission(levelPath) end

--- Restaure l'état sérialisé et recalcule quels joueurs sont à pied.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:518
---@param data table Table de onSerialize.
function gameplay_walk.onDeserialize(data) end

--- Hook de sauvegarde avant rechargement des extensions : toggling, liste noire, unicycles, visages, peintures.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:514
---@return table  {togglingEnabled, vehicleBlacklist, unicycleIds, faceParts, paints}
function gameplay_walk.onSerialize() end

--- Hook appelé quand l'écran partagé change : reconfigure les couleurs des unicycles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:593
---@param enabled boolean Écran partagé actif.
---@param playerCount integer Nombre de joueurs.
---@param layout any Disposition.
---@param mode any Mode.
function gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode) end

--- Hook appelé à chaque image : pour chaque joueur, cherche le véhicule proche, met à jour la vitesse de stationnement et affiche/retire le message « walkingmode ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:502
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_walk.onUpdate(dtReal, dtSim) end

--- Hook appelé quand la couleur d'un véhicule change : si c'est l'unicycle d'un joueur (hors multi-siège), enregistre la peinture dans le réglage playerCharacterColor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:628
---@param vehId integer Id du véhicule.
---@param index integer Indice de peinture (seul 1 est pris en compte).
---@param paint table Peinture.
function gameplay_walk.onVehicleColorChanged(vehId, index, paint) end

--- Hook appelé à la destruction d'un véhicule : oublie l'unicycle correspondant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:654
---@param vehId integer Id du véhicule.
function gameplay_walk.onVehicleDestroyed(vehId) end

--- Hook appelé quand un véhicule est remplacé : oublie l'unicycle correspondant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:650
---@param vehId integer Id du véhicule.
function gameplay_walk.onVehicleReplaced(vehId) end

--- Hook appelé quand un joueur change de véhicule : désactive l'ancien unicycle mémorisé et met à jour l'état actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/walk.lua:617
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer|nil Indice de joueur.
function gameplay_walk.onVehicleSwitched(oldId, newId, player) end

--- Retire un véhicule de la liste noire.
---Source : lua/ge/extensions/gameplay/walk.lua:565
---@param vehId integer Id du véhicule.
function gameplay_walk.removeVehicleFromBlacklist(vehId) end

--- Change le visage. Si le joueur est à pied, son unicycle est reconfiguré ; sinon l'unicycle mémorisé est supprimé et sera recréé plus tard.
---Source : lua/ge/extensions/gameplay/walk.lua:163
---@param player integer|nil Indice de joueur.
---@param facePart string Nom de la pièce de visage.
function gameplay_walk.setFacePart(player, facePart) end

--- Oriente la caméra/le personnage à pied via les données de la caméra unicycle. Sans effet si le joueur n'est pas actif en mode marche.
---Source : lua/ge/extensions/gameplay/walk.lua:287
---@param front vec3 Direction avant.
---@param up vec3 Direction haut.
---@param player integer|nil Indice de joueur.
function gameplay_walk.setRot(front, up, player) end

--- Active ou désactive le mode marche. À l'activation, fait apparaître ou réactive l'unicycle à pos (sinon près de la portière ou au siège quitté) et y place le joueur. À la désactivation, monte dans le véhicule proche, ou désactive simplement l'unicycle.
---Source : lua/ge/extensions/gameplay/walk.lua:311
---@param enabled boolean true pour marcher.
---@param pos vec3|nil Position d'apparition (facultative).
---@param rot quat|nil Orientation de départ (facultative).
---@param force boolean|nil Ignore les restrictions de bascule.
---@param player integer|nil Indice de joueur.
---@return boolean  true si l'état demandé est atteint (false si bloqué).
---@return integer|nil  Id de l'unicycle courant.
function gameplay_walk.setWalkingMode(enabled, pos, rot, force, player) end

--- Bascule le mode marche (appelé par l'action d'entrée). Ne fait rien si le joueur marche sans véhicule à proximité ; en multijoueur, passe par multiplayer_vehicleSync.
---Source : lua/ge/extensions/gameplay/walk.lua:361
---@param player integer|nil Indice de joueur (ignoré si négatif).
function gameplay_walk.toggleWalkingMode(player) end

