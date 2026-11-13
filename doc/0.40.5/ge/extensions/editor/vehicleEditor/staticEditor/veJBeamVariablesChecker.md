# `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamVariablesChecker")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`

Application « JBeam Variables Checker » du Static Editor. Le bouton « Start Analysis » parcourt tous les dossiers de véhicules, lit leurs fichiers .pc (configurations) et .jbeam, et vérifie que les valeurs des variables (par défaut dans le JBeam et valeurs imposées par les .pc) respectent les bornes min/max de la variable. Les valeurs hors limites sont signalées dans la console avec un avertissement (log W) indiquant où la variable et la valeur sont définies.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamVariablesChecker')
editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open()
```

## Remarques

- Les résultats ne vont que dans la console ; l'interface affiche seulement « Results get printed to the console. ». L'analyse affiche « Done! » à la fin.
- Les .pc sont convertis avec extensions.core_vehicle_partmgmt.buildConfigFromString(vehDir, pcFilePath), puis vehConfig.vars (variable vers valeur) est regroupé par variable.
- Le tableau des variables d'une partie est normalisé avec jbeam/tableSchema (process(partData, false, true)) avant la lecture de partData.variables.
- Les bornes sont réordonnées avec min/max et la valeur est clampée sur la copie vv (la valeur hors limite n'est que signalée, pas corrigée sur disque).
- Si un .jbeam n'est pas du JSON valide, parseFile renvoie nil et analyzeJBeamFile(nil) provoquerait une erreur (pairs(nil)) : aucun garde-fou dans le code.
- Le code contient un label ::continue:: inutilisé avant im.End().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état de la fenêtre. *(interne)* *(hook)* | 127 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre. *(interne)* *(hook)* | 121 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onUpdate()` | Hook d'extension appelé à chaque frame : dessine la fenêtre avec le bouton « Start Analysis » quand elle est ouverte. *(interne)* *(hook)* | 102 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open()` | Ouvre la fenêtre de l'application (windowOpen[0] = true). | 117 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « JBeam Variables Checker ». |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua`.*
