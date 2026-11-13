# `editor_api_decal`

*Fichier : `lua/ge/extensions/editor/api/decal.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_decal` : `extensions.load("editor_api_decal")`, puis la globale `editor_api_decal`

API de l'éditeur pour les decals de terrain/objets (Engine.Render.DecalMgr) : création et suppression de templates (DecalData), ajout/suppression d'instances, recherche et sauvegarde. initialize(editor) crée le PersistenceManager decalPersistMan et ajoute les fonctions sur editor. Les templates sont sauvés dans art/decals/managedDecalData.json du dossier de la mission, les instances dans main.decals.json.

## Remarques

- Si le nom de mission est introuvable, getDecalDataFilePath logge une erreur et retombe sur le chemin par défaut relatif.
- getDecalInstance et getDecalInstanceByUid renvoient nil si l'instance n'a pas de champs id/uid valides.
- Dans getDecalInstanceByUid, l'uid est passé à DecalMgr.getDecalInstance (même appel que pour un index) : le moteur gère les deux (déduit du code).
- Les templates supprimés sont mis en file et réellement supprimés du fichier par saveDecals.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_decal.initialize(editorInstance)` | Crée decalPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor. *(interne)* | 133 |

### Détail des paramètres

#### `editor_api_decal.initialize(editorInstance)`

Crée decalPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor.

- `editorInstance` (*table*) : Objet editor

## Classe `editor`

Fonctions ajoutées à l'objet editor par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha)` | Ajoute une instance de decal orientée par une normale et une rotation autour de celle-ci. | 55 |
| `editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha)` | Comme addDecalInstance mais orientée par un vecteur tangent. | 62 |
| `editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index)` | Comme addDecalInstanceWithTan mais en imposant l'index de l'instance. | 69 |
| `editor.createDecalTemplate()` | Crée un DecalData au nom unique NewTemplate (matériau WarningMaterial), le marque modifié pour le fichier de decals. | 18 |
| `editor.deleteDecalInstance(instance)` | Supprime une instance et marque l'éditeur modifié. | 94 |
| `editor.deleteDecalTemplate(template)` | Supprime toutes les instances utilisant ce template, retire le template du set et le met en file pour suppression au prochain saveDecals. | 34 |
| `editor.getClosestDecal(pos)` | Renvoie le decal le plus proche d'une position. | 99 |
| `editor.getDecalDataFilePath()` | Chemin du fichier des templates : dossier de la mission + art/decals/managedDecalData.json. | 10 |
| `editor.getDecalInstance(index)` | Renvoie l'instance d'index donné, ou nil si invalide. | 76 |
| `editor.getDecalInstanceByUid(uid)` | Renvoie l'instance d'uid donné, ou nil si invalide. | 83 |
| `editor.getDecalInstanceVecSize()` | Nombre d'emplacements du tableau d'instances. | 90 |
| `editor.getDecalTemplates()` | Renvoie le set de templates (DecalMgr.getSet()). | 47 |
| `editor.hasDirtyDecalTemplates()` | Indique si des templates ont des modifications non sauvegardées. | 51 |
| `editor.isDecalDirty(decal)` | Indique si le decal/template a des modifications non sauvegardées. | 108 |
| `editor.notifyDecalModified(instance)` | Prévient le moteur qu'une instance a changé et marque l'éditeur modifié. | 103 |
| `editor.saveDecal(template)` | Sauvegarde un template modifié. | 112 |
| `editor.saveDecals()` | Purge les templates mis en file pour suppression, sauvegarde les templates modifiés et écrit les instances dans main.decals.json du dossier de la mission. | 116 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/decal.lua`.*
