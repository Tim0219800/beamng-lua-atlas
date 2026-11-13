# `editor_ezObjectSelect_viewportOrientationGizmo`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_viewportOrientationGizmo` : `extensions.load("editor_ezObjectSelect_viewportOrientationGizmo")`, puis la globale `editor_ezObjectSelect_viewportOrientationGizmo`

Petit gizmo d'orientation 2D dessiné dans un coin de la vue de l'éditeur (ImGui, foreground draw list) pour Easy Object Select : trois axes X (rouge), Y (vert), Z (bleu) projetés selon l'orientation de la caméra (core_camera.getQuat), avec bouts positifs pleins étiquetés et bouts négatifs plus sombres. Affiche « W » (monde) ou « L » (local) selon qu'un objet local est donné.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId)` | Dessine le gizmo. Si localObjectId désigne un objet existant, les axes suivent sa matrice de transformation (mode L), sinon les axes monde (mode W). Les extrémités sont triées par profondeur. | 52 |

### Détail des paramètres

#### `editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId)`

Dessine le gizmo. Si localObjectId désigne un objet existant, les axes suivent sa matrice de transformation (mode L), sinon les axes monde (mode W). Les extrémités sont triées par profondeur.

- `rightOffset` (*number|nil*) : Décalage depuis le bord droit de la vue de scène, en pixels avant uiscale (défaut 64).
- `topOffset` (*number|nil*) : Décalage depuis le haut, en pixels avant uiscale (défaut 64).
- `localObjectId` (*integer|nil*) : ID d'un objet dont les axes locaux sont affichés.

## Appels vers le moteur (C++)

- `obj:` `getTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua`.*
