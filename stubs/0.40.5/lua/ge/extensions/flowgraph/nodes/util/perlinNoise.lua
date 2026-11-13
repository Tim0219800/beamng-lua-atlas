---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_perlinNoise_C
local flowgraph_nodes_util_perlinNoise_C = {}

--- Somme le bruit sur plusieurs octaves (fréquence ×2 et amplitude ÷2 à chaque octave) ; divise par la somme des amplitudes si normalize.
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:145
---@param x number Abscisse.
---@param y number Ordonnée.
---@param z number Cote.
---@param octaves integer Nombre d'octaves.
---@param amplitude number Amplitude initiale.
---@param frequency number Fréquence initiale.
function flowgraph_nodes_util_perlinNoise_C:OctavePerlin(x, y, z, octaves, amplitude, frequency) end

--- Vide le graphe, règle l'échelle, remplit la table de permutation (doublée) et tire la graine aléatoire si randomStartSeed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:103
function flowgraph_nodes_util_perlinNoise_C:_executionStarted() end

--- Dessine les boutons « Smooth preset » et « Natural preset » qui règlent frequency/amplitude/octaves.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:76
function flowgraph_nodes_util_perlinNoise_C:drawCustomProperties() end

--- Dessine la courbe des dernières valeurs si data.debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:94
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_perlinNoise_C:drawMiddle(builder, style) end

--- Courbe de lissage 6t^5 - 15t^4 + 10t^3 (appelée sans self).
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:228
---@param t number Valeur dans [0,1].
function flowgraph_nodes_util_perlinNoise_C.fade(t) end

--- Gradient pseudo-aléatoire choisi selon les 4 bits bas du hash.
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:223
---@param hash integer Valeur de hachage.
---@param x number x.
---@param y number y.
---@param z number z.
function flowgraph_nodes_util_perlinNoise_C:grad(hash, x, y, z) end

--- Initialise le tampon du graphe, la graine, data.debug=true et data.graphDataCount=1000.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:67
function flowgraph_nodes_util_perlinNoise_C:init() end

--- Interpolation linéaire a + t(b-a) (appelée sans self).
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:232
---@param t number Ratio.
---@param a number Début.
---@param b number Fin.
function flowgraph_nodes_util_perlinNoise_C.lerp(t, a, b) end

--- Bruit de Perlin 3D de base (interpolation des 8 coins du cube unité).
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:162
---@param x number Abscisse.
---@param y number|nil Ordonnée (0 par défaut).
---@param z number|nil Cote (0 par défaut).
function flowgraph_nodes_util_perlinNoise_C:noise(x, y, z) end

--- Si flow est actif, calcule OctavePerlin(randomStartSeed + value, 0, 0, ...), alimente le graphe et écrit value et flow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:127
function flowgraph_nodes_util_perlinNoise_C:work() end

