# `career_modules_debug_vehicleShoppingDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_vehicleShoppingDebug` : `extensions.load("career_modules_debug_vehicleShoppingDebug")`, puis la globale `career_modules_debug_vehicleShoppingDebug`

Onglet de debug carrière « Vehicle Shopping ». Relit les fichiers *.facilities.json du niveau courant pour obtenir les concessionnaires, simule le tirage de véhicules (util/configListGenerator) et affiche, par concessionnaire et par sous-filtre, les configurations qui correspondent (modèle, config, nom) avec probabilité normalisée, nombre d'éligibles et temps de calcul.

## Remarques

- Outil de développement ; debugOrder = 0.
- Charge util/configListGenerator et freeroam/facilities au besoin.
- Le champ de recherche filtre par sous-chaîne sur modèle, config et nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_vehicleShoppingDebug.drawDebugMenu()` | Dessine la fenêtre 'Vehicle Shopping - SubFilter Matches' : bouton Refresh (recalcul), compteurs, champ Search et résultats par concessionnaire/sous-filtre. *(interne)* | 127 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle Shopping'. |
| `debugOrder` | number | Ordre de tri (0). |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

**Charge les extensions :** `freeroam/facilities`, `util/configListGenerator`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua`.*
