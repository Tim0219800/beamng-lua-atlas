# `editor_missionStartPositionEditor`

*Fichier : `lua/ge/extensions/editor/missionStartPositionEditor.lua` · VM : Game Engine (GE) · 286 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionStartPositionEditor` : `extensions.load("editor_missionStartPositionEditor")`, puis la globale `editor_missionStartPositionEditor`

Mode d'édition « Edit Mission Start Position » du World Editor (icône drapeau). Il dessine avec debugDrawer une sphère et le nom pour chaque mission dont startTrigger.level est le niveau courant, et permet de déplacer le point de départ de la mission sélectionnée : clic-glisser, ou Ctrl+clic pour poser directement à la position de la souris (raycast caméra). Chaque déplacement est enregistré dans l'historique d'annulation de l'éditeur (editor.history). Un bouton déplace aussi toutes les missions situées à moins de 10 m de la mission sélectionnée vers sa position.

## Remarques

- Code couleur : vert = mission sélectionnée, orange = missions proches (<= 10 m), bleu = autres. La taille des sphères augmente avec la distance à la caméra (1.5 à 10, entre 500 m et 1500 m) ; x1.3 pour la sélection, x1.2 pour les proches.
- Modifie startTrigger.pos (table {x,y,z}) et met mission._dirty = true ; la sauvegarde se fait depuis l'éditeur de missions.
- Le test im.IsItemHovered() dans onUpdate n'est pas lié à un élément imgui : l'infobulle de mission n'est probablement jamais affichée (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionStartPositionEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : déclare le mode d'édition missionStartPositionEditMode (action map « MissionStartPositionEditor », onActivate, onDeactivate, onUpdate, onToolbar). *(interne)* *(hook)* | 267 |
| `editor_missionStartPositionEditor.setSelectedMission(mission)` | Définit la mission sélectionnée dans ce mode d'édition (utile pour l'éditeur de missions). | 284 |

### Détail des paramètres

#### `editor_missionStartPositionEditor.setSelectedMission(mission)`

Définit la mission sélectionnée dans ce mode d'édition (utile pour l'éditeur de missions).

- `mission` (*table|nil*) : Mission (avec startTrigger.pos) ou nil pour désélectionner.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionStartPositionEditor.lua`.*
