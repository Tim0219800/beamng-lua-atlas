# `flowgraph_nodes_util_loadLevel`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/loadLevel")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Load Level » (couleur bleue, icône public). Charge un niveau : levelPath est relatif à levels/ (info.json est ajouté automatiquement). Entrées : flow, levelPath (modèles = tous les niveaux), model et config (cachés, pour faire apparaître un véhicule précis). Sortie : flow, activé quand le niveau est chargé. Machine à états : 1 démarre le chargement (core_levels.startLevel), 2 attend, 3 attend delayBufferFrames puis émet onClientPostStartMission/onClientStartMission et recharge la carte (map.assureLoad), 4 terminé. Données du nœud : preventPlayerSpawning, forceLevelLoad, delayBufferFrames, stopRunningOnClientEndMission, noLoadInEdit, customLoadingScreen.

## Remarques

- Si l'éditeur est actif, il est arrêté pendant le chargement puis réactivé.
- Dans work, self.stopRunningOnClientEndMission (champ du nœud) est utilisé comme valeur de mgr.stopRunningOnClientEndMission, mais il n'est jamais défini : il vaut nil.
- Le commentaire de config dit « specific color » alors que le pin est la config du véhicule.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet l'état à 1, flow à false et efface mgr.__delayedLoadingScreenFunctions. | 34 |
| `C:drawMiddle(builder, style)` | Affiche l'état courant dans le corps du nœud. | 126 |
| `C:init()` | Initialise l'état à 1, le pin flow à false et les données par défaut (preventPlayerSpawning=true, forceLevelLoad=true, delayBufferFrames=0, noLoadInEdit=true, customLoadingScreen=false...). | 23 |
| `C:onLoadingScreenFadeout(missionFile)` | Hook appelé au fondu de sortie de l'écran de chargement ; passe à l'état 3 avec le délai de frames, sauf si déjà à l'état 4. | 51 |
| `C:postInit()` | Remplit les modèles du pin levelPath avec la liste triée de getAllLevelIdentifiers(). | 40 |
| `C:work()` | Fait avancer la machine à états. Si le niveau demandé est déjà chargé (et forceLevelLoad faux ou éditeur actif avec noLoadInEdit), passe directement à 4. Sinon lance core_levels.startLevel (en désactivant l'apparition automatique du joueur selon la donnée), puis finalise en état 3. | 59 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onClientPostStartMission` — écouté par 15 module(s)
- `onClientStartMission` — écouté par 40 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua`.*
