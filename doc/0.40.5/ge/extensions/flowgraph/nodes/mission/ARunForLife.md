# `flowgraph_nodes_mission_ARunForLife`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua` · VM : Game Engine (GE) · 839 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/ARunForLife")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'ARunForLife' (categorie repeat_instant) : logique complete d'un petit mini-jeu de survie ("Plays my little scenario"). La camera avance a vitesse croissante le long de l'axe -Y ; des props (rampe metal_ramp, gate, ball, cannon, caravan, woodcrate/woodplanks/haybale) sont actives/desactivees depuis un pool de vehicules (pin 'pool') sur 5 voies, des conteneurs sont teleportes pour boucler le decor, et des bonus (pieces, reparation) apparaissent. Le score augmente avec la distance et les actions (saut de rampe, gate, poussee de balle) ; le joueur perd s'il reste trop longtemps (5 s) hors de la zone de la camera. Beaucoup de pins de reglage en entree, sorties : score, vitesse camera, positions des triggers, medaille, signaux lost/repaired/coinEarnt/repairSpawned. Tout l'etat est dans des variables locales du module (non par instance).

## Remarques

- Etat global au module (score, coins, props, camPos...) : deux instances du noeud se partageraient l'etat.
- Les pins de sortie 'repairBuffCost' et 'gatePoints'/'jumpPoints' portent le meme nom que des entrees (entree et sortie distinctes).
- checkBuffAvailabilty depend de coins < repairBuffCost pour la piece.
- Le nom 'pipckupSpeed' (faute de frappe) est utilise dans moveCamera pour la vitesse de rattrapage de la camera.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:activateBuff(buff, pos)` | Active un bonus a une position, met a jour la position du trigger sur la sortie correspondante. | 380 |
| `C:activatePropsAndBuffs()` | Fait apparaitre periodiquement des lignes de props (nombre aleatoire entre minPropLine et maxPropLine, sans doublon de voie) et place les bonus disponibles. | 458 |
| `C:calcMedal()` | Determine la medaille (Gold, Silver, Bronze, Wood) et le score suivant selon les pins gold/silver/bronze. | 732 |
| `C:checkBuffAvailabilty()` | Met a jour repairAvailable et coinAvailable (la piece n'est disponible que tant que coins < repairBuffCost). | 326 |
| `C:checkCoinForRepair()` | Quand assez de pieces sont collectees, les depense, rend le bonus de reparation disponible et emet repairSpawned. | 355 |
| `C:checkLose()` | Si le joueur est hors de la zone camera, compte jusqu'a 5 s (timeLeftToLose) puis emet 'lost' ; sinon remet le decompte a -1. | 285 |
| `C:checkTriggers()` | Gere les impulsions d'entree : cannon (tir via custom_input.fire), jumpRamp, crashGate (points), repairTrigger, coinTrigger. | 701 |
| `C:coinBuff()` | Ajoute une piece, desactive le bonus piece et emet coinEarnt (si la reparation n'est pas encore achetable). | 692 |
| `C:createDecalPool()` | Cree le pool de decalques (fleches d'aide). | 609 |
| `C:deactivateBuff(buff)` | Desactive un bonus (hors ecran, position {-1,0,0}) et met a jour la position du trigger correspondant. | 363 |
| `C:deactivateProp(propName)` | Reaffiche le decalque d'aide d'un prop desactive. | 395 |
| `C:deactivatePropsAndBuffs()` | Desactive les props et bonus passes trop loin derriere la camera (propDespawn = 40 m) et les remet dans la liste des props inactifs. | 403 |
| `C:doBuffsTime()` | Fait avancer les minuteries des bonus qui utilisent le temps (piece) jusqu'a ce qu'ils deviennent disponibles. | 340 |
| `C:doScore()` | Augmente le score selon la position du joueur par rapport a la camera, la vitesse de la camera et dtSim ; ecrit score. | 278 |
| `C:drawDecals()` | Dessine les decalques (fleches) sur les props qui ont decal.draw actif. | 627 |
| `C:getBuffByName(name)` | Renvoie le bonus de ce nom ('repair' ou 'coin'). | 428 |
| `C:getBuffNextTime(baseTime)` | Renvoie un delai aleatoire autour de baseTime (+/- 25 %). | 376 |
| `C:getPropByName(name)` | Renvoie les infos de prop (propsInfo) pour un nom jbeam. | 436 |
| `C:increaseDecalPool(amount)` | Agrandit le pool de decalques. | 603 |
| `C:init(mgr, ...)` | Vide. | 133 |
| `C:linkContainers()` | Rassemble les ids des pins cont1id..cont20id existants dans containers et calcule contTpDist (distance de teleportation = nombre de conteneurs / 2 * 13.25). | 211 |
| `C:linkProps()` | Recupere les vehicules du pool (propPool:getVehs()), enregistre dans propsInfo les decalques/rotations corrigees par jbeam, memorise les references balle/canon/caravane et le vehicule joueur (pin plId). | 138 |
| `C:moveCamera()` | Fait avancer la camera (core_camera.setPosRot) : acceleration initiale puis lente, ralentissement/rattrapage quand slowdownCar est actif ; ecrit camSpeed. | 233 |
| `C:moveTriggers()` | Met a jour les sorties gatePos, rampPos, cannonPos depuis la position des props actifs. | 528 |
| `C:pushBall()` | Si la balle est active et a bouge de plus de 3 m, ajoute des points proportionnels a la distance parcourue (ballPoint par metre) au score et aux points bonus ; ecrit ballPoints. | 304 |
| `C:repairBuff()` | Gele le vehicule joueur (setFreeze), desactive le bonus de reparation et lance le ralentissement. | 686 |
| `C:resetValues()` | Remet tout l'etat du jeu a zero et recree la table des bonus (repair, coin). | 749 |
| `C:setParameters()` | Copie les pins de reglage non nil vers les variables locales du module. | 786 |
| `C:setReferences()` | Recupere le pool, lie conteneurs et props, remplit les listes de props actifs/inactifs. | 571 |
| `C:slowDownCar()` | Pendant la reparation, attend que le vehicule soit presque arrete (< 0,1 m/s) puis le degele, emet 'repaired'. | 673 |
| `C:tpContainers()` | Teleporte vers l'avant les conteneurs passes derriere la camera (alternance voie droite/gauche). | 264 |
| `C:updateValues()` | Chaque frame : remet des sorties a leurs valeurs par defaut, lit position/rotation de la camera et du joueur, met a jour jumpPoints, gatePoints, totalBonusScore, coins. | 546 |
| `C:work()` | Boucle de jeu : reset eventuel, initialisation unique (parametres, references, pool de decalques), puis enchaine updateValues, tpContainers, moveCamera, doScore, checkLose, checkTriggers, gestion des props/bonus, pushBall, moveTriggers, drawDecals, calcMedal, checkCoinForRepair, slowDownCar ; ecrit drawCannon. | 807 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua`.*
