# `editor_extensionsEditor`

*Fichier : `lua/ge/extensions/editor/extensionsEditor.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_extensionsEditor` : `extensions.load("editor_extensionsEditor")`, puis la globale `editor_extensionsEditor`

Fenêtre « Extensions Editor » de l'éditeur : liste toutes les extensions d'éditeur (editor.allExtensionNames) et permet d'activer/désactiver leur chargement en cliquant sur l'icône. L'état est stocké dans editor.extensionsSettings[nom].disabled puis sauvegardé par editor.saveExtensionsSettings(). Un rechargement du Lua (Ctrl+L) est nécessaire pour appliquer le changement ; le mode sans échec de l'éditeur (Ctrl+F11) permet de désactiver une extension fautive.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_extensionsEditor.onEditorGui()` | Dessine la fenêtre : texte d'aide et tableau à une colonne avec un bouton-icône par extension (coche = active, icône rouge « do_not_disturb » = désactivée). Un clic inverse le drapeau disabled et sauvegarde les réglages. *(interne)* *(hook)* | 15 |
| `editor_extensionsEditor.onEditorInitialized()` | Enregistre la fenêtre « extensionsEditor » (taille 915x600) et l'entrée de menu « Extensions Editor ». *(interne)* *(hook)* | 59 |
| `editor_extensionsEditor.onEditorPreferenceValueChanged(path, value)` | Hook vide (aucune préférence gérée). *(interne)* *(hook)* | 64 |
| `editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook vide : n'enregistre aucune préférence. *(interne)* *(hook)* | 67 |

### Détail des paramètres

#### `editor_extensionsEditor.onEditorPreferenceValueChanged(path, value)`

Hook vide (aucune préférence gérée).

- `path` (*string*) : Chemin de la préférence modifiée
- `value` (*any*) : Nouvelle valeur

#### `editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook vide : n'enregistre aucune préférence.

- `prefsRegistry` (*table*) : Registre des préférences de l'éditeur

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/extensionsEditor.lua`.*
