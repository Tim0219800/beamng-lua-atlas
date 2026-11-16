# `editor_rallyEditor_pacenotes_calibrationAnalysisExport`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua` · VM : Game Engine (GE) · 1021 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_pacenotes_calibrationAnalysisExport` : `extensions.load("editor_rallyEditor_pacenotes_calibrationAnalysisExport")`, puis la globale `editor_rallyEditor_pacenotes_calibrationAnalysisExport`

Exporte les données de calibration des virages d'un carnet de rallye vers un fichier JSON destiné à être analysé (par exemple par un LLM) pour ajuster les seuils d'intensité et de longueur des virages. Pour chaque pacenote non TODO, il remesure le virage sur la snaproad et sérialise les mesures, les étiquettes manuelles (métadonnées de calibration), les ajustements, l'aperçu composé et le contexte des waypoints, avec la calibration courante, les surcharges actives et des instructions d'analyse. Deux formats : v1 (complet, calibrationAnalysis.json) et v2 (compact avec comparaisons cible/projeté par intensité et longueur, calibrationAnalysis.v2.json). Utilisé par l'onglet Export de la fenêtre de calibration.

## Remarques

- Fichiers écrits : <missionDir>/rally/calibrationAnalysis.json et <missionDir>/rally/calibrationAnalysis.v2.json (dossier rally créé si besoin). Après écriture, le fichier est relu pour vérifier que le JSON se parse.
- Les pacenotes avec todo == true sont ignorés (comptés dans skippedTodoPacenoteCount). Le champ exportFilters.note du fichier parle de « todo == false » : même sens.
- Les nombres sont arrondis à 3 décimales ; les descripteurs (square, hairpin…) sont exclus de l'analyse numérique v2. Intensité = diamètre en mètres ; longueur = arcMeters.
- La snaproad est prise sur pacenotesWindow.snaproad, sinon sur path:getSnaproad(). Dans l'onglet Pacenotes la snaproad est stockée dans pacenoteToolsState.snaproad, donc le champ pacenotesWindow.snaproad est en pratique nil et c'est le repli path:getSnaproad() qui sert.
- La partition de la snaproad (pacenote sélectionné) est restaurée à la fin de build().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow)` | Construit la table d'export v1 en mémoire (version = 1) : identité du carnet, style de compositeur actif, calibration courante, surcharges, instructions, schéma, contexte, pacenotes et résumé. | 478 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow)` | Construit l'export compact v2 (version = 2) à partir de build() : plages de calibration, surcharges actives, analyse (distributions cible/projeté) et instructions. | 964 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow)` | Construit l'export v1, l'écrit sur disque et vérifie la relecture. | 546 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir)` | Chemin du fichier d'export v1 pour une mission. | 20 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow)` | Construit l'export v2, l'écrit sur disque et vérifie la relecture. Mêmes valeurs de retour que export(). | 991 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir)` | Chemin du fichier d'export v2 pour une mission. | 26 |

### Détail des paramètres

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow)`

Construit la table d'export v1 en mémoire (version = 1) : identité du carnet, style de compositeur actif, calibration courante, surcharges, instructions, schéma, contexte, pacenotes et résumé.

- `path` (*table|nil*) : Carnet.
- `pacenotesWindow` (*table|nil*) : Onglet Pacenotes (pour la snaproad).
- **renvoie** : table|nil Données d'export, ou nil en cas d'erreur.
- **renvoie** : string|nil Message d'erreur (pas de carnet, pas de calibration corner active, snaproad non chargée).

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow)`

Construit l'export compact v2 (version = 2) à partir de build() : plages de calibration, surcharges actives, analyse (distributions cible/projeté) et instructions.

- `path` (*table|nil*) : Carnet.
- `pacenotesWindow` (*table|nil*) : Onglet Pacenotes.
- **renvoie** : table|nil Données v2, ou nil.
- **renvoie** : string|nil Message d'erreur.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow)`

Construit l'export v1, l'écrit sur disque et vérifie la relecture.

- `path` (*table|nil*) : Carnet.
- `pacenotesWindow` (*table|nil*) : Onglet Pacenotes.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Chemin du fichier en cas de succès, sinon message d'erreur.
- **renvoie** : table|string|nil Données exportées en cas de succès ; en cas d'échec d'écriture, chemin du fichier.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir)`

Chemin du fichier d'export v1 pour une mission.

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : string|nil <missionDir>/rally/calibrationAnalysis.json, ou nil sans dossier.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow)`

Construit l'export v2, l'écrit sur disque et vérifie la relecture. Mêmes valeurs de retour que export().

- `path` (*table|nil*) : Carnet.
- `pacenotesWindow` (*table|nil*) : Onglet Pacenotes.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Chemin du fichier en cas de succès, sinon message d'erreur.
- **renvoie** : table|string|nil Données exportées, ou chemin en cas d'échec d'écriture.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir)`

Chemin du fichier d'export v2 pour une mission.

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : string|nil <missionDir>/rally/calibrationAnalysis.v2.json, ou nil sans dossier.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua`.*
