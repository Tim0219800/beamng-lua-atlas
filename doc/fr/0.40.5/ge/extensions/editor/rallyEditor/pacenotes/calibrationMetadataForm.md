# `editor_rallyEditor_pacenotes_calibrationMetadataForm`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_calibrationMetadataForm` : `extensions.load("editor_rallyEditor_pacenotes_calibrationMetadataForm")`, puis la globale `editor_rallyEditor_pacenotes_calibrationMetadataForm`

Formulaire imgui « Calibration Metadata » affiché dans l'éditeur de pacenotes. Il permet de choisir, pour le pacenote sélectionné, cinq valeurs de calibration (intensité, descripteur, direction, longueur, forme) via des listes déroulantes alimentées par la configuration du compositeur de texte du carnet (componentTypes.corner). Les choix sont stockés dans pacenote.metadata.calibration. Rien n'est affiché si le carnet n'a pas de metadata.calibrationFields.

## Remarques

- Choisir « - » supprime la clé ; quand la table calibration devient vide, pacenote.metadata.calibration est remise à nil.
- Les valeurs enregistrées pour descriptor, direction, longueur et forme sont les libellés (texte), pas des identifiants ; seule l'intensité stocke l'identifiant.
- Les modifications n'utilisent pas l'historique d'annulation de l'éditeur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow)` | Dessine la section de métadonnées de calibration pour un pacenote. Ne fait rien si le pacenote n'a pas de carnet, si le carnet n'a pas de calibrationFields, ou si le compositeur n'a pas de configuration corner. | 140 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow)`

Dessine la section de métadonnées de calibration pour un pacenote. Ne fait rien si le pacenote n'a pas de carnet, si le carnet n'a pas de calibrationFields, ou si le compositeur n'a pas de configuration corner.

- `pacenote` (*table*) : Pacenote édité (accède à pacenote.notebook et pacenote.metadata).
- `pacenoteToolsWindow` (*table*) : Fenêtre d'outils pacenotes (non utilisée dans le code).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua`.*
