# `editor_toolUtilities_polygonPaint`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polygonPaint.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polygonPaint` : `extensions.load("editor_toolUtilities_polygonPaint")`, puis la globale `editor_toolUtilities_polygonPaint`

Outil de polygone à main levée pour l'éditeur : l'utilisateur maintient le clic gauche et glisse sur le terrain pour poser des points, relâche pour terminer (la fermeture est implicite entre le dernier et le premier point). Le tracé est simplifié par RDP pour obtenir un polygone éditable propre. Dessine un aperçu (sphères et lignes bleues) et le curseur.

## Exemple

```lua
local pp = extensions.editor_toolUtilities_polygonPaint
pp.start({stepMeters = 2, rdpTolMeters = 6})
-- chaque frame :
if pp.update() then
  local poly = pp.consumePolygon()
end
```

## Remarques

- Le dessin ne démarre que si la souris survole le terrain : évite qu'un clic sur l'interface (ex. bouton « New ») commence et termine un trait.
- Les points sont posés à la hauteur du terrain + 0.05 m (anti z-fighting).
- Un trait de moins de 3 points (ou moins de 3 après RDP) est jeté et l'outil reste armé.
- À la fin d'un tracé valide, active passe à false et finished à true jusqu'à consumePolygon.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polygonPaint.cancel()` | Désarme l'outil et efface les points. | 61 |
| `editor_toolUtilities_polygonPaint.consumePolygon(out)` | Récupère le polygone simplifié terminé et efface le drapeau finished. Renvoie nil s'il n'y a rien de terminé. | 75 |
| `editor_toolUtilities_polygonPaint.hasFinished()` | Indique si un polygone terminé attend d'être récupéré par consumePolygon. | 71 |
| `editor_toolUtilities_polygonPaint.isActive()` | Indique si l'outil est armé. | 67 |
| `editor_toolUtilities_polygonPaint.start(opts)` | Arme l'outil et réinitialise les tables. stepMeters (défaut 2.0) est la distance minimale entre deux points capturés, rdpTolMeters (défaut 6.0) la tolérance de simplification. | 50 |
| `editor_toolUtilities_polygonPaint.update()` | À appeler chaque frame pendant que la peinture doit être possible : dessine l'aperçu et le curseur, capture les points tant que le clic gauche est enfoncé sur le terrain, termine au relâchement. | 128 |

### Détail des paramètres

#### `editor_toolUtilities_polygonPaint.consumePolygon(out)`

Récupère le polygone simplifié terminé et efface le drapeau finished. Renvoie nil s'il n'y a rien de terminé.

- `out` (*table|nil*) : Table de sortie réutilisable, vidée puis remplie ; créée si nil.
- **renvoie** : table|nil Liste de vec3 du polygone.

#### `editor_toolUtilities_polygonPaint.hasFinished()`

Indique si un polygone terminé attend d'être récupéré par consumePolygon.

- **renvoie** : boolean true si un polygone est prêt.

#### `editor_toolUtilities_polygonPaint.isActive()`

Indique si l'outil est armé.

- **renvoie** : boolean true si armé.

#### `editor_toolUtilities_polygonPaint.start(opts)`

Arme l'outil et réinitialise les tables. stepMeters (défaut 2.0) est la distance minimale entre deux points capturés, rdpTolMeters (défaut 6.0) la tolérance de simplification.

- `opts` (*table|nil*) : { stepMeters = number, rdpTolMeters = number }

#### `editor_toolUtilities_polygonPaint.update()`

À appeler chaque frame pendant que la peinture doit être possible : dessine l'aperçu et le curseur, capture les points tant que le clic gauche est enfoncé sur le terrain, termine au relâchement.

- **renvoie** : boolean true si un polygone s'est terminé pendant cette frame.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polygonPaint.lua`.*
