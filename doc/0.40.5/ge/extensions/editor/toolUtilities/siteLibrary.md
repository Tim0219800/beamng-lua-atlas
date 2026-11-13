# `editor_toolUtilities_siteLibrary`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua` · VM : Game Engine (GE) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteLibrary` : `extensions.load("editor_toolUtilities_siteLibrary")`, puis la globale `editor_toolUtilities_siteLibrary`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteLibrary.new(cfg)` | One tool's binding to its shelf. cfg:<br>  toolId     the tool's id: its session key, and the tag its model.json was written under<br>  kind       which shelf the document lives on ('building' / 'openSpace' / 'carPark')<br>  noun       what one of them is called, for the tooltips<br>  stateKey   the key the serialised document sits under inside model.json's `state`<br>  editMode   the edit mode to select when the placer sends one here to be opened<br>  hasContent (doc) -> is there yet anything worth saving<br>  bakeRun    (doc) -> ok, and the folder written or the reason it could not be<br>  applyState (state) -> load the document out of a model.json state; ok, and a reason when not<br>  rename     (doc, name) put the name on the document through the tool's own undo | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua`.*
