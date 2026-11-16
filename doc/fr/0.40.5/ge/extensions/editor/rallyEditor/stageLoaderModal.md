# `editor_rallyEditor_stageLoaderModal`

*Fichier : `lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_stageLoaderModal` : `extensions.load("editor_rallyEditor_stageLoaderModal")`, puis la globale `editor_rallyEditor_stageLoaderModal`

Fenêtre modale « Open Rally Stage » de l'éditeur de rallye. Elle liste les missions de type rallyStage du niveau courant (gameplay_missions_missions.getFilesData), triées par nom, les missions de dev étant marquées [DEV]. Le bouton Open charge le notebook de la mission choisie (rallyEditor.loadForMissionEditor) et affiche l'outil (showRallyTool).

## Remarques

- Message affiché si aucun niveau n'est chargé, si les données de missions sont indisponibles ou s'il n'y a aucune mission rallyStage.
- Le niveau d'une mission vient de startTrigger.level, sinon du premier segment de l'id ; comparaison insensible à la casse.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr)` | À appeler chaque frame. Ouvre la popup quand openPtr[0] passe à true (en rafraîchissant la liste), dessine la liste et les détails, et remet openPtr[0] à false à la fermeture (Open ou Cancel). | 140 |

### Détail des paramètres

#### `editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr)`

À appeler chaque frame. Ouvre la popup quand openPtr[0] passe à true (en rafraîchissant la liste), dessine la liste et les détails, et remet openPtr[0] à false à la fermeture (Open ou Cancel).

- `rallyEditor` (*table*) : Module éditeur de rallye (doit fournir loadForMissionEditor et showRallyTool).
- `openPtr` (*table*) : Pointeur booléen imgui (BoolPtr) indiquant si la modale doit être ouverte.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua`.*
