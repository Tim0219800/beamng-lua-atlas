# `editor_terraformTool`

*Fichier : `lua/ge/extensions/editor/terraformTool.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terraformTool` : `extensions.load("editor_terraformTool")`, puis la globale `editor_terraformTool`

Façade de l'outil Terraform de l'éditeur de monde. Elle stocke cinq réglages (domaine d'influence, marge, falloff, rugosité, échelle de bruit) comme préférences de l'éditeur, gère le polygone dessiné par l'utilisateur et déclenche le terraformage du terrain (editor/terraform/terraform) à partir de sources récupérées par editor/terraform/fetchSources (routes, etc.) dans un polygone ou dans la sélection. Un moddeur l'utilise pour terraformer par script ou pour lire/modifier les réglages.

## Exemple

```lua
local t = extensions.editor_terraformTool
t.setDOI(150)
t.setMargin(6)
t.terraformSelection()
```

## Remarques

- Valeurs par défaut du code : DOI 100 m, margin 5.0 m, falloff 1.5 m, roughness 0.4, scale 0.5 (les deux derniers dans [0, 1]).
- Bornes des curseurs : DOI 1 à 500 m, margin 0 à 20 m, falloff 1 à 5 m.
- Les réglages sont lus avec editor.getPreference('terraformTool.general.<nom>') et valent la valeur par défaut si la préférence est absente (nil ou false).
- Les fonctions de terraformage modifient le terrain réellement ; elles supposent que l'éditeur est initialisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terraformTool.clearPolygon()` | Efface le polygone courant. | 49 |
| `editor_terraformTool.getDOI()` | Renvoie le domaine d'influence (en mètres) du terraformage, lu dans la préférence terraformTool.general.domainOfInfluence (défaut 100). | 29 |
| `editor_terraformTool.getFalloff()` | Renvoie la distance de décroissance (falloff, en mètres), préférence terraformTool.general.falloff (défaut 1.5). | 31 |
| `editor_terraformTool.getMargin()` | Renvoie la marge latérale (en mètres) autour des sources, préférence terraformTool.general.margin (défaut 5.0). | 30 |
| `editor_terraformTool.getPolygon()` | Renvoie le polygone courant (délègue à editor/toolUtilities/polygon). | 43 |
| `editor_terraformTool.getRoughness()` | Renvoie la rugosité du bruit, préférence terraformTool.general.roughness (défaut 0.4, plage [0, 1]). | 32 |
| `editor_terraformTool.getScale()` | Renvoie l'échelle du bruit, préférence terraformTool.general.scale (défaut 0.5, plage [0, 1]). | 33 |
| `editor_terraformTool.handleTerraformingPolygon()` | À appeler à chaque frame de l'UI : gère le dessin du polygone par l'utilisateur et lance terraformPolygon quand il valide. | 58 |
| `editor_terraformTool.isPolygonExist()` | Indique si un polygone valide existe (poly.isPolygonValid). | 46 |
| `editor_terraformTool.onEditorRegisterPreferences(prefs)` | Hook de l'éditeur : enregistre la catégorie de préférences terraformTool et sa sous-catégorie general (domainOfInfluence en int, margin, falloff, roughness, scale en float) avec leurs bornes. *(interne)* *(hook)* | 67 |
| `editor_terraformTool.setDOI(value)` | Enregistre le domaine d'influence dans les préférences de l'éditeur. | 36 |
| `editor_terraformTool.setFalloff(value)` | Enregistre la distance de décroissance dans les préférences de l'éditeur. | 38 |
| `editor_terraformTool.setMargin(value)` | Enregistre la marge latérale dans les préférences de l'éditeur. | 37 |
| `editor_terraformTool.setRoughness(value)` | Enregistre la rugosité du bruit dans les préférences de l'éditeur. | 39 |
| `editor_terraformTool.setScale(value)` | Enregistre l'échelle du bruit dans les préférences de l'éditeur. | 40 |
| `editor_terraformTool.terraformPolygon(polygon)` | Récupère toutes les sources supportées dans le polygone (fetchSources.getAllSourcesInPolygon) puis appelle terraformToSources avec les réglages courants (DOI, marge, falloff, rugosité, échelle). | 52 |
| `editor_terraformTool.terraformSelection()` | Récupère les objets supportés de la sélection de l'éditeur (fetchSources.getAllSourcesInSelection) et terraforme le terrain autour d'eux avec les réglages courants. | 61 |

### Détail des paramètres

#### `editor_terraformTool.getDOI()`

Renvoie le domaine d'influence (en mètres) du terraformage, lu dans la préférence terraformTool.general.domainOfInfluence (défaut 100).

- **renvoie** : number Domaine d'influence en mètres.

#### `editor_terraformTool.getFalloff()`

Renvoie la distance de décroissance (falloff, en mètres), préférence terraformTool.general.falloff (défaut 1.5).

- **renvoie** : number Falloff en mètres.

#### `editor_terraformTool.getMargin()`

Renvoie la marge latérale (en mètres) autour des sources, préférence terraformTool.general.margin (défaut 5.0).

- **renvoie** : number Marge en mètres.

#### `editor_terraformTool.getPolygon()`

Renvoie le polygone courant (délègue à editor/toolUtilities/polygon).

- **renvoie** : table Polygone courant (structure définie par le module polygon).

#### `editor_terraformTool.getRoughness()`

Renvoie la rugosité du bruit, préférence terraformTool.general.roughness (défaut 0.4, plage [0, 1]).

- **renvoie** : number Rugosité.

#### `editor_terraformTool.getScale()`

Renvoie l'échelle du bruit, préférence terraformTool.general.scale (défaut 0.5, plage [0, 1]).

- **renvoie** : number Échelle du bruit.

#### `editor_terraformTool.isPolygonExist()`

Indique si un polygone valide existe (poly.isPolygonValid).

- **renvoie** : boolean true si le polygone est valide.

#### `editor_terraformTool.onEditorRegisterPreferences(prefs)`

Hook de l'éditeur : enregistre la catégorie de préférences terraformTool et sa sous-catégorie general (domainOfInfluence en int, margin, falloff, roughness, scale en float) avec leurs bornes.

- `prefs` (*table*) : Registre de préférences de l'éditeur.

#### `editor_terraformTool.setDOI(value)`

Enregistre le domaine d'influence dans les préférences de l'éditeur.

- `value` (*number*) : Domaine d'influence en mètres.

#### `editor_terraformTool.setFalloff(value)`

Enregistre la distance de décroissance dans les préférences de l'éditeur.

- `value` (*number*) : Falloff en mètres.

#### `editor_terraformTool.setMargin(value)`

Enregistre la marge latérale dans les préférences de l'éditeur.

- `value` (*number*) : Marge en mètres.

#### `editor_terraformTool.setRoughness(value)`

Enregistre la rugosité du bruit dans les préférences de l'éditeur.

- `value` (*number*) : Rugosité dans [0, 1].

#### `editor_terraformTool.setScale(value)`

Enregistre l'échelle du bruit dans les préférences de l'éditeur.

- `value` (*number*) : Échelle dans [0, 1].

#### `editor_terraformTool.terraformPolygon(polygon)`

Récupère toutes les sources supportées dans le polygone (fetchSources.getAllSourcesInPolygon) puis appelle terraformToSources avec les réglages courants (DOI, marge, falloff, rugosité, échelle).

- `polygon` (*table*) : Polygone dans lequel chercher les sources (déduit du code).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terraformTool.lua`.*
