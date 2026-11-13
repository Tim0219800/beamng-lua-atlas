# `editor_terraform_fetchSources`

*Fichier : `lua/ge/extensions/editor/terraform/fetchSources.lua` · VM : Game Engine (GE) · 310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terraform_fetchSources` : `extensions.load("editor_terraform_fetchSources")`, puis la globale `editor_terraform_fetchSources`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terraform_fetchSources.getAllSourcesInPolygon(polygon)` | Returns all the sources within the given polygon, which are supported by the terraform tool.<br> [If eg a road goes in and out of the polygon, then it is split and only the inner parts of the road are included, as separate sources.] | 245 |
| `editor_terraform_fetchSources.getAllSourcesInSelection()` |  | 287 |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terraform/fetchSources.lua`.*
