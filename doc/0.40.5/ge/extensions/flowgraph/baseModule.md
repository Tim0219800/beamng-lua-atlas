# `flowgraph_baseModule`

*Fichier : `lua/ge/extensions/flowgraph/baseModule.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `flowgraph_baseModule` : `extensions.load("flowgraph_baseModule")`, puis la globale `flowgraph_baseModule`

Classe de base des modules du gestionnaire flowgraph (les « modules » attachés au manager, par opposition aux nœuds). Elle définit une classe C avec des hooks vides (clear, onUpdate, executionStarted, executionStopped) que les modules dérivés surchargent. Le fichier n'est pas une extension utilisable seule : il est utilisé par les modules flowgraph via M.use(mgr, derivedClass).

## Exemple

```lua
local base = require('/lua/ge/extensions/flowgraph/baseModule')
local module = base.use(mgr, {
  onUpdate = function(self, dtReal, dtSim, dtRaw) end,
})
```

## Remarques

- C.moduleOrder = 0 : ordre de traitement des modules, les valeurs basses passent en premier.
- C.hooks est une table vide, destinée à déclarer les hooks gérés par le module.
- Les fonctions preTrigger/afterTrigger sont commentées dans le code (non disponibles).
- M.use n'appelle o:init() une seconde fois que si la classe dérivée a redéfini init (sans argument mgr dans ce cas).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_baseModule.createBase(...)` | Crée une instance de la classe de base : table avec C comme métatable, puis appelle init(...) (donc init(mgr)). *(interne)* | 27 |
| `flowgraph_baseModule.use(mgr, derivedClass)` | Crée un module de base, copie dessus tous les champs/méthodes de derivedClass (surcharge), puis rappelle init() si la classe dérivée l'a redéfini. *(interne)* | 35 |

### Détail des paramètres

#### `flowgraph_baseModule.createBase(...)`

Crée une instance de la classe de base : table avec C comme métatable, puis appelle init(...) (donc init(mgr)).

- `...` (*any*) : arguments transmis à init, normalement le manager flowgraph mgr
- **renvoie** : table instance du module de base

#### `flowgraph_baseModule.use(mgr, derivedClass)`

Crée un module de base, copie dessus tous les champs/méthodes de derivedClass (surcharge), puis rappelle init() si la classe dérivée l'a redéfini.

- `mgr` (*table*) : manager flowgraph propriétaire du module
- `derivedClass` (*table*) : table de méthodes/champs qui remplacent ceux de la base
- **renvoie** : table instance du module

## Classe `C`

Classe de base d'un module flowgraph. Les méthodes vides sont à surcharger.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clear()` | Hook vide « utilisable » par les modules dérivés pour vider leur état. | 15 |
| `C:executionStarted()` | Hook vide appelé au démarrage de l'exécution du flowgraph. | 18 |
| `C:executionStopped()` | Hook vide appelé à l'arrêt de l'exécution du flowgraph. | 17 |
| `C:init(mgr)` | Mémorise le manager dans self.mgr. | 10 |
| `C:onClear()` | Appelle self:executionStopped(). Sert de réaction au vidage du manager. | 19 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Hook vide appelé à chaque mise à jour du manager (surchargé par les modules). | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/baseModule.lua`.*
