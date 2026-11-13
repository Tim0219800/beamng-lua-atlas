---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/noise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bruit fractal partagé en coordonnées monde pour les outils de terrain et de maillage de l'éditeur (terraform, éditeur de route héros). Source unique pour que le maillage d'une route et le terrain autour d'elle échantillonnent le même champ avec la même correspondance rugosité/échelle et s'accordent bosse pour bosse sur leur bord commun. Aucune graine par outil : les coordonnées sont les XY monde bruts.
--- Accès : extension `editor_toolUtilities_noise` : `extensions.load("editor_toolUtilities_noise")`, puis la globale `editor_toolUtilities_noise`
---@class editor_toolUtilities_noise
---@field defaultFbmGain number Multiplicateur d'amplitude par octave (0.5).
---@field defaultFbmLacunarity number Multiplicateur de fréquence par octave (2.0).
editor_toolUtilities_noise = {}

--- Mouvement brownien fractionnaire au point monde (x, y) : somme de bruit simplex sur plusieurs octaves, normalisée par l'amplitude totale.
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:20
---@param x number X monde (déjà multiplié par la fréquence de base si voulu).
---@param y number Y monde.
---@param octaves integer Nombre d'octaves.
---@param lacunarity number Multiplicateur de fréquence par octave.
---@param gain number Multiplicateur d'amplitude par octave.
---@return number  Valeur normalisée d'environ [-1, 1].
function editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain) end

--- Convertit rugosité et échelle utilisateur ([0,1], bornées) en paramètres de fbm pour de GRANDES ondulations de terrain : force 0 à 1 m, fréquence 0.02 (bosses d'environ 50 m) à 0.2 (environ 5 m), octaves 3 à 6.
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:33
---@param roughness number Rugosité 0 à 1 (amplitude).
---@param scale number Échelle 0 à 1 (0 = grandes bosses, 1 = petites).
---@return number  noiseFreq.
---@return number  noiseStrength (m).
---@return integer  fbmOctaves.
---@return number  fbmLacunarity (2.0).
---@return number  fbmGain (0.5).
function editor_toolUtilities_noise.mapNoiseParameters(roughness, scale) end

--- Même champ, mais réglé pour une SURFACE DE ROUTE (bosses de rallye) : bande plus fine et amplitude plus faible, force 0 à 0.18 m de hauteur de crête, fréquence 0.06 (environ 16 m) à 0.5 (environ 2 m), octaves 3 à 5.
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:46
---@param roughness number Rugosité 0 à 1.
---@param scale number Échelle 0 à 1.
---@return number  noiseFreq.
---@return number  noiseStrength (m).
---@return integer  fbmOctaves.
---@return number  fbmLacunarity.
---@return number  fbmGain.
function editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale) end

