# `ui_appContainers_topRight`

*Fichier : `lua/ge/extensions/ui/appContainers/topRight.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appContainers_topRight` : `extensions.load("ui_appContainers_topRight")`, puis la globale `ui_appContainers_topRight`

Déclare le conteneur d'apps « topRight » (coin haut-droit de l'interface) auprès de ui_appContainers, avec le trigger UI setTopRightAppVisibility. La liste d'apps est vide dans 0.40.5 : le conteneur existe mais ne gère aucune app.

## Remarques

- Remplace l'ancien identifiant secondaryApps (voir ui_appContainers.resolveContainerId).

**Dépendances (chargées avant) :** `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appContainers_topRight.onExtensionLoaded()` | Appelé au chargement de l'extension : enregistre le conteneur topRight (sans app) via ui_appContainers.registerContainer. *(interne)* *(hook)* | 8 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "ui_appContainers" } : chargé avant ce module. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appContainers/topRight.lua`.*
