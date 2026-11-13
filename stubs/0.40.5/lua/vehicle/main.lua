---@meta
-- tim19Atlas stub generated from lua/vehicle/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fait en sorte que onPhysicsStep relaie extensions.hook('onPhysicsStep', dt) et force la réévaluation du flag moteur. À appeler dans onExtensionLoaded par toute extension qui définit onPhysicsStep (le hook n'est jamais désactivé ensuite).
---Source : lua/vehicle/main.lua:65
function enablePhysicsStepHook() end

--- Appelée par le moteur avant un rechargement du Lua : sérialise les extensions (serializePackages('reload')) et les confie au moteur via obj:setPersistentData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:533
function exportPersistentData() end

--- Appelée par le moteur après un rechargement : désérialise les données persistantes et les redonne aux extensions (deserializePackages).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:539
---@param s string Données sérialisées produites par exportPersistentData.
function importPersistentData(s) end

--- Appelée par le moteur au spawn du véhicule. Ajuste package.path vers le dossier du véhicule, charge les modules en globales, décode initData (lpack) et construit les données du véhicule (v.loadVehicleStage2), appelle initSystems, charge les extensions de base (skeleton, dossier auto, gameplayStatistic) et émet 'onVehicleLoaded'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:206
---@param path string Dossier du véhicule (ajouté à package.path et utilisé pour charger ses scripts lua/).
---@param initData string Données de spawn sérialisées avec lpack, doivent contenir `vdata`.
---@return boolean|nil  false = demande au moteur de décharger le Lua ; true en cas de succès ; nil si obj absent.
function init(path, initData) end

--- Initialise tous les sous-systèmes dans l'ordre décrit en notes, émet le hook 'onInit', active la détection d'écritures globales (detectGlobalWrites) et règle le flag de step physique. Appelée par init().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:139
function initSystems() end

--- Appelé par le moteur quand une poutre casse. Relaye à beamstate, wheels, powertrain, energyStorage, controller, bdebug, puis extensions.hook('onBeamBroke').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:366
---@param id integer Identifiant de poutre (cid).
---@param energy number Énergie de la rupture.
function onBeamBroke(id, energy) end

--- Appelé par le moteur seulement pour les poutres ayant des déclencheurs de déformation. Relaye à beamstate et controller puis au hook 'onBeamDeformed'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:377
---@param id integer Identifiant de poutre (cid).
---@param ratio number Ratio de déformation.
function onBeamDeformed(id, ratio) end

--- Callback générique utilisé par le moteur pour appeler une fonction Lua par nom. Résout `funName` soit comme globale ("maFonction") soit comme "module.fonction" (un seul niveau, le module doit être une table globale) et l'appelle avec `data`. Ignore silencieusement tout ce qui n'est pas une fonction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:345
---@param funName string Nom de la fonction, avec au plus un point.
---@param data any Unique argument transmis.
function onCallEvent(funName, data) end

--- Appelé par le moteur quand un coupleur s'attache. Relaye aux mêmes modules que onCouplerFound puis au hook 'onCouplerAttached'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:397
---@param nodeId integer Noeud coupleur de ce véhicule.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud coupleur de l'autre véhicule.
---@param attachSpeed number Vitesse relative à l'attache.
---@param attachEnergy number Énergie à l'attache.
function onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Appelé par le moteur quand un coupleur se détache. Relaye aux mêmes modules puis au hook 'onCouplerDetached'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:406
---@param nodeId integer Noeud coupleur de ce véhicule.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud coupleur de l'autre véhicule.
---@param breakForce number Force de détachement.
function onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Appelé par le moteur quand un coupleur trouve un coupleur compatible à portée. Relaye à beamstate, controller, powertrain, energyStorage puis au hook 'onCouplerFound'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:388
---@param nodeId integer Noeud coupleur de ce véhicule.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Noeud coupleur de l'autre véhicule.
---@param nodeDist number Distance entre les noeuds.
function onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Appelé par le moteur à chaque frame de dessin debug. Met à jour la position de focus partagée, appelle bdebug.debugDraw, ai.debugDraw, beamstate.debugDraw, controller.debugDraw, hydros.debugDraw, puis extensions.hook('onDebugDraw', focusPos) et, si un joueur est assis, 'onDebugDrawActive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:126
---@param x number X de la position de focus (caméra).
---@param y number Y du focus.
---@param z number Z du focus.
function onDebugDraw(x, y, z) end

--- Appelé par le moteur quand le véhicule est supprimé : hydros.destroy(), protocols.destroy() et, si la globale odometer existe, odometer.submitStatistic().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:430
function onDespawnObject() end

--- Callback moteur lors de l'ajout d'une poutre dynamique ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:420
---@param dbId integer Id de poutre dynamique.
---@param nodeId integer Noeud.
---@param tag any Étiquette.
function onDynamicBeamAdded(dbId, nodeId, tag) end

--- Callback moteur quand une poutre dynamique casse ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:426
---@param dbId integer Id de poutre dynamique.
---@param energy number Énergie.
function onDynamicBeamBroke(dbId, energy) end

--- Callback moteur lors de la suppression d'une poutre dynamique ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:423
---@param dbId integer Id de poutre dynamique.
function onDynamicBeamDeleted(dbId) end

--- Appelé par le moteur à chaque frame graphique (une fois par rendu/frame de simulation). Mémorise lastDt, met à jour flux GUI, capteurs, roues, IA, entrées, electrics, contrôleurs, extensions (hook 'updateGFX'), hydros, powertrain, etc. dans l'ordre décrit dans les notes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:86
---@param dtSim number Temps de simulation écoulé depuis la dernière frame, en secondes.
function onGraphicsStep(dtSim) end

--- Appelé par le moteur à chaque collision de noeud filtrée. Remplit particlefilter.particleData et le passe à wheels, fire, controller, particlefilter et bdebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:491
---@param id1 integer Noeud en collision.
---@param pos vec3 Position du contact.
---@param normal vec3 Normale du contact.
---@param nodeVel vec3 Vitesse du noeud.
---@param perpendicularVel number Vitesse perpendiculaire à la surface.
---@param slipVec vec3 Vecteur de glissement.
---@param slipVel number Vitesse de glissement.
---@param slipForce number Force de glissement.
---@param normalForce number Force normale.
---@param depth number Profondeur de pénétration.
---@param materialId1 integer Matériau du noeud.
---@param materialId2 integer Matériau de la surface touchée.
function onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2) end

--- Appelé par le moteur à chaque pas de physique (haute fréquence) si le step est activé. Exécute la chaîne physique (voir notes) puis le hook d'extensions 'onPhysicsStep'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:73
---@param dtPhys number Pas de physique en secondes (= physicsDt).
function onPhysicsStep(dtPhys) end

--- Appelé par le moteur quand un cluster de noeuds est téléporté/repositionné. Active le mode fantôme (obj:setGhostEnabled(true)) si ghostOnTp, puis émet le hook 'onSetClusterPosRelRot'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:439
---@param cNodeId integer Noeud de référence du cluster.
---@param pos vec3 Nouvelle position.
---@param relRot quat Rotation relative.
function onSetClusterPosRelRot(cNodeId, pos, relRot) end

--- Appelée par le moteur quand les réglages changent : settings.settingsChanged, hook 'onSettingsChanged', puis controller, input, wheels et protocols.settingsChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:545
function onSettingsChanged() end

--- Appelé par le moteur quand un slidenode quitte son rail ; relaye uniquement au hook d'extension 'onSlidenodeDetached'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:415
---@param nodeId integer Noeud slidenode.
---@param railId integer Rail quitté.
---@param energy number Énergie.
function onSlidenodeDetached(nodeId, railId, energy) end

--- Appelé par le moteur quand une barre de torsion casse ; relaye à beamstate et au hook 'onTorsionbarBroken'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:383
---@param id integer Identifiant de la barre de torsion.
---@param energy number Énergie de la rupture.
function onTorsionbarBroken(id, energy) end

--- Appelé par le moteur au reset du véhicule (touche I, récupération…). Réactive le mode fantôme si ghostOnReset, remet à zéro tous les modules (ordre dans les notes) et émet le hook 'onReset'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:448
---@param retainDebug boolean|nil Indique si l'état de debug doit être conservé ; transmis à onReset (déduit du nom, non utilisé directement ici).
function onVehicleReset(retainDebug) end

--- Remplace print standard : envoie le premier argument converti en chaîne au log (niveau 'A', tag 'print').
---Source : lua/vehicle/main.lua:16
---@param ... any Seul le premier argument est utilisé (tostring(...)).
function print(...) end

--- Appelée par le moteur quand la liste des joueurs assis dans ce véhicule change. Met à jour playerInfo (seatedPlayers, anyPlayerSeated, firstPlayerSeated), prévient le contrôleur principal/powertrain/damageTracker si un joueur est assis, notifie bdebug, protocols, ai, sounds, puis émet 'onPlayersChanged'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:504
---@param players table<integer, boolean> Joueurs assis, indexés depuis 0 (ex. {[0]=true}).
function setControllingPlayers(players) end

--- Définit playerInfo.persona (identifiant de persona du joueur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/main.lua:529
---@param persona any Identifiant de persona.
function setPlayerPersona(persona) end

--- Active ou désactive côté moteur l'appel de onPhysicsStep : obj:setPhysicsStepEnabled(true) si controller, powertrain, wheels, thrusters, hydros, beamstate ou protocols en ont besoin (isPhysicsStepUsed) ou si le hook d'extension est actif. Appelée en fin d'init et de reset.
---Source : lua/vehicle/main.lua:61
function updateCorePhysicsStepEnabled() end

---@type any
backwardsCompatibility = nil
---@type any
extensions = nil
---@type vec3
float3 = nil
---@type number
lastDt = nil
---@type any
physicsDt = nil
---@type table
playerInfo = nil
---@type any
profilerPopEvent = nil
---@type any
profilerPopEvent1 = nil
---@type any
profilerPushEvent = nil
---@type any
profilerPushEvent1 = nil
---@type any
settings = nil
---@type any
shippingBuild = nil
---@type string
vmType = nil
