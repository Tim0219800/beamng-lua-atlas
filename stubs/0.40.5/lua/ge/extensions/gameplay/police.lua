---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/police.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de police du trafic : suit les véhicules ayant le rôle 'police', gère les poursuites (niveaux -1 à 3 selon le score d'infractions), l'arrestation, l'évasion, la libération, les barrages routiers (véhicules et accessoires), et la file d'attente des suspects aléatoires. Elle s'appuie sur gameplay_traffic (données de trafic, rôles). Un moddeur s'en sert pour lancer ou terminer une poursuite, régler les variables de poursuite ou installer un barrage.
--- Accès : extension `gameplay_police` : `extensions.load("gameplay_police")`, puis la globale `gameplay_police`
---@class gameplay_police
---@field enabled boolean Si false, la logique de police à l'exécution (onUpdate) est suspendue. Vaut true par défaut.
gameplay_police = {}

--- Déclare immédiatement un véhicule arrêté : messages optionnels (contravention ou arrestation, liste des infractions), émet onPursuitAction 'arrest' puis setPursuitMode(-1) pour les policiers qui le ciblent. Fonctionne comme prévu si la cible a le rôle suspect.
---Source : lua/ge/extensions/gameplay/police.lua:456
---@param id integer Véhicule arrêté.
---@param showMessages boolean|nil Afficher les messages d'interface.
function gameplay_police.arrestVehicle(id, showMessages) end

--- Indique combien des véhicules fournis tiennent dans la largeur d'un barrage (du plus court au plus long, longueur = plus grande étendue de la boîte, ou l'axe choisi par useLength).
---Source : lua/ge/extensions/gameplay/police.lua:56
---@param vehIds integer[] Ids de véhicules ou d'accessoires.
---@param rbWidth number|nil Largeur maximale du barrage en mètres (défaut 10).
---@param useLength boolean|nil nil = meilleur axe ; true = étendue Y ; false = étendue X.
---@return integer[]  Ids qui tiennent dans le barrage (nil si vehIds n'est pas une table).
---@return number  Longueur totale occupée en mètres.
function gameplay_police.checkRoadblock(vehIds, rbWidth, useLength) end

--- Déclare immédiatement qu'un véhicule a échappé à la police : émet onPursuitAction 'evade' puis setPursuitMode(0).
---Source : lua/ge/extensions/gameplay/police.lua:493
---@param id integer Véhicule.
---@param showMessages boolean|nil Afficher les messages d'interface.
function gameplay_police.evadeVehicle(id, showMessages) end

--- Police active la plus proche de la cible, d'après les distances mises en cache dans role.validTargets.
---Source : lua/ge/extensions/gameplay/police.lua:277
---@param targetId integer|nil Id de la cible.
---@param isVisible boolean|nil Ne garder que les policiers voyant la cible (ignoré si vars.useVisibility est false).
---@param isUsable boolean|nil Exclure les policiers à l'état 'disabled'.
---@return integer|nil  Id du policier.
---@return number  Distance (math.huge si aucun).
---@return number  Distance interactive (le policier regarde devant).
function gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable) end

--- Alias de getPoliceVehicles.
---Source : lua/ge/extensions/gameplay/police.lua:273
---@return table<integer, table>  Véhicules de police.
function gameplay_police.getPolice() end

--- Alias de getPursuitVars.
---Source : lua/ge/extensions/gameplay/police.lua:603
---@return table  Variables (référence directe).
function gameplay_police.getPoliceVars() end

--- Table des véhicules de police du trafic, par id de véhicule (données de gameplay_traffic). Alias : getPolice.
---Source : lua/ge/extensions/gameplay/police.lua:273
---@return table<integer, table>  Véhicules de police.
function gameplay_police.getPoliceVehicles() end

--- Données de poursuite (veh.pursuit) d'un véhicule du trafic. Conservée pour compatibilité.
---Source : lua/ge/extensions/gameplay/police.lua:594
---@param id integer|nil Véhicule (défaut joueur 0).
---@return table|nil  Table pursuit (mode, score, timers, offensesList…).
function gameplay_police.getPursuitData(id) end

--- Variables de poursuite actuelles. Alias : getPoliceVars.
---Source : lua/ge/extensions/gameplay/police.lua:603
---@return table  Variables (référence directe).
function gameplay_police.getPursuitVars() end

--- Ajoute un objet comme accessoire de barrage, s'il existe, n'est pas déjà un véhicule de trafic et n'est pas déjà enregistré.
---Source : lua/ge/extensions/gameplay/police.lua:235
---@param propId integer Id de l'objet.
function gameplay_police.insertProp(propId) end

--- Statut de poursuite d'un véhicule du trafic : pour un policier, vrai s'il poursuit (éventuellement targetId) ; pour un suspect, vrai si pursuit.mode > 0.
---Source : lua/ge/extensions/gameplay/police.lua:299
---@param id integer|nil Véhicule (défaut joueur 0).
---@param targetId integer|nil Filtre sur la cible poursuivie (policiers seulement).
---@return boolean  En poursuite.
---@return boolean  Le véhicule est un policier.
function gameplay_police.isVehicleInPursuit(id, targetId) end

--- Hook de fin de niveau : vide la liste de police et réinitialise les variables de poursuite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:707
function gameplay_police.onClientEndMission() end

--- Hook après rechargement Lua : restaure vars et policePropIds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:762
---@param data table Résultat de onSerialize.
function gameplay_police.onDeserialized(data) end

--- Hook avant rechargement Lua : renvoie {vars, propIds} et vide la liste de police (reconstruite ensuite).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:756
---@return table  {vars, propIds}
function gameplay_police.onSerialize() end

--- Hook de trafic : suit les changements de rôle (action 'changeRole') pour ajouter ou retirer un véhicule de la liste de police.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:607
---@param id integer Véhicule.
---@param action string Nom de l'action.
---@param data table Pour 'changeRole' : name, prevName.
function gameplay_police.onTrafficAction(id, action, data) end

--- Hook de gameplay_traffic : enregistre le fournisseur de véhicules spéciaux 'police' (priorité 10, au moins 3 véhicules de trafic au total, 25 % du total arrondi au supérieur si options.police). Le groupe vient d'un fichier de groupe (si options.autoLoadFromFile ou le réglage trafficSmartSelections), sinon de trafficUtils.createPoliceGroup, sinon des fullsize/police.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:26
function gameplay_police.onTrafficSpecialVehiclesProviders() end

--- Hook au démarrage du trafic : logue le nombre de véhicules de police et d'accessoires.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:635
function gameplay_police.onTrafficStarted() end

--- Hook à l'arrêt du trafic : vide la liste de police.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:642
function gameplay_police.onTrafficStopped() end

--- Hook : ajoute le véhicule à la liste de police si son rôle est 'police'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:623
---@param id integer Véhicule ajouté.
function gameplay_police.onTrafficVehicleAdded(id) end

--- Hook : retire le véhicule de la liste de police.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:629
---@param id integer Véhicule retiré.
function gameplay_police.onTrafficVehicleRemoved(id) end

--- Appelé à chaque image. Pour chaque véhicule du trafic, déclenche setPursuitMode quand le score atteint un nouveau palier de scoreLevels (avec un court délai au début). Gère aussi le minuteur de suspect aléatoire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:712
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_police.onUpdate(dt, dtSim) end

--- Hook : retire l'objet détruit de la liste d'accessoires.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:700
---@param id integer Objet détruit.
function gameplay_police.onVehicleDestroyed(id) end

--- Hook de réinitialisation d'un véhicule IA : choisit éventuellement un suspect aléatoire parmi les véhicules 'standard' quand le minuteur est écoulé, ou ramène un suspect non 'wanted' au rôle standard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:683
---@param id integer Véhicule réinitialisé.
function gameplay_police.onVehicleResetted(id) end

--- Hook de changement de véhicule contrôlé : insère le nouveau véhicule dans le trafic si besoin ; lors d'un passage à pied/en véhicule (jbeam 'unicycle') pendant une poursuite, transfère les données de poursuite au nouveau véhicule, relance le mode, et force l'arrestation en cas de retour dans un véhicule sous les yeux de la police. Marque ignorePolice pour éviter l'auto-arrestation d'un policier descendant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/police.lua:646
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function gameplay_police.onVehicleSwitched(oldId, newId) end

--- Place des véhicules en rang en travers d'une route (centrés sur pos, répartis sur placeData.width), puis les téléporte avec core_multiSpawn.placeGroup.
---Source : lua/ge/extensions/gameplay/police.lua:91
---@param vehIds integer[] Ids à placer.
---@param pos vec3 Centre du barrage.
---@param rot quat Orientation (la direction avant doit suivre la route).
---@param placeData table|nil width (défaut 10 m), angle (degrés, défaut 0), centerAngle (angle du véhicule central).
function gameplay_police.placeRoadblock(vehIds, pos, rot, placeData) end

--- Libère un véhicule après arrestation : émet onPursuitAction 'release' et remet le mode de poursuite à 0. Si le véhicule n'est pas du trafic, envoie controller.setFreeze(0) à son VM.
---Source : lua/ge/extensions/gameplay/police.lua:519
---@param id integer Véhicule.
---@param showMessages boolean|nil Afficher le message « drive away » si c'est le joueur.
function gameplay_police.releaseVehicle(id, showMessages) end

--- Retire un accessoire de la liste de barrage.
---Source : lua/ge/extensions/gameplay/police.lua:242
---@param propId integer Id de l'objet.
function gameplay_police.removeProp(propId) end

--- Alias de setPursuitVars.
---Source : lua/ge/extensions/gameplay/police.lua:265
---@param data table|nil|false Voir setPursuitVars.
function gameplay_police.setPoliceVars(data) end

--- Active ou désactive tous les accessoires de barrage enregistrés ; avec reset, appelle recovery.loadHome() sur chacun.
---Source : lua/ge/extensions/gameplay/police.lua:226
---@param active boolean true pour activer.
---@param reset boolean|nil true pour remettre à leur position d'origine.
function gameplay_police.setPropsActive(active, reset) end

--- Fixe le mode de poursuite d'une cible : -1 arrêté, 0 fin, 1 à 3 niveau. Met la cible au rôle suspect (action fleePolice), met à jour les policiers (pursuitStart, pursuitEnd, resetAction) et le score, puis émet onPursuitModeUpdate. Au passage de 0 à >0, émet onPursuitAction 'start'. Sans effet si la cible n'est pas du trafic ou a ignorePursuit.
---Source : lua/ge/extensions/gameplay/police.lua:325
---@param mode integer -1 à 3 (borné).
---@param targetId integer|nil Cible (défaut joueur 0).
---@param policeIds integer[]|integer|nil Policiers concernés (défaut tous ; un nombre seul est accepté).
function gameplay_police.setPursuitMode(mode, targetId, policeIds) end

--- Fusionne data dans les variables de poursuite ; sans table valide (nil/false), les remet par défaut. Alias : setPoliceVars.
---Source : lua/ge/extensions/gameplay/police.lua:265
---@param data table|nil|false Variables à modifier (scoreLevels, strictness, arrestTime, arrestRadius, evadeTime, evadeRadius, suspectFrequency, roadblockFrequency, useVisibility, autoRelease).
function gameplay_police.setPursuitVars(data) end

--- Passe un véhicule de trafic au rôle 'suspect' avec l'action 'watchPolice' (conservée au rafraîchissement du rôle).
---Source : lua/ge/extensions/gameplay/police.lua:429
---@param id integer Id du véhicule.
function gameplay_police.setSuspect(id) end

--- Règle le délai avant le prochain suspect aléatoire. Sans argument : 120 * coef * (1 - suspectFrequency)^2 + 15 à 45 s ; coef vaut 2, 1 après une arrestation du joueur policier, 5 après une évasion.
---Source : lua/ge/extensions/gameplay/police.lua:439
---@param time number|nil Délai en secondes ; nil = calcul automatique.
function gameplay_police.setSuspectTimer(time) end

--- Prépare un scénario de poursuite : insère le suspect dans le trafic (sans désactivation par le pool de véhicules), désactive son respawn, lui donne le rôle suspect (pursuitMode), force le rôle 'police' aux policeIds fournis, et lance l'action 'watchPolice' sauf si preventAutoStart.
---Source : lua/ge/extensions/gameplay/police.lua:544
---@param suspectId integer|nil Suspect (défaut véhicule du joueur 0).
---@param policeIds integer[]|nil Policiers (défaut : policiers existants).
---@param options table|nil playerId, pursuitMode (défaut 2), preventAutoStart (défaut false).
---@return boolean  false si le suspect est introuvable ou s'il n'existe aucun policier.
function gameplay_police.setupPursuitGameplay(suspectId, policeIds, options) end

--- Prépare et place un barrage devant la cible. Choisit les véhicules de police actifs, éloignés de plus de activeDist et derrière l'origine, qui peuvent cibler targetId. Cherche un point de route à spawnDist devant, calcule la largeur de route, ajuste l'angle aléatoirement, met les policiers en action 'roadblock' et place aussi des accessoires (propIds).
---Source : lua/ge/extensions/gameplay/police.lua:136
---@param targetId integer|nil Cible (défaut véhicule du joueur 0).
---@param roadblockVehIds integer[]|nil Véhicules candidats (défaut tous les véhicules de police).
---@param roadblockPropIds integer[]|nil Accessoires (défaut ceux de insertProp).
---@param originPos vec3|nil Origine (défaut position caméra).
---@param originDirVec vec3|nil Direction de l'origine (défaut avant de la caméra).
---@param activeDist number|nil Distance rayonnante (défaut 100 m) ; 0 ignore les tests de distance et de direction.
---@param spawnDist number|nil Distance minimale de placement (défaut 120 m) ; 0 force le placement à l'origine.
---@return table|nil  {vehIds, propIds} des éléments placés ; nil en cas d'échec.
function gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist) end

