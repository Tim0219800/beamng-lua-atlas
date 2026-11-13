# `editor_toolUtilities_groundPass`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundPass.lua` · VM : Game Engine (GE) · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundPass` : `extensions.load("editor_toolUtilities_groundPass")`, puis la globale `editor_toolUtilities_groundPass`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundPass.applyParams(t)` |  | 189 |
| `editor_toolUtilities_groundPass.features(out, p)` | Every network's terraform features, with these settings (the shared ones by default). A network ticked off is left out. | 51 |
| `editor_toolUtilities_groundPass.getParams()` | The settings, kept in each tool's session file. | 183 |
| `editor_toolUtilities_groundPass.getRecord()` | The carve record, kept over a Lua reload and in the session files. | 197 |
| `editor_toolUtilities_groundPass.hasCarve()` |  | 150 |
| `editor_toolUtilities_groundPass.laySites()` | Lay the site grade the `holdSites` passes kept up over the ground the last of them cut. One undo step. | 129 |
| `editor_toolUtilities_groundPass.naturalGround()` | The ground as it was before every carve, as a lookup `height(x, y)` (terraform.groundBefore). Built again only when the<br> records have changed: off them it reads live terrain, which needs no rebuild. | 162 |
| `editor_toolUtilities_groundPass.register(id, s)` |  | 40 |
| `editor_toolUtilities_groundPass.reset()` | A new level: its terrain is not the one the record was cut in. | 209 |
| `editor_toolUtilities_groundPass.restore()` | Put the networks' ground back, and the site grade back over it. | 146 |
| `editor_toolUtilities_groundPass.run(p, laySites, holdSites)` | Terraform the networks (when Terraform is on) and lay the site grade back over them. `p` overrides the shared settings for<br> one run; `laySites` grades the sites even when they were not graded; `holdSites` leaves that to laySites(). | 121 |
| `editor_toolUtilities_groundPass.setRecord(bl)` |  | 202 |
| `editor_toolUtilities_groundPass.setSites(s)` |  | 48 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaults` | table |  |
| `params` | table | Public interface. |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundPass.lua`.*
