# `ui_popup`

*Fichier : `lua/ge/extensions/ui/popup.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_popup` : `extensions.load("ui_popup")`, puis la globale `ui_popup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_popup.closeTutorialPopup()` |  | 104 |
| `ui_popup.collectPopupIdsFromRoot(root)` |  | 109 |
| `ui_popup.openAllPopupsFromRoot(options)` |  | 138 |
| `ui_popup.openContractSignPopup(options, additionalIds)` |  | 193 |
| `ui_popup.openDragTimeslipTutorialPopup(options, additionalIds)` |  | 171 |
| `ui_popup.openDrivingAssistsPopup(options)` |  | 152 |
| `ui_popup.openOptionalChallengeSelectionPopup(options)` |  | 162 |
| `ui_popup.openPopupById(id, options)` |  | 85 |
| `ui_popup.openPopupEntries(entries, options)` |  | 77 |
| `ui_popup.openPopupsByIds(ids, options)` |  | 91 |
| `ui_popup.readPopupEntryById(id, options)` |  | 15 |
| `ui_popup.resolveAssetPath(basePath, assetPath)` |  | 7 |
| `ui_popup.showDragTreeStagesPopup(options)` |  | 218 |

**Évènements UI (guihooks.trigger) :** `CloseTutorialPopup`, `OpenTutorialPopup`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/popup.lua`.*
