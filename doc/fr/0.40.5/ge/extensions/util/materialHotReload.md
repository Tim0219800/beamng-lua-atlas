# `util_materialHotReload`

*Fichier : `lua/ge/extensions/util/materialHotReload.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_materialHotReload` : `extensions.load("util_materialHotReload")`, puis la globale `util_materialHotReload`

Rechargement à chaud des fichiers *.materials.json et *.material.json : quand l'un d'eux est modifié sur disque, l'extension le relit (loadJsonMaterialsFile, qui met à jour les objets Material en mémoire) puis appelle reload() sur chaque matériau de classe « Material » déclaré dans le fichier. Utile à un créateur de matériaux/textures pour voir ses changements sans relancer le niveau.

## Exemple

```lua
extensions.load('util_materialHotReload')
```

## Remarques

- L'extension se met en mode de déchargement « manual » (setExtensionUnloadMode) : elle reste chargée entre les niveaux.
- Seuls les événements de type "modified" sont traités ; la création ou la suppression de fichiers est ignorée.
- Dans onFileChanged, le paramètre nommé type masque la fonction globale type() ; ça ne pose pas de problème dans cette fonction car elle ne l'appelle pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_materialHotReload.onFileChanged(filename, type)` | Hook appelé quand un fichier surveillé change sur disque. Si c'est une modification d'un fichier de matériaux, recharge le fichier et les matériaux concernés puis logue le nombre de matériaux rechargés. *(interne)* *(hook)* | 30 |
| `util_materialHotReload.onInit()` | Appelé à l'initialisation de l'extension : demande qu'elle reste chargée lors des changements de niveau ou de mode. *(interne)* *(hook)* | 36 |

### Détail des paramètres

#### `util_materialHotReload.onFileChanged(filename, type)`

Hook appelé quand un fichier surveillé change sur disque. Si c'est une modification d'un fichier de matériaux, recharge le fichier et les matériaux concernés puis logue le nombre de matériaux rechargés.

- `filename` (*string*) : Chemin du fichier modifié
- `type` (*string*) : Type de changement ; seul "modified" est traité

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/materialHotReload.lua`.*
