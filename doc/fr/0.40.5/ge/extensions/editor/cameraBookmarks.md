# `editor_cameraBookmarks`

*Fichier : `lua/ge/extensions/editor/cameraBookmarks.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraBookmarks` : `extensions.load("editor_cameraBookmarks")`, puis la globale `editor_cameraBookmarks`

Fenêtre d'éditeur « Camera Bookmarks » (menu Camera). Permet de créer, copier, coller, rejoindre et supprimer des signets de caméra (objets CameraBookmark rangés dans le groupe retourné par editor.getCameraBookmarks()). L'ajout, la suppression et le collage de position passent par l'historique d'annulation de l'éditeur (editor.history:commitAction).

## Remarques

- Aucune fonction utilitaire exportée : le module n'expose que des hooks d'éditeur.
- Un signet est créé via worldEditorCppApi.createObject('CameraBookmark') avec datablock CameraBookmarkMarker et échelle '5 5 5'.
- Les fonctions de rejeu undo/redo sont locales (createBookmarkRedo, deleteBookmarkRedo, setCameraTransformRedo/Undo).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraBookmarks.onEditorGui()` | Dessine la fenêtre « Camera Bookmarks » : champ de nom + bouton Add, boutons Copy Location / Paste Location, puis la liste des signets avec Go To, Copy et Delete. Appelé à chaque frame par l'éditeur. *(interne)* *(hook)* | 79 |
| `editor_cameraBookmarks.onEditorInitialized()` | Enregistre la fenêtre (500x500) et l'entrée de menu « Camera Bookmarks » dans le groupe de menu Camera. Appelé une fois à l'initialisation de l'éditeur. *(interne)* *(hook)* | 133 |
| `editor_cameraBookmarks.onExtensionLoaded()` | Hook de chargement de l'extension ; vide. *(interne)* *(hook)* | 130 |

## Appels vers le moteur (C++)

- `obj:` `deleteObject`, `getInternalName`, `getTransform`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraBookmarks.lua`.*
