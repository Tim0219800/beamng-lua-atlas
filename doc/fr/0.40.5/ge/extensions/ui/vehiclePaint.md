# `ui_vehiclePaint`

*Fichier : `lua/ge/extensions/ui/vehiclePaint.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehiclePaint` : `extensions.load("ui_vehiclePaint")`, puis la globale `ui_vehiclePaint`

Petite fenêtre imgui de débogage « Metallic paint » pour régler en direct les paramètres de peinture métallique du véhicule du joueur (3 peintures : métallique, rugosité, vernis, rugosité du vernis). Elle lit et écrit le champ objet `metallicPaintData` du véhicule sous forme de chaîne de 4 nombres.

## Exemple

```lua
extensions.load('ui_vehiclePaint'); ui_vehiclePaint.show()
```

## Remarques

- Les 4 valeurs de metallicPaintData sont, dans l'ordre : [1] Roughness, [2] Metallic, [3] Coat, [4] Coat roughness (d'après les indices passés à sliderUI). Chaque curseur va de 0 à 1.
- changeData n'écrit toujours que dans la peinture 0 : son paramètre index désigne la composante du tableau, pas la peinture.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehiclePaint.changeData(change, index)` | Modifie une composante de metallicPaintData de la peinture 0 du véhicule du joueur 0 et réécrit le champ. | 91 |
| `ui_vehiclePaint.onExtensionLoaded()` | Hook appelé au chargement : crée le pointeur booléen de visibilité (faux) et le pointeur flottant des curseurs. *(interne)* *(hook)* | 82 |
| `ui_vehiclePaint.onUpdate()` | Hook appelé à chaque frame : si la fenêtre est ouverte et qu'un véhicule joueur existe, dessine les curseurs des peintures 0, 1 et 2 et applique les changements via setField. *(interne)* *(hook)* | 41 |
| `ui_vehiclePaint.show()` | Ouvre la fenêtre 'Metallic paint' (la fenêtre est dessinée dans onUpdate). | 78 |

### Détail des paramètres

#### `ui_vehiclePaint.changeData(change, index)`

Modifie une composante de metallicPaintData de la peinture 0 du véhicule du joueur 0 et réécrit le champ.

- `change` (*number*) : Nouvelle valeur.
- `index` (*integer*) : Indice (1 à 4) dans le tableau de 4 valeurs.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_imgui. |

## Appels vers le moteur (C++)

- `ui_imgui.` `BoolPtr`, `FloatPtr`, `SliderFloat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehiclePaint.lua`.*
