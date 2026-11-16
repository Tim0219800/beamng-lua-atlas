# `editor_rallyEditor_aiCompetitorsEditorModel`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_aiCompetitorsEditorModel` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorModel`

Modèle de données de l'onglet « AI Competitors » de l'éditeur de rallye. Il lit et écrit le fichier JSON gameplay/rally/aiCompetitorsConfig.json (sections general, competitors, ui), fournit les valeurs par défaut des 26 paramètres généraux du modèle de mélange de résultats (Safe, Push, Minor Mistake, Major Issue, DNF) et de 5 concurrents (A à E, traits skill/consistency/risk à 0.5), les bornes des curseurs, le formatage des valeurs et les groupes de paramètres affichés dans l'interface. Les calculs de mélange viennent de gameplay/rally/aiCompetitors, réexposés ici (computeMixtureWeights, mixtureDensityTimes).

## Remarques

- Les traits d'un concurrent (skill, consistency, risk) sont ramenés à [0, 1] ; si l'une des trois valeurs dépasse 1, les trois sont divisées par 100 (échelle 0-100 acceptée). Les chaînes sont converties avec tonumber (0.5 sinon).
- À la lecture, la liste competitors est prise dans raw.competitors, sinon raw.drivers, sinon le préréglage A à E.
- Seules les clés connues de defaultGeneral sont acceptées dans mergeGeneral ; les autres sont ignorées.
- À l'écriture, les nombres sont arrondis à 3 décimales (les valeurs quasi entières deviennent des entiers).
- Le champ ui.rng_seed vaut nil par défaut, donc il n'apparaît pas dans defaultUiDict.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value)` | Borne une valeur à la plage du curseur du paramètre (inchangée si le paramètre est inconnu). | 284 |
| `editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw)` | Complète une configuration brute avec les valeurs par défaut : general fusionné, competitors normalisés (traits dans [0,1]), ui fusionné. | 135 |
| `editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict()` | Renvoie les réglages d'interface par défaut : default_player_time_sec 100, default_appearance_mode « dark », default_color_theme « blue », window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5. | 70 |
| `editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName)` | Transforme un nom snake_case en libellé (ex. « risk_tail_exponent » donne « Risk Tail Exponent »). | 314 |
| `editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value)` | Formate un paramètre selon sa grandeur : 2 décimales si \|v\| ≥ 100, 3 si ≥ 10, 4 si ≥ 1, sinon 5 chiffres significatifs. | 299 |
| `editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig()` | Lit configPath avec jsonReadFile ; renvoie une table vide si le fichier est absent ou invalide. | 160 |
| `editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides)` | Renvoie une copie des paramètres généraux par défaut, surchargés par les clés connues et non nil de overrides. | 58 |
| `editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable)` | Écrit {general, competitors, ui} (nombres arrondis à 3 décimales) dans configPath avec jsonWriteFile (joli format). | 211 |
| `editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax)` | Convertit une valeur de curseur en [0, 1] ; si l'étendue est ≤ 0, borne simplement la valeur. | 322 |

### Détail des paramètres

#### `editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value)`

Borne une valeur à la plage du curseur du paramètre (inchangée si le paramètre est inconnu).

- `fieldName` (*string*) : Nom du paramètre général.
- `value` (*number|string*) : Valeur (convertie par tonumber, 0 si invalide).
- **renvoie** : number Valeur bornée.

#### `editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw)`

Complète une configuration brute avec les valeurs par défaut : general fusionné, competitors normalisés (traits dans [0,1]), ui fusionné.

- `raw` (*table|nil*) : Configuration lue (general, competitors ou drivers, ui).
- **renvoie** : table general.
- **renvoie** : table<integer, table> Liste des concurrents normalisés.
- **renvoie** : table ui.

#### `editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict()`

Renvoie les réglages d'interface par défaut : default_player_time_sec 100, default_appearance_mode « dark », default_color_theme « blue », window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5.

- **renvoie** : table Table ui par défaut.

#### `editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName)`

Transforme un nom snake_case en libellé (ex. « risk_tail_exponent » donne « Risk Tail Exponent »).

- `snakeName` (*string*) : Nom du paramètre.
- **renvoie** : string Libellé.

#### `editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value)`

Formate un paramètre selon sa grandeur : 2 décimales si |v| ≥ 100, 3 si ≥ 10, 4 si ≥ 1, sinon 5 chiffres significatifs.

- `value` (*number|string*) : Valeur à formater.
- **renvoie** : string Texte formaté.

#### `editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig()`

Lit configPath avec jsonReadFile ; renvoie une table vide si le fichier est absent ou invalide.

- **renvoie** : table Données brutes.

#### `editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides)`

Renvoie une copie des paramètres généraux par défaut, surchargés par les clés connues et non nil de overrides.

- `overrides` (*table|nil*) : Valeurs à surcharger.
- **renvoie** : table<string, number> Paramètres généraux complets.

#### `editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable)`

Écrit {general, competitors, ui} (nombres arrondis à 3 décimales) dans configPath avec jsonWriteFile (joli format).

- `generalTable` (*table*) : Paramètres généraux.
- `competitorsList` (*table<integer, table>*) : Liste des concurrents.
- `uiTable` (*table*) : Réglages d'interface.
- **renvoie** : boolean Résultat de jsonWriteFile.

#### `editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax)`

Convertit une valeur de curseur en [0, 1] ; si l'étendue est ≤ 0, borne simplement la valeur.

- `value` (*number*) : Valeur du curseur.
- `sliderMin` (*number*) : Minimum du curseur.
- `sliderMax` (*number*) : Maximum du curseur.
- **renvoie** : number Valeur normalisée entre 0 et 1.

## Champs

| Champ | Type | Description |
|---|---|---|
| `computeMixtureWeights` | function | Alias de gameplay/rally/aiCompetitors.computeMixtureWeights. |
| `configPath` | string | Chemin du fichier de configuration : « gameplay/rally/aiCompetitorsConfig.json ». |
| `generalFieldNames` | table<integer, string> | Noms des paramètres généraux, triés alphabétiquement. |
| `generalParamGroups` | table<integer, table> | Groupes d'affichage {title, blurb, fields} : Stage limits, Safe & Push, Incidents & DNF, Pace vs reference, Base std dev, Consistency on std dev. |
| `generalSliderBounds` | table<string, {lo: number, hi: number}> | Bornes min/max des curseurs pour chaque paramètre général. |
| `mixtureDensityTimes` | function | Alias de gameplay/rally/aiCompetitors.mixtureDensityTimes. |
| `numOutcomes` | integer | Nombre de résultats possibles (5). |
| `outcomeDnf` | integer | Indice (5) du résultat DNF / Terminal. |
| `outcomeLabels` | table<integer, string> | Libellés : Safe / Clean, Push / Aggressive, Minor Mistake, Major Issue, DNF / Terminal. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua`.*
