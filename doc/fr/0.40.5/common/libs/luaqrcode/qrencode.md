# `libs_luaqrcode_qrencode`

*Fichier : `lua/common/libs/luaqrcode/qrencode.lua` · VM : Commun (GE + véhicule) · 1259 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luaqrcode/qrencode")`

luaqrcode (Patrick Gundlach / speedata, licence BSD 3 clauses) : générateur de QR codes en Lua pur. Il choisit la plus petite version (1 à 40) et le mode (numérique, alphanumérique, binaire), encode les données, calcule la correction d'erreur Reed-Solomon, génère les 8 masques et garde celui dont la pénalité est la plus faible. Il ne dessine rien : il renvoie une matrice de modules que le moddeur affiche lui-même (par exemple en UI ou texture).

## Exemple

```lua
local qr = require('libs/luaqrcode/qrencode')
local ok, matrix = qr.qrcode('https://beamng.com')
if ok then
  for x = 1, #matrix do for y = 1, #matrix do
    local noir = matrix[x][y] > 0
  end end
end
```

## Remarques

- Valeurs de la matrice : positif = module noir, négatif = module blanc (1/-1 pour les données, 2/-2 pour les motifs obligatoires). La matrice est indexée matrix[x][y], en base 1, taille carrée de 4 * version + 17 ; [1][1] est en haut à gauche.
- qrcode renvoie (true, matrice) en cas de succès, (false, message) si les données arrangées ne sont pas un multiple de 8 bits ; les autres cas d'échec (texte trop long pour la version 40, etc.) peuvent lever une erreur (déduit du code).
- Le paramètre mode n'est pas implémenté : le passer déclenche assert(false, 'not implemented') dans get_version_eclevel_mode_bistringlength. Le mode est choisi automatiquement : numérique si que des chiffres, alphanumérique pour [0-9A-Z $%*./:+-], sinon binaire.
- Niveaux de correction ec_level : 1 à 4 (L, M, Q, H). Sans valeur, la fonction prend le niveau le plus élevé qui tient dans la plus petite version.
- Le fichier contient un bloc 'if testing' qui exporte des fonctions internes si la globale testing est définie ; sinon seul qrcode est exporté.
- Utilise le module 'bit' (LuaJIT BitOp).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luaqrcode_qrencode.qrcode(str, ec_level, mode)` | Génère le QR code d'une chaîne : détermine version, niveau de correction et mode, encode les données, ajoute la correction d'erreur, puis choisit le masque de moindre pénalité. | 1220 |

### Détail des paramètres

#### `libs_luaqrcode_qrencode.qrcode(str, ec_level, mode)`

Génère le QR code d'une chaîne : détermine version, niveau de correction et mode, encode les données, ajoute la correction d'erreur, puis choisit le masque de moindre pénalité.

- `str` (*string*) : Texte à encoder.
- `ec_level` (*integer|nil*) : Niveau de correction demandé, 1 à 4 (L, M, Q, H). Facultatif.
- `mode` (*integer|nil*) : Non implémenté : ne pas fournir (provoque une assertion).
- **renvoie** : boolean true si la génération a réussi.
- **renvoie** : table<integer, table<integer, integer>>|string Matrice [x][y] des modules (positif = noir), ou message d'erreur si le premier retour est false.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luaqrcode/qrencode.lua`.*
