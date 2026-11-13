# `flowgraph_nodes_math_math`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/math.lua` · VM : Game Engine (GE) · 293 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/math")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Expression' (categorie simple, fichier math). Evalue une expression mathematique Lua (data.expression) sur les pins a, b, c... (number, vec3 ou quat) et sort le resultat sur 'value'. L'environnement expose les fonctions de math, clamp, round, sign, lerp, inverseLerp, smoothstep, case, vec3, quat, quatFromEuler, terrainHeight, pingpong, random, etc. Les tables de pins sont converties en vec3 (3 composantes) ou quat (4). Modeles proposes : distance entre deux positions, lerp.

## Exemple

```lua
Expression : '(a-b):length()' avec a et b de type vec3 donne la distance ; 'lerp(a,b,c)' interpole.
```

## Remarques

- Une table de pin est interpretee comme quat si elle a 4 elements, sinon comme vec3.
- Aucune liste blanche de caracteres n'est appliquee : toute fonction exposee dans l'environnement (et les methodes de vec3/quat) peut etre appelee.
- La table keyworkdWhiteListLookup est construite mais jamais utilisee.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Construit activePinList (pins d'entree reliees). | 258 |
| `C:_onDeserialized(nodeData)` | Appelle parseExpression apres chargement (resultat ignore). | 269 |
| `C:buildBaseEnv()` | Construit l'environnement de l'expression (fonctions math et utilitaires, lecture des pins avec cache vec3/quat). | 101 |
| `C:drawCustomProperties()` | Liste des modeles d'expression et description de leurs pins. | 47 |
| `C:drawMiddle(builder, style)` | Affiche l'expression. | 246 |
| `C:init()` | safeMode=true, expression vide, creation de l'environnement et des caches vec3/quat. | 277 |
| `C:onLink(link)` | Cree un pin d'entree supplementaire (lettre suivante, valeur par defaut 0) quand un lien est ajoute et qu'il manque un pin. | 251 |
| `C:onUnlink(link)` | Vide. | 273 |
| `C:parseExpression()` | Refuse les affectations ('=' isole) puis compile 'return <expression>' avec load() dans l'environnement. | 182 |
| `C:work()` | En safeMode, ne fait rien si une entree connectee est nil. Recompile si l'expression a change, execute avec pcall, convertit un resultat vec3/quat (cdata) en table {x,y,z[,w]}, ecrit 'value' et signale les erreurs (noeud + logEvent). | 199 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/math.lua`.*
