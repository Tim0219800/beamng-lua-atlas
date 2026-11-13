# `util_photomode`

*Fichier : `lua/ge/extensions/util/photomode.lua` · VM : Game Engine (GE) · 16 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_photomode` : `extensions.load("util_photomode")`, puis la globale `util_photomode`

Petit module du mode photo : liste les images PNG d'overlays disponibles dans ui/modules/photomode/ui-overlays (cadres, filigranes) que l'interface propose à l'utilisateur. Un moddeur peut y déposer ses propres PNG pour les rendre disponibles.

## Exemple

```lua
dump(extensions.util_photomode.getPhotomodeOverlays())
```

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_photomode.getPhotomodeOverlays()` | Liste les fichiers *.png de ui/modules/photomode/ui-overlays (non récursif). | 7 |

### Détail des paramètres

#### `util_photomode.getPhotomodeOverlays()`

Liste les fichiers *.png de ui/modules/photomode/ui-overlays (non récursif).

- **renvoie** : table[] Liste de tables {filename = chemin du PNG}

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/photomode.lua`.*
