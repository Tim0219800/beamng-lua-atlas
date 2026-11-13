# `flowgraph_nodes_vehicle_ai_scriptAI_playRecording`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua` · VM : Game Engine (GE) · 130 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Play ScriptAI Recording » (couleur ai, repeat_p_duration). Fait rejouer à un véhicule un enregistrement ScriptAI lu dans un fichier .track.json. Entrées : start (impulsion), stop (impulsion), fileName, vehId (sans valeur = joueur), loopCount (-1 par défaut si vide). Le fichier est cherché relativement au projet puis dans /replays/scriptai/tracks/. Donnée renderDebug : dessine le tracé. Pas de pins de sortie.

## Remarques

- Le commentaire du fichier précise que la catégorie est techniquement f_duration mais qu'aucun callback n'existe pour des pins de fin.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche un bouton Load, l'état et les infos de l'enregistrement (véhicule, niveau, nombre de points, durée) ; dessine le tracé si renderDebug. | 96 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 44 |
| `C:init()` | Initialise recording=nil, data.renderDebug=false et running=false. | 32 |
| `C:loadRecording()` | Lit le fichier JSON en essayant trois emplacements (relatif au projet, dossier des pistes, dossier des pistes + extension) et le mémorise. | 76 |
| `C:play()` | Charge l'enregistrement, fixe loopCount et loopType « firstOnlyTeleport » puis envoie ai.startFollowing(recording). | 54 |
| `C:postInit()` | Limite le sélecteur de fichier de fileName aux fichiers .track.json. | 38 |
| `C:stop()` | Passe running à false et envoie ai.stopFollowing() au véhicule. | 67 |
| `C:work()` | Appelle play sur l'impulsion start, ou stop sur l'impulsion stop. | 88 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua`.*
