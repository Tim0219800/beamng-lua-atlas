# `editor_dynamicDecals_helper`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/helper.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_helper` : `extensions.load("editor_dynamicDecals_helper")`, puis la globale `editor_dynamicDecals_helper`

Petites fonctions utilitaires ImGui et de chaînes partagées par les sections de l'outil Dynamic Decals : texte centré, aperçu d'image avec sa taille, info-bulle d'image ou d'icône, mise en forme de noms camelCase. Utile à un moddeur qui écrit une section ou un widget pour cet outil.

## Remarques

- splitAndCapitalizeCamelCase et capitalizeWords renvoient deux valeurs (gsub renvoie la chaîne et le nombre de remplacements) ; encadrer l'appel de parenthèses pour ne garder que la chaîne.
- imageWidget et imageTooltip passent par editor.getTempTextureObj(path) ; un chemin « / » (texture absente) est affiché en carré.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_helper.capitalizeWords(str)` | Met la première lettre de chaque mot en majuscule et le reste en minuscules. | 60 |
| `editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 72 |
| `editor_dynamicDecals_helper.iconTooltip(msg, inline)` | Dessine une icône « info » avec une info-bulle contenant le message. | 44 |
| `editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth)` | Si l'élément ImGui précédent est survolé, affiche une info-bulle avec l'image et sa taille. Largeur par défaut : préférence `dynamicDecalsTool.imageTooltip.texturePreviewSize`. | 32 |
| `editor_dynamicDecals_helper.imageWidget(path, overrideWidth)` | Affiche une image (teintée avec la couleur BeamNG de l'éditeur) à la largeur donnée en respectant le ratio, suivie de sa taille « L x H ». | 24 |
| `editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry)` | Enregistre la préférence float `dynamicDecalsTool.imageTooltip.texturePreviewSize` (défaut 128, de 32 à 512). *(interne)* | 66 |
| `editor_dynamicDecals_helper.setup(tool_in)` | Appelé par l'outil : mémorise la référence à l'outil (nécessaire pour iconTooltip, qui utilise tool.getIconSize()). *(interne)* | 76 |
| `editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str)` | Transforme une chaîne camelCase en mots séparés par des espaces avec majuscule initiale (ex. « brushStroke » donne « Brush Stroke »). | 52 |
| `editor_dynamicDecals_helper.textColoredCentered(color, string_label)` | Comme textUnformattedCentered mais avec une couleur ImGui. | 18 |
| `editor_dynamicDecals_helper.textUnformattedCentered(string_label)` | Affiche un texte brut centré horizontalement dans la zone disponible. Ne fait rien si le texte est nil. | 12 |

### Détail des paramètres

#### `editor_dynamicDecals_helper.capitalizeWords(str)`

Met la première lettre de chaque mot en majuscule et le reste en minuscules.

- `str` (*string*) : Chaîne source.
- **renvoie** : string Chaîne formatée (suivie du nombre de substitutions).

#### `editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_helper.iconTooltip(msg, inline)`

Dessine une icône « info » avec une info-bulle contenant le message.

- `msg` (*string*) : Texte de l'info-bulle.
- `inline` (*boolean|nil*) : Si vrai, place l'icône sur la même ligne que l'élément précédent.

#### `editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth)`

Si l'élément ImGui précédent est survolé, affiche une info-bulle avec l'image et sa taille. Largeur par défaut : préférence `dynamicDecalsTool.imageTooltip.texturePreviewSize`.

- `path` (*string*) : Chemin de la texture.
- `overrideTooltipWidth` (*number|nil*) : Largeur de l'aperçu en pixels.

#### `editor_dynamicDecals_helper.imageWidget(path, overrideWidth)`

Affiche une image (teintée avec la couleur BeamNG de l'éditeur) à la largeur donnée en respectant le ratio, suivie de sa taille « L x H ».

- `path` (*string*) : Chemin de la texture.
- `overrideWidth` (*number|nil*) : Largeur en pixels ; par défaut toute la largeur disponible.

#### `editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry)`

Enregistre la préférence float `dynamicDecalsTool.imageTooltip.texturePreviewSize` (défaut 128, de 32 à 512).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_helper.setup(tool_in)`

Appelé par l'outil : mémorise la référence à l'outil (nécessaire pour iconTooltip, qui utilise tool.getIconSize()).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

#### `editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str)`

Transforme une chaîne camelCase en mots séparés par des espaces avec majuscule initiale (ex. « brushStroke » donne « Brush Stroke »).

- `str` (*string*) : Chaîne camelCase.
- **renvoie** : string Chaîne formatée (suivie du nombre de substitutions du dernier gsub).

#### `editor_dynamicDecals_helper.textColoredCentered(color, string_label)`

Comme textUnformattedCentered mais avec une couleur ImGui.

- `color` (*ImVec4*) : Couleur du texte.
- `string_label` (*string|nil*) : Texte à afficher.

#### `editor_dynamicDecals_helper.textUnformattedCentered(string_label)`

Affiche un texte brut centré horizontalement dans la zone disponible. Ne fait rien si le texte est nil.

- `string_label` (*string|nil*) : Texte à afficher.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/helper.lua`.*
