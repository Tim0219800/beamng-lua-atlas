# `ui_pause_providers_routeData_photomode`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/photomode.lua` · VM : Game Engine (GE) · 146 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_photomode` : `extensions.load("ui_pause_providers_routeData_photomode")`, puis la globale `ui_pause_providers_routeData_photomode`

Fournisseur de données du menu pause pour la page du mode photo. Il renvoie la charge utile (payload) fournie par ui_pause_photomode.getRoutePayload(), ou à défaut une charge utile de repli (contractVersion 6) où toutes les sections et fonctions sont désactivées (caméra, scène, effets, capture, upload, Steam, etc.) et où la supersampling vaut 1 avec des limites de 1 à 24.

## Remarques

- La charge utile de repli décrit aussi les limites de capture : superSampling et downscaleLevel de 1 à 24 (pas 1), seuil d'avertissement 9.

**Dépendances (chargées avant) :** `ui_pause_photomode`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_photomode.getPhotomodeData()` | Renvoie {mainPanelContent = {}, photomode = payload}, où payload vient de ui_pause_photomode.getRoutePayload() si disponible, sinon la charge utile de repli. | 133 |

### Détail des paramètres

#### `ui_pause_providers_routeData_photomode.getPhotomodeData()`

Renvoie {mainPanelContent = {}, photomode = payload}, où payload vient de ui_pause_photomode.getRoutePayload() si disponible, sinon la charge utile de repli.

- **renvoie** : table Données de la route photomode.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_photomode"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/photomode.lua`.*
