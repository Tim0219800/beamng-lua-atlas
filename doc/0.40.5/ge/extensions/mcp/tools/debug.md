# `mcp_tools_debug`

*Fichier : `lua/ge/extensions/mcp/tools/debug.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_debug` : `extensions.load("mcp_tools_debug")`, puis la globale `mcp_tools_debug`

Outils MCP de dessin de debug dans le monde : sphères, lignes et textes persistants, redessinés à chaque frame avec debugDrawer jusqu'à effacement ou expiration (ttl). Sert à signaler une position ou un problème dans la scène. Module chargé par mcp_tools.

## Remarques

- Les formes sont dessinées dans onPreRender ; le ttl utilise os.clockhp (secondes réelles).
- Couleur par défaut rouge {1,0,0,1} ; composantes 0..1, acceptées en {r,g,b,a} ou tableau {r,g,b,a}. Positions acceptées en {x,y,z} ou {x,y,z} indexé [1..3].
- Si kind est omis, c'est une ligne quand 'from' est donné, sinon une sphère.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_debug.debug_clear(args)` | Efface une forme par id, ou toutes si aucun id n'est donné. | 62 |
| `mcp_tools_debug.debug_draw(args)` | Ajoute ou remplace une forme de debug persistante et renvoie son id (« sN » auto-généré si non fourni). | 41 |
| `mcp_tools_debug.onPreRender(dtReal)` | Appelé avant chaque rendu : supprime les formes expirées et dessine les autres (ligne, texte ou sphère, avec étiquette éventuelle). *(interne)* *(hook)* | 32 |

### Détail des paramètres

#### `mcp_tools_debug.debug_clear(args)`

Efface une forme par id, ou toutes si aucun id n'est donné.

- `args` (*table|nil*) : {id?: string}
- **renvoie** : string Confirmation.
- **renvoie** : boolean toujours false.

#### `mcp_tools_debug.debug_draw(args)`

Ajoute ou remplace une forme de debug persistante et renvoie son id (« sN » auto-généré si non fourni).

- `args` (*table*) : {kind?: 'sphere'|'line'|'text', pos?: {x,y,z}, from?: {x,y,z}, to?: {x,y,z}, radius?: number m (défaut 0.5), label?|text?: string, color?: {r,g,b,a}, ttl?: number s (0/absent = permanent), id?: string}. line exige from+to ; sphere/text exigent pos ; text exige un label.
- **renvoie** : string Id de la forme, ou message d'erreur.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_debug.onPreRender(dtReal)`

Appelé avant chaque rendu : supprime les formes expirées et dessine les autres (ligne, texte ou sphère, avec étiquette éventuelle).

- `dtReal` (*number*) : Durée réelle (s), inutilisée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas de debug_draw et debug_clear. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/debug.lua`.*
