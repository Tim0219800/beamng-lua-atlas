# `gameplay_missions_unlocks_conditions_genericConditions`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks_conditions_genericConditions` : `extensions.load("gameplay_missions_unlocks_conditions_genericConditions")`, puis la globale `gameplay_missions_unlocks_conditions_genericConditions`

Types de condition génériques pour les déblocages de missions : never, missing, always et les combinateurs multiAnd / multiOr. Chargés par gameplay_missions_unlocks ; chaque type a conditionMet(c) (renvoie met et éventuellement la liste des résultats imbriqués) et getLabel(c).

## Remarques

- missing est utilisé quand le type de condition est inconnu, et renvoie true (la condition est donc considérée remplie).
- multiOr renvoie true si la liste nested est vide ; multiAnd aussi (aucun élément).
- always est marquée hidden = true (non affichée dans l'interface).

## Champs

| Champ | Type | Description |
|---|---|---|
| `always` | table | Toujours true ; hidden = true. |
| `missing` | table | Condition de repli pour un type invalide ou introuvable ; toujours true. |
| `multiAnd` | table | ET logique sur c.nested (chaque sous-condition évaluée via gameplay_missions_unlocks.conditionMet). Renvoie met, nested. editorFunction 'displayNestedCondition'. |
| `multiOr` | table | OU logique sur c.nested ; true si la liste est vide. Renvoie met, nested. editorFunction 'displayNestedCondition'. |
| `never` | table | Toujours false. Label littéral 'Never'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua`.*
