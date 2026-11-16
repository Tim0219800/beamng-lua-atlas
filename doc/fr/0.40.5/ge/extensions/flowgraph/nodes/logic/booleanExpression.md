# `flowgraph_nodes_logic_booleanExpression`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/booleanExpression")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Boolean Expression' (categorie simple). Evalue une expression booleenne Lua saisie dans data.expression (ex. 'a and not b') avec des pins d'entree bool a, b, c... et sort le resultat sur le pin bool 'value'. Des modeles AND, OR, XOR, NAND sont proposes dans l'editeur. Un pin d'entree supplementaire (lettre suivante) est cree a chaque nouveau lien.

## Remarques

- Le filtre de caracteres '[^(and)(or)(not)%l%s%(%)]' est une classe de caracteres : il accepte toute lettre minuscule, espace et parenthese, donc la liste blanche keyworkdWhiteListLookup n'est pas reellement utilisee.
- Le pin cree par onLink a pour valeur par defaut 0 alors que son type est bool.
- C.tags contient 'math','arithmetic','vector' (copie du noeud math), sans rapport avec le role du noeud.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Au demarrage, construit la liste activePinList des pins d'entree reellement connectes (utilisee par safeMode). | 181 |
| `C:_onDeserialized(nodeData)` | Appelle parseExpression apres chargement (le resultat est ignore). | 192 |
| `C:buildBaseEnv()` | Construit l'environnement de l'expression : une table dont __index lit la valeur du pin d'entree du meme nom. | 96 |
| `C:drawCustomProperties()` | Panneau de proprietes : liste deroulante des modeles d'expression (AND, OR, XOR, NAND, ou 'Custom Expression') et description des pins du modele choisi. | 62 |
| `C:drawMiddle(builder, style)` | Affiche l'expression au milieu du noeud. | 169 |
| `C:init()` | Initialise data.safeMode=true, expression vide, l'environnement et une liste blanche de mots-cles (not, true, false, nil). | 200 |
| `C:onLink(link)` | Quand un lien est ajoute et qu'il manque un pin, cree un nouveau pin d'entree bool nomme par la lettre suivante (a, b, c...). | 174 |
| `C:onUnlink(link)` | Vide (ne fait rien). | 196 |
| `C:parseExpression()` | Verifie l'expression (refuse '=' d'assignation et les caracteres hors lettres minuscules/espaces/parentheses) puis la compile avec load() dans l'environnement restreint. | 114 |
| `C:work()` | En safeMode, ne fait rien si une entree connectee vaut nil. Recompile l'expression si elle a change, l'execute avec pcall et ecrit le resultat sur 'value' ; les erreurs sont affichees via __setNodeError('expression'). | 134 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua`.*
