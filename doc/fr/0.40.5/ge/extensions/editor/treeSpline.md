# `editor_treeSpline`

*Fichier : `lua/ge/extensions/editor/treeSpline.lua` · VM : Game Engine (GE) · 619 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline` : `extensions.load("editor_treeSpline")`, puis la globale `editor_treeSpline`

Outil Tree Spline de l'éditeur : on dessine une polyligne éditable sur le terrain et l'outil plante une rangée régulière d'arbres/arbustes (vraies instances Forest) le long de celle-ci (avenues, haies). Dès 2 nœuds, la spline plante et replante en direct quand on ajoute/déplace/supprime des nœuds ou change la distribution. Frère « ligne » de forestZoneEditor ; partage le noyau de toolUtilities/foliageScatter. Structure identique à meshSpline/assemblySpline (editor/<outil>.lua + <outil>/splineMgr.lua + populate.lua). Fenêtre « treeSpline » et mode d'édition treeSplineEditMode.

## Remarques

- Constantes : espacement 0.5 à 40 m, variance de position 0 à 1, variance d'échelle 0 à 0.9, pente max 0 à 89°, graine max 100000, tolérance RDP de simplification 4 m.
- Une spline verrouillée (isEnabled = false) garde ses arbres dans la forêt à la sauvegarde du niveau et à la sérialisation ; seules les splines actives sont retirées/relevées.
- setSelectedSplineIdx et setSelectedNodeIdx doivent exister en paire, sinon splineInput ignore la sélection inter-outils.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline.onClientEndMission()` | Hook de fin de mission : oublie les arbres soulevés et supprime toutes les splines. *(interne)* *(hook)* | 592 |
| `editor_treeSpline.onDeserialized(data)` | Après rechargement : restaure l'état (splines marquées sales, replantées au prochain onEditorGui). *(interne)* *(hook)* | 556 |
| `editor_treeSpline.onEditorBeforeSaveLevel()` | Avant la sauvegarde du niveau : soulève de la forêt (scatter.lift) les arbres des splines actives pour qu'ils ne soient pas écrits ; seuls les arbres des splines verrouillées font partie du niveau. Ils sont remis à la frame suivante. *(interne)* *(hook)* | 598 |
| `editor_treeSpline.onEditorGui()` | Hook de frame de l'éditeur : restitue les arbres soulevés, replante les splines sales (même outil inactif), dessine la fenêtre, gère l'édition des nœuds via splineInput et le rendu des splines. *(interne)* *(hook)* | 504 |
| `editor_treeSpline.onEditorInitialized()` | Hook d'initialisation de l'éditeur : crée editor.editModes.treeSplineEditMode et enregistre la fenêtre treeSpline (330x760). *(interne)* *(hook)* | 579 |
| `editor_treeSpline.onSerialize()` | Avant le rechargement de la VM Lua : pour chaque spline verrouillée, garde les clés de ses arbres (keptObjects via populate.release), puis prend un instantané des définitions et retire les instances plantées pour éviter les orphelins. onDeserialized les replante. *(interne)* *(hook)* | 546 |
| `editor_treeSpline.setLockedById(id, isLocked)` | Verrouille/déverrouille la tree spline d'identifiant donné (isEnabled = not isLocked), la marque sale et la replante immédiatement. Aussi utilisé par la Master Spline pour les enfants liés. Les arbres d'une spline verrouillée restent dans la forêt à la sauvegarde. Sans effet si l'id est inconnu. | 118 |
| `editor_treeSpline.setSelectedNodeIdx(idx)` | Définit l'index du nœud sélectionné ; appelé par splineInput lors d'un saut vers cet outil. *(interne)* | 99 |
| `editor_treeSpline.setSelectedSplineIdx(idx)` | Définit l'index de la spline sélectionnée ; appelé par splineInput lors d'un saut vers cet outil. *(interne)* | 98 |

### Détail des paramètres

#### `editor_treeSpline.onDeserialized(data)`

Après rechargement : restaure l'état (splines marquées sales, replantées au prochain onEditorGui).

- `data` (*table|nil*) : Valeur renvoyée par onSerialize.

#### `editor_treeSpline.onSerialize()`

Avant le rechargement de la VM Lua : pour chaque spline verrouillée, garde les clés de ses arbres (keptObjects via populate.release), puis prend un instantané des définitions et retire les instances plantées pour éviter les orphelins. onDeserialized les replante.

- **renvoie** : table État des splines (splineMgr.getState()).

#### `editor_treeSpline.setLockedById(id, isLocked)`

Verrouille/déverrouille la tree spline d'identifiant donné (isEnabled = not isLocked), la marque sale et la replante immédiatement. Aussi utilisé par la Master Spline pour les enfants liés. Les arbres d'une spline verrouillée restent dans la forêt à la sauvegarde. Sans effet si l'id est inconnu.

- `id` (*string*) : Identifiant de la spline.
- `isLocked` (*boolean*) : Vrai pour verrouiller.

#### `editor_treeSpline.setSelectedNodeIdx(idx)`

Définit l'index du nœud sélectionné ; appelé par splineInput lors d'un saut vers cet outil.

- `idx` (*integer*) : Index du nœud (à partir de 1).

#### `editor_treeSpline.setSelectedSplineIdx(idx)`

Définit l'index de la spline sélectionnée ; appelé par splineInput lors d'un saut vers cet outil.

- `idx` (*integer*) : Index de la spline (à partir de 1).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline.lua`.*
