# `editor_util_searchUtil`

*Fichier : `lua/ge/extensions/editor/util/searchUtil.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/searchUtil")` (fichier sous extensions/ mais pas une extension classique)

Aide d'éditeur pour la recherche floue avec classement « frecency » (fréquence/récence d'usage). Le module renvoie un constructeur : require('/lua/ge/extensions/editor/util/searchUtil')(). On appelle startSearch, queryElement pour chaque candidat, puis finishSearch qui renvoie les résultats triés par score final. Fournit aussi un combo imgui avec recherche intégrée (beginSearchableSimpleCombo).

## Exemple

```lua
local s = require('/lua/ge/extensions/editor/util/searchUtil')()
s:startSearch('veh')
for _, e in ipairs(liste) do s:queryElement({name = e, frecencyId = e}) end
local res = s:finishSearch()
```

## Remarques

- matchStringScore(name, match, ignoreEarly) est exposé en C.matchStringScore : score = caractères appariés / longueur du libellé (jusqu'à 7 occurrences), mélangé à 50 % avec un bonus de position précoce.
- Score final = score*(1-frecencyWeight) + frecency*frecencyWeight, frecencyWeight = 0.5.
- Frecency : 1/1.25^(jours écoulés) ; la valeur stockée est os.time() du dernier usage. updateFrecencyEntry annule la mise à jour précédente si elle date de moins de 10 s.
- beginSearchableSimpleCombo utilise ffi.string sans déclarer ffi localement (dépend de la globale ffi) ; imgui est reçu en paramètre.

## Classe `C`

Instance de recherche.

Le module renvoie un constructeur : `local obj = require("editor_util_searchUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags)` | Dessine un combo imgui avec champ de recherche, bouton X et liste filtrée (140 px de haut, mise à l'échelle UI). Renvoie l'élément cliqué. | 131 |
| `C:finishSearch()` | Calcule frecency et finalScore de chaque résultat, trie (finalScore décroissant) et renvoie la liste. | 77 |
| `C:getFrecencyData()` | Renvoie la table de frecency. | 98 |
| `C:getFrecencyScore(fId)` | Score de récence entre 0 et 1 (0 si inconnu). | 122 |
| `C:init()` | Installe la fonction de score et de départage par défaut (par nom) et frecencyWeight = 0.5. | 48 |
| `C:queryElement(elem, scoringFunction)` | Évalue un élément : écrit elem.score et l'ajoute aux résultats si le score est > 0. | 69 |
| `C:setFrecencyData(frecencyData)` | Définit la table frecencyId -> horodatage. | 94 |
| `C:setSameScoreResolvingFunction(fun)` | Remplace la fonction de départage (a, b) -> boolean utilisée à score final égal. | 59 |
| `C:setScoringFunction(fun)` | Remplace la fonction de score (element, match) -> number. | 55 |
| `C:startSearch(matchString)` | Démarre une recherche : vide les résultats, mémorise la chaîne cherchée et oublie l'annulation de frecency. | 63 |
| `C:updateFrecencyEntry(fId)` | Marque un identifiant comme utilisé maintenant (os.time()). Si la mise à jour précédente date de 10 s ou moins, elle est d'abord annulée. | 103 |

## Classe `self`

Champs de fonction posés sur l'instance par init.

Objet `self` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `self.sameScoreResolvingFunction(a, b)` | Départage par défaut : a.name < b.name. | 43 |
| `self.scoringFunction(element, match)` | Score par défaut : matchStringScore(element.name, match). | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/searchUtil.lua`.*
