# `flowgraph_nodes_util_perlinNoise`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua` · VM : Game Engine (GE) · 238 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/perlinNoise")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Perlin Noise » (repeat_instant). Produit un nombre pseudo-aléatoire cohérent (bruit de Perlin à octaves) en fonction d'une valeur d'entrée, par exemple le temps. Entrées : flow, value (graine/abscisse), octaves (6), amplitude (128), frequency (4), normalize (false), randomStartSeed (true, décale l'abscisse aléatoirement à chaque démarrage). Sorties : flow, value. Boutons de préréglage « Smooth » et « Natural » dans l'inspecteur ; un graphe de débogage est dessiné dans le nœud (data.debug). Implémentation adaptée d'un gist de kymckay.

## Remarques

- La boucle d'OctavePerlin va de 0 à octaves inclus : il y a octaves+1 passes.
- Dans _executionStarted, amplitude.value est lu pour l'échelle du graphe ; sans valeur la ligne échouerait.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:OctavePerlin(x, y, z, octaves, amplitude, frequency)` | Somme le bruit sur plusieurs octaves (fréquence ×2 et amplitude ÷2 à chaque octave) ; divise par la somme des amplitudes si normalize. | 145 |
| `C:_executionStarted()` | Vide le graphe, règle l'échelle, remplit la table de permutation (doublée) et tire la graine aléatoire si randomStartSeed. | 103 |
| `C:drawCustomProperties()` | Dessine les boutons « Smooth preset » et « Natural preset » qui règlent frequency/amplitude/octaves. | 76 |
| `C:drawMiddle(builder, style)` | Dessine la courbe des dernières valeurs si data.debug. | 94 |
| `C.fade(t)` | Courbe de lissage 6t^5 - 15t^4 + 10t^3 (appelée sans self). | 228 |
| `C:grad(hash, x, y, z)` | Gradient pseudo-aléatoire choisi selon les 4 bits bas du hash. | 223 |
| `C:init()` | Initialise le tampon du graphe, la graine, data.debug=true et data.graphDataCount=1000. | 67 |
| `C.lerp(t, a, b)` | Interpolation linéaire a + t(b-a) (appelée sans self). | 232 |
| `C:noise(x, y, z)` | Bruit de Perlin 3D de base (interpolation des 8 coins du cube unité). | 162 |
| `C:work()` | Si flow est actif, calcule OctavePerlin(randomStartSeed + value, 0, 0, ...), alimente le graphe et écrit value et flow. | 127 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua`.*
