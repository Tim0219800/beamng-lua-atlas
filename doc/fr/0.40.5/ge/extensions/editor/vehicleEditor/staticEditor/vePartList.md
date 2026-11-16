# `editor_vehicleEditor_staticEditor_vePartList`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua` · VM : Game Engine (GE) · 255 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_vePartList` : `extensions.load("editor_vehicleEditor_staticEditor_vePartList")`, puis la globale `editor_vehicleEditor_staticEditor_vePartList`

Fenêtre « Part List » du Static Editor de l'éditeur de véhicule. Elle liste les parties JBeam disponibles du véhicule chargé (ou seulement les parties actives, case « Active »), avec colonnes Name, Filename et Last modified, tri par colonne et recherche texte (nom ou fichier). Cliquer une ligne sélectionne la partie (vEditor.selectedPart) et ouvre les fenêtres Part Tree et Part Text View ; double-clic sur une colonne copie le nom de la partie ou le nom du fichier dans le presse-papiers ; clic droit ouvre le dossier du fichier.

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_vePartList')
editor_vehicleEditor_staticEditor_vePartList.open()
```

## Remarques

- Utilise jbeam/io : getAvailableParts(ioCtx) et getPart(ioCtx, partName), avec vEditor.vehData.ioCtx et vEditor.vehData.vdata.activePartsData.
- À la construction de la liste, la partie dont slotType vaut 'main' devient la partie sélectionnée.
- La date de modification (FS:stat(fichier).modtime) est affichée en texte relatif : « last minute », « last hour », « last 24h: date », « last week: date », puis date seule.
- Les colonnes Filename et Last modified sont masquées par défaut (TableColumnFlags_DefaultHide).
- La recherche est une recherche de sous-chaîne sensible à la casse du texte saisi sur le nom/fichier mis en minuscules (partName:lower():find(texte, 1, true)) : une saisie contenant des majuscules ne trouve rien.
- onSerialize/onDeserialized conservent vEditor.selectedPart à travers un rechargement Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure vEditor.selectedPart. *(interne)* *(hook)* | 244 |
| `editor_vehicleEditor_staticEditor_vePartList.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : construit la liste de parties au premier passage (ou après changement du filtre Active), puis dessine la fenêtre, le tableau trié/filtré et le menu contextuel. Ne fait rien sans véhicule chargé dans l'éditeur. *(interne)* *(hook)* | 52 |
| `editor_vehicleEditor_staticEditor_vePartList.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor). *(interne)* *(hook)* | 233 |
| `editor_vehicleEditor_staticEditor_vePartList.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde la partie sélectionnée. *(interne)* *(hook)* | 238 |
| `editor_vehicleEditor_staticEditor_vePartList.open()` | Affiche la fenêtre « Part List » (editor.showWindow). | 229 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure vEditor.selectedPart.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_vePartList.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde la partie sélectionnée.

- **renvoie** : table {selectedPart = string|nil}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « Part List ». |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua`.*
