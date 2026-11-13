---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_ARunForLife_C
local flowgraph_nodes_mission_ARunForLife_C = {}

--- Active un bonus a une position, met a jour la position du trigger sur la sortie correspondante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:380
---@param buff table bonus
---@param pos vec3 position
function flowgraph_nodes_mission_ARunForLife_C:activateBuff(buff, pos) end

--- Fait apparaitre periodiquement des lignes de props (nombre aleatoire entre minPropLine et maxPropLine, sans doublon de voie) et place les bonus disponibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:458
function flowgraph_nodes_mission_ARunForLife_C:activatePropsAndBuffs() end

--- Determine la medaille (Gold, Silver, Bronze, Wood) et le score suivant selon les pins gold/silver/bronze.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:732
function flowgraph_nodes_mission_ARunForLife_C:calcMedal() end

--- Met a jour repairAvailable et coinAvailable (la piece n'est disponible que tant que coins < repairBuffCost).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:326
function flowgraph_nodes_mission_ARunForLife_C:checkBuffAvailabilty() end

--- Quand assez de pieces sont collectees, les depense, rend le bonus de reparation disponible et emet repairSpawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:355
function flowgraph_nodes_mission_ARunForLife_C:checkCoinForRepair() end

--- Si le joueur est hors de la zone camera, compte jusqu'a 5 s (timeLeftToLose) puis emet 'lost' ; sinon remet le decompte a -1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:285
function flowgraph_nodes_mission_ARunForLife_C:checkLose() end

--- Gere les impulsions d'entree : cannon (tir via custom_input.fire), jumpRamp, crashGate (points), repairTrigger, coinTrigger.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:701
function flowgraph_nodes_mission_ARunForLife_C:checkTriggers() end

--- Ajoute une piece, desactive le bonus piece et emet coinEarnt (si la reparation n'est pas encore achetable).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:692
function flowgraph_nodes_mission_ARunForLife_C:coinBuff() end

--- Cree le pool de decalques (fleches d'aide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:609
function flowgraph_nodes_mission_ARunForLife_C:createDecalPool() end

--- Desactive un bonus (hors ecran, position {-1,0,0}) et met a jour la position du trigger correspondant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:363
---@param buff table bonus a desactiver
function flowgraph_nodes_mission_ARunForLife_C:deactivateBuff(buff) end

--- Reaffiche le decalque d'aide d'un prop desactive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:395
---@param propName string nom jbeam du prop
function flowgraph_nodes_mission_ARunForLife_C:deactivateProp(propName) end

--- Desactive les props et bonus passes trop loin derriere la camera (propDespawn = 40 m) et les remet dans la liste des props inactifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:403
function flowgraph_nodes_mission_ARunForLife_C:deactivatePropsAndBuffs() end

--- Fait avancer les minuteries des bonus qui utilisent le temps (piece) jusqu'a ce qu'ils deviennent disponibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:340
function flowgraph_nodes_mission_ARunForLife_C:doBuffsTime() end

--- Augmente le score selon la position du joueur par rapport a la camera, la vitesse de la camera et dtSim ; ecrit score.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:278
function flowgraph_nodes_mission_ARunForLife_C:doScore() end

--- Dessine les decalques (fleches) sur les props qui ont decal.draw actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:627
function flowgraph_nodes_mission_ARunForLife_C:drawDecals() end

--- Renvoie le bonus de ce nom ('repair' ou 'coin').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:428
---@param name string nom du bonus
---@return table|nil  bonus
function flowgraph_nodes_mission_ARunForLife_C:getBuffByName(name) end

--- Renvoie un delai aleatoire autour de baseTime (+/- 25 %).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:376
---@param baseTime number temps de base en secondes
---@return number  delai aleatoire
function flowgraph_nodes_mission_ARunForLife_C:getBuffNextTime(baseTime) end

--- Renvoie les infos de prop (propsInfo) pour un nom jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:436
---@param name string nom jbeam
---@return table|nil  infos du prop
function flowgraph_nodes_mission_ARunForLife_C:getPropByName(name) end

--- Agrandit le pool de decalques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:603
---@param amount integer nombre a ajouter
function flowgraph_nodes_mission_ARunForLife_C:increaseDecalPool(amount) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:133
---@param mgr any
---@param ... any
function flowgraph_nodes_mission_ARunForLife_C:init(mgr, ...) end

--- Rassemble les ids des pins cont1id..cont20id existants dans containers et calcule contTpDist (distance de teleportation = nombre de conteneurs / 2 * 13.25).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:211
function flowgraph_nodes_mission_ARunForLife_C:linkContainers() end

--- Recupere les vehicules du pool (propPool:getVehs()), enregistre dans propsInfo les decalques/rotations corrigees par jbeam, memorise les references balle/canon/caravane et le vehicule joueur (pin plId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:138
function flowgraph_nodes_mission_ARunForLife_C:linkProps() end

--- Fait avancer la camera (core_camera.setPosRot) : acceleration initiale puis lente, ralentissement/rattrapage quand slowdownCar est actif ; ecrit camSpeed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:233
function flowgraph_nodes_mission_ARunForLife_C:moveCamera() end

--- Met a jour les sorties gatePos, rampPos, cannonPos depuis la position des props actifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:528
function flowgraph_nodes_mission_ARunForLife_C:moveTriggers() end

--- Si la balle est active et a bouge de plus de 3 m, ajoute des points proportionnels a la distance parcourue (ballPoint par metre) au score et aux points bonus ; ecrit ballPoints.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:304
function flowgraph_nodes_mission_ARunForLife_C:pushBall() end

--- Gele le vehicule joueur (setFreeze), desactive le bonus de reparation et lance le ralentissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:686
function flowgraph_nodes_mission_ARunForLife_C:repairBuff() end

--- Remet tout l'etat du jeu a zero et recree la table des bonus (repair, coin).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:749
function flowgraph_nodes_mission_ARunForLife_C:resetValues() end

--- Copie les pins de reglage non nil vers les variables locales du module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:786
function flowgraph_nodes_mission_ARunForLife_C:setParameters() end

--- Recupere le pool, lie conteneurs et props, remplit les listes de props actifs/inactifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:571
function flowgraph_nodes_mission_ARunForLife_C:setReferences() end

--- Pendant la reparation, attend que le vehicule soit presque arrete (< 0,1 m/s) puis le degele, emet 'repaired'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:673
function flowgraph_nodes_mission_ARunForLife_C:slowDownCar() end

--- Teleporte vers l'avant les conteneurs passes derriere la camera (alternance voie droite/gauche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:264
function flowgraph_nodes_mission_ARunForLife_C:tpContainers() end

--- Chaque frame : remet des sorties a leurs valeurs par defaut, lit position/rotation de la camera et du joueur, met a jour jumpPoints, gatePoints, totalBonusScore, coins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:546
function flowgraph_nodes_mission_ARunForLife_C:updateValues() end

--- Boucle de jeu : reset eventuel, initialisation unique (parametres, references, pool de decalques), puis enchaine updateValues, tpContainers, moveCamera, doScore, checkLose, checkTriggers, gestion des props/bonus, pushBall, moveTriggers, drawDecals, calcMedal, checkCoinForRepair, slowDownCar ; ecrit drawCannon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:807
function flowgraph_nodes_mission_ARunForLife_C:work() end

