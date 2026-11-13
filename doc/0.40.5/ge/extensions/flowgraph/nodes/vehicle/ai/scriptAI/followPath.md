# `flowgraph_nodes_vehicle_ai_scriptAI_followPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Follow Path from Data » (couleur ai). Fait suivre à un véhicule un chemin ScriptAI fourni par les nœuds « AI Path from File » ou « Stored AI Path » (ai.startFollowing). Entrées : flow, reset, path (type aiPath), vehId, loopCount. Sortie : flow, actif quand le chemin est terminé. Options de l'inspecteur : Timescale (min 0,25), mode de reset (neverReset, alwaysReset, startReset), bouton « Reset AI ». Données : handBrakeWhenFinished, straightenWheelsWhenFinished.

## Remarques

- loopMode n'est pas sauvegardé : il revient à « neverReset » au rechargement du projet.
- Si loopCount n'est pas donné, la valeur 0 est envoyée à ai.startFollowing.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Arrête l'IA si le chemin était en cours puis remet started/complete à false. | 87 |
| `C:_onDeserialized(nodeData)` | Restaure timeScale (1 par défaut). | 138 |
| `C:_onSerialize(res)` | Sauvegarde timeScale. | 134 |
| `C:drawCustomProperties()` | Dessine le champ Timescale (minimum 0,25), le choix du mode de reset et le bouton « Reset AI ». | 38 |
| `C:drawMiddle(builder, style)` | Affiche les états Complete et Started. | 143 |
| `C:endAI()` | Envoie au véhicule ai:scriptStop(handBrake, straightenWheels). | 70 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 60 |
| `C:init()` | Initialise started, complete, loopMode=« neverReset », timeScale=1 et les données. | 29 |
| `C:loadPath()` | Charge le chemin depuis le pin path dans self.path. | 95 |
| `C:onVehicleSubmitInfo(id, info, nodeID)` | Hook appelé par la commande envoyée à chaque frame (ai.scriptState du véhicule) ; quand l'info est nil pour ce véhicule et ce nœud, marque le chemin comme terminé et arrête l'IA. | 77 |
| `C:setupAI()` | Prépare le chemin (temps divisés par timeScale, dir/up conservés) et envoie ai.startFollowing(chemin, nil, loopCount, mode de boucle). | 99 |
| `C:work()` | Gère reset ; au premier passage lance setupAI ; chaque frame demande via be:queueAllObjectLua l'état ai.scriptState() de chaque véhicule qui rappelle le hook onVehicleSubmitInfo ; active flow une fois complete. | 118 |

## Appels vers le moteur (C++)

- `be:` `queueAllObjectLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua`.*
