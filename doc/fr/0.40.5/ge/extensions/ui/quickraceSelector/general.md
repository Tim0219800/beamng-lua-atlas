# `ui_quickraceSelector_general`

*Fichier : `lua/ge/extensions/ui/quickraceSelector/general.lua` · VM : Game Engine (GE) · 21 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_quickraceSelector_general` : `extensions.load("ui_quickraceSelector_general")`, puis la globale `ui_quickraceSelector_general`

Backend du sélecteur en grille de l'assistant Vue « Quickrace » : expose la liste des niveaux et, pour chaque niveau, sa liste de pistes. Le module ne contient aucune logique propre : il crée un backend avec ui/oneshotRaceSelector/core à partir du descripteur partagé quickRaceTrackDescriptor (identifiant "quickraceSelector") puis recopie toutes ses fonctions dans M.

## Remarques

- Dépend de scenario_quickRaceLoader, chargé avant.
- Les fonctions réellement exposées sont celles de createBackend (définies dans ui/oneshotRaceSelector/core.lua) ; elles ne sont pas visibles dans ce fichier.

**Dépendances (chargées avant) :** `scenario_quickRaceLoader`

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions à charger avant : {"scenario_quickRaceLoader"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/quickraceSelector/general.lua`.*
