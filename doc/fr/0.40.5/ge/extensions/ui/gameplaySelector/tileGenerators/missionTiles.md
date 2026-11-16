# `ui_gameplaySelector_tileGenerators_missionTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua` · VM : Game Engine (GE) · 279 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_missionTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_missionTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_missionTiles`

Générateur de tuiles du sélecteur de gameplay pour les missions (système « challenges »). Il ajoute une tuile par mission de gameplay_missions_missions.getFilesData(true), calcule son libellé de type (course de dragster, contre-la-montre, gymkhana…) et construit le panneau de détails avec un bouton de démarrage.

## Remarques

- Une mission réservée à la carrière (showInCareer sans showInFreeroam) est triée par profondeur de déblocage (gameplay_missions_unlocks.getForwardMissionInfo) et reçoit l'icône cup ; sinon l'ordre est -date.
- Libellés de type : table missionTypeLabelByType pour dragStripRace, dragStripAPM, generatedTimeTrial, simpleLapconfigScenario et flowgraph ; les missions drift hors « A to B » et avalanche sans zone cible sont étiquetées gymkhana ; sinon bigMap.missionLabels.<missionType>.
- La tuile « moreMissions » est ajoutée pour tous les backends (validBackends vide).
- Les étiquettes de détails utilisent mission.missionTypeLabel, qui peut être nil (le libellé calculé n'est mémorisé que dans la tuile) : on retombe alors sur le missionType brut.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook appelé à l'ouverture des détails. Si itemDetails.missionId désigne une mission connue, ajoute un bloc (titre, description, aperçu, favori, spécifications générales et carrière, étiquettes) avec un bouton de démarrage qui appelle gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector"). *(interne)* *(hook)* | 213 |
| `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend)` | Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par mission (nom, aperçu, type, sous-groupe, niveau, icônes beamNG, bug, cup, clé mission_<id>). Ajoute dans tous les cas la tuile « moreMissions ». *(interne)* *(hook)* | 25 |

### Détail des paramètres

#### `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook appelé à l'ouverture des détails. Si itemDetails.missionId désigne une mission connue, ajoute un bloc (titre, description, aperçu, favori, spécifications générales et carrière, étiquettes) avec un bouton de démarrage qui appelle gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector").

- `itemDetails` (*table*) : Données showDetails (missionId, key).
- `details` (*table*) : Liste de blocs de détails à compléter.
- `buttonInstance` (*table*) : Objet fournissant addButton.
- `backend` (*table*) : Backend offrant isFavourite et trackRecent.

#### `ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend)`

Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par mission (nom, aperçu, type, sous-groupe, niveau, icônes beamNG, bug, cup, clé mission_<id>). Ajoute dans tous les cas la tuile « moreMissions ».

- `items` (*table*) : Liste de tuiles à compléter.
- `backend` (*table*) : Backend appelant ; backendName doit valoir « gameplaySelector ».

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua`.*
