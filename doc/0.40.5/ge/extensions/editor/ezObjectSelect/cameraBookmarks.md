# `editor_ezObjectSelect_cameraBookmarks`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_cameraBookmarks` : `extensions.load("editor_ezObjectSelect_cameraBookmarks")`, puis la globale `editor_ezObjectSelect_cameraBookmarks`

Panneau imgui de signets de caméra pour l'outil Easy Select. Permet d'ajouter la position/rotation courante de la caméra (core_camera.getPosition / getQuat), de renommer, de retourner à un signet, de le mettre à jour ou de le supprimer. Les signets ne vivent qu'en mémoire (table locale) : ils ne sont pas sauvegardés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_cameraBookmarks.draw()` | Dessine le panneau « Camera Bookmarks » (champ de nom, bouton Add Current Position, liste, Rename, Go To, Update View, Delete). Go To vide les entrées/mouvements de la caméra puis fixe position et rotation via core_camera.setPosition/setRotation. À appeler chaque frame depuis une fenêtre imgui. | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/cameraBookmarks.lua`.*
