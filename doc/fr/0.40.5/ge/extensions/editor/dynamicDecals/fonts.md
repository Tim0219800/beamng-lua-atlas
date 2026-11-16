# `editor_dynamicDecals_fonts`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/fonts.lua` · VM : Game Engine (GE) · 533 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_fonts` : `extensions.load("editor_dynamicDecals_fonts")`, puis la globale `editor_dynamicDecals_fonts`

Gestion des polices de l'outil Dynamic Decals. Génère, via FontRasterizer.createFontBitmap, des atlas de glyphes (bitmaps de 256 px de haut, option SDF avec padding, valeur onedge et échelle de distance) dans /art/dynamicDecals/fonts/ à partir d'un fichier de police (dossier source par défaut /ui/common/). Les atlas générés (`<nom>.font.json` avec header et glyphs) sont listés, prévisualisés dans la section « Fonts », dans une fenêtre d'aperçu et dans un onglet « Fonts » du navigateur ; un glyphe choisi peut servir de texture de decal (api.setDecalLayerFontPath / setDecalLayerFontCharacter). Les calques à texte (path layers) s'en servent.

## Remarques

- Un atlas n'est listé que si son fichier `.font.json` contient une clé `header`.
- checkOrGenerateFontBitmaps renvoie true si le chemin est vide (≤ 1 caractère) ou si l'atlas existe déjà, sinon le résultat de la génération.
- En cas d'échec de génération, un message est ajouté dans les notifications (niveau error) et dans le log.
- Le code lit la liste des atlas dans destinationDirectory (« /art/dynamicDecals/fonts/ ») avec une profondeur de 1.
- editModeUpdate retire des éléments de fontGenNotifications pendant ipairs : un élément peut être sauté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath)` | S'assure qu'un atlas existe pour la police donnée, le génère sinon (nom de l'atlas = nom du fichier sans extension). | 502 |
| `editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 470 |
| `editor_dynamicDecals_fonts.getFontDirectory()` | Renvoie le dossier source des polices (/ui/common/). | 517 |
| `editor_dynamicDecals_fonts.getGeneratedFontAtlases()` | Renvoie la liste (triée sans casse) des noms d'atlas de police déjà générés. | 521 |
| `editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry)` | Enregistre `dynamicDecalsTool.fonts` : glyphPreviewSize et glyphPreviewSizeInPreviewWindow (float, défaut 128, de 32 à 1024) et markMissingGlyphs (bool, vrai). *(interne)* | 462 |
| `editor_dynamicDecals_fonts.setup(tool_in)` | Appelé par l'outil : liste les atlas existants, enregistre la section « Fonts » (ordre 1030), l'onglet « Fonts » du navigateur (ordre 40), la fenêtre d'aperçu, les callbacks d'update et d'interface, puis indique à l'API le dossier des atlas (api.setFontTextureAtlasPath). *(interne)* | 483 |

### Détail des paramètres

#### `editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath)`

S'assure qu'un atlas existe pour la police donnée, le génère sinon (nom de l'atlas = nom du fichier sans extension).

- `fontPath` (*string*) : Chemin du fichier .ttf.
- **renvoie** : boolean false si la création a échoué, true sinon.

#### `editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_fonts.getFontDirectory()`

Renvoie le dossier source des polices (/ui/common/).

- **renvoie** : string Chemin du dossier.

#### `editor_dynamicDecals_fonts.getGeneratedFontAtlases()`

Renvoie la liste (triée sans casse) des noms d'atlas de police déjà générés.

- **renvoie** : string[] Noms de polices.

#### `editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry)`

Enregistre `dynamicDecalsTool.fonts` : glyphPreviewSize et glyphPreviewSizeInPreviewWindow (float, défaut 128, de 32 à 1024) et markMissingGlyphs (bool, vrai).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_fonts.setup(tool_in)`

Appelé par l'outil : liste les atlas existants, enregistre la section « Fonts » (ordre 1030), l'onglet « Fonts » du navigateur (ordre 40), la fenêtre d'aperçu, les callbacks d'update et d'interface, puis indique à l'API le dossier des atlas (api.setFontTextureAtlasPath).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Champs

| Champ | Type | Description |
|---|---|---|
| `supportedFontFileFormats` | table | Filtres de la boîte de fichier pour choisir une police : tous les fichiers, fichiers police (.ttf, .TTF) et fichiers TTF. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/fonts.lua`.*
