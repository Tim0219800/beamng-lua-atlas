# `devUtils`

*Fichier : `lua/common/devUtils.lua` · VM : Commun (GE + véhicule) · 213 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("devUtils")`

Utilitaires de développement rarement nécessaires, définis comme fonctions globales : exécution de code Lua avec capture du print, analyse des upvalues d'un module, instantané (snapshot) JSON de l'état global Lua pour comparer deux états, et détection de tables partagées à plusieurs endroits d'une arborescence. Surtout utile pour déboguer les fuites ou fusions de tables entre modules.

## Remarques

- Le fichier utilise des helpers globaux d'autres fichiers : tableMerge, tableKeysSorted, tableIsEmpty, deepcopy, flattenTable, jsonWriteFile, writeFile.
- executeLuaSandboxed n'est pas un vrai bac à sable (le code reste exécuté dans l'environnement du fichier et on peut atteindre des objets cachés) ; seul print est détourné.
- Bug : _createGraphviz (locale, non utilisée, appel commenté dans createGlobalSnapshot) référence une variable k non définie ; elle ne fonctionnerait pas si activée.
- createGlobalSnapshot appelle gui.reset() si disponible avant de capturer pour vider les caches temporaires.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `createGlobalSnapshot(filename)` | Écrit en JSON un instantané des variables globales, des modules (contenu et locales) et des extensions chargées. Les fonctions et userdata sont retirés, les tables aplaties (flattenTable). | 145 |
| `executeLuaSandboxed(cmd, source)` | Compile puis exécute la chaîne cmd avec xpcall, en remplaçant temporairement print pour capturer les sorties. En cas d'erreur de syntaxe ou d'exécution, renvoie une chaîne commençant par 'Error: '. | 10 |
| `getModuleLocals(moduleTbl)` | Renvoie les variables locales (upvalues) utilisées par les fonctions d'un module, en parcourant récursivement les fonctions, leurs upvalues et la métatable. Ignore les globales, les champs du module, le module lui-même et ___locals. | 89 |
| `tableFindRecursion(tbl)` | Parcourt tbl et détecte les sous-tables atteintes par plusieurs chemins (références partagées ou cycles). | 200 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/devUtils.lua`.*
