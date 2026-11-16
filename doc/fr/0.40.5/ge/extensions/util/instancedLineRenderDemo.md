# `util_instancedLineRenderDemo`

*Fichier : `lua/ge/extensions/util/instancedLineRenderDemo.lua` · VM : Game Engine (GE) · 248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_instancedLineRenderDemo` : `extensions.load("util_instancedLineRenderDemo")`, puis la globale `util_instancedLineRenderDemo`

Démo technique du dessin de lignes « instanciées » du debugDrawer (drawLineInstance, drawDot), qui permettent des lignes épaisses avec contour et extrémités arrondies. Une fois chargée, l'extension lance une simulation de 6 masses en attraction (inspirée d'un n-body JavaScript) et dessine chaque frame leurs trajectoires à 3 m de haut au-dessus de l'origine, deux fois : sans test de profondeur et avec (décalé de 5 m en X). Les autres démos (grille, sinusoïdes, bords, feu tricolore) sont du code mort commenté dans onPreRender.

## Exemple

```lua
extensions.load('util_instancedLineRenderDemo')
```

## Remarques

- Les trajectoires s'accumulent (jusqu'à 10000 segments par masse, puis la table est vidée) : le coût de dessin augmente avec le temps.
- Il n'y a pas de décharge propre : décharger l'extension arrête simplement le dessin. Recharger l'extension ajoute de nouvelles masses sans effacer les anciennes (startSim ne vide pas la table masses).
- L'appel vec3Random(1) ignore son argument ; startSim crée nMasses+1 = 6 masses (boucle de 0 à nMasses).
- testGrid, drawSinWaveTest, drawEdgeTest et drawSignal ne sont jamais appelées (appels commentés).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_instancedLineRenderDemo.onExtensionLoaded()` | Appelé au chargement de l'extension : initialise les masses de la simulation (startSim). *(interne)* *(hook)* | 240 |
| `util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame avant le rendu. Avance le temps de la démo, fait un pas de simulation et dessine les trajectoires (sans puis avec profondeur). *(interne)* *(hook)* | 222 |

### Détail des paramètres

#### `util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame avant le rendu. Avance le temps de la démo, fait un pas de simulation et dessine les trajectoires (sans puis avec profondeur).

- `dtReal` (*number*) : Delta de temps réel en secondes
- `dtSim` (*number*) : Delta de temps de simulation en secondes (utilisé par la démo)
- `dtRaw` (*number*) : Delta de temps brut (non utilisé)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawDot`, `drawLine`, `drawLineInstance`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/instancedLineRenderDemo.lua`.*
