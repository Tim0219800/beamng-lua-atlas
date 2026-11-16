# `editor_rallyEditor_notebookInfo`

*Fichier : `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua` · VM : Game Engine (GE) · 242 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/notebookInfo")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Notebook » de l'éditeur de rallye. Il affiche les informations du carnet courant (id, fichier, issues de validation) et permet de modifier son nom, ses auteurs, sa description et son mode audio par défaut, chaque modification passant par l'historique d'annulation de l'éditeur. Il contient aussi la section « Calibration Metadata Fields » (définition des champs de calibration au niveau du carnet) et le sélecteur de « Ghost Notebook ». Le module renvoie un constructeur (classe C).

## Remarques

- Les champs de calibration initialisés par le bouton « Initialize Calibration Fields » sont : cornerIntensity, cornerDescriptor, direction, cornerLength, shape (stockés dans notebook.metadata.calibrationFields).
- Le mode audio proposé exclut 'auto' et les modes masqués (RallyEnums.pacenoteAudioModeHidden).
- Incohérence : dans selected(), le champ description est recréé avec un tampon de 1024 caractères alors que clearState() et la déclaration initiale utilisent 2048.
- Les variables des champs de texte sont des locales du fichier (partagées par toutes les instances).

## Classe `C`

Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, path (carnet édité), valid, windowDescription = 'Notebook'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_notebookInfo")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearState()` | Oublie le carnet et vide les champs de texte. | 34 |
| `C:draw(mouseInfo)` | Dessine l'onglet (délègue à drawNotebook). | 78 |
| `C:drawCalibrationMetadataFields()` | Affiche les champs de calibration définis dans le carnet, ou un bouton pour les initialiser s'ils n'existent pas. | 142 |
| `C:drawGhostNotebook()` | Dessine le sélecteur du carnet fantôme (liste des choix, option « (none) », message d'erreur) en appelant les fonctions ghostNotebook de l'éditeur de rallye. | 96 |
| `C:drawNotebook()` | Valide puis dessine les informations du carnet (erreurs éventuelles, id, fichier), les champs éditables avec annulation/rétablissement, le mode audio, puis les sections calibration et ghost. | 165 |
| `C:init(rallyEditor)` | Constructeur interne : mémorise l'éditeur, valid = true. | 29 |
| `C:isValid()` | Renvoie le résultat de la dernière validation. | 42 |
| `C:selected()` | Appelée par l'éditeur quand l'onglet est sélectionné : recopie nom, auteurs et description du carnet dans les champs, puis émet onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis. | 60 |
| `C:setPath(path)` | Définit le carnet édité par l'onglet. | 55 |
| `C:unselect()` | Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 72 |
| `C:validate()` | Lance path:validate() et met à jour valid selon path:is_valid(). Les problèmes sont dans path.validation_issues. | 46 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua`.*
