# `ui_gameBlur`

*Fichier : `lua/ge/extensions/ui/gameBlur.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameBlur` : `extensions.load("ui_gameBlur")`, puis la globale `ui_gameBlur`

Gère des rectangles de flou plein écran dessinés derrière l'interface (effet scenetree.ScreenBlurFX). Les rectangles sont rangés par groupes dans M.blurRects ; à chaque onPreRender ils sont envoyés à addFrameBlurRect. Coordonnées normalisées : (0,0) en haut à gauche, (1,1) en bas à droite.

## Exemple

```lua
ui_gameBlur.replaceGroup('monPanneau', { {0, 0.15, 1, 0.8, 1} })  -- x, y, w, h, opacité
ui_gameBlur.removeGroup('monPanneau')
```

## Remarques

- Chaque rectangle est une table {x, y, largeur, hauteur, alpha} (indices 1 à 5), la couleur est ColorF(1,1,1,alpha).
- Rien n'est dessiné si l'UI CEF est masquée (ui_visibility.getCef()), sauf si l'extension test_singleLevelLong est chargée, ni si une session OpenXR tourne.
- Bug : M.onExtensionLoaded, M.onExtensionUnloaded et M.setColor sont affectés à des variables locales jamais définies, donc valent nil.
- addToGroup et removeFromGroup existent mais ne sont pas exportés ; seuls replaceGroup, removeGroup et removeAllGroups sont publics.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameBlur.onPreRender()` | Hook de pré-rendu : envoie chaque rectangle au ScreenBlurFX (addFrameBlurRect) si l'UI est visible. *(interne)* *(hook)* | 48 |
| `ui_gameBlur.removeAllGroups()` | Supprime tous les groupes de rectangles de flou. | 39 |
| `ui_gameBlur.removeGroup(group)` | Supprime un groupe de rectangles. | 35 |
| `ui_gameBlur.replaceGroup(group, data)` | Remplace tous les rectangles d'un groupe par la liste donnée. | 31 |

### Détail des paramètres

#### `ui_gameBlur.removeGroup(group)`

Supprime un groupe de rectangles.

- `group` (*string*) : Nom du groupe.

#### `ui_gameBlur.replaceGroup(group, data)`

Remplace tous les rectangles d'un groupe par la liste donnée.

- `group` (*string*) : Nom du groupe.
- `data` (*table*) : Liste de rectangles {x, y, w, h, alpha}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Toujours nil (référence à une variable non définie). ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |
| `onExtensionUnloaded` | nil | Toujours nil (référence à une variable non définie). ⚠ référence `onExtensionUnloaded` non définie dans le fichier (vaut probablement nil) |
| `setColor` | nil | Toujours nil (référence à une variable non définie). ⚠ référence `setColor` non définie dans le fichier (vaut probablement nil) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameBlur.lua`.*
