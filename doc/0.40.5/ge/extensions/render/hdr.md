# `render_hdr`

*Fichier : `lua/ge/extensions/render/hdr.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_hdr` : `extensions.load("render_hdr")`, puis la globale `render_hdr`

Crée au premier frame la chaîne d'effets de post-traitement HDR (exposition automatique/locale) : PostEffectBrightPass (rendu AfterPostFX à échelle 0.5) avec ses enfants PostEffectDownScale, PostEffectLuminance et PostEffectCombinePass, plus PostEffectLocalExposure (échelle 0.25) dont le biais d'exposition en EV vient du réglage GraphicEVCompensation. Aucun usage direct par un moddeur ; global : render_hdr.

## Remarques

- Ne fait rien si l'unique adaptateur graphique est « GFX Null Device » (serveur sans GPU) : log d'erreur « Null graphics device detected ».
- Chaque objet n'est créé que s'il n'existe pas déjà dans le scenetree (recherche par nom PostEffect…Object) ; seul exposureBiasEV de PostEffectLocalExposureObject est mis à jour à chaque appel.
- La variable `initialized` n'est jamais mise à true dans onFirstUpdate (seulement par onDeserialized) : le garde-fou n'agit donc qu'après un rechargement Lua ; la création reste idempotente grâce aux recherches par nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_hdr.onDeserialized(data)` | Après rechargement Lua : restaure le drapeau initialized. *(interne)* *(hook)* | 61 |
| `render_hdr.onFirstUpdate()` | Hook du premier update du jeu : crée (si absents) les objets de post-traitement HDR décrits ci-dessus et applique le biais d'exposition GraphicEVCompensation (réglage, en EV, 0 par défaut). *(interne)* *(hook)* | 9 |
| `render_hdr.onSerialize()` | Avant rechargement Lua. *(interne)* *(hook)* | 57 |

### Détail des paramètres

#### `render_hdr.onDeserialized(data)`

Après rechargement Lua : restaure le drapeau initialized.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `render_hdr.onSerialize()`

Avant rechargement Lua.

- **renvoie** : table {initialized = true}

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/hdr.lua`.*
