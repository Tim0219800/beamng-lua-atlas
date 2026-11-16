# `editor_roadTemplateEditor`

*Fichier : `lua/ge/extensions/editor/roadTemplateEditor.lua` · VM : Game Engine (GE) · 426 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadTemplateEditor` : `extensions.load("editor_roadTemplateEditor")`, puis la globale `editor_roadTemplateEditor`

Éditeur de modèles de routes (menu Fenêtre > Roads > « Road Template Editor »). Permet de choisir, sauvegarder (« Save », « Save as... »), créer (« New ») et supprimer un modèle de route (fichier .road.json) composé de DecalRoads, de décorations et de decals ; les champs se modifient dans la fenêtre Inspector. Dépend de editor_roadEditor et s'appuie sur editor_roadUtils (rechargement des modèles). Quand la fenêtre est masquée, le modèle courant est désélectionné et ses objets temporaires supprimés.

## Remarques

- Préférence roadTemplates.general.loadTemplates (bool, défaut false) : « Load road templates on startup (longer initialization time) ». Tant qu'elle est à false, editor_roadUtils ne recharge ni ne applique aucun modèle.
- « Delete » supprime le fichier avec os.remove("roadtemplates/<nom>.road.json") (chemin relatif au répertoire de travail du processus, alors que la sauvegarde et editor_roadUtils utilisent levels/<niveau>/roadtemplates/ : BUG probable, Delete ne supprime pas le bon fichier).

**Dépendances (chargées avant) :** `editor_roadEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadTemplateEditor.onEditorGui()` | Appelé à chaque image : si la fenêtre « roadTemplateEditor » est masquée, désélectionne le modèle ; sinon dessine la fenêtre « Road Templates » avec les boutons Choose Template, Save, Save as..., New, Delete et le choix des routes/décorations/decals du modèle. *(interne)* *(hook)* | 182 |
| `editor_roadTemplateEditor.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Road Template Editor » (groupe Roads) et enregistre la fenêtre (200x400). *(interne)* *(hook)* | 407 |
| `editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry)` | Enregistre la catégorie de préférences « roadTemplates » avec la sous-catégorie « general » et la case loadTemplates (bool, false par défaut). *(interne)* *(hook)* | 412 |

### Détail des paramètres

#### `editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry)`

Enregistre la catégorie de préférences « roadTemplates » avec la sous-catégorie « general » et la case loadTemplates (bool, false par défaut).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"editor_roadEditor"} : extensions chargées avant celle-ci. |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadTemplateEditor.lua`.*
