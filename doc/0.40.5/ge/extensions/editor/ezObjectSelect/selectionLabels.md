# `editor_ezObjectSelect_selectionLabels`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionLabels` : `extensions.load("editor_ezObjectSelect_selectionLabels")`, puis la globale `editor_ezObjectSelect_selectionLabels`

Petit utilitaire de l'outil Easy Select : calcule le texte affiché pour nommer un objet de la scène. Priorité : nom de l'objet, nom interne, nom du fichier d'asset (champ shapeName ou getModelFile), sinon « Classe #id ». Un préfixe indique le type : [p] Prefab/PrefabInstance, [s] TSStatic, [v] BeamNGVehicle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionLabels.objectName(obj, objectId)` | Renvoie le libellé d'un objet. Si objectId est fourni, l'objet est retrouvé via scenetree.findObjectById ; s'il n'existe plus, renvoie « deleted #id » (ou « missing » si aucun id). | 29 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionLabels.objectName(obj, objectId)`

Renvoie le libellé d'un objet. Si objectId est fourni, l'objet est retrouvé via scenetree.findObjectById ; s'il n'existe plus, renvoie « deleted #id » (ou « missing » si aucun id).

- `obj` (*userdata|nil*) : Objet de la scène (ignoré si objectId est donné)
- `objectId` (*integer|nil*) : Id de l'objet à retrouver dans scenetree
- **renvoie** : string Libellé, éventuellement préfixé par [p], [s] ou [v]

## Appels vers le moteur (C++)

- `obj:` `getClassName`, `getField`, `getID`, `getInternalName`, `getModelFile`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua`.*
