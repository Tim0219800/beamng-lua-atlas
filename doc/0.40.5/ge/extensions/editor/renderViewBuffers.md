# `editor_renderViewBuffers`

*Fichier : `lua/ge/extensions/editor/renderViewBuffers.lua` · VM : Game Engine (GE) · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_renderViewBuffers` : `extensions.load("editor_renderViewBuffers")`, puis la globale `editor_renderViewBuffers`

Outil de debug de l'éditeur (menu Debug > « NamedTextureTarget Viewer ») pour prévisualiser les render buffers (NamedTexTargets) avec imgui : liste filtrable à gauche, aperçu à droite avec zoom/déplacement (molette, glisser), choix du canal (RGBA, R, G, B) et réinitialisation de la vue par double-clic. Utile pour inspecter les cibles de rendu, par exemple les shadow maps.

## Remarques

- La liste des textures disponibles est rafraîchie quand la fenêtre passe de masquée à visible.
- onWindowMenuItem est local (non exporté).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_renderViewBuffers.onEditorGui()` | Hook : dessine la fenêtre (liste + aperçu) et rafraîchit la liste des cibles à l'ouverture. *(interne)* *(hook)* | 274 |
| `editor_renderViewBuffers.onEditorInitialized()` | Hook : ajoute l'entrée de menu Debug et enregistre la fenêtre (1100x700). *(interne)* *(hook)* | 297 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/renderViewBuffers.lua`.*
