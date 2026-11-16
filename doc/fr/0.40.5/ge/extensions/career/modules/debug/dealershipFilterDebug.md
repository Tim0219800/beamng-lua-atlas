# `career_modules_debug_dealershipFilterDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua` · VM : Game Engine (GE) · 225 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_dealershipFilterDebug` : `extensions.load("career_modules_debug_dealershipFilterDebug")`, puis la globale `career_modules_debug_dealershipFilterDebug`

Outil de debug « General > Filter Debug » : fenêtre ImGui où l'on colle un JSON de filtre de concessionnaire (filter avec whiteList/blackList, subFilters avec probability…) ; le JSON est décodé à chaque modification, le filtre est appliqué (via util/configListGenerator) et le résultat est affiché en tableau. Utile pour régler les filtres de véhicules d'un concessionnaire.

## Exemple

```lua
extensions.load("career/modules/debug/dealershipFilterDebug")
career_modules_debug_dealershipFilterDebug.show()
```

## Remarques

- show() permet d'ouvrir l'outil hors carrière : elle branche drawDebugMenu sur le hook onUpdate.
- Le message d'erreur de décodage est stocké dans une variable globale nommée 'error' (masque la fonction Lua error).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_dealershipFilterDebug.drawDebugMenu()` | Dessine la fenêtre 'Filter Debug Input' (zone de texte JSON, statut 'All Good :)' ou 'Decoding Error') puis les résultats du filtre. | 101 |
| `career_modules_debug_dealershipFilterDebug.show()` | Affiche l'outil hors carrière : M.onUpdate = drawDebugMenu puis extensions.hookUpdate('onUpdate'). | 218 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'General > Filter Debug'. |
| `debugOrder` | number | Ordre de tri dans la fenêtre de debug (11). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

**Charge les extensions :** `util/configListGenerator`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua`.*
