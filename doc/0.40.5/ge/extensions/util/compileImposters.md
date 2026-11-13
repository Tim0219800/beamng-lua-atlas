# `util_compileImposters`

*Fichier : `lua/ge/extensions/util/compileImposters.lua` · VM : Game Engine (GE) · 126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_compileImposters` : `extensions.load("util_compileImposters")`, puis la globale `util_compileImposters`

Outil de build hors-ligne : pour une liste de niveaux, démarre chaque niveau en freeroam, attend qu'il soit chargé puis déclenche la compilation des imposters (Engine.Render.updateImposters(true)). Un compteur lié aux logs de la console sert à attendre que le moteur ait fini de travailler. Si la durée dépasse 6000 frames sans fin de job, le jeu s'arrête (shutdown(0)).

## Exemple

```lua
util_compileImposters.compileImposters({'west_coast_usa', 'italy'})
```

## Remarques

- L'extension se met en déchargement manuel (setExtensionUnloadMode) dans onInit.
- Séquence par niveau : attente de core_levels et freeroam_freeroam, attente de l'activation des mods (onModManagerReady), 10 s, démarrage du niveau (essais toutes les 8 s), 120 s, attente d'une période sans log, updateImposters, 20 s, nouvelle attente sans log.
- logCooldown : fixé à 6000 à chaque ligne de log (onConsoleLog), décrémenté à chaque frame (onPreRender) ; les attentes se terminent quand il atteint 0.
- Un seul job à la fois : un second appel pendant un traitement logue une erreur et renvoie false. Sinon la fonction ne renvoie rien.
- Une valeur de frame est remise à 0 aux étapes ; si frame dépasse 6000 sans être remis à 0, le jeu s'arrête (délai d'attente dépassé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_compileImposters.compileImposters(queue)` | Lance le traitement d'une file de niveaux dans un job (un job à la fois). | 92 |
| `util_compileImposters.onConsoleLog(timer, lvl, origin, line)` | Hook appelé à chaque ligne de log ; remet logCooldown à 6000 (le moteur est considéré actif). *(interne)* *(hook)* | 121 |
| `util_compileImposters.onInit()` | Hook d'initialisation : passe l'extension en déchargement manuel. *(interne)* *(hook)* | 12 |
| `util_compileImposters.onModManagerReady(mod)` | Hook appelé quand le gestionnaire de mods est prêt : autorise la suite du job. *(interne)* *(hook)* | 117 |
| `util_compileImposters.onPreRender(dt)` | Hook appelé avant chaque rendu : décompte logCooldown et surveille le délai maximal (6000 frames) pendant un traitement. *(interne)* *(hook)* | 101 |

### Détail des paramètres

#### `util_compileImposters.compileImposters(queue)`

Lance le traitement d'une file de niveaux dans un job (un job à la fois).

- `queue` (*string[]*) : Noms de niveaux à traiter (passés à freeroam_freeroam.startFreeroamByName).
- **renvoie** : boolean|nil false si un traitement est déjà en cours, sinon nil.

#### `util_compileImposters.onConsoleLog(timer, lvl, origin, line)`

Hook appelé à chaque ligne de log ; remet logCooldown à 6000 (le moteur est considéré actif).

- `timer` (*any*) : Horodatage (non utilisé).
- `lvl` (*string*) : Niveau de log.
- `origin` (*string*) : Origine du log.
- `line` (*string*) : Texte du log.

#### `util_compileImposters.onModManagerReady(mod)`

Hook appelé quand le gestionnaire de mods est prêt : autorise la suite du job.

- `mod` (*any*) : Non utilisé.

#### `util_compileImposters.onPreRender(dt)`

Hook appelé avant chaque rendu : décompte logCooldown et surveille le délai maximal (6000 frames) pendant un traitement.

- `dt` (*number*) : Durée de la frame (s).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/compileImposters.lua`.*
