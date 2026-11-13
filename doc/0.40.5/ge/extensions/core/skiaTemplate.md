# `core_skiaTemplate`

*Fichier : `lua/ge/extensions/core/skiaTemplate.lua` · VM : Game Engine (GE) · 273 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_skiaTemplate` : `extensions.load("core_skiaTemplate")`, puis la globale `core_skiaTemplate`

Pilote Lua des plaques d'immatriculation dessinées avec Skia. Il génère le texte de plaque à partir des motifs de design.vars (texte littéral et jetons {token}), construit la table de variables ({plate}, {line1}/{line2}, {seg1}…, variables prédéfinies ou générées), substitue chaque {clé} dans une copie de l'arbre de mise en page du format choisi, puis envoie le résultat résolu au moteur C++ (veh:renderLicensePlateSkia), qui lie les textures aux tags de matériau @licenseplate-*. Le C++ ne fait que le rendu. Utile pour les mods de plaques (fichiers *.sktemplate.json).

## Exemple

```lua
local design = jsonReadFile('vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json')
local text = core_skiaTemplate.generateText(design, veh)
core_skiaTemplate.renderToVehicle(veh, design, 'default', text)
```

## Remarques

- Un design est une table : type ('licenseplate' par défaut), format (table nom -> {size, background, normal, emboss, finish, maps, segments, limit, limit2, root}), vars (définitions de variables : default, formats, charsets, preset), logic (nom d'un module Lua facultatif avec resolve(text, format, design) pouvant renvoyer {vars, nodes, background, normal}).
- Cartes rendues : pour le type licenseplate, diffuse, normal, specular, metallic ; pour les autres types, diffuse seulement. Une liste maps explicite dans le format ou le design prend le dessus.
- Les variables prédéfinies (preset) et générées sont déterministes pour un texte de plaque donné (hash djb2 du texte) afin que tous les clients multijoueur obtiennent le même résultat.
- Les valeurs vides sont remplacées par un espace ; un jeton inconnu reste tel quel ({clé}).
- limit et limit2 comptent des points de code UTF-8, pas des octets.
- Jetons spéciaux de generateText : {vid} (id du véhicule), {vname} (nom du fichier jbeam), et les jeux de caractères de vars.plate.charsets. Les formats de plaque choisis viennent du champ dynamique licenseFormats du véhicule (défaut {"30-15"}).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_skiaTemplate.benchmark(design, format, text, iterations)` | Outil de développement : compare le rendu CPU et GPU des cartes de plaque. Rend de façon synchrone sur le thread appelant, donc à lancer quand aucune plaque n'est en cours de création. | 247 |
| `core_skiaTemplate.generateText(design, veh)` | Génère un texte de plaque depuis design.vars.plate (texte littéral et jetons {token}). Sans variable exploitable, repli sur un style 'AAA-0000'. | 89 |
| `core_skiaTemplate.renderToVehicle(veh, design, format, text)` | Résout le format puis le soumet au thread de rendu Skia du moteur (veh:renderLicensePlateSkia avec le JSON résolu), qui lie le résultat aux tags de matériau @licenseplate-* du véhicule. | 236 |
| `core_skiaTemplate.resolveFormat(design, format, text, veh)` | Résout un format du design en gabarit plat compris par le moteur : {size, background, normal, emboss, finish, maps, root} avec toutes les {clé} substituées. finish contient les valeurs PBR par défaut (0 à 1) : roughness et metallic pour le fond, fgRoughness et fgMetallic pour le texte et les logos ; un noeud peut surcharger avec ses propres metallic/roughness. Applique aussi la découpe en segments, en lignes (limit/limit2) et la logique de design éventuelle. | 162 |
| `core_skiaTemplate.resolveTemplate(design, vars)` | Résout un gabarit générique (non plaque) plat {size, background?, root} : copie profonde et substitution des {clé} du texte depuis vars. maps vaut diffuse seulement sauf indication contraire. | 226 |

### Détail des paramètres

#### `core_skiaTemplate.benchmark(design, format, text, iterations)`

Outil de développement : compare le rendu CPU et GPU des cartes de plaque. Rend de façon synchrone sur le thread appelant, donc à lancer quand aucune plaque n'est en cours de création.

- `design` (*table|string|nil*) : Design, ou chemin VFS d'un *.sktemplate.json (défaut : plaque standard vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json).
- `format` (*string|nil*) : Format ; par défaut le premier du design.
- `text` (*string|nil*) : Texte ; défaut 'ABC-1234'.
- `iterations` (*integer|nil*) : Nombre d'itérations, 20 par défaut.
- **renvoie** : string Résumé des temps renvoyé par le moteur, ou un message d'erreur (skiaBenchmark indisponible hors build de dev avec Skia, design introuvable, format non rendable).

#### `core_skiaTemplate.generateText(design, veh)`

Génère un texte de plaque depuis design.vars.plate (texte littéral et jetons {token}). Sans variable exploitable, repli sur un style 'AAA-0000'.

- `design` (*table|nil*) : Design de plaque.
- `veh` (*userdata|nil*) : Objet véhicule (pour {vid}, {vname} et licenseFormats).
- **renvoie** : string Texte de la plaque.

#### `core_skiaTemplate.renderToVehicle(veh, design, format, text)`

Résout le format puis le soumet au thread de rendu Skia du moteur (veh:renderLicensePlateSkia avec le JSON résolu), qui lie le résultat aux tags de matériau @licenseplate-* du véhicule.

- `veh` (*userdata*) : Véhicule ayant la méthode renderLicensePlateSkia.
- `design` (*table*) : Design de plaque.
- `format` (*string*) : Nom du format.
- `text` (*string*) : Texte de la plaque.
- **renvoie** : boolean false si le véhicule ne sait pas rendre ou si le format est introuvable ; sinon le retour du moteur (true si accepté).

#### `core_skiaTemplate.resolveFormat(design, format, text, veh)`

Résout un format du design en gabarit plat compris par le moteur : {size, background, normal, emboss, finish, maps, root} avec toutes les {clé} substituées. finish contient les valeurs PBR par défaut (0 à 1) : roughness et metallic pour le fond, fgRoughness et fgMetallic pour le texte et les logos ; un noeud peut surcharger avec ses propres metallic/roughness. Applique aussi la découpe en segments, en lignes (limit/limit2) et la logique de design éventuelle.

- `design` (*table*) : Design de plaque.
- `format` (*string*) : Nom du format dans design.format.
- `text` (*string|nil*) : Texte de la plaque (vide remplacé par un espace).
- `veh` (*userdata|nil*) : Véhicule, utilisé pour les variables générées.
- **renvoie** : table|nil Gabarit résolu ; nil si le format ou son root manque.

#### `core_skiaTemplate.resolveTemplate(design, vars)`

Résout un gabarit générique (non plaque) plat {size, background?, root} : copie profonde et substitution des {clé} du texte depuis vars. maps vaut diffuse seulement sauf indication contraire.

- `design` (*table*) : Gabarit avec un champ root.
- `vars` (*table<string, string>|nil*) : Valeurs de substitution.
- **renvoie** : table|nil Gabarit résolu ; nil s'il n'y a pas de root.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/skiaTemplate.lua`.*
