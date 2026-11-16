# `editor_cubemapEditor`

*Fichier : `lua/ge/extensions/editor/cubemapEditor.lua` · VM : Game Engine (GE) · 760 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cubemapEditor` : `extensions.load("editor_cubemapEditor")`, puis la globale `editor_cubemapEditor`

Éditeur de cubemaps du World Editor (menu Assets > « Cubemap Editor », fenêtre « cubemapEditor »). Il liste les objets de classe CubemapData du niveau, permet de créer, enregistrer et supprimer un cubemap, d'assigner chacune des 6 faces (glisser-déposer ou bouton), et de capturer les 6 faces depuis la position de la caméra (captureCameraCubemap, résolution 128 à 2048 px, puissance de 2) avant de les assigner automatiquement. Il exporte aussi les données dans un fichier main.materials.json. Peut être ouvert par un autre outil via show(onSelectCb) pour choisir un cubemap.

## Exemple

```lua
editor_cubemapEditor.show(function(nom) print('cubemap choisi : '..nom) end, 'monCubemap')
```

## Remarques

- Les fichiers de faces capturées doivent s'appeler <préfixe><0..5>.hdr.dds ; si l'un manque, l'assignation échoue avec un message d'erreur de statut.
- Ordre des faces affiché : 0 +X droite, 1 -X gauche, 2 -Y arrière, 3 +Y avant, 4 +Z haut, 5 -Z bas.
- Le dossier de base par défaut est <chemin du niveau>/art/cubemaps/<nom du datablock> ; il est créé s'il n'existe pas.
- La position de capture est mémorisée dans le champ captureLocation (« x,y,z »), utilisé par le bouton « Go to cubemap location ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cubemapEditor.onEditorGui()` | Hook appelé à chaque frame de l'éditeur : dessine la fenêtre. *(interne)* *(hook)* | 751 |
| `editor_cubemapEditor.onEditorInitialized()` | Hook appelé à l'initialisation du World Editor : enregistre la fenêtre (750x380, masquée) et l'entrée de menu « Cubemap Editor » dans le groupe Assets. *(interne)* *(hook)* | 745 |
| `editor_cubemapEditor.show(onSelectCb, preselectName)` | Ouvre la fenêtre de l'éditeur de cubemaps. Charge la liste des cubemaps au premier appel, présélectionne celui dont le nom est donné (sinon le premier si rien n'est sélectionné). Si un callback est fourni, la fenêtre affiche des boutons Select/Cancel ; Select appelle le callback avec le nom du cubemap et ferme la fenêtre. | 734 |

### Détail des paramètres

#### `editor_cubemapEditor.show(onSelectCb, preselectName)`

Ouvre la fenêtre de l'éditeur de cubemaps. Charge la liste des cubemaps au premier appel, présélectionne celui dont le nom est donné (sinon le premier si rien n'est sélectionné). Si un callback est fourni, la fenêtre affiche des boutons Select/Cancel ; Select appelle le callback avec le nom du cubemap et ferme la fenêtre.

- `onSelectCb` (*function|nil*) : appelé avec le nom (string) du cubemap choisi
- `preselectName` (*string|nil*) : nom du cubemap à présélectionner

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `obj:` `setField`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cubemapEditor.lua`.*
