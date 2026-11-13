# `editor_toolUtilities_siteLibrary`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua` · VM : Game Engine (GE) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteLibrary` : `extensions.load("editor_toolUtilities_siteLibrary")`, puis la globale `editor_toolUtilities_siteLibrary`

Save, Save As et Open pour les outils de site à document unique. Un bâtiment massing, un espace ouvert et un parking sont chacun UN document dont la maison est un dossier d'étagère de bibliothèque (voir siteAssets) : Save réécrit par-dessus sans demander, Save As nomme un nouveau dossier et le suit, Open remplace tout le document. Le placeur de sites dresse les copies, l'éditeur découpe l'original. new(cfg) fabrique, pour chaque outil, une liaison avec les mêmes trois boutons, icônes et libellés.

## Exemple

```lua
local siteLibrary = require('editor/toolUtilities/siteLibrary')
local lib = siteLibrary.new({toolId = 'openSpaceEditor', kind = 'openSpace', noun = 'open space',
  stateKey = 'openSpace', editMode = 'openSpace', hasContent = hasContent,
  bakeRun = bakeRun, applyState = applyState, rename = rename})
-- chaque frame, au début : lib.settle()
-- dans la fenêtre : lib.buttons(doc)
```

## Remarques

- cfg : toolId (clé de session et étiquette de model.json), kind ('building', 'openSpace', 'carPark'), noun (nom dans les info-bulles), stateKey (clé du document dans model.json state), editMode (mode d'édition à choisir à l'ouverture), hasContent(doc), bakeRun(doc) -> ok, dossier écrit ou raison, applyState(state) -> ok, raison, rename(doc, name) (nom posé via l'annulation de l'outil).
- Les dossiers choisis et les noms saisis sont traités en haut de la frame suivante (settle / buttons), car le dialogue qui les a produits est encore en train de se dessiner et ouvrir un site remplace le document entier.
- open refuse un dossier dont model.json a été écrit par un autre outil (« that folder holds a <tool> document ») ou sans état éditable (« no editable model saved with this <noun> »).
- Save, Save As et Open passent par le dialogue extensions.editor_fileDialog, enraciné sur l'étagère (siteAssets.ensureRoot). Le dialogue d'ouverture sélectionne un dossier, pas un fichier.
- Le module dépend de session (liaison au dossier via reattach, boundPath, attachment, unbind, markEdited) et de siteAssets.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteLibrary.new(cfg)` | Fabrique la liaison d'un outil à son étagère. Renvoie une table avec les fonctions : save(doc, name) (écrit le document dans la bibliothèque sous un nom, qui est aussi son dossier ; un seul chemin pour Save, Save As et Rename ; renvoie ok), open(dir) (rouvre un site cuit depuis son model.json et s'y lie ; renvoie ok, erreur), buttons(doc) (dessine Save, Save As, Open), settle() (ouvre le dossier choisi avant tout dessin), unbind() (détache du site ouvert et marque modifié), saveOnLeave(doc) (à la sortie de l'éditeur : réécrit le site s'il a changé, ou lui donne un nom libre, avec suffixe numérique), boundName() (nom du dossier lié ou nil), boundPath() (dossier lié), attachment() (liaison et état modifié), reattach(at) et setOnOpened(fn) (à lancer une fois un document chargé). | 35 |

### Détail des paramètres

#### `editor_toolUtilities_siteLibrary.new(cfg)`

Fabrique la liaison d'un outil à son étagère. Renvoie une table avec les fonctions : save(doc, name) (écrit le document dans la bibliothèque sous un nom, qui est aussi son dossier ; un seul chemin pour Save, Save As et Rename ; renvoie ok), open(dir) (rouvre un site cuit depuis son model.json et s'y lie ; renvoie ok, erreur), buttons(doc) (dessine Save, Save As, Open), settle() (ouvre le dossier choisi avant tout dessin), unbind() (détache du site ouvert et marque modifié), saveOnLeave(doc) (à la sortie de l'éditeur : réécrit le site s'il a changé, ou lui donne un nom libre, avec suffixe numérique), boundName() (nom du dossier lié ou nil), boundPath() (dossier lié), attachment() (liaison et état modifié), reattach(at) et setOnOpened(fn) (à lancer une fois un document chargé).

- `cfg` (*table*) : { toolId, kind, noun, stateKey, editMode, hasContent, bakeRun, applyState, rename }.
- **renvoie** : table Liaison avec save, open, buttons, settle, unbind, saveOnLeave, boundName, boundPath, attachment, reattach, setOnOpened.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua`.*
