# `util_resolution`

*Fichier : `lua/ge/extensions/util/resolution.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_resolution` : `extensions.load("util_resolution")`, puis la globale `util_resolution`

Aide pour lire et changer la résolution de la fenêtre du jeu via GFXDevice. getVideoModeSnapshot renvoie la largeur, la hauteur et le mode d'affichage courants ; setWindowedResolution force une résolution précise en mode fenêtré (pas sans bordure). Pratique pour les captures d'écran à taille fixe ou les tests d'interface.

## Exemple

```lua
extensions.reload('util_resolution')
extensions.util_resolution.setWindowedResolution(1280, 720)
```

## Remarques

- setWindowedResolution ne fait rien (avec un log) si la résolution et le mode « Window » sont déjà actifs, et refuse les arguments non numériques.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_resolution.getVideoModeSnapshot()` | Lit le mode vidéo courant de GFXDevice. | 9 |
| `util_resolution.setWindowedResolution(width, height)` | Passe la fenêtre en mode « Window » à la résolution donnée (GFXDevice.setVideoMode). | 30 |

### Détail des paramètres

#### `util_resolution.getVideoModeSnapshot()`

Lit le mode vidéo courant de GFXDevice.

- **renvoie** : table|nil {width, height, displayMode} ou nil si GFXDevice.getVideoMode est indisponible

#### `util_resolution.setWindowedResolution(width, height)`

Passe la fenêtre en mode « Window » à la résolution donnée (GFXDevice.setVideoMode).

- `width` (*number*) : Largeur en pixels
- `height` (*number*) : Hauteur en pixels

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/resolution.lua`.*
