# `editor_screenshotCreatorBootstrap`

*Fichier : `lua/ge/extensions/editor/screenshotCreatorBootstrap.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_screenshotCreatorBootstrap` : `extensions.load("editor_screenshotCreatorBootstrap")`, puis la globale `editor_screenshotCreatorBootstrap`

Petit amorçage de l'éditeur : ajoute l'entrée de menu Fenêtre > Vehicles > « Vehicle Screenshot Creator » qui ouvre la fenêtre de l'extension util_screenshotCreator (captures de véhicules).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_screenshotCreatorBootstrap.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : crée l'élément de menu « Vehicle Screenshot Creator » (groupe de menu « Vehicles »). Son clic appelle extensions.util_screenshotCreator.openWindow(). *(interne)* *(hook)* | 13 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/screenshotCreatorBootstrap.lua`.*
