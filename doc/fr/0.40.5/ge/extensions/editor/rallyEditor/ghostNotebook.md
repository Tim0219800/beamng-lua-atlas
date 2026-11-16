# `editor_rallyEditor_ghostNotebook`

*Fichier : `lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua` · VM : Game Engine (GE) · 351 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/ghostNotebook")` (fichier sous extensions/ mais pas une extension classique)

Gère le « carnet fantôme » de l'éditeur de rallye : un second carnet (ou les métadonnées de calibration du carnet actif) dont les notes sont affichées en texte dans la vue 3D, à titre de comparaison avec le carnet en cours d'édition. Le module renvoie un constructeur (classe C). Il liste les carnets disponibles dans le dossier de la mission, en charge un, et calcule un libellé court par pacenote (texte anglais hérité, sortie du compositeur, éléments structurés, ou nom). Le rendu est fait par ghostRenderer.

## Exemple

```lua
local ghost = require('/lua/ge/extensions/editor/rallyEditor/ghostNotebook')(rallyEditor)
for _, c in ipairs(ghost:listChoices()) do print(c.label) end
if ghost:select('<metadata>') then print(ghost:getSelectedLabel()) end
```

## Remarques

- Choix spécial '<metadata>' : le fantôme est alors le carnet actif de la fenêtre pacenotes, et le libellé vient de pacenote.metadata.calibration (descripteur/intensité, direction, longueur, forme).
- Ordre de priorité du libellé d'un pacenote : audio personnalisé, texte anglais hérité (notes.english), sortie structurée du compositeur, éléments structurés, puis pacenote.name.
- Les appels au compositeur sont protégés par pcall : une erreur donne simplement un libellé vide ou nil.
- Les libellés sont mis en cache à select() dans self.labels (indexés par pacenote.id) ; en mode '<metadata>' ils sont recalculés à chaque appel.

## Classe `C`

Objet renvoyé par le constructeur du module (new(rallyEditor)). Champs : rallyEditor, selectedFname, path (carnet chargé), labels (table id -> libellé), error (message ou nil).

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_ghostNotebook")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:activeNotebook()` | Renvoie le carnet actuellement édité (champ path de la fenêtre pacenotes), ou nil. | 282 |
| `C:clear()` | Oublie le carnet fantôme sélectionné, son chemin, les libellés et l'erreur. | 249 |
| `C:clearState()` | Alias de clear(), appelé par l'éditeur lors d'une réinitialisation d'état. | 256 |
| `C:getError()` | Renvoie le dernier message d'erreur de chargement. | 333 |
| `C:getLabelForPacenote(pacenote)` | Renvoie le texte à afficher pour un pacenote du fantôme. En mode '<metadata>', construit le libellé depuis les métadonnées de calibration (chaîne vide si absent) ; sinon utilise le cache puis recalcule. | 337 |
| `C:getPath()` | Renvoie le carnet fantôme chargé. | 320 |
| `C:getSelectedFname()` | Renvoie le nom de fichier sélectionné (ou '<metadata>'). | 324 |
| `C:getSelectedLabel()` | Renvoie le libellé d'affichage du fantôme sélectionné, ou '(none)' si rien n'est sélectionné. | 328 |
| `C:init(rallyEditor)` | Constructeur interne : mémorise l'éditeur et remet l'état à zéro. | 244 |
| `C:listChoices()` | Liste les fantômes sélectionnables : d'abord l'entrée '<metadata>', puis chaque carnet du dossier de la mission. Renvoie une table vide s'il n'y a pas de mission courante. | 260 |
| `C:select(fname)` | Charge le carnet fantôme indiqué ('<metadata>' = carnet actif), rafraîchit ses notes structurées et précalcule les libellés. Un nom vide ou nil efface la sélection. En cas d'échec, remplit self.error et journalise une erreur. | 287 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua`.*
