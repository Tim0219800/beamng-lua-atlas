# `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua` · VM : Game Engine (GE) · 1102 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`

Application « JBeam Modifier Leaking Visualizer » du Static Editor. En JBeam, un modificateur (par exemple beamSpring, nodeWeight, frictionCoef) posé dans une ligne reste actif pour les lignes suivantes, même dans les parties suivantes d'un véhicule (il « fuit »). Cet outil analyse les parties du véhicule chargé dans l'ordre de chargement, avec leurs données AST, calcule quels modificateurs fuient d'une partie à l'autre dans chaque section, et les affiche dans un tableau (sections en boutons, parties en lignes, modificateurs en colonnes). Les sections qui fuient sont colorées en rouge. Une case « Ignore Default Values » (EXPERIMENTAL) ignore les valeurs égales aux valeurs par défaut du moteur (table modifiersDefaultValues codée en dur).

## Exemple

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis')
editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open()
```

## Remarques

- Nécessite un véhicule chargé dans l'éditeur (vEditor.vehicle) ; sinon la fenêtre n'affiche rien après l'ouverture.
- Les parties sont obtenues par un parcours récursif de vEditor.vehData.config.partsTree dans l'ordre des slots (slots2 ou slots) ; chaque fichier JBeam est relu et parsé en AST (json-ast) une seule fois grâce à un cache local.
- Les valeurs spéciales de chaînes (par exemple « |NORMAL », « NM_xxx » pour un matériau de node) sont converties comme le fait le chargeur JBeam (replaceSpecialValues, avec particles.getMaterialIDByName).
- ImGui limite les tables à 64 colonnes : si une section a plus de modificateurs, un message d'avertissement l'indique et tous ne sont pas affichés.
- La table modifiersDefaultValues est incomplète (l'interface elle-même précise « Not all default values accounted for »).
- La variable locale runTest vaut false : les compteurs de test internes (comparaison avec vEditor.vdata) sont désactivés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data)` | Hook appelé après un rechargement Lua : restaure l'état de la fenêtre. *(interne)* *(hook)* | 1091 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre. *(interne)* *(hook)* | 1085 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onUpdate()` | Hook d'extension appelé à chaque frame : dessine le bouton « Start Analysis », la case des valeurs par défaut, les boutons de section et le tableau des modificateurs quand la fenêtre est ouverte et qu'un véhicule est chargé. *(interne)* *(hook)* | 904 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open()` | Ouvre la fenêtre de l'application (windowOpen[0] = true). | 1081 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data)`

Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.

- `data` (*table*) : table produite par onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « JBeam Modifier Leaking Visualizer ». |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua`.*
