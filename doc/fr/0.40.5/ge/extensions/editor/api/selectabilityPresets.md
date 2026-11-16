# `editor_api_selectabilityPresets`

*Fichier : `lua/ge/extensions/editor/api/selectabilityPresets.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_selectabilityPresets` : `extensions.load("editor_api_selectabilityPresets")`, puis la globale `editor_api_selectabilityPresets`

Gère des préréglages (presets) de « sélectionnabilité » des types d'objets dans l'éditeur du monde : quelles classes d'objets (TSStatic, Prefab, BeamNGVehicle…) peuvent être cliquées/sélectionnées. Préréglages : current, all, staticsAndProps (BeamNGVehicle, Prefab, PrefabInstance, TSStatic), default (masque capturé à la première initialisation). Il lit/écrit via editor.getObjectTypeSelectable / setObjectTypeSelectable et la préférence gizmos.visualization.selectable. Un outil peut prendre temporairement le contrôle du masque avec beginScope/endScope.

## Exemple

```lua
local sp = extensions.editor_api_selectabilityPresets
local owner = {}
if sp.beginScope(owner, 'staticsAndProps', 'Mon outil') then
  -- ... travail ...
  sp.endScope(owner)
end
```

## Remarques

- Le module utilise la globale editor (non déclarée localement) et worldEditorCppApi.getObjectClassNames() pour la liste des classes.
- Le preset 'current' n'est pas applicable : applyPreset et beginScope renvoient false pour lui.
- Pendant un scope, applyPreset avec un autre owner est refusé, markCurrent et syncActivePresetFromMask renvoient false, et les boutons de drawControls sont désactivés.
- Le preset 'default' est le masque capturé au premier appel de initialize (donc l'état au moment de la première utilisation, pas une valeur fixe).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_selectabilityPresets.applyPreset(presetId, persist, owner)` | Applique un préréglage (all, staticsAndProps ou default) au masque de sélectionnabilité. Si persist est vrai et qu'aucun scope n'est actif, enregistre aussi le masque dans les préférences. | 72 |
| `editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel)` | Prend temporairement le contrôle du masque : sauvegarde le masque et les préférences actuels puis applique le preset, sans le persister. Si le scope existe déjà, renvoie si l'owner est le même. | 83 |
| `editor_api_selectabilityPresets.drawControls()` | Dessine en ImGui la ligne de boutons « Presets » : All, Statics and Props, Restore Default (avec persistance). Désactivés pendant un scope, avec un texte indiquant qui contrôle le masque. À appeler depuis une fenêtre d'éditeur. | 163 |
| `editor_api_selectabilityPresets.endScope(owner)` | Termine le scope : restaure le masque, les préférences et le preset actif sauvegardés, puis sauvegarde les préférences si saveVisualizationSettings est actif. | 102 |
| `editor_api_selectabilityPresets.getActivePresetId()` | Renvoie l'id du preset actif. | 155 |
| `editor_api_selectabilityPresets.getActivePresetLabel()` | Renvoie le libellé affichable du preset actif. | 159 |
| `editor_api_selectabilityPresets.getScopeOwner()` | Renvoie le propriétaire du scope actif, ou nil. | 120 |
| `editor_api_selectabilityPresets.initialize()` | Capture le masque de sélectionnabilité actuel comme masque « default » s'il n'est pas déjà capturé. Appelé automatiquement par les autres fonctions. | 68 |
| `editor_api_selectabilityPresets.isScoped()` | Indique si un scope temporaire est actif. | 124 |
| `editor_api_selectabilityPresets.markCurrent()` | Marque le preset actif comme 'current' (masque modifié à la main). Sans effet pendant un scope. | 128 |
| `editor_api_selectabilityPresets.syncActivePresetFromMask()` | Compare le masque réel aux presets all, staticsAndProps, default et met activePresetId sur le premier qui correspond, sinon 'current'. | 134 |

### Détail des paramètres

#### `editor_api_selectabilityPresets.applyPreset(presetId, persist, owner)`

Applique un préréglage (all, staticsAndProps ou default) au masque de sélectionnabilité. Si persist est vrai et qu'aucun scope n'est actif, enregistre aussi le masque dans les préférences.

- `presetId` (*string*) : 'all', 'staticsAndProps' ou 'default' ('current' est refusé).
- `persist` (*boolean|nil*) : Sauvegarder dans la préférence gizmos.visualization.selectable (et sur disque si saveVisualizationSettings est actif).
- `owner` (*table|nil*) : Propriétaire du scope : doit correspondre au propriétaire courant si un scope est actif.
- **renvoie** : boolean true si appliqué, false si preset inconnu/'current' ou scope détenu par un autre.

#### `editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel)`

Prend temporairement le contrôle du masque : sauvegarde le masque et les préférences actuels puis applique le preset, sans le persister. Si le scope existe déjà, renvoie si l'owner est le même.

- `owner` (*table*) : Table identifiant l'appelant (comparée par identité).
- `presetId` (*string*) : 'all', 'staticsAndProps' ou 'default'.
- `ownerLabel` (*string|nil*) : Nom affiché dans drawControls (« X is temporarily controlling this mask »).
- **renvoie** : boolean true si le scope est actif pour cet owner.

#### `editor_api_selectabilityPresets.endScope(owner)`

Termine le scope : restaure le masque, les préférences et le preset actif sauvegardés, puis sauvegarde les préférences si saveVisualizationSettings est actif.

- `owner` (*table*) : Doit être le propriétaire du scope.
- **renvoie** : boolean true si restauré, false s'il n'y a pas de scope ou autre owner.

#### `editor_api_selectabilityPresets.getActivePresetId()`

Renvoie l'id du preset actif.

- **renvoie** : string 'current', 'all', 'staticsAndProps' ou 'default'.

#### `editor_api_selectabilityPresets.getActivePresetLabel()`

Renvoie le libellé affichable du preset actif.

- **renvoie** : string Ex. 'Statics and Props'.

#### `editor_api_selectabilityPresets.getScopeOwner()`

Renvoie le propriétaire du scope actif, ou nil.

- **renvoie** : table|nil owner du scope.

#### `editor_api_selectabilityPresets.isScoped()`

Indique si un scope temporaire est actif.

- **renvoie** : boolean true si scope actif.

#### `editor_api_selectabilityPresets.markCurrent()`

Marque le preset actif comme 'current' (masque modifié à la main). Sans effet pendant un scope.

- **renvoie** : boolean false si un scope est actif, sinon true.

#### `editor_api_selectabilityPresets.syncActivePresetFromMask()`

Compare le masque réel aux presets all, staticsAndProps, default et met activePresetId sur le premier qui correspond, sinon 'current'.

- **renvoie** : boolean false si un scope est actif, sinon true.

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getObjectClassNames`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/selectabilityPresets.lua`.*
