# `editor_sitesEditor_parkingSpots`

*Fichier : `lua/ge/extensions/editor/sitesEditor/parkingSpots.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/parkingSpots")` (fichier sous extensions/ mais pas une extension classique)

Sous-éditeur 'Parking Spots' de l'éditeur de sites. Le module renvoie un constructeur de classe C. Une place est une boîte orientée (pos, rot, scl) ; l'éditeur propose gizmo de transformation (transformUtil), préréglages de taille (Car 2.5x6x3, LargeCar 3.25x8x4, Bus 4x14x8), saisie d'angles en degrés, et le mode 'MultiSpot' qui répète la place N fois (1 à 25) dans une direction (Left, Right, Front, Back) avec un décalage et une rotation. Création, suppression, duplication (Shift + glisser) et transformations passent par editor.history (annulable).

## Remarques

- Les angles saisis sont en degrés ; les rotations internes sont des quaternions (conversion XYZ euler en radians).
- setSites restaure rot depuis rotOrig si présent (corrige les rotations ajustées automatiquement pour les multispots) puis supprime rotOrig.
- Une place dupliquée reçoit un nom unique 'Nom (n)' via makeUniqueName.
- hitTest ne renvoie rien (nil) tant que la souris n'est pas enfoncée (mouseInfo.down) ; il teste la boîte orientée de chaque spot du multispot avec intersectsRay_OBB (la caméra doit être hors de la boîte).

## Classe `C`

Objet renvoyé par le constructeur. Champs : sitesEditor, key, current (place sélectionnée), list, isMultiSpot, multiSpotData (spotAmount, spotOffset, spotDirection, spotRotation), listDisplay (assigné par sitesEditor), requestGizmo.

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_parkingSpots")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_beginShiftDuplicate()` | Duplique la place courante (action annulable 'Duplicate Parking Spot') quand un glissement commence avec Shift, et fait adopter la copie par la liste. | 258 |
| `C:create(pos)` | Crée une place à la position donnée avec l'échelle 'Car' (action annulable 'Create Parking Spot') et la renvoie. | 197 |
| `C:drawElement(ps, mouseInfo)` | Dessine l'éditeur de la place : gizmo, choix de taille, angles de rotation, case 'Is MultiSpot' et ses curseurs (Amount of Spots 1 à 25, Offset 0 à 5, Spot Rotation -1.55 à 1.55). | 277 |
| `C:hitTest(mouseInfo, objects)` | Renvoie la place dont la boîte (ou l'une des boîtes du multispot) est touchée au plus près par le rayon souris, seulement lors d'un clic. | 111 |
| `C:init(sitesEditor, key)` | Constructeur : prépare les valeurs de multispot, l'état de glissement et l'utilitaire transformUtil ('Edit Sites', 'Transform'). Définit aussi la méthode C:requestGizmo(mode) qui programme la (re)configuration du gizmo sur 3 images. | 57 |
| `C:remove(ps)` | Supprime une place (action annulable 'Remove Parking Spot'). | 204 |
| `C:select(ps)` | Sélectionne une place : place le transform, active l'édition et recopie ses réglages de multispot dans l'UI. | 97 |
| `C:setSites(sites)` | Définit les sites édités, restaure les rotations d'origine des multispots et désélectionne. | 84 |
| `C:setTransform()` | Copie pos, rot, scl de la place courante dans transformUtil. | 210 |
| `C:updateFromTransform()` | Copie pos, rot, scl de transformUtil vers la place courante (pendant un glissement). | 214 |
| `C:updateMultiSpot()` | Recopie les réglages de multispot de l'UI vers la place courante. | 248 |
| `C:updateTransform()` | Enregistre une action annulable 'Update Transform of ...' avec les anciennes et nouvelles valeurs. | 240 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/parkingSpots.lua`.*
