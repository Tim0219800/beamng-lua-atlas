# `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua` · VM : Game Engine (GE) · 484 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veJBeamSpellchecker` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamSpellchecker")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`

Application « JBeam Spellchecker » du Static Editor. Le bouton « Start Analysis » parcourt tous les fichiers *.jbeam du dossier vehicles et vérifie que les modificateurs (options en ligne ou lignes d'options en dictionnaire) utilisés dans les sections flexbodies, props, nodes, beams, triangles, hydros, torsionbars, torsionHydros et variables font partie d'une liste blanche codée en dur dans le fichier. Tout modificateur inconnu est signalé par un log d'erreur « Section: X Modifier: 'Y' not valid! » avec le chemin du fichier.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamSpellchecker')
editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open()
```

## Remarques

- Les résultats ne sont écrits que dans la console/le log. Les sections absentes de la liste blanche (information, slots, powertrain, etc.) sont ignorées : leur liste est vide ou en commentaire.
- Les fichiers sont lus avec json.decode (JSON strict) ; un fichier non décodable est ignoré avec un log d'erreur, mais parseFile renvoie alors nil et analyzeJBeamFile(nil) provoquerait une erreur (pairs(nil)).
- Si l'en-tête d'une section n'est pas une liste, analyzeJBeamFile affiche un avertissement et renvoie -1 : le reste du fichier n'est alors plus analysé.
- L'analyse retire l'en-tête (table.remove(sectionData, 1)) des données décodées en mémoire ; sans effet sur le disque.
- Le code contient un label ::continue:: inutilisé avant im.End().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état de la fenêtre. *(interne)* *(hook)* | 473 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre. *(interne)* *(hook)* | 467 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onUpdate()` | Hook d'extension appelé à chaque frame : dessine la fenêtre avec le bouton « Start Analysis » quand elle est ouverte. *(interne)* *(hook)* | 450 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open()` | Ouvre la fenêtre de l'application (windowOpen[0] = true). | 463 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « JBeam Spellchecker ». |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua`.*
