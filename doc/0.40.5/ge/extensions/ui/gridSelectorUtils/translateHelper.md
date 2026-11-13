# `ui_gridSelectorUtils_translateHelper`

*Fichier : `lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorUtils_translateHelper` : `extensions.load("ui_gridSelectorUtils_translateHelper")`, puis la globale `ui_gridSelectorUtils_translateHelper`

Aide de traduction côté Lua pour les sélecteurs en grille. Traduit une clé avec `_tr`, résout les expressions imbriquées de style Angular (`{{ 'clé' | translate }}`, `{{ clé | translate }}`, `{{clé}}`) jusqu'à 10 passes, et met le résultat en cache par clé.

## Remarques

- Le cache (translateCache) n'est jamais vidé : un changement de langue en cours de session n'est pas pris en compte pour les clés déjà traduites.
- Le cache ne tient compte que de la clé, pas du `fallback` : le premier fallback utilisé reste.
- Le drapeau interne debugTranslations (false par défaut) randomiserait la première lettre de chaque mot ; il n'est pas modifiable depuis l'extérieur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorUtils_translateHelper.translate(key, fallback)` | Renvoie la traduction de la clé (via _tr, avec la clé comme repli par défaut), après résolution des traductions imbriquées. Si la clé n'est pas une chaîne, la renvoie telle quelle ou "Missing Translation Key!" si nil. | 85 |

### Détail des paramètres

#### `ui_gridSelectorUtils_translateHelper.translate(key, fallback)`

Renvoie la traduction de la clé (via _tr, avec la clé comme repli par défaut), après résolution des traductions imbriquées. Si la clé n'est pas une chaîne, la renvoie telle quelle ou "Missing Translation Key!" si nil.

- `key` (*string*) : Clé de traduction.
- `fallback` (*string|nil*) : Texte de repli passé à _tr (défaut : la clé).
- **renvoie** : string Texte traduit.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua`.*
