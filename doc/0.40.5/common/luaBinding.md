# `luaBinding`

*Fichier : `lua/common/luaBinding.lua` · VM : Commun (GE + véhicule) · 276 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("luaBinding")`

Colle Lua des liaisons C++ <-> Lua : les fonctions __luaBind* sont les __index / __newindex que le moteur C++ place sur les metatables des classes exposées (getters, setters, héritage). Elles sont rappelées par le moteur (noms codés en dur côté C++), un moddeur n'a normalement pas à les appeler. __finalizeLuaBindings est appelée par le moteur après l'enregistrement des classes pour optimiser les metatables et configurer les SimObjects.

## Exemple

```lua
-- usage interne au moteur ; rien à appeler dans un mod
```

## Remarques

- NE PAS RENOMMER : les noms __luaBindIndex, __luaBindIndexStatic, __luaBindNewindex, __luaBindNewindexStatic, __finalizeLuaBindings sont codés en dur côté C++ (commentaire du code).
- Convention de metatable de classe C++ : [1] = table des getters, [2] = table des setters, [3] = metatable de la classe parente (super) ; pour les SimObjects : [4] getStaticDataFieldbyName, [5] getDynDataFieldbyName, [6] setStaticDataFieldbyName, [7] setDynDataFieldbyName. Les résultats trouvés dans une classe parente sont recopiés dans la metatable enfant (cache).
- Pour les classes statiques, un getter qui n'est pas une fonction (constante via addConstant()) est renvoyé directement.
- __finalizeLuaBindings ne fait le travail SimObject que si luaVMname ~= 'vlua' (hors VM véhicule) : détecte les classes dont le nom commence par 'd' (byte 100) et qui ont isSubClassOf, aplatit leur hiérarchie et installe les __index/__newindex SimObject (champs dynamiques/statiques accessibles comme des propriétés, obj.obj = lui-même).
- Écrire dans une propriété non trouvée ou en lecture seule ne lève pas d'erreur : l'assignation est silencieusement ignorée (log commenté). Lire une propriété inconnue renvoie nil.
- testBindings() est un test unitaire interne (TestNamespace.TestClassA/B) : n'existe que si ces classes de test sont enregistrées.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `__finalizeLuaBindings(classes, luaVMname)` | Appelée par le moteur une fois toutes les classes C++ enregistrées dans la VM : installe les accès SimObject (hors VM véhicule) puis optimise les metatables sans parent (supprime __newindex sans setters, aplatit les getters). | 195 |
| `__luaBindIndex(t, k)` | __index d'une instance de classe C++ : cherche d'abord un champ de la metatable, puis un getter de la classe, puis remonte la chaîne des classes parentes (en mettant en cache). Renvoie nil si introuvable. | 6 |
| `__luaBindIndexStatic(t, k)` | __index des classes à membres statiques : comme __luaBindIndex mais les getters sont appelés sans instance, et une constante non fonction est renvoyée telle quelle. | 43 |
| `__luaBindNewindex(t, k, v)` | __newindex d'une instance : appelle le setter de la classe (ou d'un parent) ; ignore silencieusement si aucun setter. | 84 |
| `__luaBindNewindexStatic(t, k, v)` | __newindex pour classes statiques : appelle le setter sans instance (setFunc(v)). | 112 |
| `testBindings()` | Test unitaire des liaisons (classes TestNamespace.TestClassA/B) : assignations, appels, destruction et ramasse-miettes ; affiche *** Unittest start *** / *** DONE ***. | 249 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/luaBinding.lua`.*
