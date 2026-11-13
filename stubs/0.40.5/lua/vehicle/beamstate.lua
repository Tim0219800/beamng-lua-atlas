---@meta
-- tim19Atlas stub generated from lua/vehicle/beamstate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Etat physique du vehicule cote Lua (VM vehicule, globale `beamstate`). Suit les poutres cassees ou deformees, les groupes de casse (breakGroup) et de deformation (deformGroup), le score de degats par piece et par zone de carrosserie, les pneus crevés, les planetes (attracteurs de gravite locaux) et tous les coupleurs (attelages, remorques). Un moddeur s'en sert pour casser des groupes, crever des pneus, ajouter des degats, lire les degats, attacher ou detacher les coupleurs, sauvegarder ou charger l'etat des noeuds et poutres. Les hooks beamBroken, onBeamDeformed, onCouplerAttached et onCouplerDetached sont appeles par le moteur C++ ; updateGFX et init/reset par la boucle principale du vehicule.
--- Accès : globale `beamstate`
---@class beamstate
---@field activeParts string[] Noms des parties actives du vehicule, collectees depuis `v.data.slotMap`.
---@field attachedCouplers table<integer, table> Coupleurs actuellement attaches, par cid de noeud local : {obj2id, obj2nodeId, exportElectrics?, exportInputs?}.
---@field brokenBreakGroups table<string, boolean> Noms des breakGroups deja casses (valeur true). Table recreee a chaque init.
---@field couplerCache table<integer, table> Copie des noeuds jbeam qui ont un couplerTag ou un tag, indexee par cid de noeud (champs couplerTag, couplerWeld, couplerLock, couplerStrength, couplerRadius, couplerLockRadius, couplerLatchSpeed, couplerTargets, couplerStartRadius, breakGroup, importElectrics, importInputs).
---@field damage number Degats cumules du vehicule (energie dissipee + damageExt), mis a jour dans updateGFX.
---@field damageExt number Degats ajoutes artificiellement (addDamage, pneus crevés +1000). Remis a 0 par init.
---@field debugDraw function nop par defaut ; dessine des spheres sur les noeuds de coupleurs libres dont le tag est visible (setCouplerVisiblityExternal).
---@field deformGroupDamage table<string, table> Par deformGroup : {eventCount, damage, maxEvents, invMaxEvents}. `damage` = eventCount / maxEvents, de 0 a 1 environ.
---@field deformGroupsTriggerBeam table<string, integer> Par deformGroup, cid de la premiere poutre qui l'a declenche (deformation ou casse).
---@field deformedBeams table<integer, number> Alias de beamDamageTracker : par cid de poutre, ratio de deformation (onBeamDeformed) ou 1 si cassee.
---@field linkTagBeamMap table<string, integer[]> linkTag de poutre -> liste d'ids de poutres.
---@field lowpressure boolean true des qu'au moins un pneu a ete degonfle. Remis a false par reset().
---@field monetaryDamage number Remis a 0 par init, non modifie ailleurs dans ce fichier.
---@field nodeNameMap table<string, integer> Nom jbeam d'un noeud -> cid.
---@field tagBeamMap table<string, integer[]> Tag de poutre -> liste d'ids de poutres portant ce tag.
---@field update function nop sauf pendant la precompression progressive des poutres/barres de torsion ; appele par la boucle physique.
---@field updateRemoteElectrics function nop par defaut ; devient la vraie fonction apres sendExportCouplerData. Appelee deux fois par electrics.lua : fusionne dans electrics.values les valeurs recues d'un vehicule attele. Parametre retainReceivedElectrics : si faux/nil, vide la liste recue.
beamstate = {}

--- Active l'attelage automatique : pendant 60 s max, toutes les 0,5 s les coupleurs (tous, ou ceux des tags donnes) sont rearmes via attachCouplers. Diffuse la visibilite des tags aux autres vehicules. Sans argument, prevoit aussi l'extension `couplings`. Ne fait rien si le vehicule n'a aucun coupleur a tag.
---Source : lua/vehicle/beamstate.lua:252
---@param _nodetag string|string[]|nil Tag(s) de coupleur a viser ; nil = tous les coupleurs libres (ni welded ni locked).
function beamstate.activateAutoCoupling(_nodetag) end

--- Ajoute des degats artificiels a `damageExt` (donc a `damage`).
---Source : lua/vehicle/beamstate.lua:1426
---@param damage number Montant a ajouter.
function beamstate.addDamage(damage) end

--- Ajoute une planete (attracteur) via obj:setPlanets. Avec dt, la planete est temporaire : si elle existe deja avec dt > 0 on prolonge sa duree, avec dt = 0 on la supprime.
---Source : lua/vehicle/beamstate.lua:631
---@param center vec3 Centre.
---@param radius number Rayon.
---@param mass number Masse.
---@param dt number|nil Duree de vie en secondes ; nil = permanente.
function beamstate.addPlanet(center, radius, mass, dt) end

--- Arme (obj:attachCoupler) les coupleurs non welded portant un couplerTag, avec leurs parametres jbeam (couplerStrength defaut 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0).
---Source : lua/vehicle/beamstate.lua:304
---@param _nodetag string|nil Ne traite que ce couplerTag ; nil = tous.
function beamstate.attachCouplers(_nodetag) end

--- Hook C++ appele quand une poutre casse. Met a jour le suivi de degats (zone de carrosserie, piece), degonfle le pneu ou le groupe de pression concerne, casse les triangles de collision et les meshes, les rails, propage au breakGroup (breakGroupType 0/nil), change le materiau (deformSwitches) et lance des particules (plastique, verre, bois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:806
---@param id integer cid de la poutre.
---@param energy number Energie de rupture (non utilisee).
function beamstate.beamBroken(id, energy) end

--- Casse toutes les poutres qui ont un breakGroup (obj:breakBeam) et casse aussi les groupes qui ne contiennent que des coupleurs.
---Source : lua/vehicle/beamstate.lua:1356
function beamstate.breakAllBreakgroups() end

--- Casse un groupe : le marque dans brokenBreakGroups, cache les props du groupe, casse toutes ses poutres, detache ses coupleurs et casse les triangles de collision du meme groupe. Previent aussi la camera si c'est un groupe d'occupant (ocpAttach...).
---Source : lua/vehicle/beamstate.lua:169
---@param g string|nil Nom du breakGroup. nil : ne fait rien.
function beamstate.breakBreakGroup(g) end

--- Casse les poutres dont un breakGroup contient "hinge" ou "latch" (charnieres, loquets), ainsi que les groupes de coupleurs de ce type.
---Source : lua/vehicle/beamstate.lua:1368
function beamstate.breakHinges() end

--- Indique si un tag de coupleur (couplerTag ou tag) existe sur ce vehicule.
---Source : lua/vehicle/beamstate.lua:313
---@param _nodetag string Tag recherche.
---@return boolean|nil  true si existe, sinon nil.
function beamstate.couplerExists(_nodetag) end

--- Hook C++ appele quand un coupleur proche est trouve. Corps vide dans cette version (seulement un print commente).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:381
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre vehicule.
---@param obj2nodeId integer cid du noeud de l'autre vehicule.
function beamstate.couplerFound(nodeId, obj2id, obj2nodeId) end

--- Degonfle un pneu pris au hasard parmi ceux qui ne sont pas deja degonfles.
---Source : lua/vehicle/beamstate.lua:1397
function beamstate.deflateRandomTire() end

--- Degonfle un pneu. Au premier appel pour la roue : marque isTireDeflated, affiche le message, joue le son d'eclatement, enregistre le degat, appelle le hook `onTireDeflated(wheelid)` via extensions.hook, ajoute 1000 a damageExt et ramollit les poutres de la bande de roulement, des flancs et de la pression. Les appels suivants font monter le compteur ; au-dela de 4 le groupe de pression est vide.
---Source : lua/vehicle/beamstate.lua:524
---@param wheelid integer Index de roue (v.data.wheels / wheels.wheels).
function beamstate.deflateTire(wheelid) end

--- Appelle deflateTire pour toutes les roues.
---Source : lua/vehicle/beamstate.lua:1391
function beamstate.deflateTires() end

--- Supprime une planete (attracteur de gravite) identifiee par centre, rayon et masse exacts, puis met a jour le moteur.
---Source : lua/vehicle/beamstate.lua:621
---@param center vec3 Centre.
---@param radius number Rayon.
---@param mass number Masse.
function beamstate.delPlanet(center, radius, mass) end

--- Detache (obj:detachCoupler) les coupleurs d'un tag ou tous. Les coupleurs locked ou welded sont ignores sauf si on force. Notifie le jeu (onCouplerDetach) et l'extension couplings.
---Source : lua/vehicle/beamstate.lua:317
---@param _nodetag string|nil Tag a detacher ; nil = tous.
---@param forceLocked boolean|nil Detache aussi les coupleurs couplerLock.
---@param forceWelded boolean|nil Detache aussi les coupleurs couplerWeld.
function beamstate.detachCouplers(_nodetag, forceLocked, forceWelded) end

--- Arrete l'attelage automatique, efface les tags visibles et previent l'extension couplings.
---Source : lua/vehicle/beamstate.lua:291
function beamstate.disableAutoCoupling() end

--- Appelee depuis le vehicule qui veut importer des electrics. Chez le fournisseur, ajoute les electrics/inputs demandes a la liste transmise chaque frame (dans updateGFX) vers l'autre vehicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:479
---@param nodeid integer cid du noeud local de coupleur.
---@param dataList table {electrics = string[], inputs = string[]}.
function beamstate.exportCouplerData(nodeid, dataList) end

--- Ecrit les degats par piece dans le fichier `partDamage.json` (dumpToFile). Outil de debug.
---Source : lua/vehicle/beamstate.lua:1627
function beamstate.exportPartDamageData() end

--- Degat des six zones de carrosserie.
---Source : lua/vehicle/beamstate.lua:1618
---@return table<string, number>  {FL=, FR=, ML=, MR=, RL=, RR=}.
function beamstate.getBodyZoneDamage() end

--- Degat d'une zone de carrosserie (somme des poutres cassees + ratios de deformation, divisee par le nombre de poutres de la zone).
---Source : lua/vehicle/beamstate.lua:1606
---@param zone string "FL", "FR", "ML", "MR", "RL" ou "RR".
---@return number  Valeur de degat, 0 si zone inconnue ou vide.
function beamstate.getBodyZoneDamageValue(zone) end

--- Renvoie la position de chaque coupleur relative au noeud de reference du vehicule (refNodes[0].ref).
---Source : lua/vehicle/beamstate.lua:463
---@param couplerTag string|nil Filtre sur couplerTag ou tag ; nil ou "" = tous.
---@return table<integer, table>  Par cid : {x, y, z, couplerTag, tag}. Table vide si pas de noeuds.
function beamstate.getCouplerOffset(couplerTag) end

--- Estime l'etat d'une piece a partir de ses breakGroups casses et des poutres deformees (`beamDamage`). La piece (qui doit avoir un flexbody) est dite a remplacer si trop de groupes sont casses (>1, ou tous), plus de 1 % de poutres deformees (>= 0.01) ou plus de 2 poutres cassees (>= 0.9).
---Source : lua/vehicle/beamstate.lua:106
---@param partId string Identifiant de la piece (pour debug).
---@param partTypeData string[]|nil Tags de la piece de forme "jbeam:breakGroup:nom", "jbeam:flexbody", "jbeam:beamDamage:<cid>".
---@return table  {integrityValue, integrityState, visualValue, visualState} ; visualState.needsReplacement = true et integrityValue = 0 si la piece est trop abimee.
---@return boolean  true si un etat a pu etre fourni.
function beamstate.getPartCondition(partId, partTypeData) end

--- Score de degat d'une piece a partir de son nom de signal.
---Source : lua/vehicle/beamstate.lua:1581
---@param name string Nom de signal (cf. getPartDamageSignalList).
---@return number|nil  Score 0 a 1, nil si le nom est inconnu.
function beamstate.getPartDamageBySignalName(name) end

--- Renvoie les pieces ayant un degat strictement positif.
---Source : lua/vehicle/beamstate.lua:1560
---@return table<string, table>  partPath -> {name, damage} ; damage = max(poutres cassees / seuil, poutres deformees / seuil), entre 0 et 1.
function beamstate.getPartDamageData() end

--- Table plate nom-de-signal -> score de degat pour toutes les pieces, y compris celles a 0.
---Source : lua/vehicle/beamstate.lua:1572
---@return table<string, number>  Nom court de piece (ou chemin avec "_" en cas de doublon) -> score 0 a 1.
function beamstate.getPartDamageScores() end

--- Liste triee des noms de signaux de pieces disponibles.
---Source : lua/vehicle/beamstate.lua:1593
---@return table[]  {{name = string, type = "number"}, ...}.
function beamstate.getPartDamageSignalList() end

--- Renvoie une photo du vehicule (id, conditions de pieces, itemId de config, position, vecteurs avant et haut). Contient un faux delai de 1 s volontaire (voir notes).
---Source : lua/vehicle/beamstate.lua:1539
---@param ... any Valeurs renvoyees telles quelles apres l'etat.
---@return table  {objId, partsCondition, itemId, pos, front, up}.
---@return any  Les arguments supplementaires passes en entree.
function beamstate.getVehicleState(...) end

--- Indique si le vehicule a au moins un coupleur non welded portant un couplerTag.
---Source : lua/vehicle/beamstate.lua:1447
---@param couplerTag string|nil Filtre sur couplerTag ou tag ; nil = tous.
---@return boolean  true si un coupleur correspond.
function beamstate.hasCouplers(couplerTag) end

--- Appelee par l'hote fournisseur. Stocke les electrics recus (fusionnes ensuite dans electrics.values par updateRemoteElectrics) et rejoue les inputs via input.event(nom, valeur, 2). Ignore les donnees si le coupleur n'est plus attache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:496
---@param nodeId integer cid du noeud local.
---@param data table {electrics = table<string, any>, inputs = table<string, number>}.
function beamstate.importCouplerData(nodeId, data) end

--- Reconstruit tout l'etat a partir de `v.data` : remet les degats a zero, vide les caches, reindexe triangles, breakGroups, deformGroups, coupleurs, tags de poutres, zones de carrosserie, donnees de pieces ; prepare la precompression retardee, la liste des signaux de pieces, et enregistre le menu radial des coupleurs. Appelee au chargement du vehicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:1049
function beamstate.init() end

--- Indique si beamstate a besoin de la boucle physique (true seulement tant que la precompression retardee est en cours).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:1632
---@return boolean  true si M.update est actif.
function beamstate.isPhysicsStepUsed() end

--- Indique si un triangle de collision est casse (absent du suivi interne).
---Source : lua/vehicle/beamstate.lua:961
---@param triId integer cid du triangle.
---@return boolean  true si casse ou inconnu.
function beamstate.isTriangleBroken(triId) end

--- Recharge un fichier ecrit par save. Verifie que le nombre de noeuds/poutres, le dossier du vehicule et le format correspondent, sinon log d'erreur et abandon. Restaure noeuds, masses, longueurs, poutres cassees/deformees puis appelle obj:commitLoad().
---Source : lua/vehicle/beamstate.lua:1496
---@param filename string|nil Chemin ; par defaut `<vehicleDirectory>/vehicle.save.json`.
function beamstate.load(filename) end

--- Hook C++ appele seulement pour les poutres qui ont un seuil de deformation. Met a jour `deformedBeams`, les degats de zone et de piece, change de materiau (deformSwitches) et compte les evenements du ou des deformGroup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:1308
---@param id integer cid de la poutre.
---@param ratio number Ratio de deformation de la poutre.
function beamstate.onBeamDeformed(id, ratio) end

--- Hook C++ appele quand un coupleur s'attache. Enregistre l'attelage dans attachedCouplers, copie les flags lock/weld entre coupleurs du meme vehicule, coupe l'attelage auto si c'etait ce tag, demande l'import d'electrics/inputs si le noeud a importElectrics/importInputs, restaure ses breakGroups de coupleur, puis previent le jeu (onCouplerAttached cote GE, une seule fois : par le vehicule d'id le plus petit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:402
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre vehicule.
---@param obj2nodeId integer cid du noeud de l'autre vehicule.
---@param attachSpeed number Vitesse d'attache (non utilisee ici).
---@param attachEnergy number Energie d'attache (non utilisee ici).
function beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Hook C++ appele quand un coupleur se detache. Retire l'attelage, casse les breakGroups du noeud si breakGroupType vaut 0 ou nil, puis previent le jeu (onCouplerDetached cote GE, une seule fois par paire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:441
---@param nodeId integer cid du noeud local.
---@param obj2id integer Id de l'autre vehicule.
---@param obj2nodeId integer cid du noeud de l'autre vehicule.
---@param breakForce number Force de rupture transmise au jeu.
function beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Enregistre un cid de noeud-coupleur dans un breakGroup, pour qu'un breakBreakGroup ulterieur le detache. Utilisee par des extensions de couplage.
---Source : lua/vehicle/beamstate.lua:776
---@param breakGroup string Nom du groupe.
---@param cid integer cid du noeud de coupleur.
function beamstate.registerExternalCouplerBreakGroup(breakGroup, cid) end

--- Pour l'UI : envoie la geometrie des poutres (paires de positions de noeuds) via guihooks "VehicleSkeleton", puis l'etat du squelette. Ne fait rien d'affichable si aucun joueur n'est assis.
---Source : lua/vehicle/beamstate.lua:1430
function beamstate.requestSkeleton() end

--- Envoie a l'UI l'etat des poutres (`beamDamageTracker`) via guihooks "VehicleSkeletonState" si un joueur est assis dans ce vehicule. Appelee aussi toutes les 0,25 s quand des degats ont change.
---Source : lua/vehicle/beamstate.lua:517
function beamstate.requestSkeletonState() end

--- Reinitialise l'etat (appelle init) et remet `lowpressure` a false. Appelee au reset du vehicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:1351
function beamstate.reset() end

--- Ecrit un JSON (format "v2") de l'etat : positions et masses des noeuds, longueur au repos, cassure et deformation des poutres, etat des hydros et paquets Lua serialises.
---Source : lua/vehicle/beamstate.lua:1457
---@param filename string|nil Chemin ; par defaut `<vehicleDirectory>/vehicle.save.json`.
function beamstate.save(filename) end

--- Demande a l'autre vehicule (queueObjectLuaCommand -> exportCouplerData) d'exporter vers nous certaines valeurs electrics/inputs, et active updateRemoteElectrics.
---Source : lua/vehicle/beamstate.lua:397
---@param obj2Id integer Id de l'autre vehicule.
---@param obj2nodeId integer cid du noeud de coupleur de l'autre vehicule.
---@param data table {electrics = string[], inputs = string[]}.
function beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data) end

--- Appelee par un autre vehicule (via BeamEngine:queueAllObjectLua) pour activer/desactiver la surbrillance des coupleurs dont le tag est dans la liste. (Le nom contient la faute "Visiblity".)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:242
---@param sourceObjectID integer Id du vehicule qui diffuse (non utilise).
---@param visibleTags table<string, boolean>|false|nil Tags visibles ; faux/nil desactive l'affichage.
function beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags) end

--- Appliquerait un etat d'integrite/visuel a une piece. Dans cette version le corps est quasi vide (le code utile est commente) : ne fait rien d'utile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:71
---@param partId string Identifiant de la piece.
---@param partTypeData string[] Liste de types de piece (ex. "jbeam:breakGroup:nom").
---@param odometer any Non utilise.
---@param integrity number|table Valeur ou table d'integrite.
---@param visual number|table Valeur ou table d'etat visuel.
function beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual) end

--- Remplace toutes les planetes. Le tableau est lu par triplets (centre, rayon, masse).
---Source : lua/vehicle/beamstate.lua:659
---@param p table {vec3, rayon, masse, vec3, rayon, masse, ...}.
function beamstate.setPlanets(p) end

--- Bascule les attelages ; appelee a l'appui sur la touche L. Sans tag : coupe l'attelage auto s'il est actif, detache tout si un coupleur est attache, sinon lance l'attelage auto. Avec un tag : detache s'il est attache, sinon l'attache (sauf forceAutoCoupling).
---Source : lua/vehicle/beamstate.lua:351
---@param _nodetag string|nil Tag cible.
---@param forceLocked boolean|nil Transmis a detachCouplers.
---@param forceWelded boolean|nil Transmis a detachCouplers.
---@param forceAutoCoupling boolean|nil Avec un tag, force la logique de l'attelage automatique.
function beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling) end

--- Hook C++ appele quand une barre de torsion casse. Si elle a un breakGroup, cache les props et casse le groupe (breakGroupType 0 ou nil), comme beamBroken le fait pour les poutres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:781
---@param id integer Index de la barre de torsion dans v.data.torsionbars.
---@param energy number Energie de rupture (non utilisee).
function beamstate.torsionBarBroken(id, energy) end

--- Declenche le changement de materiau du premier deformSwitches correspondant au groupe de deformation donne.
---Source : lua/vehicle/beamstate.lua:1409
---@param group string|nil Nom du deformGroup ; nil ne fait rien.
function beamstate.triggerDeformGroup(group) end

--- Appelee chaque frame graphique. Gere les minuteurs des planetes temporaires, recalcule `damage`, le score de degats par piece, envoie l'etat du squelette a l'UI (au plus toutes les 0,25 s), pilote l'attelage automatique (timeout 60 s) et transmet aux vehicules attelés les electrics/inputs demandes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/beamstate.lua:672
---@param dt number Pas de temps en secondes.
function beamstate.updateGFX(dt) end

