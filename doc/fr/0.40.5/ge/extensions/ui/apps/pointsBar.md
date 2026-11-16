# `ui_apps_pointsBar`

*Fichier : `lua/ge/extensions/ui/apps/pointsBar.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_pointsBar` : `extensions.load("ui_apps_pointsBar")`, puis la globale `ui_apps_pointsBar`

Alimente l'app d'interface pointsBar (barre de points avec paliers). Il garde le nombre de points et les paliers (100, 200, 300 par défaut) et publie dans le flux 'pointsBar' le pourcentage de remplissage, le libellé, les paliers atteints et la position des paliers en pourcentage.

## Exemple

```lua
ui_apps_pointsBar.setThresholds({500, 1000, 2000})
ui_apps_pointsBar.setPoints(750, '750 pts')
```

## Remarques

- La barre est dimensionnée sur le dernier palier + 10 % : fillPercent = points / (dernierPalier * 1.1), sous forme de fraction (0 à ~0,91), alors que thresholdPercentages est exprimé en pourcentage (0 à 100).
- setPoints ne vérifie pas que les paliers existent : une liste de paliers vide provoque une erreur (index nil).
- Dans clearData, setPoints(0) n'a pas de libellé : pointsLabel interne devient nil (le flux utilise alors '0').
- L'extension reste chargée en permanence (déchargement manuel).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_pointsBar.clearData()` | Remet les paliers par défaut {100, 200, 300} et les points à 0. | 55 |
| `ui_apps_pointsBar.onInit()` | Hook d'initialisation : place l'extension en déchargement manuel. *(interne)* *(hook)* | 6 |
| `ui_apps_pointsBar.requestAllData()` | Republie paliers et points courants (utile quand l'app se monte). | 60 |
| `ui_apps_pointsBar.setPoints(points, pointsLabel)` | Met à jour les points courants et le libellé, recalcule remplissage et paliers atteints, puis publie dans le flux 'pointsBar'. | 26 |
| `ui_apps_pointsBar.setThresholds(thresholds)` | Définit la liste des paliers (si fournie), recalcule leur position en pourcentage et publie dans le flux. | 41 |

### Détail des paramètres

#### `ui_apps_pointsBar.setPoints(points, pointsLabel)`

Met à jour les points courants et le libellé, recalcule remplissage et paliers atteints, puis publie dans le flux 'pointsBar'.

- `points` (*number*) : Points actuels.
- `pointsLabel` (*string|nil*) : Texte affiché ; par défaut tostring(points).

#### `ui_apps_pointsBar.setThresholds(thresholds)`

Définit la liste des paliers (si fournie), recalcule leur position en pourcentage et publie dans le flux.

- `thresholds` (*table<integer, number>|nil*) : Paliers croissants ; le dernier fixe l'échelle.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/pointsBar.lua`.*
