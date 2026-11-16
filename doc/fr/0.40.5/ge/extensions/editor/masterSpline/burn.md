# `editor_masterSpline_burn`

*Fichier : `lua/ge/extensions/editor/masterSpline/burn.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_burn` : `extensions.load("editor_masterSpline_burn")`, puis la globale `editor_masterSpline_burn`

Verrouillage (« burn » = lock) d'une Master Spline de l'éditeur. Une Master Spline possède une pile de splines enfants liées (mesh, assembly, road, tree, decal) ; la verrouiller verrouille aussi tous ses enfants : ils restent dans leurs outils, non modifiables, et leur contenu généré est sauvegardé avec le niveau. Le déverrouillage rend tout éditable.

## Remarques

- Chaque verrouillage/déverrouillage est une action annulable de editor.history (« Lock Master Spline » / « Unlock Master Spline »).
- Au déverrouillage, les modifications manuelles des enfants (outils mesh et assembly seulement, via eachObjectJumpTable) sont enregistrées dans data.records ; un verrouillage ultérieur (ex. annulation) les restaure via splineLock.restore.
- Met spline.isEnabled = not isLocked et appelle editor.setDirty().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_burn.run(idx)` | Action du bouton Burn : verrouille la Master Spline d'indice idx (équivaut à setLocked(idx, true)). | 56 |
| `editor_masterSpline_burn.setLocked(idx, isLocked)` | Verrouille ou déverrouille la Master Spline d'indice idx, avec tous ses enfants liés, en une seule transaction annulable. Ne fait rien si l'indice est invalide. | 47 |

### Détail des paramètres

#### `editor_masterSpline_burn.run(idx)`

Action du bouton Burn : verrouille la Master Spline d'indice idx (équivaut à setLocked(idx, true)).

- `idx` (*integer*) : Indice de la Master Spline dans la liste (à partir de 1).

#### `editor_masterSpline_burn.setLocked(idx, isLocked)`

Verrouille ou déverrouille la Master Spline d'indice idx, avec tous ses enfants liés, en une seule transaction annulable. Ne fait rien si l'indice est invalide.

- `idx` (*integer*) : Indice de la Master Spline dans la liste (à partir de 1).
- `isLocked` (*boolean*) : true pour verrouiller, false pour déverrouiller.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/burn.lua`.*
