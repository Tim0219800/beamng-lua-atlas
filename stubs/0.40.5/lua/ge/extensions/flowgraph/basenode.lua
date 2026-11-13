---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/basenode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base de tous les nœuds flowgraph. Elle crée les pins à partir de C.pinSchema du nœud dérivé, gère les comportements (once, duration, simple...) selon C.category, exécute work()/workOnce() sous xpcall (les erreurs deviennent des erreurs de nœud affichées en rouge), dessine le nœud dans l'éditeur (en-tête, pins, tooltip, menu contextuel) et sérialise/désérialise le nœud (position, couleur perso, pins en dur, pins cachés). Un moddeur qui écrit un nœud personnalisé hérite de cette classe et surcharge work, init, postInit, drawMiddle, etc.
--- Accès : extension `flowgraph_basenode` : `extensions.load("flowgraph_basenode")`, puis la globale `flowgraph_basenode`
---@class flowgraph_basenode
flowgraph_basenode = {}

--- Crée un objet nœud avec C comme métatable et appelle init(...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1533
---@param ... any mgr, graph, forceId (transmis à C:init)
---@return table  nœud de base
function flowgraph_basenode.createBase(...) end

--- Crée un nœud de base, copie la classe dérivée par-dessus, puis appelle _preInit (pins de sortie), init (si redéfini) et _postInit (pins d'entrée, catégories, postInit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1541
---@param mgr table manager flowgraph
---@param graph table graphe contenant le nœud
---@param forceId integer|nil id imposé (sinon mgr:getNextFreeGraphNodeId())
---@param derivedClass table classe du type de nœud concret
---@return table  nœud initialisé
function flowgraph_basenode.use(mgr, graph, forceId, derivedClass) end

--- Nœud flowgraph. Champs principaux : mgr, graph, id, name, description, color, iconColor, type ('node' par défaut, 'simple', 'variable'), tags, behaviour, triggerCount, workCount, data, dynamicMode, durationState, pinIn, pinInLocal, pinOut, pinList (ordre d'affichage), nodePosition ({x, y}), customName/customColor/customIcon/customIconColor, _error.
---@class flowgraph_basenode_C
local flowgraph_basenode_C = {}

--- Convertit HSV en RGB via la fonction globale HSVtoRGB après avoir ramené h à sa partie fractionnaire et borné s et v dans [0, 1].
---Source : lua/ge/extensions/flowgraph/basenode.lua:647
---@param h number teinte (la partie entière est ignorée)
---@param s number saturation 0..1
---@param v number valeur 0..1
---@return table  {r, g, b}
function flowgraph_basenode_C:HSVtoRGB(h, s, v) end

--- Appelé par le manager au démarrage : efface l'erreur du nœud, remet à nil les sorties si clearOutPinsOnStart, réinitialise _frameLastUsed et _dynamicDone, puis appelle _executionStarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:622
function flowgraph_basenode_C:__executionStarted() end

--- Appelé par le manager à l'arrêt : appelle _executionStopped et remet _dynamicDone à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:615
function flowgraph_basenode_C:__executionStopped() end

--- Renvoie le message d'erreur d'une catégorie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1509
---@param category string catégorie
---@return string|nil  message d'erreur
function flowgraph_basenode_C:__getNodeError(category) end

--- Restaure position, personnalisations, data (propriétés connues seulement), mode dynamique, pins sauvegardés, valeurs en dur, quickAccess et pins cachés. Journalise des avertissements si un pin est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1381
---@param nodeData table données produites par __onSerialize
function flowgraph_basenode_C:__onDeserialized(nodeData) end

--- Sérialise le nœud : data (sans cdata), type, position, nom/couleur/icône perso, identifiant, mode dynamique, pins (si savePins), pins en dur, quickAccess, pins cachés, timeline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1298
---@return table  données du nœud pour le fichier de graphe
function flowgraph_basenode_C:__onSerialize() end

--- Enregistre une erreur pour une catégorie (log E) ; appelé sans catégorie, efface toutes les erreurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1497
---@param category string|nil catégorie ('work', 'onNodeReset'...) ou nil pour tout effacer
---@param err string|nil message ; nil retire la catégorie
function flowgraph_basenode_C:__setNodeError(category, err) end

--- Appelle self:destroy().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:105
function flowgraph_basenode_C:_destroy() end

--- Appelle self:doubleClicked() si cette fonction existe sur le nœud dérivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:574
function flowgraph_basenode_C:_doubleClicked() end

--- Dessine la zone centrale selon le mode d'affichage (flowLevel, simple, debug, default, heatmap, geometry) ; appelle drawMiddle si le nœud dérivé le définit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:824
---@param builder table builder flowgraph
---@param style table style ImGui
---@param drawType string valeur de la préférence flowgraph.debug.viewMode
function flowgraph_basenode_C:_drawMiddle(builder, style, drawType) end

--- Hook interne vide appelé au démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:620
function flowgraph_basenode_C:_executionStarted() end

--- Hook interne vide appelé à l'arrêt de l'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:613
function flowgraph_basenode_C:_executionStopped() end

--- Vide (l'appel à _executionStopped y est commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:609
function flowgraph_basenode_C:_onClear() end

--- Hook vide appelé pendant la désérialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1378
---@param nodeData table données du nœud
function flowgraph_basenode_C:_onDeserialized(nodeData) end

--- Appelle onLink.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:584
---@param link table lien
function flowgraph_basenode_C:_onLink(link) end

--- Appelle onNodeReset sous xpcall puis remet toutes les valeurs de pinOut à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:336
function flowgraph_basenode_C:_onNodeReset() end

--- Hook vide permettant au nœud dérivé d'ajouter des champs à la table sérialisée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1295
---@param res table table de sortie
function flowgraph_basenode_C:_onSerialize(res) end

--- Appelle onSetHardcode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:598
---@param pin table pin
---@param value any valeur
---@param forceType string|nil type imposé
function flowgraph_basenode_C:_onSetHardcode(pin, value, forceType) end

--- Appelle onUnlink.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:591
---@param link table lien
function flowgraph_basenode_C:_onUnlink(link) end

--- Appelle onUnsetHardcode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:605
---@param pin table pin
function flowgraph_basenode_C:_onUnsetHardcode(pin) end

--- Hook vide appelé après la désérialisation complète du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1515
function flowgraph_basenode_C:_postDeserialize() end

--- Crée les pins d'entrée de pinSchema (avec valeurs hardcoded si demandé), crée un pin reset si le mode est 'once', appelle handleNodeCategories puis postInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:135
function flowgraph_basenode_C:_postInit() end

--- Crée les pins de sortie décrits dans pinSchema (hidden, impulse, chainFlow, tableType).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:113
function flowgraph_basenode_C:_preInit() end

--- Pose (val non nil) ou retire (val nil) une valeur constante sur un pin d'entrée : crée une entrée factice dans pinIn avec hardCodeType, passe pin.pinMode à 'hardcoded' ou 'normal' et appelle les hooks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1251
---@param pin table pin d'entrée
---@param val any valeur ou nil pour retirer
---@param forceType string|nil type imposé ; sinon le type du pin (ou defaultHardCodeType si multiple ou 'any')
---@return string|nil  type retenu quand une valeur est posée
function flowgraph_basenode_C:_setHardcodedDummyInputPin(pin, val, forceType) end

--- Crée self.timeline {beginTime, endTime, lane = 0} et définit des onTimelineBegin/End/Trigger vides (nop) si absents.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1283
---@param beginTime number début
---@param endTime number fin
function flowgraph_basenode_C:_setupTimeline(beginTime, endTime) end

--- Mode 'once' : gère le reset (pinIn.reset), appelle workOnce une fois puis work à chaque appel tant que le flux est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:351
function flowgraph_basenode_C:_workDynamicOnce() end

--- Exécute work sous xpcall, applique checkAutomatedFlow, incrémente workCount et enregistre l'erreur éventuelle (erreur de nœud + évènement du manager).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:321
function flowgraph_basenode_C:_workDynamicRepeat() end

--- Active un comportement dans self.behaviour.
---Source : lua/ge/extensions/flowgraph/basenode.lua:234
---@param behaviour string 'once', 'duration', 'simple', 'singleActive' ou 'obsolete'
function flowgraph_basenode_C:addBehaviour(behaviour) end

--- Hook vide appelé quand le nœud est ajouté à un graphe.
---Source : lua/ge/extensions/flowgraph/basenode.lua:109
---@param graph table graphe
function flowgraph_basenode_C:addedToGraph(graph) end

--- Aligne le nœud sur la grille de 14 px (décalage 10, 8), éventuellement après avoir fixé une position, puis met à jour l'éditeur.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1520
---@param x number|nil nouvelle position x (avec y)
---@param y number|nil nouvelle position y
function flowgraph_basenode_C:alignToGrid(x, y) end

--- Comme createPin, mais seulement si aucun pin du même nom/direction n'existe, puis replace le pin à la position imposée par pinOrder pour les nœuds fonctionnels.
---Source : lua/ge/extensions/flowgraph/basenode.lua:251
---@param direction string 'in' ou 'out'
---@param type string|table type du pin (ex. 'flow', 'number')
---@param name string nom du pin
---@param default any valeur par défaut (entrées)
---@param description string description affichée
---@param extra any données supplémentaires (pin.extraData)
---@param fixed boolean|nil pin non supprimable/non modifiable
---@return table|nil  le pin créé, ou nil s'il existait déjà
function flowgraph_basenode_C:autoCreatePin(direction, type, name, default, description, extra, fixed) end

--- Recopie pinIn.flow vers pinOut.flow pour les nœuds fonctionnels non simples et pilote incomplete/complete/completed pour les nœuds f_duration. 'completed' retombe à false après une frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:397
function flowgraph_basenode_C:checkAutomatedFlow() end

--- Crée un pin sur le nœud (module flowgraph/pin), l'ajoute à pinInLocal/pinOut, à pinList et à graph.pins. Refuse les noms vides ou en double (sauf autoNumber, qui ajoute un suffixe 2..101).
---Source : lua/ge/extensions/flowgraph/basenode.lua:465
---@param direction string 'in' ou 'out'
---@param type string|table type du pin ou liste de types
---@param name string nom unique du pin
---@param default any valeur par défaut
---@param description string texte d'aide
---@param autoNumber boolean|nil numéroter automatiquement en cas de doublon
---@param extra any données supplémentaires (pin.extraData)
---@param fixed boolean|nil pin fixe
---@return table|nil  pin créé, nil en cas d'erreur
function flowgraph_basenode_C:createPin(direction, type, name, default, description, autoNumber, extra, fixed) end

--- Crée un pin d'entrée flow 'reset' (impulsion) et ajoute le comportement 'once', s'il n'existe pas.
---Source : lua/ge/extensions/flowgraph/basenode.lua:301
function flowgraph_basenode_C:createResetPin() end

--- Hook vide pour ajouter des entrées au menu contextuel du nœud.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1096
function flowgraph_basenode_C:customContextMenu() end

--- Hook vide appelé à la destruction du nœud ; à surcharger pour libérer des ressources.
---Source : lua/ge/extensions/flowgraph/basenode.lua:102
function flowgraph_basenode_C:destroy() end

--- Dessine tout le nœud dans l'éditeur : styles selon erreur/activité récente, en-tête, pins d'entrée, milieu (sous xpcall), pins de sortie, icônes de comportement. Ignore les types autres que node, simple, variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:892
---@param builder table builder flowgraph
---@param style table style ImGui
function flowgraph_basenode_C:draw(builder, style) end

--- Dessine l'en-tête du nœud (icône, nom, [ERROR] si erreur, id si préférence, couleur heatmap selon l'ancienneté de _frameLastUsed).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:653
---@param builder table builder flowgraph
---@param style table style ImGui courant
function flowgraph_basenode_C:drawHeader(builder, style) end

--- Hook de dessin du milieu du nœud à surcharger ; la version de base appelle simplement builder:Middle().
---Source : lua/ge/extensions/flowgraph/basenode.lua:888
---@param builder table builder flowgraph
---@param style table style ImGui
function flowgraph_basenode_C:drawMiddle(builder, style) end

--- Dessine l'infobulle du nœud survolé : activité en mode heatmap, nom, nom perso, comportements, obsolescence, description, TODO, erreurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:710
function flowgraph_basenode_C:drawTooltip() end

--- Renvoie la table self.data (propriétés éditables du nœud).
---Source : lua/ge/extensions/flowgraph/basenode.lua:86
---@return table  data du nœud
function flowgraph_basenode_C:getData() end

--- Parcourt les liens du graphe et renvoie ceux qui arrivent sur le nœud puis ceux qui en partent.
---Source : lua/ge/extensions/flowgraph/basenode.lua:634
---@return table  liens dont le nœud est la cible
---@return table  liens dont le nœud est la source
function flowgraph_basenode_C:getLinks() end

--- Renvoie self.pinIn.
---Source : lua/ge/extensions/flowgraph/basenode.lua:94
---@return table  table des pins d'entrée nommés
function flowgraph_basenode_C:getPinIn() end

--- Renvoie la valeur constante d'un pin d'entrée si elle a été posée en dur (hardcoded), sinon nil.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1086
---@param pinName string nom du pin d'entrée
---@return any  valeur constante ou nil
function flowgraph_basenode_C:getPinInConstValue(pinName) end

--- Selon self.category, ajoute les comportements et crée automatiquement les pins flow, reset, incomplete, complete, completed. Journalise une erreur si un nœud 'simple' a des pins flow ou si un 'provider' a des entrées. Sans catégorie, force le mode 'repeat'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:169
function flowgraph_basenode_C:handleNodeCategories() end

--- Indique si pinSchema contient un pin de type 'flow'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:279
---@return boolean  true si oui
function flowgraph_basenode_C:hasFlowPins() end

--- Indique si pinSchema contient un pin d'entrée.
---Source : lua/ge/extensions/flowgraph/basenode.lua:290
---@return boolean  true si oui
function flowgraph_basenode_C:hasInputPins() end

--- Hook vide appelé quand la sélection quitte le nœud.
---Source : lua/ge/extensions/flowgraph/basenode.lua:572
function flowgraph_basenode_C:hideProperties() end

--- Initialise tous les champs du nœud (identifiant, nom 'unknown', couleur par défaut, tables de pins, pin d'alignement). Vérifie les identifiants dupliqués si mgr.__safeIds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:36
---@param mgr table manager flowgraph
---@param graph table graphe propriétaire
---@param forceId integer|nil id imposé
function flowgraph_basenode_C:init(mgr, graph, forceId) end

--- Censée dire si une dépendance de flux est active, mais renvoie toujours true (voir notes).
---Source : lua/ge/extensions/flowgraph/basenode.lua:562
function flowgraph_basenode_C:isFlowActive() end

--- Hook vide : l'état de durée passe à 'finished'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:439
function flowgraph_basenode_C:onDurationFinished() end

--- Hook vide : l'état de durée passe à 'inactive'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:435
function flowgraph_basenode_C:onDurationInactive() end

--- Hook vide : l'état de durée passe à 'started'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:437
function flowgraph_basenode_C:onDurationStarted() end

--- Hook vide appelé quand un lien est créé sur un pin du nœud.
---Source : lua/ge/extensions/flowgraph/basenode.lua:581
---@param link table lien créé
function flowgraph_basenode_C:onLink(link) end

--- Hook vide appelé quand le nœud est réinitialisé (pin reset en mode 'once').
---Source : lua/ge/extensions/flowgraph/basenode.lua:334
function flowgraph_basenode_C:onNodeReset() end

--- Hook vide appelé quand une valeur constante (hardcoded) est posée sur un pin d'entrée.
---Source : lua/ge/extensions/flowgraph/basenode.lua:595
---@param pin table pin concerné
---@param value any valeur constante
---@param forceType string|nil type imposé
function flowgraph_basenode_C:onSetHardcode(pin, value, forceType) end

--- Hook vide appelé quand un lien est supprimé.
---Source : lua/ge/extensions/flowgraph/basenode.lua:588
---@param link table lien supprimé
function flowgraph_basenode_C:onUnlink(link) end

--- Hook vide appelé quand la valeur constante d'un pin est retirée.
---Source : lua/ge/extensions/flowgraph/basenode.lua:602
---@param pin table pin concerné
function flowgraph_basenode_C:onUnsetHardcode(pin) end

--- Dessine une grande icône semi-transparente par-dessus le nœud (appel commenté dans draw, donc inutilisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:800
function flowgraph_basenode_C:overDraw() end

--- Hook vide appelé à la fin de _postInit, une fois tous les pins créés.
---Source : lua/ge/extensions/flowgraph/basenode.lua:316
function flowgraph_basenode_C:postInit() end

--- Désactive un comportement (met la valeur à false).
---Source : lua/ge/extensions/flowgraph/basenode.lua:243
---@param behaviour string nom du comportement
function flowgraph_basenode_C:removeBehaviour(behaviour) end

--- Supprime un pin : supprime d'abord les liens du graphe qui l'utilisent, retire le pin des tables et de pinList. Le commentaire du code signale que d'autres effets de bord sont à vérifier.
---Source : lua/ge/extensions/flowgraph/basenode.lua:503
---@param pin table pin à supprimer
function flowgraph_basenode_C:removePin(pin) end

--- Supprime le pin 'reset' et le comportement 'once'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:309
function flowgraph_basenode_C:removeResetPin() end

--- Renomme un pin d'entrée dans pinInLocal. Refuse (avec un avertissement) si le nouveau nom est déjà pris par un autre pin. Ne gère que les pins d'entrée.
---Source : lua/ge/extensions/flowgraph/basenode.lua:528
---@param pin table pin à renommer
---@param newName string nouveau nom
function flowgraph_basenode_C:renamePin(pin, newName) end

--- Renvoie nil par défaut ; les nœuds qui représentent un sous-graphe renvoient ce graphe.
---Source : lua/ge/extensions/flowgraph/basenode.lua:110
---@return table|nil  graphe représenté
function flowgraph_basenode_C:representsGraph() end

--- Remplace self.data.
---Source : lua/ge/extensions/flowgraph/basenode.lua:90
---@param data table nouvelle table de données
function flowgraph_basenode_C:setData(data) end

--- Change l'état d'un nœud de catégorie f_duration et signale le changement ; checkAutomatedFlow met alors à jour les pins incomplete/complete/completed et appelle onDurationXxx.
---Source : lua/ge/extensions/flowgraph/basenode.lua:389
---@param state string 'inactive', 'started' ou 'finished'
function flowgraph_basenode_C:setDurationState(state) end

--- Fixe le mode dynamique ; crée le pin reset pour 'once', le supprime pour 'repeat'.
---Source : lua/ge/extensions/flowgraph/basenode.lua:453
---@param mode string 'repeat' ou 'once'
function flowgraph_basenode_C:setDynamicMode(mode) end

--- Remplace self.pinIn.
---Source : lua/ge/extensions/flowgraph/basenode.lua:98
---@param data table nouvelle table pinIn
function flowgraph_basenode_C:setPinIn(data) end

--- Échange un pin de pinList avec son voisin (circulaire) pour changer l'ordre d'affichage.
---Source : lua/ge/extensions/flowgraph/basenode.lua:540
---@param idInList integer indice (1-based) du pin dans pinList
---@param direction integer +1 ou -1
function flowgraph_basenode_C:shiftPin(idInList, direction) end

--- Affiche le menu contextuel (copier, supprimer, afficher/masquer les pins, créer un sous-graphe, dégrouper, commentaire, outils de développement selon préférences).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:1097
---@param menuPos ImVec2 position du menu (non utilisée dans le corps)
function flowgraph_basenode_C:showContextMenu(menuPos) end

--- Hook vide appelé quand le nœud est sélectionné pour afficher ses propriétés.
---Source : lua/ge/extensions/flowgraph/basenode.lua:571
function flowgraph_basenode_C:showProperties() end

--- Renvoie une chaîne « nom (nodeType / id) in graphe » pour les logs.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1513
---@return string  description du nœud
function flowgraph_basenode_C:toString() end

--- Bascule entre 'repeat' et 'once' si la catégorie est dynamique.
---Source : lua/ge/extensions/flowgraph/basenode.lua:442
function flowgraph_basenode_C:toggleDynamicMode() end

--- Déclenche le nœud via self._trigger (fonction compilée par le manager) si le graphe n'est pas arrêté ; incrémente triggerCount et met à jour _frameLastUsed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/basenode.lua:549
function flowgraph_basenode_C:trigger() end

--- Applique nodePosition au nœud dans l'éditeur (SetNodePosition). À n'appeler que lorsque le manager est ouvert dans l'éditeur.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1366
function flowgraph_basenode_C:updateEditorPosition() end

--- Lit la position du nœud dans l'éditeur ImGui et la mémorise dans nodePosition (si dans ±2e8).
---Source : lua/ge/extensions/flowgraph/basenode.lua:1355
function flowgraph_basenode_C:updateNodePosition() end

--- Fonction principale du nœud, à surcharger. Appelée par le manager à chaque passage du flux, dans un xpcall. En mode 'once', elle est appelée après workOnce.
---Source : lua/ge/extensions/flowgraph/basenode.lua:318
---@param args any non utilisé par la base
function flowgraph_basenode_C:work(args) end

--- Hook vide appelé une seule fois (mode dynamique 'once') quand le flux arrive, avant les appels de work. Réarmé par un reset.
---Source : lua/ge/extensions/flowgraph/basenode.lua:349
function flowgraph_basenode_C:workOnce() end

