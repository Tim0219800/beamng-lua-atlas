# `editor_raceEditor_timeTrials`

*Fichier : `lua/ge/extensions/editor/raceEditor/timeTrials.lua` · VM : Game Engine (GE) · 250 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/timeTrials")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Time Trials » de l'éditeur de course : métadonnées du circuit (nom, description, auteurs, difficulté Easy/Medium/Hard/Very Hard), indicateurs de classification (Reversible, Rolling Start, calculés par path:classify()), présence d'une image d'aperçu <nom>.jpg à côté du fichier de course, et trois listes de prefabs (prefabs, forwardPrefabs, reversePrefabs) à charger avec le circuit. Chaque changement passe par editor.history. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/timeTrials')(raceEditor).

## Remarques

- Difficulté : stockée comme entier ; le choix de la liste écrit (i-1)*25+12 (12, 37, 62, 87) ; l'affichage inverse avec floor(d/25)+1 borné entre 1 et 4.
- Prefab automatique : <nom du fichier>.prefab, <nom>_forward.prefab, <nom>_reverse.prefab (chargés s'ils existent). Les prefabs forward ne se chargent que dans le sens normal, les reverse que dans le sens inverse (infobulles du code).
- Bug : dans C:existsIcon, « local levelPath » est redéclaré dans le bloc « if lvl », ce qui masque la variable externe ; le paramètre inPathFolder n'a donc aucun effet et le chemin testé reste le dossier du chemin de course.
- Dans prefabData, le nom du troisième groupe affiche « ReversePrefabs » avec une espace initiale (coquille).

## Classe `C`

Fenêtre Time Trials (windowDescription = 'Time Trials'). Instanciée avec init(raceEditor) ; le module est stocké dans self.pathEditor.

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_timeTrials")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeField(field, new, add)` | Si la nouvelle valeur diffère de path[field], valide une action d'historique qui modifie ce champ du chemin. | 65 |
| `C:displayClassification(classification, name, field, tt)` | Affiche une ligne « nom : » avec une icône coche ou croix selon classification[field]. | 148 |
| `C:draw()` | Appelé à chaque frame : dessine les informations générales. | 58 |
| `C:drawGeneralInfo()` | Dessine tout le formulaire : champs texte, difficulté, classification, indicateur d'aperçu (survol = image, clic = actualiser) et listes de prefabs. | 74 |
| `C:drawPrefabs(fieldName, default)` | Dessine la liste de prefabs d'un champ : entrée automatique en lecture seule, puis pour chaque prefab suppression, saisie, sélecteur de fichier et icône d'existence, et bouton Add. | 195 |
| `C:existsIcon(f, inPathFolder)` | Affiche une icône coche (fichier trouvé) ou erreur (introuvable) pour un prefab, en testant plusieurs chemins (avec/sans .prefab, .prefab.json, .json, dossier du niveau ou du chemin). L'infobulle liste le fichier trouvé ou les chemins essayés. | 159 |
| `C:findPreview()` | Cherche <dossier><nom du fichier>.jpg ; si présent, le charge comme texture d'aperçu, sinon efface l'aperçu. | 48 |
| `C:init(raceEditor)` | Mémorise le module raceEditor dans self.pathEditor. | 24 |
| `C:selected()` | Recharge nom, description, auteurs et listes de prefabs depuis le chemin, puis cherche l'image d'aperçu. | 32 |
| `C:setPath(path)` | Définit le chemin de course édité et recharge les champs de la fenêtre (appelle selected()). | 28 |
| `C:unselect()` | Appelé quand l'onglet est quitté ; ne fait rien. | 56 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/timeTrials.lua`.*
