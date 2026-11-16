# `flowgraph_nodes_gameplay_playerMoves`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/playerMoves")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Detect Acceleration At Start » (catégorie repeat_instant, icône timer). Sert à démarrer une mission quand le joueur bouge plutôt qu'après un compte à rebours. Entrées : flow, reset (impulsion qui remet la position initiale à zéro), vehId (véhicule suivi, sinon véhicule du joueur 0). Sortie : success (flow) vrai quand le véhicule s'est éloigné de plus de 0,1 m de sa position initiale. Tant que le véhicule n'a pas bougé, envoie le message UI 'ScenarioRealtimeDisplay' (missions.general.moveToStart, contexte accelerateToBegin) ; il est effacé au premier mouvement.

## Remarques

- Option data.useScenarioRealtimeDisplay (true par défaut) : active l'affichage du message de départ.
- La position est lue dans map.objects[vehId].pos ; si le véhicule n'y figure pas, le nœud ne fait rien.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise la position initiale et msgSent au démarrage du graphe. | 28 |
| `C:init()` | Initialise initialPos à nil, msgSent à true et data.useScenarioRealtimeDisplay à true. | 20 |
| `C:work(args)` | Chaque frame : gère reset, mémorise la position initiale du véhicule, affiche/efface le message de départ et met success à vrai si le véhicule s'est déplacé de plus de 0,1 m. | 33 |

**Évènements UI (guihooks.trigger) :** `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua`.*
