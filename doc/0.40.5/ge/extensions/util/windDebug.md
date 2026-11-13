# `util_windDebug`

*Fichier : `lua/ge/extensions/util/windDebug.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_windDebug` : `extensions.load("util_windDebug")`, puis la globale `util_windDebug`

Visualise le champ de vent partagé : échantillonne `be:getWindAt()` sur une grille de 21 x 21 points espacés de 5 m centrée sur la caméra, et dessine une flèche par point (direction = vent, longueur et couleur = vitesse, du bleu au rouge à 20 m/s). Un texte au centre affiche la vitesse du vent en m/s et km/h. Les rafales s'animent car le champ varie dans le temps.

## Exemple

```lua
extensions.load('util_windDebug'); util_windDebug.toggle()
```

## Remarques

- Désactivé par défaut (enabled = false) ; ne dessine que si enabled est vrai.
- Les flèches sont posées à 1 m au-dessus du terrain (core_terrain.getTerrainHeight) ou à 2 m sous la caméra si le terrain n'est pas disponible.
- Les cellules où le vent est inférieur à 0,05 m/s ne sont pas dessinées. Longueur d'une flèche : 0,15 m par m/s, plafonnée à 4,5 m.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_windDebug.onPreRender(dtReal, dtSim)` | Hook de pré-rendu : si enabled, dessine la grille de flèches de vent autour de la caméra et le texte de vitesse au centre. *(interne)* *(hook)* | 43 |
| `util_windDebug.setEnabled(v)` | Active ou désactive l'affichage. | 66 |
| `util_windDebug.toggle()` | Inverse l'état d'affichage. | 67 |

### Détail des paramètres

#### `util_windDebug.onPreRender(dtReal, dtSim)`

Hook de pré-rendu : si enabled, dessine la grille de flèches de vent autour de la caméra et le texte de vitesse au centre.

- `dtReal` (*number*) : temps réel écoulé, en secondes
- `dtSim` (*number*) : temps simulé écoulé, en secondes

#### `util_windDebug.setEnabled(v)`

Active ou désactive l'affichage.

- `v` (*any*) : toute valeur ; convertie en booléen (vrai si truthy)

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean | Vrai quand la visualisation du vent est active. |

## Appels vers le moteur (C++)

- `be:` `getWindAt`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/windDebug.lua`.*
