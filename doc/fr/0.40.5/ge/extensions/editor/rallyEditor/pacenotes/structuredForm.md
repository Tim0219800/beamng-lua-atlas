# `editor_rallyEditor_pacenotes_structuredForm`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua` · VM : Game Engine (GE) · 1037 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_structuredForm` : `extensions.load("editor_rallyEditor_pacenotes_structuredForm")`, puis la globale `editor_rallyEditor_pacenotes_structuredForm`

Formulaire d'édition « structuré » d'un pacenote dans l'éditeur de rallye. Il affiche un aperçu du texte et des fichiers audio, puis les sections Caution, Modifiers Before (preMod1/preMod2), Corner (descripteur d'intensité, direction, forme, pas signés, mode de longueur, type de relâchement des virages lents), Modifiers After (postMod1/postMod2) et Distance. Les modifieurs se choisissent par menu ou par recherche textuelle, avec liste des derniers utilisés (10 max). Les options viennent de la configuration du compositeur de texte du notebook. Utilisé par pacenoteForm.

## Remarques

- La configuration (types, modifieurs, formes, descripteurs) est chargée au premier draw après un clear().
- Appeler clear() quand le pacenote affiché change, sinon le formulaire garde les données de l'ancien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_structuredForm.clear()` | Réinitialise l'état interne du formulaire (configuration, options, états de recherche, fenêtre active). | 1022 |
| `editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow)` | Dessine tout le formulaire structuré pour le pacenote donné (charge la configuration si besoin). | 989 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow)`

Dessine tout le formulaire structuré pour le pacenote donné (charge la configuration si besoin).

- `pacenote` (*table*) : Pacenote en cours d'édition.
- `pacenoteToolsWindow` (*table*) : Fenêtre d'outils des pacenotes, mémorisée pour les rafraîchissements.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua`.*
