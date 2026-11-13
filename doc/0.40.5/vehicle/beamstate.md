# `beamstate`

*Fichier : `lua/vehicle/beamstate.lua` · VM : Véhicule · 1700 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `beamstate`

Etat physique du vehicule cote Lua (VM vehicule, globale `beamstate`). Suit les poutres cassees ou deformees, les groupes de casse (breakGroup) et de deformation (deformGroup), le score de degats par piece et par zone de carrosserie, les pneus crevés, les planetes (attracteurs de gravite locaux) et tous les coupleurs (attelages, remorques). Un moddeur s'en sert pour casser des groupes, crever des pneus, ajouter des degats, lire les degats, attacher ou detacher les coupleurs, sauvegarder ou charger l'etat des noeuds et poutres. Les hooks beamBroken, onBeamDeformed, onCouplerAttached et onCouplerDetached sont appeles par le moteur C++ ; updateGFX et init/reset par la boucle principale du vehicule.

## Exemple

```lua
-- casser un groupe, crever un pneu, lire les degats
beamstate.breakBreakGroup("doorFL_break")
beamstate.deflateTire(0)
local zones = beamstate.getBodyZoneDamage() -- {FL=0..1, FR=..., ML, MR, RL, RR}
print(beamstate.damage)
-- toggle des attelages
beamstate.toggleCouplers()
```

## Remarques

- `beamstate.damage` = energie dissipee du moteur (`obj:getDissipatedEnergy()`) + `damageExt`, recalcule a chaque updateGFX. `damageExt` est incremente par addDamage et de 1000 a chaque pneu qui se degonfle.
- Les ids de poutres, noeuds, roues et triangles sont des `cid` (index 0 base du moteur).
- Zones de carrosserie : lettre 1 = avant/milieu/arriere (F, M, R selon y en tiers), lettre 2 = L/R selon x (moitie). Les poutres de roue (wheelID) ne comptent pas. Valeurs de degats de 0 a 1 environ.
- breakGroupType d'une poutre : 0 ou nil = casser cette poutre casse tout le groupe ; 1 = la poutre est cassee par le groupe mais ne le declenche pas.
- Une poutre ayant `beamPrecompressionTime` (ou une barre de torsion avec `precompressionTime`) active `M.update` pendant le temps de precompression progressive ; ensuite `M.update` revient a `nop`.
- M.update, M.updateRemoteElectrics et M.debugDraw valent `nop` (fonction vide du jeu) et non nil ; les champs listes comme references `nop` sont donc des fonctions vides. `update` n'est actif que pendant la precompression ; `updateRemoteElectrics` est installe a la premiere exportation de donnees de coupleur ; `debugDraw` est actif tant que la visibilite des coupleurs est demandee.
- Bug potentiel : dans init, `for _, tag in b.tag do` (et la variante linkTag) itere sans `pairs`, donc une poutre dont `tag` ou `linkTag` est une table provoque une erreur Lua. La branche linkTag teste aussi `type(b.tag)` au lieu de `type(b.linkTag)`.
- Bug potentiel : onCouplerAttached lit `n.breakGroup` sans verifier que `n` (noeud) est non nil, alors que le test precedent le verifie.
- `beamstate.getVehicleState` contient un faux delai volontaire d'1 seconde (boucle d'attente active) et un log d'avertissement : a ne pas appeler dans une boucle de jeu.
- `brokenBreakGroups` est remplace par une nouvelle table a chaque init/reset : ne pas conserver une reference ancienne. En revanche `deformedBeams`, `couplerCache`, `attachedCouplers`, `nodeNameMap`, `tagBeamMap` sont vides puis remplis en place.
- Champs exportes mais jamais ecrits dans ce fichier : `lowpressure` est mis a true des qu'un pneu est degonfle et remis a false seulement par reset().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `beamstate.activateAutoCoupling(_nodetag)` | Active l'attelage automatique : pendant 60 s max, toutes les 0,5 s les coupleurs (tous, ou ceux des tags donnes) sont rearmes via attachCouplers. Diffuse la visibilite des tags aux autres vehicules. Sans argument, prevoit aussi l'extension `couplings`. Ne fait rien si le vehicule n'a aucun coupleur a tag. | 252 |
| `beamstate.addDamage(damage)` | Ajoute des degats artificiels a `damageExt` (donc a `damage`). | 1426 |
| `beamstate.addPlanet(center, radius, mass, dt)` | Ajoute une planete (attracteur) via obj:setPlanets. Avec dt, la planete est temporaire : si elle existe deja avec dt > 0 on prolonge sa duree, avec dt = 0 on la supprime. | 631 |
| `beamstate.attachCouplers(_nodetag)` | Arme (obj:attachCoupler) les coupleurs non welded portant un couplerTag, avec leurs parametres jbeam (couplerStrength defaut 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0). | 304 |
| `beamstate.beamBroken(id, energy)` | Hook C++ appele quand une poutre casse. Met a jour le suivi de degats (zone de carrosserie, piece), degonfle le pneu ou le groupe de pression concerne, casse les triangles de collision et les meshes, les rails, propage au breakGroup (breakGroupType 0/nil), change le materiau (deformSwitches) et lance des particules (plastique, verre, bois). *(interne)* | 806 |
| `beamstate.breakAllBreakgroups()` | Casse toutes les poutres qui ont un breakGroup (obj:breakBeam) et casse aussi les groupes qui ne contiennent que des coupleurs. | 1356 |
| `beamstate.breakBreakGroup(g)` | Casse un groupe : le marque dans brokenBreakGroups, cache les props du groupe, casse toutes ses poutres, detache ses coupleurs et casse les triangles de collision du meme groupe. Previent aussi la camera si c'est un groupe d'occupant (ocpAttach...). | 169 |
| `beamstate.breakHinges()` | Casse les poutres dont un breakGroup contient "hinge" ou "latch" (charnieres, loquets), ainsi que les groupes de coupleurs de ce type. | 1368 |
| `beamstate.couplerExists(_nodetag)` | Indique si un tag de coupleur (couplerTag ou tag) existe sur ce vehicule. | 313 |
| `beamstate.couplerFound(nodeId, obj2id, obj2nodeId)` | Hook C++ appele quand un coupleur proche est trouve. Corps vide dans cette version (seulement un print commente). *(interne)* | 381 |
| `beamstate.deflateRandomTire()` | Degonfle un pneu pris au hasard parmi ceux qui ne sont pas deja degonfles. | 1397 |
| `beamstate.deflateTire(wheelid)` | Degonfle un pneu. Au premier appel pour la roue : marque isTireDeflated, affiche le message, joue le son d'eclatement, enregistre le degat, appelle le hook `onTireDeflated(wheelid)` via extensions.hook, ajoute 1000 a damageExt et ramollit les poutres de la bande de roulement, des flancs et de la pression. Les appels suivants font monter le compteur ; au-dela de 4 le groupe de pression est vide. | 524 |
| `beamstate.deflateTires()` | Appelle deflateTire pour toutes les roues. | 1391 |
| `beamstate.delPlanet(center, radius, mass)` | Supprime une planete (attracteur de gravite) identifiee par centre, rayon et masse exacts, puis met a jour le moteur. | 621 |
| `beamstate.detachCouplers(_nodetag, forceLocked, forceWelded)` | Detache (obj:detachCoupler) les coupleurs d'un tag ou tous. Les coupleurs locked ou welded sont ignores sauf si on force. Notifie le jeu (onCouplerDetach) et l'extension couplings. | 317 |
| `beamstate.disableAutoCoupling()` | Arrete l'attelage automatique, efface les tags visibles et previent l'extension couplings. | 291 |
| `beamstate.exportCouplerData(nodeid, dataList)` | Appelee depuis le vehicule qui veut importer des electrics. Chez le fournisseur, ajoute les electrics/inputs demandes a la liste transmise chaque frame (dans updateGFX) vers l'autre vehicule. *(interne)* | 479 |
| `beamstate.exportPartDamageData()` | Ecrit les degats par piece dans le fichier `partDamage.json` (dumpToFile). Outil de debug. | 1627 |
| `beamstate.getBodyZoneDamage()` | Degat des six zones de carrosserie. | 1618 |
| `beamstate.getBodyZoneDamageValue(zone)` | Degat d'une zone de carrosserie (somme des poutres cassees + ratios de deformation, divisee par le nombre de poutres de la zone). | 1606 |
| `beamstate.getCouplerOffset(couplerTag)` | Renvoie la position de chaque coupleur relative au noeud de reference du vehicule (refNodes[0].ref). | 463 |
| `beamstate.getPartCondition(partId, partTypeData)` | Estime l'etat d'une piece a partir de ses breakGroups casses et des poutres deformees (`beamDamage`). La piece (qui doit avoir un flexbody) est dite a remplacer si trop de groupes sont casses (>1, ou tous), plus de 1 % de poutres deformees (>= 0.01) ou plus de 2 poutres cassees (>= 0.9). | 106 |
| `beamstate.getPartDamageBySignalName(name)` | Score de degat d'une piece a partir de son nom de signal. | 1581 |
| `beamstate.getPartDamageData()` | Renvoie les pieces ayant un degat strictement positif. | 1560 |
| `beamstate.getPartDamageScores()` | Table plate nom-de-signal -> score de degat pour toutes les pieces, y compris celles a 0. | 1572 |
| `beamstate.getPartDamageSignalList()` | Liste triee des noms de signaux de pieces disponibles. | 1593 |
| `beamstate.getVehicleState(...)` | Renvoie une photo du vehicule (id, conditions de pieces, itemId de config, position, vecteurs avant et haut). Contient un faux delai de 1 s volontaire (voir notes). | 1539 |
| `beamstate.hasCouplers(couplerTag)` | Indique si le vehicule a au moins un coupleur non welded portant un couplerTag. | 1447 |
| `beamstate.importCouplerData(nodeId, data)` | Appelee par l'hote fournisseur. Stocke les electrics recus (fusionnes ensuite dans electrics.values par updateRemoteElectrics) et rejoue les inputs via input.event(nom, valeur, 2). Ignore les donnees si le coupleur n'est plus attache. *(interne)* | 496 |
| `beamstate.init()` | Reconstruit tout l'etat a partir de `v.data` : remet les degats a zero, vide les caches, reindexe triangles, breakGroups, deformGroups, coupleurs, tags de poutres, zones de carrosserie, donnees de pieces ; prepare la precompression retardee, la liste des signaux de pieces, et enregistre le menu radial des coupleurs. Appelee au chargement du vehicule. *(interne)* | 1049 |
| `beamstate.isPhysicsStepUsed()` | Indique si beamstate a besoin de la boucle physique (true seulement tant que la precompression retardee est en cours). *(interne)* | 1632 |
| `beamstate.isTriangleBroken(triId)` | Indique si un triangle de collision est casse (absent du suivi interne). | 961 |
| `beamstate.load(filename)` | Recharge un fichier ecrit par save. Verifie que le nombre de noeuds/poutres, le dossier du vehicule et le format correspondent, sinon log d'erreur et abandon. Restaure noeuds, masses, longueurs, poutres cassees/deformees puis appelle obj:commitLoad(). | 1496 |
| `beamstate.onBeamDeformed(id, ratio)` | Hook C++ appele seulement pour les poutres qui ont un seuil de deformation. Met a jour `deformedBeams`, les degats de zone et de piece, change de materiau (deformSwitches) et compte les evenements du ou des deformGroup. *(interne)* *(hook)* | 1308 |
| `beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)` | Hook C++ appele quand un coupleur s'attache. Enregistre l'attelage dans attachedCouplers, copie les flags lock/weld entre coupleurs du meme vehicule, coupe l'attelage auto si c'etait ce tag, demande l'import d'electrics/inputs si le noeud a importElectrics/importInputs, restaure ses breakGroups de coupleur, puis previent le jeu (onCouplerAttached cote GE, une seule fois : par le vehicule d'id le plus petit). *(interne)* *(hook)* | 402 |
| `beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook C++ appele quand un coupleur se detache. Retire l'attelage, casse les breakGroups du noeud si breakGroupType vaut 0 ou nil, puis previent le jeu (onCouplerDetached cote GE, une seule fois par paire). *(interne)* *(hook)* | 441 |
| `beamstate.registerExternalCouplerBreakGroup(breakGroup, cid)` | Enregistre un cid de noeud-coupleur dans un breakGroup, pour qu'un breakBreakGroup ulterieur le detache. Utilisee par des extensions de couplage. | 776 |
| `beamstate.requestSkeleton()` | Pour l'UI : envoie la geometrie des poutres (paires de positions de noeuds) via guihooks "VehicleSkeleton", puis l'etat du squelette. Ne fait rien d'affichable si aucun joueur n'est assis. | 1430 |
| `beamstate.requestSkeletonState()` | Envoie a l'UI l'etat des poutres (`beamDamageTracker`) via guihooks "VehicleSkeletonState" si un joueur est assis dans ce vehicule. Appelee aussi toutes les 0,25 s quand des degats ont change. | 517 |
| `beamstate.reset()` | Reinitialise l'etat (appelle init) et remet `lowpressure` a false. Appelee au reset du vehicule. *(interne)* | 1351 |
| `beamstate.save(filename)` | Ecrit un JSON (format "v2") de l'etat : positions et masses des noeuds, longueur au repos, cassure et deformation des poutres, etat des hydros et paquets Lua serialises. | 1457 |
| `beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data)` | Demande a l'autre vehicule (queueObjectLuaCommand -> exportCouplerData) d'exporter vers nous certaines valeurs electrics/inputs, et active updateRemoteElectrics. | 397 |
| `beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags)` | Appelee par un autre vehicule (via BeamEngine:queueAllObjectLua) pour activer/desactiver la surbrillance des coupleurs dont le tag est dans la liste. (Le nom contient la faute "Visiblity".) *(interne)* | 242 |
| `beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual)` | Appliquerait un etat d'integrite/visuel a une piece. Dans cette version le corps est quasi vide (le code utile est commente) : ne fait rien d'utile. *(interne)* | 71 |
| `beamstate.setPlanets(p)` | Remplace toutes les planetes. Le tableau est lu par triplets (centre, rayon, masse). | 659 |
| `beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling)` | Bascule les attelages ; appelee a l'appui sur la touche L. Sans tag : coupe l'attelage auto s'il est actif, detache tout si un coupleur est attache, sinon lance l'attelage auto. Avec un tag : detache s'il est attache, sinon l'attache (sauf forceAutoCoupling). | 351 |
| `beamstate.torsionBarBroken(id, energy)` | Hook C++ appele quand une barre de torsion casse. Si elle a un breakGroup, cache les props et casse le groupe (breakGroupType 0 ou nil), comme beamBroken le fait pour les poutres. *(interne)* | 781 |
| `beamstate.triggerDeformGroup(group)` | Declenche le changement de materiau du premier deformSwitches correspondant au groupe de deformation donne. | 1409 |
| `beamstate.updateGFX(dt)` | Appelee chaque frame graphique. Gere les minuteurs des planetes temporaires, recalcule `damage`, le score de degats par piece, envoie l'etat du squelette a l'UI (au plus toutes les 0,25 s), pilote l'attelage automatique (timeout 60 s) et transmet aux vehicules attelés les electrics/inputs demandes. *(interne)* | 672 |

### Détail des paramètres

#### `beamstate.activateAutoCoupling(_nodetag)`

Active l'attelage automatique : pendant 60 s max, toutes les 0,5 s les coupleurs (tous, ou ceux des tags donnes) sont rearmes via attachCouplers. Diffuse la visibilite des tags aux autres vehicules. Sans argument, prevoit aussi l'extension `couplings`. Ne fait rien si le vehicule n'a aucun coupleur a tag.

- `_nodetag` (*string|string[]|nil*) : Tag(s) de coupleur a viser ; nil = tous les coupleurs libres (ni welded ni locked).

#### `beamstate.addDamage(damage)`

Ajoute des degats artificiels a `damageExt` (donc a `damage`).

- `damage` (*number*) : Montant a ajouter.

#### `beamstate.addPlanet(center, radius, mass, dt)`

Ajoute une planete (attracteur) via obj:setPlanets. Avec dt, la planete est temporaire : si elle existe deja avec dt > 0 on prolonge sa duree, avec dt = 0 on la supprime.

- `center` (*vec3*) : Centre.
- `radius` (*number*) : Rayon.
- `mass` (*number*) : Masse.
- `dt` (*number|nil*) : Duree de vie en secondes ; nil = permanente.

#### `beamstate.attachCouplers(_nodetag)`

Arme (obj:attachCoupler) les coupleurs non welded portant un couplerTag, avec leurs parametres jbeam (couplerStrength defaut 1000000, couplerRadius 0.2, couplerLockRadius 0.025, couplerLatchSpeed 0.3, couplerTargets 0).

- `_nodetag` (*string|nil*) : Ne traite que ce couplerTag ; nil = tous.

#### `beamstate.beamBroken(id, energy)`

Hook C++ appele quand une poutre casse. Met a jour le suivi de degats (zone de carrosserie, piece), degonfle le pneu ou le groupe de pression concerne, casse les triangles de collision et les meshes, les rails, propage au breakGroup (breakGroupType 0/nil), change le materiau (deformSwitches) et lance des particules (plastique, verre, bois).

- `id` (*integer*) : cid de la poutre.
- `energy` (*number*) : Energie de rupture (non utilisee).

#### `beamstate.breakBreakGroup(g)`

Casse un groupe : le marque dans brokenBreakGroups, cache les props du groupe, casse toutes ses poutres, detache ses coupleurs et casse les triangles de collision du meme groupe. Previent aussi la camera si c'est un groupe d'occupant (ocpAttach...).

- `g` (*string|nil*) : Nom du breakGroup. nil : ne fait rien.

#### `beamstate.couplerExists(_nodetag)`

Indique si un tag de coupleur (couplerTag ou tag) existe sur ce vehicule.

- `_nodetag` (*string*) : Tag recherche.
- **renvoie** : boolean|nil true si existe, sinon nil.

#### `beamstate.couplerFound(nodeId, obj2id, obj2nodeId)`

Hook C++ appele quand un coupleur proche est trouve. Corps vide dans cette version (seulement un print commente).

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre vehicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre vehicule.

#### `beamstate.deflateTire(wheelid)`

Degonfle un pneu. Au premier appel pour la roue : marque isTireDeflated, affiche le message, joue le son d'eclatement, enregistre le degat, appelle le hook `onTireDeflated(wheelid)` via extensions.hook, ajoute 1000 a damageExt et ramollit les poutres de la bande de roulement, des flancs et de la pression. Les appels suivants font monter le compteur ; au-dela de 4 le groupe de pression est vide.

- `wheelid` (*integer*) : Index de roue (v.data.wheels / wheels.wheels).

#### `beamstate.delPlanet(center, radius, mass)`

Supprime une planete (attracteur de gravite) identifiee par centre, rayon et masse exacts, puis met a jour le moteur.

- `center` (*vec3*) : Centre.
- `radius` (*number*) : Rayon.
- `mass` (*number*) : Masse.

#### `beamstate.detachCouplers(_nodetag, forceLocked, forceWelded)`

Detache (obj:detachCoupler) les coupleurs d'un tag ou tous. Les coupleurs locked ou welded sont ignores sauf si on force. Notifie le jeu (onCouplerDetach) et l'extension couplings.

- `_nodetag` (*string|nil*) : Tag a detacher ; nil = tous.
- `forceLocked` (*boolean|nil*) : Detache aussi les coupleurs couplerLock.
- `forceWelded` (*boolean|nil*) : Detache aussi les coupleurs couplerWeld.

#### `beamstate.exportCouplerData(nodeid, dataList)`

Appelee depuis le vehicule qui veut importer des electrics. Chez le fournisseur, ajoute les electrics/inputs demandes a la liste transmise chaque frame (dans updateGFX) vers l'autre vehicule.

- `nodeid` (*integer*) : cid du noeud local de coupleur.
- `dataList` (*table*) : {electrics = string[], inputs = string[]}.

#### `beamstate.getBodyZoneDamage()`

Degat des six zones de carrosserie.

- **renvoie** : table<string, number> {FL=, FR=, ML=, MR=, RL=, RR=}.

#### `beamstate.getBodyZoneDamageValue(zone)`

Degat d'une zone de carrosserie (somme des poutres cassees + ratios de deformation, divisee par le nombre de poutres de la zone).

- `zone` (*string*) : "FL", "FR", "ML", "MR", "RL" ou "RR".
- **renvoie** : number Valeur de degat, 0 si zone inconnue ou vide.

#### `beamstate.getCouplerOffset(couplerTag)`

Renvoie la position de chaque coupleur relative au noeud de reference du vehicule (refNodes[0].ref).

- `couplerTag` (*string|nil*) : Filtre sur couplerTag ou tag ; nil ou "" = tous.
- **renvoie** : table<integer, table> Par cid : {x, y, z, couplerTag, tag}. Table vide si pas de noeuds.

#### `beamstate.getPartCondition(partId, partTypeData)`

Estime l'etat d'une piece a partir de ses breakGroups casses et des poutres deformees (`beamDamage`). La piece (qui doit avoir un flexbody) est dite a remplacer si trop de groupes sont casses (>1, ou tous), plus de 1 % de poutres deformees (>= 0.01) ou plus de 2 poutres cassees (>= 0.9).

- `partId` (*string*) : Identifiant de la piece (pour debug).
- `partTypeData` (*string[]|nil*) : Tags de la piece de forme "jbeam:breakGroup:nom", "jbeam:flexbody", "jbeam:beamDamage:<cid>".
- **renvoie** : table {integrityValue, integrityState, visualValue, visualState} ; visualState.needsReplacement = true et integrityValue = 0 si la piece est trop abimee.
- **renvoie** : boolean true si un etat a pu etre fourni.

#### `beamstate.getPartDamageBySignalName(name)`

Score de degat d'une piece a partir de son nom de signal.

- `name` (*string*) : Nom de signal (cf. getPartDamageSignalList).
- **renvoie** : number|nil Score 0 a 1, nil si le nom est inconnu.

#### `beamstate.getPartDamageData()`

Renvoie les pieces ayant un degat strictement positif.

- **renvoie** : table<string, table> partPath -> {name, damage} ; damage = max(poutres cassees / seuil, poutres deformees / seuil), entre 0 et 1.

#### `beamstate.getPartDamageScores()`

Table plate nom-de-signal -> score de degat pour toutes les pieces, y compris celles a 0.

- **renvoie** : table<string, number> Nom court de piece (ou chemin avec "_" en cas de doublon) -> score 0 a 1.

#### `beamstate.getPartDamageSignalList()`

Liste triee des noms de signaux de pieces disponibles.

- **renvoie** : table[] {{name = string, type = "number"}, ...}.

#### `beamstate.getVehicleState(...)`

Renvoie une photo du vehicule (id, conditions de pieces, itemId de config, position, vecteurs avant et haut). Contient un faux delai de 1 s volontaire (voir notes).

- `...` (*any*) : Valeurs renvoyees telles quelles apres l'etat.
- **renvoie** : table {objId, partsCondition, itemId, pos, front, up}.
- **renvoie** : any Les arguments supplementaires passes en entree.

#### `beamstate.hasCouplers(couplerTag)`

Indique si le vehicule a au moins un coupleur non welded portant un couplerTag.

- `couplerTag` (*string|nil*) : Filtre sur couplerTag ou tag ; nil = tous.
- **renvoie** : boolean true si un coupleur correspond.

#### `beamstate.importCouplerData(nodeId, data)`

Appelee par l'hote fournisseur. Stocke les electrics recus (fusionnes ensuite dans electrics.values par updateRemoteElectrics) et rejoue les inputs via input.event(nom, valeur, 2). Ignore les donnees si le coupleur n'est plus attache.

- `nodeId` (*integer*) : cid du noeud local.
- `data` (*table*) : {electrics = table<string, any>, inputs = table<string, number>}.

#### `beamstate.isPhysicsStepUsed()`

Indique si beamstate a besoin de la boucle physique (true seulement tant que la precompression retardee est en cours).

- **renvoie** : boolean true si M.update est actif.

#### `beamstate.isTriangleBroken(triId)`

Indique si un triangle de collision est casse (absent du suivi interne).

- `triId` (*integer*) : cid du triangle.
- **renvoie** : boolean true si casse ou inconnu.

#### `beamstate.load(filename)`

Recharge un fichier ecrit par save. Verifie que le nombre de noeuds/poutres, le dossier du vehicule et le format correspondent, sinon log d'erreur et abandon. Restaure noeuds, masses, longueurs, poutres cassees/deformees puis appelle obj:commitLoad().

- `filename` (*string|nil*) : Chemin ; par defaut `<vehicleDirectory>/vehicle.save.json`.

#### `beamstate.onBeamDeformed(id, ratio)`

Hook C++ appele seulement pour les poutres qui ont un seuil de deformation. Met a jour `deformedBeams`, les degats de zone et de piece, change de materiau (deformSwitches) et compte les evenements du ou des deformGroup.

- `id` (*integer*) : cid de la poutre.
- `ratio` (*number*) : Ratio de deformation de la poutre.

#### `beamstate.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy)`

Hook C++ appele quand un coupleur s'attache. Enregistre l'attelage dans attachedCouplers, copie les flags lock/weld entre coupleurs du meme vehicule, coupe l'attelage auto si c'etait ce tag, demande l'import d'electrics/inputs si le noeud a importElectrics/importInputs, restaure ses breakGroups de coupleur, puis previent le jeu (onCouplerAttached cote GE, une seule fois : par le vehicule d'id le plus petit).

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre vehicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre vehicule.
- `attachSpeed` (*number*) : Vitesse d'attache (non utilisee ici).
- `attachEnergy` (*number*) : Energie d'attache (non utilisee ici).

#### `beamstate.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook C++ appele quand un coupleur se detache. Retire l'attelage, casse les breakGroups du noeud si breakGroupType vaut 0 ou nil, puis previent le jeu (onCouplerDetached cote GE, une seule fois par paire).

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre vehicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre vehicule.
- `breakForce` (*number*) : Force de rupture transmise au jeu.

#### `beamstate.registerExternalCouplerBreakGroup(breakGroup, cid)`

Enregistre un cid de noeud-coupleur dans un breakGroup, pour qu'un breakBreakGroup ulterieur le detache. Utilisee par des extensions de couplage.

- `breakGroup` (*string*) : Nom du groupe.
- `cid` (*integer*) : cid du noeud de coupleur.

#### `beamstate.save(filename)`

Ecrit un JSON (format "v2") de l'etat : positions et masses des noeuds, longueur au repos, cassure et deformation des poutres, etat des hydros et paquets Lua serialises.

- `filename` (*string|nil*) : Chemin ; par defaut `<vehicleDirectory>/vehicle.save.json`.

#### `beamstate.sendExportCouplerData(obj2Id, obj2nodeId, data)`

Demande a l'autre vehicule (queueObjectLuaCommand -> exportCouplerData) d'exporter vers nous certaines valeurs electrics/inputs, et active updateRemoteElectrics.

- `obj2Id` (*integer*) : Id de l'autre vehicule.
- `obj2nodeId` (*integer*) : cid du noeud de coupleur de l'autre vehicule.
- `data` (*table*) : {electrics = string[], inputs = string[]}.

#### `beamstate.setCouplerVisiblityExternal(sourceObjectID, visibleTags)`

Appelee par un autre vehicule (via BeamEngine:queueAllObjectLua) pour activer/desactiver la surbrillance des coupleurs dont le tag est dans la liste. (Le nom contient la faute "Visiblity".)

- `sourceObjectID` (*integer*) : Id du vehicule qui diffuse (non utilise).
- `visibleTags` (*table<string, boolean>|false|nil*) : Tags visibles ; faux/nil desactive l'affichage.

#### `beamstate.setPartCondition(partId, partTypeData, odometer, integrity, visual)`

Appliquerait un etat d'integrite/visuel a une piece. Dans cette version le corps est quasi vide (le code utile est commente) : ne fait rien d'utile.

- `partId` (*string*) : Identifiant de la piece.
- `partTypeData` (*string[]*) : Liste de types de piece (ex. "jbeam:breakGroup:nom").
- `odometer` (*any*) : Non utilise.
- `integrity` (*number|table*) : Valeur ou table d'integrite.
- `visual` (*number|table*) : Valeur ou table d'etat visuel.

#### `beamstate.setPlanets(p)`

Remplace toutes les planetes. Le tableau est lu par triplets (centre, rayon, masse).

- `p` (*table*) : {vec3, rayon, masse, vec3, rayon, masse, ...}.

#### `beamstate.toggleCouplers(_nodetag, forceLocked, forceWelded, forceAutoCoupling)`

Bascule les attelages ; appelee a l'appui sur la touche L. Sans tag : coupe l'attelage auto s'il est actif, detache tout si un coupleur est attache, sinon lance l'attelage auto. Avec un tag : detache s'il est attache, sinon l'attache (sauf forceAutoCoupling).

- `_nodetag` (*string|nil*) : Tag cible.
- `forceLocked` (*boolean|nil*) : Transmis a detachCouplers.
- `forceWelded` (*boolean|nil*) : Transmis a detachCouplers.
- `forceAutoCoupling` (*boolean|nil*) : Avec un tag, force la logique de l'attelage automatique.

#### `beamstate.torsionBarBroken(id, energy)`

Hook C++ appele quand une barre de torsion casse. Si elle a un breakGroup, cache les props et casse le groupe (breakGroupType 0 ou nil), comme beamBroken le fait pour les poutres.

- `id` (*integer*) : Index de la barre de torsion dans v.data.torsionbars.
- `energy` (*number*) : Energie de rupture (non utilisee).

#### `beamstate.triggerDeformGroup(group)`

Declenche le changement de materiau du premier deformSwitches correspondant au groupe de deformation donne.

- `group` (*string|nil*) : Nom du deformGroup ; nil ne fait rien.

#### `beamstate.updateGFX(dt)`

Appelee chaque frame graphique. Gere les minuteurs des planetes temporaires, recalcule `damage`, le score de degats par piece, envoie l'etat du squelette a l'UI (au plus toutes les 0,25 s), pilote l'attelage automatique (timeout 60 s) et transmet aux vehicules attelés les electrics/inputs demandes.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `activeParts` | string[] | Noms des parties actives du vehicule, collectees depuis `v.data.slotMap`. |
| `attachedCouplers` | table<integer, table> | Coupleurs actuellement attaches, par cid de noeud local : {obj2id, obj2nodeId, exportElectrics?, exportInputs?}. |
| `brokenBreakGroups` | table<string, boolean> | Noms des breakGroups deja casses (valeur true). Table recreee a chaque init. |
| `couplerCache` | table<integer, table> | Copie des noeuds jbeam qui ont un couplerTag ou un tag, indexee par cid de noeud (champs couplerTag, couplerWeld, couplerLock, couplerStrength, couplerRadius, couplerLockRadius, couplerLatchSpeed, couplerTargets, couplerStartRadius, breakGroup, importElectrics, importInputs). |
| `damage` | number | Degats cumules du vehicule (energie dissipee + damageExt), mis a jour dans updateGFX. |
| `damageExt` | number | Degats ajoutes artificiellement (addDamage, pneus crevés +1000). Remis a 0 par init. |
| `debugDraw` | function | nop par defaut ; dessine des spheres sur les noeuds de coupleurs libres dont le tag est visible (setCouplerVisiblityExternal). |
| `deformGroupDamage` | table<string, table> | Par deformGroup : {eventCount, damage, maxEvents, invMaxEvents}. `damage` = eventCount / maxEvents, de 0 a 1 environ. |
| `deformGroupsTriggerBeam` | table<string, integer> | Par deformGroup, cid de la premiere poutre qui l'a declenche (deformation ou casse). |
| `deformedBeams` | table<integer, number> | Alias de beamDamageTracker : par cid de poutre, ratio de deformation (onBeamDeformed) ou 1 si cassee. |
| `linkTagBeamMap` | table<string, integer[]> | linkTag de poutre -> liste d'ids de poutres. |
| `lowpressure` | boolean | true des qu'au moins un pneu a ete degonfle. Remis a false par reset(). |
| `monetaryDamage` | number | Remis a 0 par init, non modifie ailleurs dans ce fichier. |
| `nodeNameMap` | table<string, integer> | Nom jbeam d'un noeud -> cid. |
| `tagBeamMap` | table<string, integer[]> | Tag de poutre -> liste d'ids de poutres portant ce tag. |
| `update` | function | nop sauf pendant la precompression progressive des poutres/barres de torsion ; appele par la boucle physique. |
| `updateRemoteElectrics` | function | nop par defaut ; devient la vraie fonction apres sendExportCouplerData. Appelee deux fois par electrics.lua : fusionne dans electrics.values les valeurs recues d'un vehicule attele. Parametre retainReceivedElectrics : si faux/nil, vide la liste recue. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTireDeflated`

**Évènements UI (guihooks.trigger) :** `VehicleSkeleton`, `VehicleSkeletonState`

## Appels vers le moteur (C++)

- `BeamEngine:` `queueAllObjectLua`
- `obj:` `addParticleByNodesRelative`, `attachCoupler`, `beamIsBroken`, `breakBeam`, `breakCollisionTriangle`, `breakMeshes`, `breakRails`, `changePressureGroupDrag`, `commitLoad`, `deflatePressureGroup`, `detachCoupler`, `getBeamDeformation`, `getBeamRestLength`, `getDirectionVector`, `getDirectionVectorUp`, `getDissipatedEnergy`, `getGroupPressure`, `getId`, `getNodeMass`, `getNodePosition`, `getOriginalNodeMass`, `getPosition`, `playSFXOnceCT`, `queueGameEngineLua`, `queueObjectLuaCommand`, `setBeamLength`, `setBeamPressureRel`, `setBeamSpringDamp`, `setGroupPressure`, `setNodeFrictionSlidingCoefs`, `setNodeMass`, `setNodePosition`, `setPlanets`, `setPrecompressionRatio`, `setTorsionbarPrecompressionAngle`, `stopLatching`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/beamstate.lua`.*
