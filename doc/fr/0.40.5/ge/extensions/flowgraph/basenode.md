# `flowgraph_basenode`

*Fichier : `lua/ge/extensions/flowgraph/basenode.lua` · VM : Game Engine (GE) · 1557 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `flowgraph_basenode` : `extensions.load("flowgraph_basenode")`, puis la globale `flowgraph_basenode`

Classe de base de tous les nœuds flowgraph. Elle crée les pins à partir de C.pinSchema du nœud dérivé, gère les comportements (once, duration, simple...) selon C.category, exécute work()/workOnce() sous xpcall (les erreurs deviennent des erreurs de nœud affichées en rouge), dessine le nœud dans l'éditeur (en-tête, pins, tooltip, menu contextuel) et sérialise/désérialise le nœud (position, couleur perso, pins en dur, pins cachés). Un moddeur qui écrit un nœud personnalisé hérite de cette classe et surcharge work, init, postInit, drawMiddle, etc.

## Exemple

```lua
-- squelette d'un nœud flowgraph
local C = {}
C.name = 'Mon nœud'
C.description = 'Fait quelque chose.'
C.category = 'once_p_duration'
C.pinSchema = {
  {dir = 'in', type = 'number', name = 'valeur', default = 1, description = 'Entrée.'},
  {dir = 'out', type = 'number', name = 'resultat', description = 'Sortie.'},
}
function C:work()
  self.pinOut.resultat.value = self.pinIn.valeur.value * 2
end
return _flowgraph_createNode(C)
```

## Remarques

- Format de C.pinSchema (lu par _preInit pour les sorties puis _postInit pour les entrées) : {dir='in'|'out', type, name, default, description, fixed, hidden, impulse, chainFlow, tableType, hardcoded, defaultHardCodeType}. L'ancien format sans champ dir est refusé (log d'erreur). Les valeurs default sur une sortie sont ignorées avec un avertissement.
- self.pinIn[nom] et self.pinOut[nom] : accès par nom aux pins. pinIn renvoie un pin vide (emptyPin, non modifiable) si le nom n'existe pas et refuse l'écriture. pinInLocal contient les pins d'entrée réels ; pinIn contient des entrées « en dur » (hardcoded) quand une valeur constante est posée.
- Comportements (self.behaviour) : 'once', 'duration', 'simple', 'singleActive', 'obsolete'. Les pins flow/reset/incomplete/complete/completed sont créés automatiquement selon la catégorie (ui_flowgraph_editor.isFunctionalNode, isSimpleNode, isDurationNode, isF_DurationNode, isOnceNode, isDynamicNode).
- Ordre fixe de certains pins : flow in, flow out, reset in, incomplete out, complete out, completed out.
- dynamicMode : 'repeat' (par défaut, work appelé à chaque fois) ou 'once' (workOnce une fois puis work, avec pin reset).
- Grille de l'éditeur : gridSize 14, décalage (10, 8) ; alignToGrid aligne la position dessus.
- Bug : isFlowActive boucle sur _flowInDeps mais renvoie toujours true (le return true final est atteint même si aucune dépendance n'a de flux).
- Bug : dans __onDeserialized, le test type(data) == 'cdata' utilise la variable data (globale, nil) au lieu de v ; la branche cdata n'est donc jamais prise.
- Bug : alignToGrid référence une variable force non définie (globale nil) ; la condition ne dépend que de nodePosition.
- Bug : dans _workDynamicOnce, workCount est incrémenté jusqu'à deux fois par appel (une fois dans le bloc, une fois à la fin).
- Les fonctions préfixées _ ou __ sont des enveloppes internes appelées par le manager/graphe ; les versions sans préfixe (onLink, onUnlink, onSetHardcode, onUnsetHardcode, onNodeReset, onDurationXxx) sont les hooks à surcharger.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_basenode.createBase(...)` | Crée un objet nœud avec C comme métatable et appelle init(...). *(interne)* | 1533 |
| `flowgraph_basenode.use(mgr, graph, forceId, derivedClass)` | Crée un nœud de base, copie la classe dérivée par-dessus, puis appelle _preInit (pins de sortie), init (si redéfini) et _postInit (pins d'entrée, catégories, postInit). *(interne)* | 1541 |

### Détail des paramètres

#### `flowgraph_basenode.createBase(...)`

Crée un objet nœud avec C comme métatable et appelle init(...).

- `...` (*any*) : mgr, graph, forceId (transmis à C:init)
- **renvoie** : table nœud de base

#### `flowgraph_basenode.use(mgr, graph, forceId, derivedClass)`

Crée un nœud de base, copie la classe dérivée par-dessus, puis appelle _preInit (pins de sortie), init (si redéfini) et _postInit (pins d'entrée, catégories, postInit).

- `mgr` (*table*) : manager flowgraph
- `graph` (*table*) : graphe contenant le nœud
- `forceId` (*integer|nil*) : id imposé (sinon mgr:getNextFreeGraphNodeId())
- `derivedClass` (*table*) : classe du type de nœud concret
- **renvoie** : table nœud initialisé

## Classe `C`

Nœud flowgraph. Champs principaux : mgr, graph, id, name, description, color, iconColor, type ('node' par défaut, 'simple', 'variable'), tags, behaviour, triggerCount, workCount, data, dynamicMode, durationState, pinIn, pinInLocal, pinOut, pinList (ordre d'affichage), nodePosition ({x, y}), customName/customColor/customIcon/customIconColor, _error.

| Méthode | Description | Ligne |
|---|---|---|
| `C:HSVtoRGB(h, s, v)` | Convertit HSV en RGB via la fonction globale HSVtoRGB après avoir ramené h à sa partie fractionnaire et borné s et v dans [0, 1]. | 647 |
| `C:__executionStarted()` | Appelé par le manager au démarrage : efface l'erreur du nœud, remet à nil les sorties si clearOutPinsOnStart, réinitialise _frameLastUsed et _dynamicDone, puis appelle _executionStarted. | 622 |
| `C:__executionStopped()` | Appelé par le manager à l'arrêt : appelle _executionStopped et remet _dynamicDone à false. | 615 |
| `C:__getNodeError(category)` | Renvoie le message d'erreur d'une catégorie. | 1509 |
| `C:__onDeserialized(nodeData)` | Restaure position, personnalisations, data (propriétés connues seulement), mode dynamique, pins sauvegardés, valeurs en dur, quickAccess et pins cachés. Journalise des avertissements si un pin est introuvable. | 1381 |
| `C:__onSerialize()` | Sérialise le nœud : data (sans cdata), type, position, nom/couleur/icône perso, identifiant, mode dynamique, pins (si savePins), pins en dur, quickAccess, pins cachés, timeline. | 1298 |
| `C:__setNodeError(category, err)` | Enregistre une erreur pour une catégorie (log E) ; appelé sans catégorie, efface toutes les erreurs. | 1497 |
| `C:_destroy()` | Appelle self:destroy(). | 105 |
| `C:_doubleClicked()` | Appelle self:doubleClicked() si cette fonction existe sur le nœud dérivé. | 574 |
| `C:_drawMiddle(builder, style, drawType)` | Dessine la zone centrale selon le mode d'affichage (flowLevel, simple, debug, default, heatmap, geometry) ; appelle drawMiddle si le nœud dérivé le définit. | 824 |
| `C:_executionStarted()` | Hook interne vide appelé au démarrage. | 620 |
| `C:_executionStopped()` | Hook interne vide appelé à l'arrêt de l'exécution. | 613 |
| `C:_onClear()` | Vide (l'appel à _executionStopped y est commenté). | 609 |
| `C:_onDeserialized(nodeData)` | Hook vide appelé pendant la désérialisation. | 1378 |
| `C:_onLink(link)` | Appelle onLink. | 584 |
| `C:_onNodeReset()` | Appelle onNodeReset sous xpcall puis remet toutes les valeurs de pinOut à nil. | 336 |
| `C:_onSerialize(res)` | Hook vide permettant au nœud dérivé d'ajouter des champs à la table sérialisée. | 1295 |
| `C:_onSetHardcode(pin, value, forceType)` | Appelle onSetHardcode. | 598 |
| `C:_onUnlink(link)` | Appelle onUnlink. | 591 |
| `C:_onUnsetHardcode(pin)` | Appelle onUnsetHardcode. | 605 |
| `C:_postDeserialize()` | Hook vide appelé après la désérialisation complète du graphe. | 1515 |
| `C:_postInit()` | Crée les pins d'entrée de pinSchema (avec valeurs hardcoded si demandé), crée un pin reset si le mode est 'once', appelle handleNodeCategories puis postInit. | 135 |
| `C:_preInit()` | Crée les pins de sortie décrits dans pinSchema (hidden, impulse, chainFlow, tableType). | 113 |
| `C:_setHardcodedDummyInputPin(pin, val, forceType)` | Pose (val non nil) ou retire (val nil) une valeur constante sur un pin d'entrée : crée une entrée factice dans pinIn avec hardCodeType, passe pin.pinMode à 'hardcoded' ou 'normal' et appelle les hooks. | 1251 |
| `C:_setupTimeline(beginTime, endTime)` | Crée self.timeline {beginTime, endTime, lane = 0} et définit des onTimelineBegin/End/Trigger vides (nop) si absents. | 1283 |
| `C:_workDynamicOnce()` | Mode 'once' : gère le reset (pinIn.reset), appelle workOnce une fois puis work à chaque appel tant que le flux est actif. | 351 |
| `C:_workDynamicRepeat()` | Exécute work sous xpcall, applique checkAutomatedFlow, incrémente workCount et enregistre l'erreur éventuelle (erreur de nœud + évènement du manager). | 321 |
| `C:addBehaviour(behaviour)` | Active un comportement dans self.behaviour. | 234 |
| `C:addedToGraph(graph)` | Hook vide appelé quand le nœud est ajouté à un graphe. | 109 |
| `C:alignToGrid(x, y)` | Aligne le nœud sur la grille de 14 px (décalage 10, 8), éventuellement après avoir fixé une position, puis met à jour l'éditeur. | 1520 |
| `C:autoCreatePin(direction, type, name, default, description, extra, fixed)` | Comme createPin, mais seulement si aucun pin du même nom/direction n'existe, puis replace le pin à la position imposée par pinOrder pour les nœuds fonctionnels. | 251 |
| `C:checkAutomatedFlow()` | Recopie pinIn.flow vers pinOut.flow pour les nœuds fonctionnels non simples et pilote incomplete/complete/completed pour les nœuds f_duration. 'completed' retombe à false après une frame. | 397 |
| `C:createPin(direction, type, name, default, description, autoNumber, extra, fixed)` | Crée un pin sur le nœud (module flowgraph/pin), l'ajoute à pinInLocal/pinOut, à pinList et à graph.pins. Refuse les noms vides ou en double (sauf autoNumber, qui ajoute un suffixe 2..101). | 465 |
| `C:createResetPin()` | Crée un pin d'entrée flow 'reset' (impulsion) et ajoute le comportement 'once', s'il n'existe pas. | 301 |
| `C:customContextMenu()` | Hook vide pour ajouter des entrées au menu contextuel du nœud. | 1096 |
| `C:destroy()` | Hook vide appelé à la destruction du nœud ; à surcharger pour libérer des ressources. | 102 |
| `C:draw(builder, style)` | Dessine tout le nœud dans l'éditeur : styles selon erreur/activité récente, en-tête, pins d'entrée, milieu (sous xpcall), pins de sortie, icônes de comportement. Ignore les types autres que node, simple, variable. | 892 |
| `C:drawHeader(builder, style)` | Dessine l'en-tête du nœud (icône, nom, [ERROR] si erreur, id si préférence, couleur heatmap selon l'ancienneté de _frameLastUsed). | 653 |
| `C:drawMiddle(builder, style)` | Hook de dessin du milieu du nœud à surcharger ; la version de base appelle simplement builder:Middle(). | 888 |
| `C:drawTooltip()` | Dessine l'infobulle du nœud survolé : activité en mode heatmap, nom, nom perso, comportements, obsolescence, description, TODO, erreurs. | 710 |
| `C:getData()` | Renvoie la table self.data (propriétés éditables du nœud). | 86 |
| `C:getLinks()` | Parcourt les liens du graphe et renvoie ceux qui arrivent sur le nœud puis ceux qui en partent. | 634 |
| `C:getPinIn()` | Renvoie self.pinIn. | 94 |
| `C:getPinInConstValue(pinName)` | Renvoie la valeur constante d'un pin d'entrée si elle a été posée en dur (hardcoded), sinon nil. | 1086 |
| `C:handleNodeCategories()` | Selon self.category, ajoute les comportements et crée automatiquement les pins flow, reset, incomplete, complete, completed. Journalise une erreur si un nœud 'simple' a des pins flow ou si un 'provider' a des entrées. Sans catégorie, force le mode 'repeat'. | 169 |
| `C:hasFlowPins()` | Indique si pinSchema contient un pin de type 'flow'. | 279 |
| `C:hasInputPins()` | Indique si pinSchema contient un pin d'entrée. | 290 |
| `C:hideProperties()` | Hook vide appelé quand la sélection quitte le nœud. | 572 |
| `C:init(mgr, graph, forceId)` | Initialise tous les champs du nœud (identifiant, nom 'unknown', couleur par défaut, tables de pins, pin d'alignement). Vérifie les identifiants dupliqués si mgr.__safeIds. | 36 |
| `C:isFlowActive()` | Censée dire si une dépendance de flux est active, mais renvoie toujours true (voir notes). | 562 |
| `C:onDurationFinished()` | Hook vide : l'état de durée passe à 'finished'. | 439 |
| `C:onDurationInactive()` | Hook vide : l'état de durée passe à 'inactive'. | 435 |
| `C:onDurationStarted()` | Hook vide : l'état de durée passe à 'started'. | 437 |
| `C:onLink(link)` | Hook vide appelé quand un lien est créé sur un pin du nœud. | 581 |
| `C:onNodeReset()` | Hook vide appelé quand le nœud est réinitialisé (pin reset en mode 'once'). | 334 |
| `C:onSetHardcode(pin, value, forceType)` | Hook vide appelé quand une valeur constante (hardcoded) est posée sur un pin d'entrée. | 595 |
| `C:onUnlink(link)` | Hook vide appelé quand un lien est supprimé. | 588 |
| `C:onUnsetHardcode(pin)` | Hook vide appelé quand la valeur constante d'un pin est retirée. | 602 |
| `C:overDraw()` | Dessine une grande icône semi-transparente par-dessus le nœud (appel commenté dans draw, donc inutilisé). | 800 |
| `C:postInit()` | Hook vide appelé à la fin de _postInit, une fois tous les pins créés. | 316 |
| `C:removeBehaviour(behaviour)` | Désactive un comportement (met la valeur à false). | 243 |
| `C:removePin(pin)` | Supprime un pin : supprime d'abord les liens du graphe qui l'utilisent, retire le pin des tables et de pinList. Le commentaire du code signale que d'autres effets de bord sont à vérifier. | 503 |
| `C:removeResetPin()` | Supprime le pin 'reset' et le comportement 'once'. | 309 |
| `C:renamePin(pin, newName)` | Renomme un pin d'entrée dans pinInLocal. Refuse (avec un avertissement) si le nouveau nom est déjà pris par un autre pin. Ne gère que les pins d'entrée. | 528 |
| `C:representsGraph()` | Renvoie nil par défaut ; les nœuds qui représentent un sous-graphe renvoient ce graphe. | 110 |
| `C:setData(data)` | Remplace self.data. | 90 |
| `C:setDurationState(state)` | Change l'état d'un nœud de catégorie f_duration et signale le changement ; checkAutomatedFlow met alors à jour les pins incomplete/complete/completed et appelle onDurationXxx. | 389 |
| `C:setDynamicMode(mode)` | Fixe le mode dynamique ; crée le pin reset pour 'once', le supprime pour 'repeat'. | 453 |
| `C:setPinIn(data)` | Remplace self.pinIn. | 98 |
| `C:shiftPin(idInList, direction)` | Échange un pin de pinList avec son voisin (circulaire) pour changer l'ordre d'affichage. | 540 |
| `C:showContextMenu(menuPos)` | Affiche le menu contextuel (copier, supprimer, afficher/masquer les pins, créer un sous-graphe, dégrouper, commentaire, outils de développement selon préférences). | 1097 |
| `C:showProperties()` | Hook vide appelé quand le nœud est sélectionné pour afficher ses propriétés. | 571 |
| `C:toString()` | Renvoie une chaîne « nom (nodeType / id) in graphe » pour les logs. | 1513 |
| `C:toggleDynamicMode()` | Bascule entre 'repeat' et 'once' si la catégorie est dynamique. | 442 |
| `C:trigger()` | Déclenche le nœud via self._trigger (fonction compilée par le manager) si le graphe n'est pas arrêté ; incrémente triggerCount et met à jour _frameLastUsed. | 549 |
| `C:updateEditorPosition()` | Applique nodePosition au nœud dans l'éditeur (SetNodePosition). À n'appeler que lorsque le manager est ouvert dans l'éditeur. | 1366 |
| `C:updateNodePosition()` | Lit la position du nœud dans l'éditeur ImGui et la mémorise dans nodePosition (si dans ±2e8). | 1355 |
| `C:work(args)` | Fonction principale du nœud, à surcharger. Appelée par le manager à chaque passage du flux, dans un xpcall. En mode 'once', elle est appelée après workOnce. | 318 |
| `C:workOnce()` | Hook vide appelé une seule fois (mode dynamique 'once') quand le flux arrive, avant les appels de work. Réarmé par un reset. | 349 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/basenode.lua`.*
