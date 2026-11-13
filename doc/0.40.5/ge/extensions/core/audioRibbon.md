# `core_audioRibbon`

*Fichier : `lua/ge/extensions/core/audioRibbon.lua` · VM : Game Engine (GE) · 846 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_audioRibbon` : `extensions.load("core_audioRibbon")`, puis la globale `core_audioRibbon`

Extension GE (core_audioRibbon) : audio dynamique pour des 'rubans' (rivières, cascades, etc.) définis dans l'éditeur. Un ruban est une bande de quadrilatères (nodes par paires gauche/droite, avec profondeur). À chaque frame, pour l'auditeur (SFXSystem), le module suit le point le plus proche sur chaque ruban proche et pilote jusqu'à 5 émetteurs SFX par évènement (1 'A' central/ambiant, puis 4 autour de l'auditeur : F devant, B derrière, R droite, L gauche) en réglant volume, pitch, color et texture (RTPC) d'après largeur, profondeur et vitesse du ruban. Les rubans sont chargés de levels/<niveau>/dynamicAudioEmitters/ribbonData.audioSFX.json (format JSON lignes, un ruban par ligne), écrits par l'éditeur à la sauvegarde. Beaucoup de fonctions exportées servent surtout à l'éditeur.

## Exemple

```lua
local rib = core_audioRibbon.getRibbons()
for i, r in ipairs(rib or {}) do print(r.name, r.numSegs) end
```

## Remarques

- Structure d'un ruban : {persistantId, name, isEnabled, isAmbient, isUpRibbon, isTopActive, isQuadAndVolume, isMuteA..D, speed, nodes (vec3 par paires), depths (par noeud), widths (par paire, calculé), numSegs (calculé), emitters[1..5]}.
- Les émetteurs d'un ruban (emitters) sont des 'hôtes' : {bestSeg, dir, vol, pos, bN, eventNameStr}. emitters[1] = évènement A (centre/ambiance), 2 = F (devant), 3 = B (derrière), 4 = R (droite), 5 = L (gauche).
- Gestion de distance : liste 'near' (au plus les 2 rubans les plus proches, tous émetteurs actifs), 'mid' (point interne seulement) et 'far' (un ruban par frame en round robin). Limite near/far : 400 m (nearFarLimitSq = 400²).
- Le suivi du point le plus proche utilise une marche directionnelle (1 segment par frame) et une sonde aléatoire (bruit bleu) toutes les 3 frames pour échapper aux minima locaux.
- Coefficients de pondération provisoires dans le code (commentaire 'TODO - REMOVE LATER WHEN SYSTEM IS TUNED') : largeur 100, profondeur 100, vitesse 100, offset exponentiel 800.
- Incohérence : readRibbonsFromFile ne relit pas isMuteA..D (le fichier ne les contient pas) : après chargement d'un niveau ils valent nil (donc non muets) ; seul onSerialize/onDeserialized les conserve lors d'un rechargement Lua.
- Effet de bord : onSerialize supprime tous les rubans et émetteurs après les avoir copiés (removeRibbon pour chaque ruban).
- Incohérence : createSfxEmitter utilise ffi.string(eventName) alors que eventName est une chaîne Lua (accepté par LuaJIT) ; le nom d'évènement est donc converti inutilement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_audioRibbon.clearAllSFXEmitters()` | Supprime tous les objets SFXEmitter dynamiques (5 axes) et vide leur table. | 494 |
| `core_audioRibbon.clearNearFarLists()` | Vide les listes near, mid et far (elles seront reconstruites à la frame suivante). | 802 |
| `core_audioRibbon.clearRibbonNames()` | Vide la table des noms de rubans. | 809 |
| `core_audioRibbon.createEmitterHost(eventName)` | Crée l'enregistrement d'un hôte d'émetteur dynamique (position initiale à l'infini, bestSeg 0, direction 1). | 535 |
| `core_audioRibbon.getFarList()` | Renvoie la liste far (rubans lointains, un seul visité par frame). | 817 |
| `core_audioRibbon.getMidList()` | Renvoie la liste mid (rubans à moins de 400 m, seulement le point interne mis à jour). | 816 |
| `core_audioRibbon.getNearList()` | Renvoie la liste near (persistantId -> indice de ruban), au plus 2 rubans. | 815 |
| `core_audioRibbon.getRibbonNames()` | Renvoie la table des identifiants de rubans connus (persistantId -> true). | 814 |
| `core_audioRibbon.getRibbons()` | Renvoie la liste des rubans (nil avant le premier chargement). | 812 |
| `core_audioRibbon.getSfxEmitters()` | Renvoie les 5 tables d'émetteurs SFX par axe, indexées par nom d'évènement ({emitter, vol, pitch, color, texture, pos}). | 818 |
| `core_audioRibbon.onClientCustomObjectSpawning()` | Hook appelé quand les objets du niveau sont créés : réinitialise les rubans puis relit le fichier ribbonData.audioSFX.json du niveau. *(interne)* *(hook)* | 792 |
| `core_audioRibbon.onClientEndMission()` | Hook appelé à la fin du niveau : supprime les émetteurs et vide les rubans (resetRibbons). *(interne)* *(hook)* | 778 |
| `core_audioRibbon.onDeserialized(data)` | Hook de restauration après rechargement Lua : reconstruit les rubans (nodes en vec3, hôtes d'émetteurs, widths, numSegs) et la table des noms. *(interne)* *(hook)* | 721 |
| `core_audioRibbon.onEditorBeforeSaveLevel()` | Hook appelé avant la sauvegarde du niveau dans l'éditeur : écrit les rubans dans levels/<niveau>/dynamicAudioEmitters/ribbonData.audioSFX.json (triés par nom). *(interne)* *(hook)* | 769 |
| `core_audioRibbon.onExit()` | Hook appelé à la fermeture du jeu : supprime tous les émetteurs SFX dynamiques. *(interne)* *(hook)* | 494 |
| `core_audioRibbon.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie une copie complète des rubans puis SUPPRIME tous les rubans et émetteurs. Renvoie nil s'il n'y a pas de ruban. *(interne)* *(hook)* | 708 |
| `core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : lit la pose de l'auditeur, met à jour les listes near/mid/far, calcule pour chaque ruban proche les points les plus proches et les RTPC, puis crée/pilote les émetteurs SFXEmitter (positions et setVolumePitchCT). Ne fait rien s'il n'y a pas de ruban. *(interne)* *(hook)* | 311 |
| `core_audioRibbon.recomputeMap()` | Reconstruit la table des noms (persistantId -> true) à partir des rubans. | 486 |
| `core_audioRibbon.removeRibbon(idx)` | Supprime tous les émetteurs SFX, retire le ruban d'indice idx de la liste et de la table des noms, et vide les listes near/mid/far. | 506 |
| `core_audioRibbon.setRibbons(val)` | Remplace la liste des rubans (utilisé par l'éditeur). | 813 |
| `core_audioRibbon.updateRibbonData(ribbon)` | À appeler après toute modification des noeuds d'un ruban : remet bestSeg=1 et dir=1 pour les 5 hôtes, recalcule ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) et ribbon.widths (distance entre les deux noeuds de chaque paire). | 517 |

### Détail des paramètres

#### `core_audioRibbon.createEmitterHost(eventName)`

Crée l'enregistrement d'un hôte d'émetteur dynamique (position initiale à l'infini, bestSeg 0, direction 1).

- `eventName` (*string*) : Nom de l'évènement FMOD
- **renvoie** : table {bestSeg, dir, vol, pos, bN, eventNameStr}

#### `core_audioRibbon.getFarList()`

Renvoie la liste far (rubans lointains, un seul visité par frame).

- **renvoie** : table<string, integer> Liste far

#### `core_audioRibbon.getMidList()`

Renvoie la liste mid (rubans à moins de 400 m, seulement le point interne mis à jour).

- **renvoie** : table<string, integer> Liste mid

#### `core_audioRibbon.getNearList()`

Renvoie la liste near (persistantId -> indice de ruban), au plus 2 rubans.

- **renvoie** : table<string, integer> Liste near

#### `core_audioRibbon.getRibbonNames()`

Renvoie la table des identifiants de rubans connus (persistantId -> true).

- **renvoie** : table<string, boolean> Table des identifiants

#### `core_audioRibbon.getRibbons()`

Renvoie la liste des rubans (nil avant le premier chargement).

- **renvoie** : table|nil Liste de rubans

#### `core_audioRibbon.getSfxEmitters()`

Renvoie les 5 tables d'émetteurs SFX par axe, indexées par nom d'évènement ({emitter, vol, pitch, color, texture, pos}).

- **renvoie** : table Tableau de 5 tables

#### `core_audioRibbon.onDeserialized(data)`

Hook de restauration après rechargement Lua : reconstruit les rubans (nodes en vec3, hôtes d'émetteurs, widths, numSegs) et la table des noms.

- `data` (*table|nil*) : Données de onSerialize

#### `core_audioRibbon.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie une copie complète des rubans puis SUPPRIME tous les rubans et émetteurs. Renvoie nil s'il n'y a pas de ruban.

- **renvoie** : table|nil Liste de rubans sérialisés

#### `core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : lit la pose de l'auditeur, met à jour les listes near/mid/far, calcule pour chaque ruban proche les points les plus proches et les RTPC, puis crée/pilote les émetteurs SFXEmitter (positions et setVolumePitchCT). Ne fait rien s'il n'y a pas de ruban.

- `dtReal` (*number*) : Pas de temps réel (s)
- `dtSim` (*number*) : Pas de temps simulation (s)
- `dtRaw` (*number*) : Pas de temps brut (s)

#### `core_audioRibbon.removeRibbon(idx)`

Supprime tous les émetteurs SFX, retire le ruban d'indice idx de la liste et de la table des noms, et vide les listes near/mid/far.

- `idx` (*integer*) : Indice du ruban dans getRibbons()

#### `core_audioRibbon.setRibbons(val)`

Remplace la liste des rubans (utilisé par l'éditeur).

- `val` (*table*) : Nouvelle liste

#### `core_audioRibbon.updateRibbonData(ribbon)`

À appeler après toute modification des noeuds d'un ruban : remet bestSeg=1 et dir=1 pour les 5 hôtes, recalcule ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) et ribbon.widths (distance entre les deux noeuds de chaque paire).

- `ribbon` (*table*) : Ruban (nodes, emitters) modifié en place

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `upcast`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/audioRibbon.lua`.*
