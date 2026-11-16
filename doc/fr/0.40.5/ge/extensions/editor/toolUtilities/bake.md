# `editor_toolUtilities_bake`

*Fichier : `lua/ge/extensions/editor/toolUtilities/bake.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_bake` : `extensions.load("editor_toolUtilities_bake")`, puis la globale `editor_toolUtilities_bake`

Aide partagée « Bake » des outils de splines de l'éditeur. Tant qu'une spline appartient à son outil, ses objets générés (TSStatic, DecalRoad, rivière) sont transitoires (canSave=false). Bake les valide dans le niveau : passe objets et dossier SimGroup en canSave=true et retire la spline de l'outil sans rien supprimer. Tout est piloté par une table `spec` fournie par l'outil (toolId, displayName, getBakeTarget, rebuildNow, burn, detach, finalizeFolder, removeFromTool, captureState, restoreState, findSpline, optionnellement iconColor/iconSize/bakeIcon/canBake/rowIconSize). L'opération est une seule transaction d'historique annulable, sans dialogue.

## Remarques

- Mode LOCK : si spec.setLockedById existe, le bouton ne supprime rien : il verrouille la spline (isEnabled=false), ses objets sont sauvegardés avec le niveau et collisionnent ; elle reste dans l'outil et peut être déverrouillée (annulable).
- Règle de bakeabilité par défaut : spline activée, non liée (isLink), avec au moins 2 nœuds ; surchargeable par spec.canBake.
- rowButton : après un clic (retour true), l'appelant doit faire editor.endWindow() puis return, car la liste d'items de l'outil a été modifiée en cours d'itération.
- renderButton appelle im.NextColumn() ; renderButtonInline ne gère aucune colonne.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_bake.burnById(spec, id)` | Propagation Master-Spline : bake la spline d'id donné (typiquement un enfant lié) sans ouvrir sa propre transaction d'historique ; le Master Spline englobe tout dans une action. | 166 |
| `editor_toolUtilities_bake.renderButton(spec)` | Variante colonne : dessine le bouton Bake comme une cellule de colonne (l'appelant doit augmenter son im.Columns de 1). S'il n'y a pas de spline bakeable sélectionnée, la cellule est un Dummy vide. | 142 |
| `editor_toolUtilities_bake.renderButtonInline(spec)` | Variante en ligne : dessine le bouton Bake (ou un Dummy) sans gestion de colonnes ; l'appelant fait son propre im.SameLine() avant. | 151 |
| `editor_toolUtilities_bake.rowButton(spec, spline)` | Variante ligne : bouton Bake pour la spline d'une ligne de liste (petite icône), ou Dummy si elle n'est pas bakeable. Un clic bake immédiatement et renvoie true. | 178 |
| `editor_toolUtilities_bake.setLocked(spec, spline, isLocked)` | Verrouille/déverrouille `spline` en une transaction d'historique annulable. Utilisé par le bouton flamme et le basculeur de verrou de l'outil. | 114 |
| `editor_toolUtilities_bake.unburn(data)` | Reprend un bake : supprime les objets brûlés et les items de forêt plantés, recharge la collision et remet le dossier en transitoire (cansave=false). | 72 |

### Détail des paramètres

#### `editor_toolUtilities_bake.burnById(spec, id)`

Propagation Master-Spline : bake la spline d'id donné (typiquement un enfant lié) sans ouvrir sa propre transaction d'historique ; le Master Spline englobe tout dans une action.

- `spec` (*table*) : Table de configuration (doit avoir findSpline).
- `id` (*any*) : Id de la spline.
- **renvoie** : table|nil { manifest, items, folderId } pour permettre l'annulation, ou nil si l'id est introuvable.

#### `editor_toolUtilities_bake.renderButton(spec)`

Variante colonne : dessine le bouton Bake comme une cellule de colonne (l'appelant doit augmenter son im.Columns de 1). S'il n'y a pas de spline bakeable sélectionnée, la cellule est un Dummy vide.

- `spec` (*table*) : Table de configuration de l'outil (voir module).

#### `editor_toolUtilities_bake.renderButtonInline(spec)`

Variante en ligne : dessine le bouton Bake (ou un Dummy) sans gestion de colonnes ; l'appelant fait son propre im.SameLine() avant.

- `spec` (*table*) : Table de configuration de l'outil.

#### `editor_toolUtilities_bake.rowButton(spec, spline)`

Variante ligne : bouton Bake pour la spline d'une ligne de liste (petite icône), ou Dummy si elle n'est pas bakeable. Un clic bake immédiatement et renvoie true.

- `spec` (*table*) : Table de configuration de l'outil.
- `spline` (*table*) : Spline de la ligne.
- **renvoie** : boolean true si un bake a eu lieu (l'appelant doit terminer sa fenêtre). Toujours false en mode LOCK.

#### `editor_toolUtilities_bake.setLocked(spec, spline, isLocked)`

Verrouille/déverrouille `spline` en une transaction d'historique annulable. Utilisé par le bouton flamme et le basculeur de verrou de l'outil.

- `spec` (*table*) : Table de configuration (doit avoir setLockedById).
- `spline` (*table*) : Spline (utilise spline.id).
- `isLocked` (*boolean*) : true pour verrouiller, false pour déverrouiller.

#### `editor_toolUtilities_bake.unburn(data)`

Reprend un bake : supprime les objets brûlés et les items de forêt plantés, recharge la collision et remet le dossier en transitoire (cansave=false).

- `data` (*table*) : Enregistrement de doBake/burnById (manifest, items, folderId).

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/bake.lua`.*
