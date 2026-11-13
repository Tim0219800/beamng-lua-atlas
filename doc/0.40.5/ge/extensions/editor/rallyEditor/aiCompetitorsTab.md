# `editor_rallyEditor_aiCompetitorsTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua` · VM : Game Engine (GE) · 344 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/aiCompetitorsTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « AI Competitors Configuration » de l'éditeur de rallye. Il permet de régler les paramètres globaux du modèle de résultats des concurrents IA (26 curseurs regroupés), le temps de référence de la spéciale et les traits d'un concurrent à la fois (Pace = skill, Consistency, Risk), avec un aperçu en direct : parts de chaque résultat en % et courbe de distribution des temps d'arrivée. Boutons Reload / Save : relit ou écrit gameplay/rally/aiCompetitorsConfig.json via aiCompetitorsEditorModel. Le module renvoie une fonction sans argument qui crée l'onglet : require('/lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab')().

## Remarques

- Les modifications ne sont écrites sur disque qu'avec le bouton Save ; le temps de référence saisi est enregistré dans ui.default_player_time_sec (minimum 1 s, défaut 100 s).
- Les valeurs chargées sont bornées à la plage de leur curseur (clampParamToSliderRange).
- Bug : drawTraitSliders lit aiCompetitorsTexts.driverPreviewSection.emptycompetitors (minuscules) alors que la clé définie est emptyCompetitors ; si la liste de concurrents était vide, im.Text recevrait nil. Peu probable en pratique car configWithDefaults fournit toujours au moins un concurrent.
- Un seul concurrent est prévisualisé à la fois ; Prev / Next recopient d'abord les curseurs dans le concurrent courant.

## Classe `Panel`

Onglet de configuration des concurrents IA (windowDescription = « AI Competitors Configuration »). Champs principaux : competitors (liste copiée pour l'édition), ui, selectedCompetitorIndex, generalFloatPtrs (un FloatPtr par paramètre général), referenceTimePtr et traitSkillPtr / traitConsistencyPtr / traitRiskPtr. Appelé par la fenêtre de l'éditeur de rallye (draw).

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_aiCompetitorsTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `Panel:applyGeneralTable(general)` | Applique une table de paramètres généraux aux curseurs, chaque valeur étant bornée à sa plage. | 73 |
| `Panel:applySelectedCompetitorToTraitSliders()` | Met les curseurs de traits aux valeurs du concurrent sélectionné (index borné à la liste ; valeur par défaut ui.default_slider_value ou 0.5 si le trait est absent). | 97 |
| `Panel:buildVisualization()` | Synchronise les traits puis calcule les données d'aperçu (aiCompetitorsEditorPreview.computeVisualization) avec les traits ramenés à [0,1] selon slider_min/slider_max. | 146 |
| `Panel:competitorDisplayName(competitor)` | Renvoie le nom affichable d'un concurrent, ou « ? » s'il est absent ou vide. | 111 |
| `Panel:draw(_mouseInfo, _dtReal, _dtSim, _dtRaw)` | Appelé à chaque frame par la fenêtre de l'éditeur de rallye : barre d'outils (Reload / Save), parts de résultats, graphique, puis deux colonnes (paramètres généraux, référence et concurrents). Les arguments sont ignorés. | 288 |
| `Panel:drawGeneralParameterGroups()` | Dessine les groupes de curseurs des paramètres généraux avec titres, descriptions, infobulles et valeur formatée. | 161 |
| `Panel:drawReferenceAndDriversColumn()` | Dessine la colonne de droite : champ du temps de référence puis les curseurs de traits. | 254 |
| `Panel:drawTraitSliders()` | Dessine la navigation Prev / Next entre concurrents et les curseurs Pace, Consistency et Risk. | 197 |
| `Panel:gatherGeneralTable()` | Relit les valeurs des curseurs dans une table des paramètres généraux. | 62 |
| `Panel:init()` | Crée les pointeurs ImGui (paramètres généraux par défaut, temps de référence, traits à 0.5) puis charge le fichier de configuration. | 46 |
| `Panel:loadFromDisk()` | Relit la configuration (loadRawConfig puis configWithDefaults), met à jour curseurs, concurrents, ui et temps de référence, et resélectionne le premier concurrent. | 122 |
| `Panel:parseReferenceTimeSeconds()` | Valide le temps de référence saisi : remplace une valeur invalide (NaN) par la valeur par défaut et impose un minimum de 1 s. | 133 |
| `Panel:syncTraitsIntoSelectedCompetitor()` | Copie les trois curseurs de traits dans le concurrent sélectionné (sans effet si aucun concurrent ou index invalide). | 82 |
| `Panel:trySaveToDisk()` | Synchronise les traits, met à jour ui.default_player_time_sec et écrit le fichier via saveConfig ; journalise « Wrote ... » (I) ou « Failed to save ... » (E). | 271 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua`.*
