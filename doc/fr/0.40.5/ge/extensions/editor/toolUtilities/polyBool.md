# `editor_toolUtilities_polyBool`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polyBool.lua` · VM : Game Engine (GE) · 879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polyBool` : `extensions.load("editor_toolUtilities_polyBool")`, puis la globale `editor_toolUtilities_polyBool`

Booléens 2D sur polygones (union, différence), maison, de type Martinez, adaptés de l'approche polybooljs (MIT). Un polygone est une table { regions = { ring, ... }, inverted = bool } où chaque ring est une liste de points {x,y}. Les calculs se font dans un repère local proche de l'origine pour que l'epsilon absolu ne s'écrase pas aux coordonnées monde. areas range ensuite une liste d'anneaux en anneaux extérieurs avec leurs trous, prêts pour une triangulation.

## Exemple

```lua
local pb = extensions.editor_toolUtilities_polyBool
local res = pb.difference(terrainRing, roadRing)
for _, a in ipairs(pb.areas(res.regions)) do
  -- a.ring (CCW), a.holes (liste d'anneaux CW)
end
```

## Remarques

- difference accepte une entrée souple : { regions }, un anneau seul, ou une liste d'anneaux ; les points peuvent être {x=,y=} ou {[1],[2]}.
- unionMany attend en revanche des tables avec le champ regions (et inverted) pour chaque élément.
- Les anneaux de moins de 3 points sont ignorés. Si le clip est vide, difference renvoie le sujet tel quel.
- Tolérances internes : eps 1e-10 pour le balayage, SNAP 1e-6 pour la grille d'entrée, WELD 1e-4 pour souder des coins presque confondus.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polyBool.areas(regions)` | Trie la liste plate d'anneaux d'un résultat booléen en anneaux extérieurs portant chacun leurs trous. L'imbrication se déduit de la profondeur de contenance : pair = plein, impair = trou. Extérieurs orientés CCW, trous CW. Chaque trou est rattaché à l'anneau le plus profond qui le contient. | 829 |
| `editor_toolUtilities_polyBool.difference(subject, clip)` | Différence booléenne : subject moins clip. Travaille dans un repère local comme unionMany. | 774 |
| `editor_toolUtilities_polyBool.unionMany(polys)` | Réunit plusieurs polygones en un seul. Renvoie un polygone vide si la liste est vide. | 744 |

### Détail des paramètres

#### `editor_toolUtilities_polyBool.areas(regions)`

Trie la liste plate d'anneaux d'un résultat booléen en anneaux extérieurs portant chacun leurs trous. L'imbrication se déduit de la profondeur de contenance : pair = plein, impair = trou. Extérieurs orientés CCW, trous CW. Chaque trou est rattaché à l'anneau le plus profond qui le contient.

- `regions` (*table*) : Liste d'anneaux {x,y} (par ex. result.regions de difference).
- **renvoie** : table Liste de { ring = anneau, holes = { anneau, ... } }.

#### `editor_toolUtilities_polyBool.difference(subject, clip)`

Différence booléenne : subject moins clip. Travaille dans un repère local comme unionMany.

- `subject` (*table*) : Polygone, anneau ou liste d'anneaux dont on soustrait.
- `clip` (*table*) : Polygone, anneau ou liste d'anneaux à soustraire.
- **renvoie** : table Polygone résultat { regions, inverted }.

#### `editor_toolUtilities_polyBool.unionMany(polys)`

Réunit plusieurs polygones en un seul. Renvoie un polygone vide si la liste est vide.

- `polys` (*table*) : Liste de polygones { regions = {ring,...}, inverted = bool }.
- **renvoie** : table Polygone résultat { regions, inverted } en coordonnées monde.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polyBool.lua`.*
