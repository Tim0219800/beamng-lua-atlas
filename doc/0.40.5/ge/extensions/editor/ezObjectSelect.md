# `editor_ezObjectSelect`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect` : `extensions.load("editor_ezObjectSelect")`, puis la globale `editor_ezObjectSelect`

Point d'entrée de l'outil « Easy Select » de l'éditeur. Enregistre un mode d'édition (editor.editModes.ezObjectSelect, nom « Easy Select », action map « EZObjectSelect ») et une fenêtre d'outil, puis délègue le travail à editor/ezObjectSelect/controller. Les actions couper/copier/coller/dupliquer/tout sélectionner/désélectionner/supprimer sont relayées vers le mode standard editor.editModes.objectSelect. Les raccourcis molette sont documentés : Ctrl+molette cycle les objets superposés, Shift+molette tourne la sélection autour de Z monde (Ctrl+Shift : par pas de 1 degré).

## Remarques

- Si l'activation du contrôleur échoue, le mode revient à editModes.objectSelect à la frame suivante.
- Plusieurs hooks (ajout d'objet, prefab explosé, champs de l'inspecteur modifiés) invalident le cache de sélection si le contrôleur est actif.
- Les fonctions request* ne font rien si le mode Easy Select n'est pas le mode actif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect.onEditorAxisGizmoAligmentChanged()` | Hook (orthographe du jeu « Aligment ») : relaie le changement d'alignement du gizmo. *(interne)* *(hook)* | 164 |
| `editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode)` | Hook : relaie le changement de mode du gizmo d'axes au contrôleur si le mode est actif. *(interne)* *(hook)* | 160 |
| `editor_ezObjectSelect.onEditorGui()` | Si le mode est actif, dessine le debug écran et la fenêtre de l'espace de travail (controller.drawWorkspace). *(interne)* *(hook)* | 86 |
| `editor_ezObjectSelect.onEditorInitialized()` | Charge les préférences, réinitialise les filtres d'entrée, enregistre la fenêtre (390x460 x uiscale) et le mode d'édition. *(interne)* *(hook)* | 77 |
| `editor_ezObjectSelect.onEditorInspectorDynFieldChanged()` | Hook : invalide le cache (inspectorDynFieldChanged). *(interne)* *(hook)* | 148 |
| `editor_ezObjectSelect.onEditorInspectorFieldChanged()` | Hook : invalide le cache (inspectorFieldChanged). *(interne)* *(hook)* | 144 |
| `editor_ezObjectSelect.onEditorObjectAdded()` | Hook : invalide le cache de sélection (raison objectAdded). *(interne)* *(hook)* | 136 |
| `editor_ezObjectSelect.onEditorPrefabExploded()` | Hook : invalide le cache (prefabExploded). *(interne)* *(hook)* | 140 |
| `editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value)` | Hook : pour gizmos.general.highlightSelectedMeshes rafraîchit la teinte de sélection si le mode est actif ; sinon relaie au contrôleur. *(interne)* *(hook)* | 152 |
| `editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry)` | Hook : laisse le contrôleur enregistrer ses préférences. *(interne)* *(hook)* | 168 |
| `editor_ezObjectSelect.onExtensionLoaded()` | Charge les préférences et réinitialise les filtres d'entrée. *(interne)* *(hook)* | 111 |
| `editor_ezObjectSelect.onExtensionUnloaded()` | Quitte le mode (retour à objectSelect) ou désactive le contrôleur, puis désenregistre la fenêtre et le mode. *(interne)* *(hook)* | 95 |
| `editor_ezObjectSelect.requestFocusShortcut()` | Demande de centrer la caméra sur la sélection (focus). | 128 |
| `editor_ezObjectSelect.requestNumpadPreset(preset)` | Transmet une touche du pavé numérique au contrôleur (préréglage de vue). | 132 |
| `editor_ezObjectSelect.requestRotateShortcut()` | Demande l'opération de rotation par raccourci. | 120 |
| `editor_ezObjectSelect.requestScaleShortcut()` | Demande l'opération d'échelle par raccourci. | 124 |
| `editor_ezObjectSelect.requestTransformShortcut()` | Demande l'opération de transformation (déplacement) par raccourci clavier. | 116 |

### Détail des paramètres

#### `editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode)`

Hook : relaie le changement de mode du gizmo d'axes au contrôleur si le mode est actif.

- `mode` (*any*) : Nouveau mode du gizmo

#### `editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value)`

Hook : pour gizmos.general.highlightSelectedMeshes rafraîchit la teinte de sélection si le mode est actif ; sinon relaie au contrôleur.

- `path` (*string*) : Chemin de préférence
- `value` (*any*) : Nouvelle valeur

#### `editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry)`

Hook : laisse le contrôleur enregistrer ses préférences.

- `prefsRegistry` (*table*) : Registre de préférences

#### `editor_ezObjectSelect.requestNumpadPreset(preset)`

Transmet une touche du pavé numérique au contrôleur (préréglage de vue).

- `preset` (*any*) : Préréglage (déduit du code : valeur transmise telle quelle)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect.lua`.*
