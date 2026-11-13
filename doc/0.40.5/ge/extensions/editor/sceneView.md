# `editor_sceneView`

*Fichier : `lua/ge/extensions/editor/sceneView.lua` · VM : Game Engine (GE) · 448 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sceneView` : `extensions.load("editor_sceneView")`, puis la globale `editor_sceneView`

Vues de scène supplémentaires de l'éditeur : chaque « Scene view N » est une fenêtre ImGui qui affiche le monde via un ImguiRenderViewControl, avec son propre mode (3D, dernière caméra sélectionnée, orthographique), plans near/far, FOV, position/rotation, visibilité des icônes et du gizmo, et masque de debug draw. Dessine aussi une grille de debug. L'état des vues est sauvegardé avec la disposition de l'éditeur (onSerialize/onDeserialized) et restauré à l'initialisation.

## Remarques

- Valeurs par défaut d'une vue : nearClip 0.01, farClip 2500, fov 70, renderDebugDrawMask -1 (tout).
- Piège : `data.attachToObject or true` vaut toujours true, la valeur sauvegardée false est donc perdue au rechargement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sceneView.onDeserialized(data)` | Mémorise les données sauvegardées jusqu'à ce que l'éditeur soit initialisé (onEditorInitialized les utilise). *(interne)* *(hook)* | 438 |
| `editor_sceneView.onEditorGui()` | Appelé à chaque image : crée une vue en attente (menu « Add Scene View ») puis dessine chaque fenêtre de vue, ses menus de contrôle (mode, clips, FOV, ortho) et met à jour la caméra de rendu. *(interne)* *(hook)* | 76 |
| `editor_sceneView.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : recrée les vues depuis les données désérialisées, puis ajoute le menu « Add Scene View ». *(interne)* *(hook)* | 406 |
| `editor_sceneView.onSerialize()` | Sérialise l'état de toutes les vues (mode, clips, fov, pos, rot, options d'affichage, masque debug). *(interne)* *(hook)* | 417 |

### Détail des paramètres

#### `editor_sceneView.onDeserialized(data)`

Mémorise les données sauvegardées jusqu'à ce que l'éditeur soit initialisé (onEditorInitialized les utilise).

- `data` (*table*) : Valeur renvoyée par onSerialize.

#### `editor_sceneView.onSerialize()`

Sérialise l'état de toutes les vues (mode, clips, fov, pos, rot, options d'affichage, masque debug).

- **renvoie** : table { sceneViews = { [nom] = état } }

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sceneView.lua`.*
