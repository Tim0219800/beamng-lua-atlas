# `editor_toolUtilities_noise`

*Fichier : `lua/ge/extensions/editor/toolUtilities/noise.lua` · VM : Game Engine (GE) · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_noise` : `extensions.load("editor_toolUtilities_noise")`, puis la globale `editor_toolUtilities_noise`

Bruit fractal partagé en coordonnées monde pour les outils de terrain et de maillage de l'éditeur (terraform, éditeur de route héros). Source unique pour que le maillage d'une route et le terrain autour d'elle échantillonnent le même champ avec la même correspondance rugosité/échelle et s'accordent bosse pour bosse sur leur bord commun. Aucune graine par outil : les coordonnées sont les XY monde bruts.

## Exemple

```lua
local noise = require('editor/toolUtilities/noise')
local f, s, oct, lac, gain = noise.mapNoiseParameters(0.5, 0.5)
local h = s * noise.fbm(x * f, y * f, oct, lac, gain)
```

## Remarques

- Utilise editor/toolUtilities/simplex (simplex.noise(x, y)) ; clamp et lerp sont des globales de common/mathlib.lua.
- Les deux fonctions de correspondance renvoient la fréquence (1/m), la force (m, hauteur de crête), les octaves, la lacunarité et le gain, dans cet ordre.
- fbm applique la fréquence par octave ; passer x*freq et y*freq en entrée donne la longueur d'onde de base voulue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain)` | Mouvement brownien fractionnaire au point monde (x, y) : somme de bruit simplex sur plusieurs octaves, normalisée par l'amplitude totale. | 20 |
| `editor_toolUtilities_noise.mapNoiseParameters(roughness, scale)` | Convertit rugosité et échelle utilisateur ([0,1], bornées) en paramètres de fbm pour de GRANDES ondulations de terrain : force 0 à 1 m, fréquence 0.02 (bosses d'environ 50 m) à 0.2 (environ 5 m), octaves 3 à 6. | 33 |
| `editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale)` | Même champ, mais réglé pour une SURFACE DE ROUTE (bosses de rallye) : bande plus fine et amplitude plus faible, force 0 à 0.18 m de hauteur de crête, fréquence 0.06 (environ 16 m) à 0.5 (environ 2 m), octaves 3 à 5. | 46 |

### Détail des paramètres

#### `editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain)`

Mouvement brownien fractionnaire au point monde (x, y) : somme de bruit simplex sur plusieurs octaves, normalisée par l'amplitude totale.

- `x` (*number*) : X monde (déjà multiplié par la fréquence de base si voulu).
- `y` (*number*) : Y monde.
- `octaves` (*integer*) : Nombre d'octaves.
- `lacunarity` (*number*) : Multiplicateur de fréquence par octave.
- `gain` (*number*) : Multiplicateur d'amplitude par octave.
- **renvoie** : number Valeur normalisée d'environ [-1, 1].

#### `editor_toolUtilities_noise.mapNoiseParameters(roughness, scale)`

Convertit rugosité et échelle utilisateur ([0,1], bornées) en paramètres de fbm pour de GRANDES ondulations de terrain : force 0 à 1 m, fréquence 0.02 (bosses d'environ 50 m) à 0.2 (environ 5 m), octaves 3 à 6.

- `roughness` (*number*) : Rugosité 0 à 1 (amplitude).
- `scale` (*number*) : Échelle 0 à 1 (0 = grandes bosses, 1 = petites).
- **renvoie** : number noiseFreq.
- **renvoie** : number noiseStrength (m).
- **renvoie** : integer fbmOctaves.
- **renvoie** : number fbmLacunarity (2.0).
- **renvoie** : number fbmGain (0.5).

#### `editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale)`

Même champ, mais réglé pour une SURFACE DE ROUTE (bosses de rallye) : bande plus fine et amplitude plus faible, force 0 à 0.18 m de hauteur de crête, fréquence 0.06 (environ 16 m) à 0.5 (environ 2 m), octaves 3 à 5.

- `roughness` (*number*) : Rugosité 0 à 1.
- `scale` (*number*) : Échelle 0 à 1.
- **renvoie** : number noiseFreq.
- **renvoie** : number noiseStrength (m).
- **renvoie** : integer fbmOctaves.
- **renvoie** : number fbmLacunarity.
- **renvoie** : number fbmGain.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultFbmGain` | number | Multiplicateur d'amplitude par octave (0.5). |
| `defaultFbmLacunarity` | number | Multiplicateur de fréquence par octave (2.0). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/noise.lua`.*
