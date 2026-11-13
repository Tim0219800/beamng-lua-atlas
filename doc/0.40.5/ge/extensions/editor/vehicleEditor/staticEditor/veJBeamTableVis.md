# `editor_vehicleEditor_staticEditor_veJBeamTableVis`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua` · VM : Game Engine (GE) · 201 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veJBeamTableVis` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamTableVis")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamTableVis`

Application « JBeam Table Visualizer » du Static Editor de l'éditeur de véhicule. Elle charge un fichier .jbeam choisi via un sélecteur de fichier, cherche récursivement les tables de nombres qui peuvent être tracées en courbe (par exemple les courbes de couple ou de torque d'un moteur), et les affiche avec plotHelperUtil (courbe de Catmull-Rom, mise à l'échelle auto). Un bouton Refresh relit le fichier sur le disque.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamTableVis')
editor_vehicleEditor_staticEditor_veJBeamTableVis.open()
```

## Remarques

- Est listée dans le menu Apps du Static Editor grâce à M.menuEntry = 'JBeam Table Visualizer' (appelle open()).
- Une table est « traçable » quand ses sous-tables ont toutes la même taille et que le premier et le deuxième élément des lignes (sauf la première) sont des nombres. L'en-tête (première ligne dont le premier élément est un texte) est retiré de la table d'origine par removeHeader, ce qui modifie les données chargées en mémoire.
- Les chemins sont affichés sous la forme « section > sous-section » dans la liste déroulante.
- onUpdate ne dessine rien tant que vEditor.vehicle est nil ; le sélecteur de fichier s'ouvre dans /vehicles/ avec le filtre .jbeam.
- Le parsing utilise json.decode (copié de common/jbeam/io.lua), donc le fichier doit être du JSON valide (pas le JBeam étendu avec commentaires).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état de la fenêtre. *(interne)* *(hook)* | 190 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde l'état ouvert/fermé de la fenêtre. *(interne)* *(hook)* | 184 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt)` | Hook d'extension appelé à chaque frame : si la fenêtre est ouverte et qu'un véhicule est chargé dans l'éditeur, dessine le bouton d'ouverture de fichier, la liste des données traçables, le bouton Refresh et le graphe. *(interne)* *(hook)* | 136 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.open()` | Ouvre la fenêtre de l'application (windowOpen[0] = true). Appelée par le menu Apps du Static Editor. | 180 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde l'état ouvert/fermé de la fenêtre.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt)`

Hook d'extension appelé à chaque frame : si la fenêtre est ouverte et qu'un véhicule est chargé dans l'éditeur, dessine le bouton d'ouverture de fichier, la liste des données traçables, le bouton Refresh et le graphe.

- `dt` (*number*) : delta de temps (s), transmis au tracé

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « JBeam Table Visualizer ». |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua`.*
