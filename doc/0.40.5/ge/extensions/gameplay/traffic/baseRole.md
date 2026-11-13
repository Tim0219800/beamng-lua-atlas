# `gameplay_traffic_baseRole`

*Fichier : `lua/ge/extensions/gameplay/traffic/baseRole.lua` · VM : Game Engine (GE) · 309 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/baseRole")` (fichier sous extensions/ mais pas une extension classique)

Classe de base des « rôles » du trafic (civil, police, suspect, etc.). Un rôle est attaché à un véhicule du trafic (objet de gameplay_traffic) et lui donne une personnalité (aggression, patience, bravery), des actions nommées (pullOver, disabled et celles ajoutées par les classes dérivées), un état et éventuellement un flowgraph propre. Le module renvoie un constructeur appelé avec la classe dérivée : require('/lua/ge/extensions/gameplay/traffic/baseRole')(derivedClass, {veh = vehObj, name = 'police'}). Les méthodes onXxx vides sont des points d'extension pour les rôles dérivés.

## Remarques

- Constructeur : crée l'objet à partir de la table passée (o.veh, o.name), appelle init, copie les champs de derivedClass (qui peuvent remplacer init et les méthodes), appelle de nouveau o:init() sans argument, puis postInit(). La classe dérivée doit donc fournir son propre init qui rappelle la base avec les bons paramètres.
- Personnalité : chaque valeur est gaussienne centrée sur 0,5 (randomGauss3()/3 + offset, bornée par min/max), valeurs dans [0, 1]. Ne s'applique qu'aux véhicules IA (veh.isAi) ; l'agressivité IA finale est base + (aggression - 0,5) * 0,6, bornée à [0,25 ; 1,25].
- Incohérence : init crée self.personalityModifiers, mais generatePersonality lit self.driver.personalityModifiers (jamais créé ici) ; les modificateurs ne s'appliquent donc que si une classe dérivée définit driver.personalityModifiers.
- Le commentaire du code précise que l'action pullOver ne fonctionne pas toujours correctement (le véhicule peut ne pas se garer sur le côté).
- lockAction (activé par setupFlowgraph) empêche setAction et resetAction d'agir.

## Classe `C`

Instance d'un rôle de trafic. Champs : veh (objet véhicule de trafic), name, class, actionName, actionTimer, state, flags, actions (table nom -> fonction(args)), baseActions (pullOver, disabled), driver {personality, aggression}, targetId, targetVisible, targetNear, flowgraph, lockAction, ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_baseRole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyPersonality(data)` | Applique une personnalité (fusionnée dans driver.personality) et envoie l'agressivité à l'IA. Si data n'est pas une table, restaure la personnalité neutre. | 171 |
| `C:checkTargetVisible(id)` | Teste par lancer de rayon statique si le véhicule cible est visible depuis ce véhicule (point visé 1 m au-dessus de la cible). | 191 |
| `C:clearFlowgraph()` | Arrête et supprime le flowgraph, remet le mode IA par défaut et déverrouille l'action. | 99 |
| `C:freezeTrafficSignals(state)` | Pour véhicules d'urgence : force les feux. À true, avance les séquences ayant un feu vert, et fige (timer coupé) celles dont tous les feux sont rouges ; à false, relance les séquences figées. Sans effet si les feux de signalisation ne sont pas actifs. | 202 |
| `C:generatePersonality()` | Génère une personnalité aléatoire (aggression, patience, bravery). Renvoie la personnalité neutre (0,5) si ignorePersonality. | 152 |
| `C:init(veh, name, data)` | Initialise les champs par défaut du rôle et les actions de base pullOver et disabled. Options lues dans data : ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh. | 9 |
| `C:onActiveDone()` | Point d'extension (vide) : appelé par le système de trafic quand le véhicule a fini d'être actif. | 243 |
| `C:onCollision(otherId, data)` | Point d'extension (vide) : collision de ce véhicule avec un autre. | 261 |
| `C:onCrashDamage(data)` | Point d'extension (vide) : dégâts de crash sur ce véhicule. | 255 |
| `C:onDeserialized(data, veh)` | Restaure le rôle après rechargement Lua. | 287 |
| `C:onOtherCollision(id1, id2, data)` | Point d'extension (vide) : collision entre deux autres véhicules. | 264 |
| `C:onOtherCrashDamage(otherId, data)` | Point d'extension (vide) : dégâts de crash sur un autre véhicule. | 258 |
| `C:onOtherEvent(eventType, otherId, data)` | Point d'extension (vide) : évènement lié à un autre véhicule. | 267 |
| `C:onRefresh()` | Point d'extension (vide) : appelé par postInit, à la création et au refresh du véhicule. | 246 |
| `C:onRoleEnded()` | Point d'extension (vide) : appelé quand le rôle se termine. | 252 |
| `C:onRoleStarted()` | Point d'extension (vide) : appelé quand le rôle devient actif. | 249 |
| `C:onSerialize()` | Sérialise id du véhicule, nom, état, nom d'action et cible. | 276 |
| `C:onTrafficTick(tickTime)` | Point d'extension (vide) : tick périodique du système de trafic. | 270 |
| `C:onUpdate(dt, dtSim)` | Point d'extension (vide) : mise à jour à chaque frame. | 273 |
| `C:postInit()` | Appelé après la construction (et à chaque refresh de véhicule) : réinitialise l'action et regénère la personnalité sauf si keepActionOnRefresh / keepPersonalityOnRefresh, puis appelle onRefresh. | 65 |
| `C:resetAction()` | Remet l'action par défaut : mode IA par défaut, paramètres et électriques réinitialisés, flags vidés, état 'none', cible effacée. Sans effet si lockAction. Appelé à chaque réapparition du véhicule sauf keepActionOnRefresh. | 137 |
| `C:setAction(name, args)` | Exécute l'action nommée de self.actions (sauf si lockAction), mémorise son nom et émet le hook onTrafficAction(vehId, name, {targetId, data}). Erreur journalisée si l'action n'existe pas. | 118 |
| `C:setAggression(baseAggression, ignorePersonality)` | Calcule et envoie à l'IA du véhicule l'agressivité (ai.setAggression), en tenant compte de la personnalité sauf si ignorée. | 130 |
| `C:setTarget(id)` | Définit le véhicule cible (si l'identifiant existe) et, pour un véhicule IA, envoie ai.setTargetObjectID. | 108 |
| `C:setupFlowgraph(fgFile, varData)` | Charge un flowgraph propre à ce véhicule, fixe ses variables, l'active (avec keepTrafficState), met l'IA du véhicule en mode 'stop' et verrouille l'action (lockAction). Journalise une erreur si le fichier est introuvable. | 75 |
| `C:tryRandomEvent()` | Point d'extension (vide) : tentative d'évènement aléatoire du rôle. | 240 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAction` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/baseRole.lua`.*
