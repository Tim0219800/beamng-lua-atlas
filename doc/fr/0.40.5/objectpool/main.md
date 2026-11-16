# `main`

*Fichier : `lua/objectpool/main.lua` · VM : Commun (GE + véhicule) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("main")`

Point d'entrée de la machine virtuelle Lua « objectpool » (vmType = 'objectpool'), qui stocke des objets de véhicule sérialisés (lpack) dans une table `objPool` indexée par identifiant d'objet. Elle sert à déplacer des données de véhicule entre VM : le moteur appelle getObject, setObject, moveObject, deleteObject. Elle charge luaCore, utils, devUtils, ve_utils et mathlib, redéfinit `print` vers le journal et installe des métatables sur _G pour que les variables globales d'un objet soient stockées dans sa fiche (objData).

## Remarques

- Ce n'est pas une extension : fichier main.lua d'une VM séparée, chargé par le moteur ; package.path est redéfini et package.cpath vidé.
- Après _setObj(objId, obj), toute lecture ou écriture d'une globale inconnue passe par __indexHandler / __newIndexHandler et va dans objPool[objId] (rawget/rawset sur objData).
- float3 est un alias de vec3. Les hooks onNodeCollision, onVehicleReset, onBeamBroke et onBeamDeformed sont vides.
- getObject et moveObject encodent avec lpack.encode ; moveObject retire en plus l'objet du pool. setObject et moveObject journalisent via dump.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `__indexHandler(t, key)` | Métatable de _G : la lecture d'une globale absente est cherchée dans objData. | 100 |
| `__newIndexHandler(t, key, val)` | Métatable de _G : une affectation de globale est stockée dans objData au lieu de _G. | 96 |
| `_setObj(objId, _obj)` | Sélectionne l'objet courant : pose les globales obj, objectId et objData (= objPool[objId]) avec rawset. | 90 |
| `deleteObject(objId)` | Supprime l'objet du pool. | 40 |
| `getObject(objId)` | Retourne l'objet du pool encodé en chaîne lpack, sans le retirer. | 24 |
| `init(path, initData)` | Appelée dans la VM Lua de l'objet : décode initData (lpack), charge le véhicule avec jbeam/stage2 (loadVehicleStage2) et le range dans objPool[obj:getId()] = {v = objet}. Journalise une erreur et retourne false (décharge la Lua) si les données sont invalides. | 49 |
| `initPool()` | Initialisation de la VM « thread » du pool ; ne fait rien. | 45 |
| `moveObject(objId)` | Retourne l'objet encodé et le retire du pool (transfert vers une autre VM). | 28 |
| `onBeamBroke(id, energy)` | Hook appelé par le moteur quand une poutre casse ; corps vide. | 81 |
| `onBeamDeformed(id, ratio)` | Hook appelé par le moteur quand une poutre se déforme ; corps vide. | 84 |
| `onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2)` | Hook de collision de nœud appelé par le moteur ; corps vide dans cette VM. | 74 |
| `onVehicleReset(retainDebug)` | Hook appelé par le moteur lors d'un reset ; corps vide. | 78 |
| `print(...)` | Remplace print : écrit dans le journal avec le niveau 'A' et le tag 'print'. Seul le premier argument est converti (tostring(...)). | 18 |
| `setObject(objId, objDataStr)` | Décode une chaîne lpack et la range dans le pool sous objId. | 35 |

**Globales affectées :** `float3`, `objData`, `vmType`

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/objectpool/main.lua`.*
