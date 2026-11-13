# `editor_cameraTransform`

*Fichier : `lua/ge/extensions/editor/cameraTransform.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraTransform` : `extensions.load("editor_cameraTransform")`, puis la globale `editor_cameraTransform`

Petite fenêtre d'éditeur « Camera Transform » (menu Camera). Elle lit la position/rotation de la caméra en JSON (commands.getCameraTransformJson), permet de l'éditer ou de la copier dans le presse-papiers, et de téléporter la caméra libre vers un JSON saisi (commands.setFreeCameraTransformJson).

## Remarques

- Le tampon de texte fait 512 caractères (im.ArrayChar(512)) : un JSON plus long serait tronqué.
- Le module n'exporte que des hooks ; onEditorActivated et onEditorDeactivated sont vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraTransform.onEditorActivated()` | Appelé à l'activation de l'éditeur ; ne fait rien. *(interne)* *(hook)* | 46 |
| `editor_cameraTransform.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur ; ne fait rien. *(interne)* *(hook)* | 50 |
| `editor_cameraTransform.onEditorGui()` | Dessine la fenêtre : boutons « Get Camera Transform », « GoTo » et « Copy », et un champ de texte contenant le JSON de la transformation. Appelé à chaque frame par l'éditeur. *(interne)* *(hook)* | 18 |
| `editor_cameraTransform.onEditorInitialized()` | Ajoute l'entrée de menu « Camera Transform » (groupe Camera) et enregistre la fenêtre 600x200. *(interne)* *(hook)* | 54 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraTransform.lua`.*
