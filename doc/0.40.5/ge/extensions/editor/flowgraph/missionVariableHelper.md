# `editor_flowgraph_missionVariableHelper`

*Fichier : `lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_flowgraph_missionVariableHelper` : `extensions.load("editor_flowgraph_missionVariableHelper")`, puis la globale `editor_flowgraph_missionVariableHelper`

Utilitaire partagé qui applique à un projet flowgraph les variables de la mission sélectionnée dans le Mission Editor (missionTypeData), et vérifie si un projet correspond à la mission. Utilisé par la fenêtre Task Manager et l'éditeur principal avant de lancer un projet.

## Exemple

```lua
local helper = require('/lua/ge/extensions/editor/flowgraph/missionVariableHelper')
local ok = helper.applyMissionVariablesToManager(mgr, 'monOutil')
```

## Remarques

- Nécessite editor_missionEditor chargé et une mission sélectionnée (editor_missionEditor.getSelectedMissionId() est traité comme un objet mission avec id, missionType, missionTypeData, fgPath).
- Seules les variables qui existent déjà dans le projet (mgr.variables:variableExists) sont modifiées, via changeBase.
- Les variables playerID, playerId, vehID et vehId reçoivent l'ID du véhicule joueur (getPlayerVehicle(0):getID()) ; ce code n'a pas de garde si aucun véhicule joueur n'existe (erreur possible).
- Si la mission n'a pas de missionTypeData, la fonction renvoie false avant l'injection des IDs de véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag)` | Copie les variables de missionTypeData de la mission sélectionnée vers le projet, puis injecte l'ID du véhicule joueur dans les variables de nom connu. Journalise le type de correspondance (avertissement si le projet n'appartient pas à la mission, mais applique quand même). | 77 |
| `editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission)` | Compare le chemin du fichier du projet (savedDir + savedFilename, .flow.json ajouté si absent) au chemin flowgraph de la mission (fgPath, ou celui de l'instance de mission), après normalisation (/, sans / initial, minuscules). | 17 |

### Détail des paramètres

#### `editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag)`

Copie les variables de missionTypeData de la mission sélectionnée vers le projet, puis injecte l'ID du véhicule joueur dans les variables de nom connu. Journalise le type de correspondance (avertissement si le projet n'appartient pas à la mission, mais applique quand même).

- `mgr` (*table*) : Manager flowgraph cible.
- `logTag` (*string|nil*) : Étiquette de log (défaut "missionVariableHelper").
- **renvoie** : boolean true si au moins une variable a été appliquée ou injectée ; false sinon (éditeur de missions absent, aucune mission, aucune variable).

#### `editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission)`

Compare le chemin du fichier du projet (savedDir + savedFilename, .flow.json ajouté si absent) au chemin flowgraph de la mission (fgPath, ou celui de l'instance de mission), après normalisation (/, sans / initial, minuscules).

- `mgr` (*table|nil*) : Manager flowgraph.
- `selectedMission` (*table|nil*) : Mission sélectionnée (id, fgPath, missionType).
- **renvoie** : string "exact", "missionTypeMain" (flowgraph principal gameplay/missiontypes/<type>/<type>.flow.json), "sameMissionType", "differentMissionType" ou "noMission".
- **renvoie** : string Chemin normalisé du projet.
- **renvoie** : string Chemin normalisé de la mission.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua`.*
