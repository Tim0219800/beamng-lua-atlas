# `editor_toolUtilities_groundPass`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundPass.lua` · VM : Game Engine (GE) · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundPass` : `extensions.load("editor_toolUtilities_groundPass")`, puis la globale `editor_toolUtilities_groundPass`

Le terraformage unique du terrain sur lequel les outils de l'éditeur posent leurs objets. Les réseaux routier et ferré sont creusés ensemble en une seule passe, avec un seul fondu (le rail est prioritaire, PRIO.RAIL). La pente de site de City Builder est posée par-dessus comme seconde passe : levée avant la passe réseau et reposée après. Chaque bouton Build appelle run(), chaque Restore appelle restore().

## Exemple

```lua
local gp = require('editor/toolUtilities/groundPass')
gp.run({doi = 30})   -- terraformer les réseaux avec un fondu de 30 m
gp.restore()         -- remettre le terrain d'origine
```

## Remarques

- Un réseau s'enregistre avec register(id, source) ; source.features(out, p) ajoute ses éléments de terraformage. Hooks facultatifs : lift(), finish(), after(), records(), hasCarve().
- L'enregistrement de creusement (owner.terraBaseline) est lié au bloc de terrain et au niveau ; checkOwner l'abandonne si le bloc a changé.
- pass() refuse de travailler (journal W 'held: the road network is still rebuilding') tant que les sites sont occupés ; run() renvoie alors 0.
- Chaque passe est une transaction d'historique ('Build Ground', 'Restore Ground', 'Grade Sites') et appelle be:reloadCollision() si un terrain existe.
- Valeurs par défaut : doi 40 m, margin 10 m, falloff 2, smooth 5, roughness 0, scale 0.5, abutLen et abutShoulder pris dans roadNetwork/bridges (embankLenM, abutShoulderM).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundPass.applyParams(t)` | Applique des réglages sauvegardés : seules les clés existantes dont le type correspond sont reprises. Ignore un argument non table. | 189 |
| `editor_toolUtilities_groundPass.features(out, p)` | Ajoute à out les éléments de terraformage de chaque réseau enregistré, selon les réglages p (ceux partagés par défaut). Un réseau décoché (p[id] == false) est ignoré. | 51 |
| `editor_toolUtilities_groundPass.getParams()` | Copie des réglages, à garder dans le fichier de session de chaque outil. | 183 |
| `editor_toolUtilities_groundPass.getRecord()` | Renvoie l'enregistrement de creusement (garde-le entre rechargements Lua et dans les sessions). | 197 |
| `editor_toolUtilities_groundPass.hasCarve()` | Vrai si un creusement est mémorisé (enregistrement partagé ou chose que les sources auraient à remettre). | 150 |
| `editor_toolUtilities_groundPass.laySites()` | Repose la pente de site gardée levée par les passes holdSites, sur le terrain de la dernière passe, en une transaction 'Grade Sites'. Sans effet (0) si rien n'est en attente. | 129 |
| `editor_toolUtilities_groundPass.naturalGround()` | Renvoie la fonction height(x, y) du terrain avant tous les creusements (terraform.groundBefore). Reconstruite seulement si les enregistrements ont changé ; sans enregistrement elle lit le terrain vivant. | 162 |
| `editor_toolUtilities_groundPass.register(id, s)` | Enregistre (ou remplace, si l'id existe déjà) la source de terraformage d'un réseau. | 40 |
| `editor_toolUtilities_groundPass.reset()` | Nouveau niveau : oublie l'enregistrement de creusement, puisque le terrain n'est plus celui où il a été fait. | 209 |
| `editor_toolUtilities_groundPass.restore()` | Remet le terrain d'origine sous les réseaux et la pente de site par-dessus (transaction 'Restore Ground'). | 146 |
| `editor_toolUtilities_groundPass.run(p, laySites, holdSites)` | Terraforme les réseaux (si Terraform est actif) puis repose la pente des sites, en une transaction 'Build Ground'. | 121 |
| `editor_toolUtilities_groundPass.setRecord(bl)` | Restaure un enregistrement de creusement (doit être une table avec gx table et n > 0, sinon il est effacé). L'id du bloc est remis à nil : checkOwner rattache l'enregistrement par le niveau. | 202 |
| `editor_toolUtilities_groundPass.setSites(s)` | Branche la pente de site de City Builder (lift, lay, busy, record). | 48 |

### Détail des paramètres

#### `editor_toolUtilities_groundPass.applyParams(t)`

Applique des réglages sauvegardés : seules les clés existantes dont le type correspond sont reprises. Ignore un argument non table.

- `t` (*table*) : Réglages sauvegardés.

#### `editor_toolUtilities_groundPass.features(out, p)`

Ajoute à out les éléments de terraformage de chaque réseau enregistré, selon les réglages p (ceux partagés par défaut). Un réseau décoché (p[id] == false) est ignoré.

- `out` (*table*) : Liste de sortie.
- `p` (*table|nil*) : Réglages ; défaut params.
- **renvoie** : table La liste out.

#### `editor_toolUtilities_groundPass.getParams()`

Copie des réglages, à garder dans le fichier de session de chaque outil.

- **renvoie** : table Copie de params.

#### `editor_toolUtilities_groundPass.getRecord()`

Renvoie l'enregistrement de creusement (garde-le entre rechargements Lua et dans les sessions).

- **renvoie** : table|nil owner.terraBaseline.

#### `editor_toolUtilities_groundPass.hasCarve()`

Vrai si un creusement est mémorisé (enregistrement partagé ou chose que les sources auraient à remettre).

- **renvoie** : boolean Un creusement existe.

#### `editor_toolUtilities_groundPass.laySites()`

Repose la pente de site gardée levée par les passes holdSites, sur le terrain de la dernière passe, en une transaction 'Grade Sites'. Sans effet (0) si rien n'est en attente.

- **renvoie** : integer Résultat de sites.lay(), 0 si rien ou si le réseau est encore en reconstruction.

#### `editor_toolUtilities_groundPass.naturalGround()`

Renvoie la fonction height(x, y) du terrain avant tous les creusements (terraform.groundBefore). Reconstruite seulement si les enregistrements ont changé ; sans enregistrement elle lit le terrain vivant.

- **renvoie** : function height(x, y).

#### `editor_toolUtilities_groundPass.register(id, s)`

Enregistre (ou remplace, si l'id existe déjà) la source de terraformage d'un réseau.

- `id` (*string*) : Id du réseau, aussi clé de params (par exemple 'roads', 'rail').
- `s` (*table*) : Source avec features(out, p) et éventuellement lift, finish, after, records, hasCarve.

#### `editor_toolUtilities_groundPass.restore()`

Remet le terrain d'origine sous les réseaux et la pente de site par-dessus (transaction 'Restore Ground').

- **renvoie** : integer Nombre d'éléments (0 en pratique).

#### `editor_toolUtilities_groundPass.run(p, laySites, holdSites)`

Terraforme les réseaux (si Terraform est actif) puis repose la pente des sites, en une transaction 'Build Ground'.

- `p` (*table|nil*) : Réglages qui remplacent les réglages partagés pour cette exécution.
- `laySites` (*boolean|nil*) : Pente les sites même s'ils ne l'étaient pas.
- `holdSites` (*boolean|nil*) : Laisse la pente levée ; il faudra appeler laySites().
- **renvoie** : integer Nombre d'éléments de terraformage appliqués (0 si bloqué).

#### `editor_toolUtilities_groundPass.setRecord(bl)`

Restaure un enregistrement de creusement (doit être une table avec gx table et n > 0, sinon il est effacé). L'id du bloc est remis à nil : checkOwner rattache l'enregistrement par le niveau.

- `bl` (*table|nil*) : Enregistrement.

#### `editor_toolUtilities_groundPass.setSites(s)`

Branche la pente de site de City Builder (lift, lay, busy, record).

- `s` (*table|nil*) : Objet de sites.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaults` | table | Valeurs par défaut des réglages numériques. |
| `params` | table | Réglages courants : on, roads, rail (booléens) et doi, margin, falloff, smooth, roughness, scale, abutLen, abutShoulder. |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundPass.lua`.*
