# `editor_vehicleEditor_staticEditor_veJBeamBeautifier`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua` · VM : Game Engine (GE) · 443 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veJBeamBeautifier` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamBeautifier")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamBeautifier`

Application « JBeam Beautifier » du Static Editor. Elle reformate des fichiers .jbeam (un fichier ou un dossier entier) en alignant en colonnes les tableaux des sections choisies (beams, nodes, quads, slots, slots2, triangles), avec option d'alignement de la ligne d'en-tête et d'arrondi des nombres (0 à 5 décimales). Elle travaille sur l'AST du fichier (json-ast) et ne modifie que les espaces et, si demandé, l'arrondi.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamBeautifier')
editor_vehicleEditor_staticEditor_veJBeamBeautifier.open()
```

## Remarques

- ATTENTION : le fichier .jbeam est réécrit sur place (writeFile(filePath, ...)) sans sauvegarde. Le test de comparaison entre données avant/après (fonction test) est commenté dans beautifyJBeamFile : aucune vérification d'équivalence n'est faite.
- Un fichier est refusé (log E) s'il n'est pas lisible, s'il ne se décode pas avec jsonDebug.decode, s'il produit des avertissements de décodage, ou si son AST ne se parse pas.
- Seules les lignes de tableau tenant sur une seule ligne sont alignées ; les tableaux répartis sur plusieurs lignes sont laissés tels quels.
- Réglages par défaut : nodes et triangles cochés, les autres sections décochées ; alignement de l'en-tête activé ; arrondi désactivé ; 3 décimales.
- Le bouton « Beautify JBeam Files » est désactivé tant que le chemin est vide. Le champ chemin est rempli par les boutons « Select Folder to Beautify » (dossier) et « Select File to Beautify » (fichier) qui ouvrent editor_fileDialog sur /vehicles/. Si le chemin est un fichier, seul ce fichier est traité ; sinon tous les *.jbeam du dossier, récursivement (FS:findFiles).
- Le résultat de l'opération est écrit dans la console (« Done! »).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état de la fenêtre. *(interne)* *(hook)* | 432 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre. *(interne)* *(hook)* | 426 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onUpdate()` | Hook d'extension appelé à chaque frame : dessine la fenêtre (sections à traiter, réglages, sélection de dossier/fichier, bouton de lancement) quand elle est ouverte. *(interne)* *(hook)* | 361 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.open()` | Ouvre la fenêtre de l'application (windowOpen[0] = true). | 422 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « JBeam Beautifier ». |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua`.*
