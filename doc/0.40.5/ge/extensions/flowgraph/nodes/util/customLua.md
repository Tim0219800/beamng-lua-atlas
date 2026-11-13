# `flowgraph_nodes_util_customLua`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/customLua.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/customLua")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Custom Lua » (catégorie repeat_instant, couleur debug). Permet d'écrire du code Lua directement dans l'éditeur flowgraph, avec pins d'entrée/sortie personnalisés (sauvegardés). Quatre blocs de code : work (chaque frame si un flow d'entrée est actif), _executionStarted, _executionStopped et onPreRender. Le code est compilé avec load dans un environnement restreint (buildBaseEnv) et exécuté sous pcall ; les erreurs sont journalisées sur le nœud. L'éditeur permet de nommer le nœud et de le sauvegarder dans une bibliothèque (préférence flowgraph.general.customLuaNodes).

## Remarques

- Le code est exécuté sans argument utile : pcall reçoit debug.traceback comme argument du chunk.
- L'environnement expose require, dofile, loadfile, load, io et os : le code n'est pas sandboxé.
- Le tag du log d'erreur dans exec contient un guillemet parasite : 'Custom Lua Node: " .. code'.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Compile les quatre blocs puis exécute _executionStarted. | 131 |
| `C:_executionStopped()` | Exécute _executionStopped puis libère l'environnement. | 137 |
| `C:_onDeserialized(data)` | Restaure nom et code puis recompile. | 160 |
| `C:_onSerialize(data)` | Sauvegarde nom et code. | 168 |
| `C:buildBaseEnv()` | Construit (une fois) et renvoie la table d'environnement du code utilisateur : self, map, be, FS, scenetree, extensions, vec3/quat, outils JSON et math, toutes les extensions chargées, etc. Fournit aussi refreshExtensions, loadExtension, unloadExtension, log (journalise aussi dans le gestionnaire). | 173 |
| `C:compile(code)` | Compile le bloc de code donné avec l'environnement de base ; enregistre le message d'erreur dans self.status, sinon la fonction dans self.compiled (nop en cas d'erreur). | 44 |
| `C:drawCustomProperties()` | Dessine l'éditeur : chargement depuis la bibliothèque, nom, bouton de sauvegarde, et un champ multiligne par bloc avec indicateur d'erreur de compilation. Renvoie la description du changement ou false. | 54 |
| `C:exec(code)` | Exécute le bloc compilé sous pcall ; en cas d'erreur, logue, marque le nœud en erreur et ajoute un évènement au gestionnaire. | 145 |
| `C:init()` | Crée les quatre blocs de code vides et autorise les pins d'entrée et de sortie personnalisés (savePins=true). | 29 |
| `C:onPreRender(dt, dtSim)` | Exécute le bloc onPreRender (avant le rendu). | 141 |
| `C:work()` | Exécute le bloc work. | 156 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/customLua.lua`.*
