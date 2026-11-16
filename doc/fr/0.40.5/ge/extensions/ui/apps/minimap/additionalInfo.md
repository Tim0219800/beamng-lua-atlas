# `ui_apps_minimap_additionalInfo`

*Fichier : `lua/ge/extensions/ui/apps/minimap/additionalInfo.lua` · VM : Game Engine (GE) · 117 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_additionalInfo` : `extensions.load("ui_apps_minimap_additionalInfo")`, puis la globale `ui_apps_minimap_additionalInfo`

Calcule les informations complémentaires affichées par la mini-carte : distance restante jusqu'à la destination (routePlanner de core_groundMarkers), nom du lieu (zone de gameplay_city la plus prioritaire sous la caméra, sinon titre du niveau) et état de la poursuite de police (disabled, visibleToPolice, hiddenFromPolice). Les changements sont envoyés au flux 'minimap' via guihooks.queueStream.

## Remarques

- Un seul envoi par frame, seulement si une valeur a changé (drapeau hasNewAdditionalInfo).
- La distance est formatée « %.1f unité » après translateDistance(…, 'auto') selon les réglages d'unités.
- checkPolice appelle gameplay_police.getPursuitData() sans test : l'extension gameplay_police doit être disponible.
- checkLocationName ne fait rien si gameplay_city n'est pas chargé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_additionalInfo.onClientEndMission()` | Hook de fin de niveau : vide les infos (visible remis à true) et force un renvoi. *(interne)* *(hook)* | 100 |
| `ui_apps_minimap_additionalInfo.onReachedTargetPos()` | Hook appelé quand la destination est atteinte : efface la distance à la cible. *(interne)* *(hook)* | 42 |
| `ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos)` | Hook appelé quand le focus de navigation de la grande carte change ; si pos est nil, efface la distance à la cible. *(interne)* *(hook)* | 106 |
| `ui_apps_minimap_additionalInfo.onUpdate()` | Hook de frame : vérifie la route, le nom de lieu et la police, puis envoie les infos si l'une a changé. *(interne)* *(hook)* | 89 |
| `ui_apps_minimap_additionalInfo.requestAdditionalInfo()` | Force le renvoi des informations au flux 'minimap' à la prochaine mise à jour (appelé quand l'interface se monte). | 7 |
| `ui_apps_minimap_additionalInfo.setVisible(visible)` | Affiche ou masque le bloc d'informations dans l'interface ; ne renvoie rien si la valeur ne change pas. Tout ce qui n'est pas false est traité comme true. | 11 |

### Détail des paramètres

#### `ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos)`

Hook appelé quand le focus de navigation de la grande carte change ; si pos est nil, efface la distance à la cible.

- `pos` (*vec3|nil*) : Position visée, ou nil si la navigation est retirée.

#### `ui_apps_minimap_additionalInfo.setVisible(visible)`

Affiche ou masque le bloc d'informations dans l'interface ; ne renvoie rien si la valeur ne change pas. Tout ce qui n'est pas false est traité comme true.

- `visible` (*boolean|nil*) : false pour masquer.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/additionalInfo.lua`.*
