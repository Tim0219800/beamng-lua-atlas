# `editor_missionEditor_conditions`

*Fichier : `lua/ge/extensions/editor/missionEditor/conditions.lua` · VM : Game Engine (GE) · 395 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/conditions")` (fichier sous extensions/ mais pas une extension classique)

Éditeur de conditions du Mission Editor, utilisé deux fois par missionEditor.lua : « Start Condition » (champ startCondition) et « Visibility Conditions » (champ visibleCondition). Au démarrage, il charge tous les fichiers de /lua/ge/extensions/gameplay/missions/unlocks/conditions/ (via FS:findFiles et require) et fusionne leurs tables de conditions ; chaque type de condition dispose d'un affichage ImGui adapté (mission, valeur, comparaison numérique, niveau de carrière, catégorie WP, constructeur, disposition de transmission, propulsion, branche, ligue, conditions imbriquées). Le module renvoie un constructeur : require(...)(missionEditor, field, name).

## Remarques

- Les conditions sont stockées dans mission[field] sous forme {type = '...', ...} ; les conditions imbriquées sont dans condition.nested (bouton « Add » ajoute {type = 'always'}).
- Le champ progressKey d'une condition de progression accepte 'any' (n'importe quelle clé) et 'default' (clé par défaut).
- Bug : getMissionIssues teste d'abord si mission[field] est nil, mais n'arrête pas la fonction ; la ligne suivante lit alors .type sur nil et provoque une erreur.
- L'état de dessin (index, depth) est global au module, partagé par toutes les instances ; il est remis à zéro dans draw.
- Les conditions disponibles dépendent des fichiers présents dans le dossier unlocks/conditions ; les clés en double sont écrasées par le dernier fichier lu.

## Classe `C`

Sous-fenêtre d'édition d'une condition de mission.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_conditions")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine la condition de la mission (par défaut {type='always'}) avec son libellé, de façon récursive pour les conditions imbriquées. | 228 |
| `C:getMissionIssues(m)` | Appelle setMission puis renvoie les problèmes : aucune condition définie (error), ou condition réglée sur « never » (error). | 46 |
| `C:init(missionEditor, field, name)` | Constructeur : mémorise missionEditor, le champ édité et le libellé affiché, puis charge toutes les conditions disponibles depuis gameplay/missions/unlocks/conditions/. | 27 |
| `C:setMission(mission)` | Sélectionne la mission à éditer et vide le cache des champs de saisie. | 41 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/conditions.lua`.*
