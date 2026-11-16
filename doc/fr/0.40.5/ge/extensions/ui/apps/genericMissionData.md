# `ui_apps_genericMissionData`

*Fichier : `lua/ge/extensions/ui/apps/genericMissionData.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_genericMissionData` : `extensions.load("ui_apps_genericMissionData")`, puis la globale `ui_apps_genericMissionData`

Stocke des lignes d'information de mission (titre, texte, chrono) classées par catégorie et les envoie à l'app d'interface « genericMissionData » via guihooks.trigger('SetGenericMissionData'). Sert aux missions et au flowgraph pour afficher des données arbitraires triées par ordre. L'extension reste chargée en permanence (setExtensionUnloadMode manual).

## Exemple

```lua
ui_apps_genericMissionData.setData({category='time', title='Temps', txt='', minutes=1, seconds=23, milliseconds=450, order=1})
ui_apps_genericMissionData.setData({category='time', clear=true})
```

## Remarques

- La catégorie fournie est d'abord comparée comme motif Lua (string.match) aux catégories existantes : un motif comme 'time.*' met à jour ou efface plusieurs catégories d'un coup. Si rien ne correspond, la catégorie est utilisée telle quelle.
- Si order est absent, il vaut -(1 + nombre d'éléments) : les nouveaux éléments passent donc après les précédents dans l'ordre croissant.
- Incohérence : le test « args.msg ~= "" » utilise un champ msg qui n'est lu nulle part ailleurs ; il est donc presque toujours vrai.
- Le champ category stocké dans l'élément est celui de args (peut être le motif), pas la catégorie réelle appariée.
- Si l'ordre d'affichage change, tous les éléments sont renvoyés ; sinon seuls les éléments modifiés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_genericMissionData.clearData()` | Efface toutes les données et envoie 'SetGenericMissionDataResetAll' à l'interface. | 17 |
| `ui_apps_genericMissionData.onInit()` | Hook d'initialisation : place l'extension en déchargement manuel. *(interne)* *(hook)* | 6 |
| `ui_apps_genericMissionData.sendAllData()` | Renvoie à l'interface tous les éléments, dans l'ordre d'affichage (utile quand l'app se monte après coup). | 26 |
| `ui_apps_genericMissionData.setData(args)` | Ajoute, met à jour ou efface (clear=true) un élément de mission, puis envoie à l'interface les éléments concernés avec leur index. | 37 |

### Détail des paramètres

#### `ui_apps_genericMissionData.setData(args)`

Ajoute, met à jour ou efface (clear=true) un élément de mission, puis envoie à l'interface les éléments concernés avec leur index.

- `args` (*table*) : {category=string|nil ('default'), order=number|nil, clear=boolean|nil, title, txt, style, minutes, seconds, milliseconds}.

**Évènements UI (guihooks.trigger) :** `SetGenericMissionData`, `SetGenericMissionDataResetAll`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/genericMissionData.lua`.*
