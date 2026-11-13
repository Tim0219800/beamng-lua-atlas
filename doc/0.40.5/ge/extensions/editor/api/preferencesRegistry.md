# `editor_api_preferencesRegistry`

*Fichier : `lua/ge/extensions/editor/api/preferencesRegistry.lua` · VM : Game Engine (GE) · 554 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/preferencesRegistry")` (fichier sous extensions/ mais pas une extension classique)

Registre des préférences de l'éditeur : organise les préférences en catégorie > sous-catégorie > item (chemin "categorie.souscategorie.item"), avec type, valeur par défaut, description, libellé, bornes, drapeaux hidden/advanced, fonction UI personnalisée, libellés d'enum et version. Gère le chargement/sauvegarde dans `settings/editor/preferences.json` (format version 2, seules les valeurs différant du défaut sont écrites) et l'émission du hook `onEditorPreferenceValueChanged`. Les extensions d'éditeur y déclarent leurs réglages ; on y accède aussi via `editor.getPreference(path)`. Le module renvoie un constructeur sans argument.

## Exemple

```lua
local reg = require("editor/api/preferencesRegistry")()
reg:registerCategory("myTool", "My Tool")
reg:registerSubCategory("myTool", "general", "General", {
  {speed = {"float", 1.0, "Vitesse", nil, 0, 10}},
})
reg:loadPreferences()
local v = reg:get("myTool.general.speed")
```

## Remarques

- Format d'un item dans registerPreferences (table positionnelle) : [1] type, [2] defaultValue, [3] description, [4] label (sinon sentenceCase du nom), [5] minValue, [6] maxValue, [7] hidden, [8] advanced, [9] customUiFunc, [10] enumLabels (liste de chaînes, enum générée {name, value=index}), [11] version (défaut 0). Chaque élément de `prefs` est une table à UNE seule paire {nom = infos} pour garder l'ordre.
- Types gérés pour (dé)sérialisation en chaîne : float, int, double, char, bool, table (JSON), Point3F/vec3, Point2F, Point2I, Point4F, ColorI, ColorF, RectF. Les vecteurs sont écrits sans virgules.
- `set` borne les nombres entre minValue et maxValue et marque `dirty` ; un chemin non enregistré est logué une seule fois puis ignoré. `get` plante si `loadPreferences` n'a pas encore été appelé (self.preferences nil).
- Les changements sont accumulés dans `changedItems` et diffusés par `broadcastPreferenceValueChanged` (à appeler depuis la boucle de l'éditeur), pas immédiatement.
- Si le fichier a une version de format différente de 2, il est ignoré (valeurs par défaut) et écrasé à la prochaine sauvegarde.
- Hooks émis : onEditorPreferenceValueChanged(itemPath, value), onEditorPreferenceVersionChanged(itemPath, valFichier, item), onEditorDeprecatedPreferencesItem(itemPath, value) (retourner true supprime l'item).
- `getAsString` et `resetItemToDefault` plantent si le chemin n'est pas enregistré (item nil).
- `loadCategory` plante si le fichier contient un item non enregistré (findItem renvoie nil puis itemValueFromString(nil, …)).

## Classe `C`

Objet registre. Champs : categories, nonPersistentItemPaths, preferences (valeurs courantes par catégorie), changedItems, dirty.

Le module renvoie un constructeur : `local obj = require("editor_api_preferencesRegistry")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addNonPersistentItemPath(subCategoryPath)` | Marque un chemin comme non persistant : il n'est pas écrit dans les fichiers de préférences. | 128 |
| `C:broadcastPreferenceValueChanged()` | Émet onEditorPreferenceValueChanged pour chaque changement en file puis vide la file. | 288 |
| `C:callHookForSetValue()` | Émet onEditorPreferenceValueChanged pour TOUS les items enregistrés avec leur valeur actuelle (utile après un chargement). | 412 |
| `C:clear()` | Vide catégories, chemins non persistants, préférences, éléments modifiés et remet dirty à false. | 69 |
| `C:findCategory(name)` | Cherche une catégorie par nom. | 189 |
| `C:findItem(itemPath)` | Cherche un item par chemin "cat.souscat.item" ; nil si moins de 3 segments ou introuvable. | 201 |
| `C:findItemInSubCategory(subCateg, itemName)` | Cherche un item par nom dans une sous-catégorie. | 217 |
| `C:findSubCategory(category, name)` | Cherche une sous-catégorie par nom dans une catégorie. | 195 |
| `C:get(itemPath)` | Renvoie la valeur d'une préférence par chemin (équivalent de editor.getPreference). | 301 |
| `C:getAsString(itemPath)` | Renvoie la valeur d'une préférence sérialisée en texte selon son type. | 314 |
| `C:init()` | Appelle clear(). Appelé par le constructeur. | 77 |
| `C:itemValueFromString(item, itemVal)` | Convertit une valeur texte (lue du fichier) en valeur Lua selon item.type (nombre, bool, table JSON, vec3, Point2F, ColorF…). | 11 |
| `C:itemValueToString(item, itemVal)` | Convertit une valeur en texte pour le fichier : tostring pour les nombres/bool, JSON pour table (inchangé si déjà une string), tostring sans virgules pour les vecteurs/couleurs. | 41 |
| `C:loadCategory(categoryName, filename)` | Charge une seule catégorie depuis un fichier au format de saveCategory et applique ses valeurs ; marque dirty. | 424 |
| `C:loadPreferences(filename)` | Lit le fichier de préférences (défaut settings/editor/preferences.json), rejette un format de version différente, puis remplit chaque item enregistré avec la valeur du fichier ou la valeur par défaut. Gère les anciennes valeurs (non-table) et appelle onEditorPreferenceVersionChanged si la version d'un item a changé. Pas de hook de changement pendant le chargement. | 319 |
| `C:migratePreferences(deleteDeprecatedItems)` | Parcourt les préférences chargées et, pour chaque item absent du registre, émet onEditorDeprecatedPreferencesItem ; supprime l'item si deleteDeprecatedItems est vrai ou si le hook renvoie true. Corrige aussi les catégories/sous-catégories qui ne sont pas des tables. | 224 |
| `C:registerCategory(categName, categLabel)` | Crée (ou retrouve) une catégorie de premier niveau. Si elle existe avec un autre libellé, avertit et remplace le libellé. | 81 |
| `C:registerPreferences(categName, subCategName, prefs)` | Ajoute des items à une sous-catégorie existante. Un nom déjà présent est refusé avec une erreur loguée. | 136 |
| `C:registerSubCategory(categName, subCategName, subCategLabel, prefs)` | Crée (ou retrouve) une sous-catégorie dans une catégorie déjà enregistrée et y enregistre éventuellement des préférences. Logue une erreur et renvoie nil si la catégorie n'existe pas. | 99 |
| `C:removeNonPersistentItemPath(subCategoryPath)` | Retire un chemin de la liste des non persistants. | 132 |
| `C:resetItemToDefault(itemPath)` | Remet un item à sa valeur par défaut. | 542 |
| `C:resetToDefaults(categoryName)` | Remet à leur valeur par défaut tous les items d'une catégorie, ou de toutes les catégories si categoryName est nil. | 523 |
| `C:saveCategory(categoryName, filename)` | Sauvegarde toutes les préférences d'une catégorie (même celles à la valeur par défaut, hors chemins non persistants) dans un fichier json. | 452 |
| `C:savePreferences(filename)` | Écrit les préférences dans le fichier (défaut settings/editor/preferences.json) en omettant les valeurs égales au défaut et les chemins non persistants ; remet dirty à false. Conserve les valeurs d'extensions non chargées. | 475 |
| `C:set(itemPath, value)` | Fixe la valeur d'une préférence par chemin (bornée pour un nombre), marque dirty et met le changement en file pour le hook. | 255 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorDeprecatedPreferencesItem`
- `onEditorPreferenceValueChanged` — écouté par 15 module(s)
- `onEditorPreferenceVersionChanged`

## Appels vers le moteur (C++)

- `ColorF.` `fromString`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/preferencesRegistry.lua`.*
