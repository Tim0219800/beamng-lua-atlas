# `editor_dragRaceEditor_input`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/input.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_input` : `extensions.load("editor_dragRaceEditor_input")`, puis la globale `editor_dragRaceEditor_input`

Gère l'entrée souris de l'éditeur de drag race pour l'édition de zones : à chaque mise à jour, calcule le rayon caméra-souris, le raycast sur la scène et les états clic/maintien/relâchement du bouton gauche. Le résultat est lu par l'éditeur de zone via getMouseInfo.

## Remarques

- Pendant le raycast, la collision de la forêt est désactivée puis réactivée.
- Un clic est pris en compte si ImGui ne capture pas la souris, ou si le mode d'édition courant est « Edit Drag Zone ».
- Quand rien n'est touché, la position du clic est à 100 m devant la caméra, normale (0,0,1).
- Au frame du clic (down), hold est forcé à false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_input.getMouseInfo()` | Renvoie la table mouseInfo courante. | 44 |
| `editor_dragRaceEditor_input.updateMouseInfo()` | Recalcule la table mouseInfo : camPos, ray, rayDir, rayCast, valid, down, hold, up et les positions/normales _downPos, _holdPos, _upPos, _downNormal, _holdNormal, _upNormal. | 6 |

### Détail des paramètres

#### `editor_dragRaceEditor_input.getMouseInfo()`

Renvoie la table mouseInfo courante.

- **renvoie** : table|nil nil tant que updateMouseInfo n'a jamais été appelé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/input.lua`.*
