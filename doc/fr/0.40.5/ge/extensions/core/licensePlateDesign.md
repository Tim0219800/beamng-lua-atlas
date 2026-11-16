# `core_licensePlateDesign`

*Fichier : `lua/ge/extensions/core/licensePlateDesign.lua` · VM : Game Engine (GE) · 307 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_licensePlateDesign` : `extensions.load("core_licensePlateDesign")`, puis la globale `core_licensePlateDesign`

Extension GE `core_licensePlateDesign` : charge la définition d'un design de plaque d'immatriculation et la convertit au format actuel (version 3, type 'licenseplate', fichiers *.sktemplate.json). Elle traduit aussi les anciens formats JSON (versions 0 à 2, avec des champs diffuse/bump/text/characterLayout et des motifs de type printf %d %c %l) vers des arbres de texte avec variables {plate}, {line1}, {seg1}... Un moddeur s'en sert pour lire un design de plaque, qu'il soit ancien ou nouveau.

## Exemple

```lua
local design = core_licensePlateDesign.loadDesign('/vehicles/common/licenseplate-default.json')
if design then dump(design.format) end
```

## Remarques

- Le module n'a qu'une fonction publique, loadDesign ; tout le reste est local. Le format par défaut des anciens designs mono-format est la clé '30-15' (FORMAT_US).
- loadDesign cherche d'abord le fichier *.sktemplate.json correspondant (le chemin .json est transformé en .sktemplate.json). S'il a un champ `format`, les formats absents sont complétés à partir de l'ancien .json du même nom (mergeLegacyFormats). Sinon il lit l'ancien fichier et le traduit.
- Les motifs legacy %d, %c, %l deviennent {d}, {c}, {c} (le jeu de caractères 'l' est converti en 'c'). Jeux de caractères par défaut : d = 0-9, c = A-Z, D = 1-9. La longueur maximale du texte de plaque est 32.
- Dimensions par défaut d'une plaque : 512 x 256 pixels ; hauteur de ligne par défaut 80 ; finition par défaut { roughness 1.0, metallic 0.0, fgRoughness 0.7, fgMetallic 0.0 }.
- Les polices intégrées sont 'plate', 'plateIT' (chemin de layout contenant 'italy' ou '_it') et 'plateFE' (contenant 'fe' ou 'europe'). Une police de mod (.otf, .ttf, ou layout .json avec atlas) est utilisée telle quelle si les fichiers existent. Les couleurs quasi blanches (luminance >= 224) sont forcées en noir avec une police intégrée.
- Bug probable dans resolveTextColor : `parseColor(color:gsub('%s+', ''))` passe aussi le 2e retour de gsub (nombre de remplacements) en argument ; sans conséquence, parseColor ignore le 2e argument.
- Les fonctions locales translateLegacyFormat / translateV2ToV3 ne vérifient pas les types d'entrée : un fichier JSON mal formé peut provoquer une erreur Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_licensePlateDesign.loadDesign(path)` | Charge un design de plaque depuis un fichier JSON (ancien ou *.sktemplate.json) et renvoie une table au format version 3 : { name, version = 3, type = 'licenseplate', format = { [clé] = { size, background, emboss, finish, root, segments/limit/limit2, normal } }, vars = { plate = {...} } }. Les anciens formats sont convertis, les nouveaux sont complétés avec les formats de l'ancien fichier s'il existe. | 279 |

### Détail des paramètres

#### `core_licensePlateDesign.loadDesign(path)`

Charge un design de plaque depuis un fichier JSON (ancien ou *.sktemplate.json) et renvoie une table au format version 3 : { name, version = 3, type = 'licenseplate', format = { [clé] = { size, background, emboss, finish, root, segments/limit/limit2, normal } }, vars = { plate = {...} } }. Les anciens formats sont convertis, les nouveaux sont complétés avec les formats de l'ancien fichier s'il existe.

- `path` (*string|nil*) : Chemin virtuel du fichier de design ; nil ou chaîne vide renvoie nil.
- **renvoie** : table|nil Design version 3, ou nil si le fichier est introuvable ou illisible (avertissement dans le log).

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/licensePlateDesign.lua`.*
