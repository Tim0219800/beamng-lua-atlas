# `bdebugImpl`

*Fichier : `lua/vehicle/bdebugImpl.lua` · VM : Véhicule · 2898 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `bdebugImpl`

Implémentation complète de l'outil de debug visuel du véhicule (chargée paresseusement par bdebug.lua). Dessine nœuds, poutres, barres de torsion, triangles de collision, rails/slidenodes, centre de gravité, aérodynamique, thermique des roues, point de contact des pneus et géométrie de direction via debugDrawer, selon M.state.vehicle (modes numérotés à partir de 1 ; 1 = 'off'). Il envoie l'état au GE (guihooks BdebugUpdate et extensions.hook onBDebugUpdate). Les moddeurs passent en général par bdebug.*, pas directement par bdebugImpl.

## Remarques

- M.state.vehicle contient pour chaque famille un index (nodeTextMode, nodeVisMode, beamTextMode, beamVisMode, collisionTriangleVisMode, torsionBarVisMode, railsSlideNodesVisMode, cogMode, nodeDebugTextMode…) et la liste des modes correspondants (…Modes) ; mode 1 = 'off'. Le dessin n'est activé que si vehicleDebugVisible est true et qu'au moins un champ non-table diffère de initState.vehicle.
- Types de poutres (valeurs C, ne pas changer) : 0 NORMALTYPE, 1 BEAM_ANISOTROPIC, 2 BEAM_BOUNDED, 3 BEAM_PRESSURED, 4 BEAM_LBEAM, 5 BEAM_BROKEN, 6 BEAM_HYDRO, 7 BEAM_SUPPORT.
- Les nodes/poutres affichés ne sont envoyés au GE (requestDrawnNodesGE/BeamsGE) qu'une fois : la liste de callbacks est vidée après l'envoi. Les callbacks sont appelés sous la forme geFuncName(liste, échelle).
- M.nodeCollision reste nop jusqu'à ce que le mode de visualisation concerné l'active en interne ; M.beamBroke n'est actif que pour les modes de poutres 'type+broken' (5) et 'brokenOnly' (6) quand l'outil est visible.
- Chaque debugDraw demande au GE la taille de viewport (debug_vehicleDebug.bdebugRequestViewportSize) ; le GE répond par receiveViewportSize.
- Incohérence : dans setNodeDebugText, la garde `if not M.state then return log(...) end` fait un `return log(...)` ; elle fonctionne mais le retour est la valeur de log. Par ailleurs updateUIs envoie volontairement l'état au GE via queueGameEngineLua (contournement d'un bug, d'après le commentaire).
- Le premier appel à init copie le savedState (ou initState) et reprend de newPartialState uniquement les champs nodeDebugTextTypeToID, nodeDebugTextMode et nodeDebugTextModes (et partsSelected).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `bdebugImpl.clearAllNodeDebugText()` | Supprime tous les groupes de textes debug de nœuds (ne reste que 'off'). | 2765 |
| `bdebugImpl.clearNodeDebugText(type, nodeCID)` | Supprime les textes d'un nœud dans un groupe. | 2734 |
| `bdebugImpl.clearTypeNodeDebugText(type)` | Supprime un groupe de textes entier et recale les index des groupes suivants ainsi que le mode sélectionné. | 2744 |
| `bdebugImpl.cogChange(change)` | Décale le mode d'affichage du centre de gravité (cyclique) avec message UI. *(interne)* | 2825 |
| `bdebugImpl.colTrisModeChange(change)` | Décale le mode des triangles de collision (cyclique) avec message UI. *(interne)* | 2818 |
| `bdebugImpl.init(savedState, newPartialState)` | Initialise l'outil : compte nœuds, poutres, triangles, barres de torsion, rails et slidenodes de v.data, copie l'état sauvegardé, récupère les textes de debug et les pièces sélectionnées de bdebug.lua et envoie l'état à l'UI. Appelée par bdebug.lua au chargement paresseux. *(interne)* | 2838 |
| `bdebugImpl.isEnabled()` | Indique si le debug visuel est affiché. | 2772 |
| `bdebugImpl.nodedebugtextModeChange(change)` | Décale le groupe de textes debug de nœuds affiché (cyclique) avec message UI. *(interne)* | 2804 |
| `bdebugImpl.nodetextModeChange(change)` | Décale le mode de texte de nœuds (cyclique) et affiche un message UI avec le nom du mode. *(interne)* | 2790 |
| `bdebugImpl.nodevisModeChange(change)` | Décale le mode de visualisation des nœuds (cyclique) avec message UI. *(interne)* | 2797 |
| `bdebugImpl.onPlayersChanged(m)` | Hook appelé quand le joueur change de véhicule (m = true si ce véhicule est concerné) : met à jour le dessin et renvoie l'état à l'UI. *(interne)* *(hook)* | 2648 |
| `bdebugImpl.receiveViewportSize(sizeX, sizeY)` | Mémorise la taille du viewport (utile au placement des textes/légendes). Appelée par le GE en réponse à bdebugRequestViewportSize. *(interne)* | 2568 |
| `bdebugImpl.requestDrawnBeamsGE(geFuncName)` | Enregistre une fonction GE à appeler au prochain dessin avec la liste des poutres dessinées : geFuncName(beamsDrawn, beamScale). | 2643 |
| `bdebugImpl.requestDrawnNodesGE(geFuncName)` | Enregistre une fonction GE à appeler au prochain dessin avec la liste des nœuds dessinés : geFuncName(nodesDrawn, nodeScale). | 2637 |
| `bdebugImpl.requestState()` | Envoie l'état courant (state et stateNoReset) au GE (guihooks BdebugUpdate et hook onBDebugUpdate). | 2560 |
| `bdebugImpl.reset()` | Au reset du véhicule : vide les mémoires des poutres cassées/déformées et groupes déclenchés pour que les messages se répètent. *(interne)* | 2861 |
| `bdebugImpl.resetModes()` | Remet l'état à une copie de initState (tous modes sur 'off'), affiche le message vehicle.bdebug.clear et met à jour l'UI. | 2832 |
| `bdebugImpl.setEnabled(enabled)` | Affiche ou masque le debug visuel, met à jour le dessin et l'UI. | 2776 |
| `bdebugImpl.setNodeDebugText(type, nodeCID, text)` | Ajoute un texte sur un nœud dans le groupe donné (créé si absent), puis met à jour le dessin et l'UI. | 2701 |
| `bdebugImpl.setPartsSelected(parts)` | Définit les pièces sélectionnées (M.partsState.partsSelected) utilisées pour mettre en valeur nœuds, poutres, etc. | 2693 |
| `bdebugImpl.setState(state, stateNoReset, notSendBack)` | Remplace l'état par celui reçu de l'UI (ignoré si state.objectId diffère de l'objet courant), recalcule vehicleDebugVisible et le dessin, puis renvoie l'état à l'UI sauf si notSendBack. | 2654 |
| `bdebugImpl.skeletonModeChange(change)` | Décale le mode de visualisation des poutres (beamVisMode, cyclique) avec message UI. *(interne)* | 2811 |
| `bdebugImpl.toggleEnabled()` | Inverse l'affichage du debug. Réservée au système d'input, pas à l'UI. *(interne)* | 2785 |

### Détail des paramètres

#### `bdebugImpl.clearNodeDebugText(type, nodeCID)`

Supprime les textes d'un nœud dans un groupe.

- `type` (*string*) : Nom du groupe.
- `nodeCID` (*integer*) : ID du nœud à l'exécution.

#### `bdebugImpl.clearTypeNodeDebugText(type)`

Supprime un groupe de textes entier et recale les index des groupes suivants ainsi que le mode sélectionné.

- `type` (*string*) : Nom du groupe.

#### `bdebugImpl.cogChange(change)`

Décale le mode d'affichage du centre de gravité (cyclique) avec message UI.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.colTrisModeChange(change)`

Décale le mode des triangles de collision (cyclique) avec message UI.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.init(savedState, newPartialState)`

Initialise l'outil : compte nœuds, poutres, triangles, barres de torsion, rails et slidenodes de v.data, copie l'état sauvegardé, récupère les textes de debug et les pièces sélectionnées de bdebug.lua et envoie l'état à l'UI. Appelée par bdebug.lua au chargement paresseux.

- `savedState` (*table|nil*) : État sauvegardé avant rechargement ; nil pour partir de initState.
- `newPartialState` (*table*) : État partiel accumulé par bdebug avant l'init (vehicle.nodeDebugText*, partsSelected).

#### `bdebugImpl.isEnabled()`

Indique si le debug visuel est affiché.

- **renvoie** : boolean M.state.vehicleDebugVisible.

#### `bdebugImpl.nodedebugtextModeChange(change)`

Décale le groupe de textes debug de nœuds affiché (cyclique) avec message UI.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.nodetextModeChange(change)`

Décale le mode de texte de nœuds (cyclique) et affiche un message UI avec le nom du mode.

- `change` (*integer*) : +1 suivant, -1 précédent.

#### `bdebugImpl.nodevisModeChange(change)`

Décale le mode de visualisation des nœuds (cyclique) avec message UI.

- `change` (*integer*) : +1 / -1.

#### `bdebugImpl.onPlayersChanged(m)`

Hook appelé quand le joueur change de véhicule (m = true si ce véhicule est concerné) : met à jour le dessin et renvoie l'état à l'UI.

- `m` (*boolean*) : Vrai si ce véhicule est (devient) le véhicule joueur (déduit du code).

#### `bdebugImpl.receiveViewportSize(sizeX, sizeY)`

Mémorise la taille du viewport (utile au placement des textes/légendes). Appelée par le GE en réponse à bdebugRequestViewportSize.

- `sizeX` (*number*) : Largeur en pixels.
- `sizeY` (*number*) : Hauteur en pixels.

#### `bdebugImpl.requestDrawnBeamsGE(geFuncName)`

Enregistre une fonction GE à appeler au prochain dessin avec la liste des poutres dessinées : geFuncName(beamsDrawn, beamScale).

- `geFuncName` (*string*) : Nom de la fonction GE.

#### `bdebugImpl.requestDrawnNodesGE(geFuncName)`

Enregistre une fonction GE à appeler au prochain dessin avec la liste des nœuds dessinés : geFuncName(nodesDrawn, nodeScale).

- `geFuncName` (*string*) : Nom de la fonction GE.

#### `bdebugImpl.setEnabled(enabled)`

Affiche ou masque le debug visuel, met à jour le dessin et l'UI.

- `enabled` (*boolean*) : true pour afficher.

#### `bdebugImpl.setNodeDebugText(type, nodeCID, text)`

Ajoute un texte sur un nœud dans le groupe donné (créé si absent), puis met à jour le dessin et l'UI.

- `type` (*string*) : Nom du groupe de textes.
- `nodeCID` (*integer*) : ID du nœud à l'exécution.
- `text` (*string*) : Texte à afficher.

#### `bdebugImpl.setPartsSelected(parts)`

Définit les pièces sélectionnées (M.partsState.partsSelected) utilisées pour mettre en valeur nœuds, poutres, etc.

- `parts` (*table*) : Sélection de pièces.

#### `bdebugImpl.setState(state, stateNoReset, notSendBack)`

Remplace l'état par celui reçu de l'UI (ignoré si state.objectId diffère de l'objet courant), recalcule vehicleDebugVisible et le dessin, puis renvoie l'état à l'UI sauf si notSendBack.

- `state` (*table*) : Nouvel état (avec objectId et vehicle).
- `stateNoReset` (*table*) : Nouvel état non remis à zéro.
- `notSendBack` (*boolean|nil*) : true pour ne pas renvoyer l'état à l'UI.

#### `bdebugImpl.skeletonModeChange(change)`

Décale le mode de visualisation des poutres (beamVisMode, cyclique) avec message UI.

- `change` (*integer*) : +1 / -1.

## Champs

| Champ | Type | Description |
|---|---|---|
| `beamBroke` | function | Hook beamBroke(id, energy) appelé quand une poutre casse ; nop sauf mode poutres cassées. |
| `debugDraw` | function | Dessin debug debugDraw(focusPos) appelé à chaque frame par la boucle principale ; nop si aucun mode actif. |
| `initState` | table | État par défaut : vehicleDebugVisible=false, objectId, et vehicle = tous les modes (nodeTextModes, nodeVisModes, beamTextModes, beamVisModes, collisionTriangleVisModes, torsionBarVisModes, railsSlideNodesVisModes, cogModes, aérodynamique…), échelles (aerodynamicsScale 0.1, nodeTextMaxDist 10), tireContactPoint, steeringGeometry (steeringGeometryLineLength 20), wheelThermals. |
| `nodeCollision` | function | Hook nodeCollision(p) appelé par le moteur sur collision de nœud ; nop par défaut, activé par le mode de visualisation correspondant. |
| `partsState` | table | {partsSelected = table} : pièces sélectionnées à mettre en valeur. |
| `stateNoReset` | table | État conservé aux resets de modes (reçu avec setState). |

## Appels vers le moteur (C++)

- `obj:` `beamIsBroken`, `calcCenterOfGravity`, `getAbsNodePosition`, `getBeamDebugDeformation`, `getBeamFrequencyAmplitude`, `getBeamLength`, `getBeamRefLength`, `getBeamStress`, `getBeamStressDamp`, `getCameraPosition`, `getDirectionVector`, `getDirectionVectorUp`, `getDistanceFromTerrainPoint`, `getEnvTemperature`, `getGroupPressure`, `getNodeCluster`, `getNodeForceVector`, `getNodeForceVectorXYZ`, `getNodeMass`, `getNodePosition`, `getNodePositionRelative`, `getNodePositionRelativeXYZ`, `getNodeTemperature`, `getNodeVelocityVector`, `getOriginalNodePositionRelative`, `getPosition`, `getPositionXYZ`, `getTorsionbarAngle`, `getTorsionbarDeformation`, `getVelocity`, `getWheelAvgTemperature`, `getWheelCoreTemperature`, `inWater`, `isTriangleBroken`, `queueGameEngineLua`, `torsionbarIsBroken`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/bdebugImpl.lua`.*
