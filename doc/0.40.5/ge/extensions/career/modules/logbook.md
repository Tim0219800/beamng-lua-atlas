# `career_modules_logbook`

*Fichier : `lua/ge/extensions/career/modules/logbook.lua` · VM : Game Engine (GE) · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_logbook` : `extensions.load("career_modules_logbook")`, puis la globale `career_modules_logbook`

Journal de bord de la carrière (logbook.json dans le dossier career de la sauvegarde). Stocke les entrées affichées dans l'UI : déblocage de missions, d'installations de livraison, de points d'apparition, et pages d'aide/tutoriel. Au premier lancement (logbook vide), il crée les entrées d'introduction (welcome, logbook, driving, delivery…) à partir de ui/modules/careerLogbook/pages/<id>/.

## Exemple

```lua
career_modules_logbook.genericInfoUnlocked("Titre", "Texte", "/ui/cover.jpg")
```

## Remarques

- Chaque entrée reçoit time = os.time(), entryId (compteur croissant) et isNew = true.
- getLogbook déclenche le hook onLogbookGetEntries(ret) pour que d'autres extensions ajoutent des entrées, puis trie par temps décroissant (à égalité, par entryId décroissant).
- setLogbookEntryRead ne modifie que isNew (not read) ; getPopups et getLogbookMostRecentUnread lisent le champ read : ces deux champs ne sont jamais synchronisés dans ce fichier (incohérence probable).
- missionUnlocked lit mission.name avant de tester id : plante si id est nil ou inconnu (mission nil).
- logbookEntry lit le fichier content.html avec readFile sans vérifier qu'il existe.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_logbook.addNewLogbookEntry(entry, skipSave)` | Crée l'entrée réelle : fixe time, entryId, isNew, l'insère en tête de liste (sauf skipSave) et, si entry.showMessage et hors tutoriel, affiche un message UI (guihooks Message, 15 s). | 84 |
| `career_modules_logbook.deliveryFacilityUnlocked(id)` | Appelé quand une installation de livraison est débloquée : crée une entrée progress (nom et aperçu de l'installation). Ne fait rien si l'installation est introuvable. | 120 |
| `career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type)` | Entrée « normale » d'information/tutoriel ; joue le son UI_Checkpoint (une seule fois par frame, jamais pendant le tutoriel). | 148 |
| `career_modules_logbook.genericLogbookEntry(title, text, cover, coverText)` | Entrée générique de type info, sans son ni particularité. | 170 |
| `career_modules_logbook.getLogbook()` | Renvoie une copie de la liste des entrées, enrichie par le hook onLogbookGetEntries et triée de la plus récente à la plus ancienne. | 23 |
| `career_modules_logbook.getLogbookMostRecentUnread(limit)` | Renvoie jusqu'à `limit` entrées récentes (hideInRecent exclu) en plaçant d'abord les non lues, puis les lues. | 46 |
| `career_modules_logbook.getPopups()` | Renvoie les entrées non lues (read faux) marquées isPopup. | 35 |
| `career_modules_logbook.logbookEntry(id)` | Crée une entrée d'aide depuis l'id d'une page : titre ui.introPopup.<id>.title, contenu de ui/modules/careerLogbook/pages/<id>/content.html (sauts de ligne retirés) et image header.jpg. | 203 |
| `career_modules_logbook.missionUnlocked(id)` | Appelé quand une mission est débloquée : crée une entrée de type progress avec nom et image de la mission. | 106 |
| `career_modules_logbook.onCareerActive(active)` | Hook : charge logbook.json ; si vide, crée les entrées d'introduction dans l'ordre inverse de la liste interne. *(interne)* *(hook)* | 221 |
| `career_modules_logbook.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit {logbook = ...} dans <save>/career/logbook.json. *(interne)* *(hook)* | 232 |
| `career_modules_logbook.onUpdate()` | Hook appelé chaque frame : réinitialise le garde-fou du son (un son max par frame). *(interne)* *(hook)* | 239 |
| `career_modules_logbook.setLogbookEntryRead(entryId, read)` | Met isNew = not read sur l'entrée d'identifiant entryId. Ignore entryId == -1. | 72 |
| `career_modules_logbook.spawnPointUnlocked(spawnPoint)` | Appelé quand un point d'apparition est découvert : crée une entrée progress avec showMessage = true. | 134 |

### Détail des paramètres

#### `career_modules_logbook.addNewLogbookEntry(entry, skipSave)`

Crée l'entrée réelle : fixe time, entryId, isNew, l'insère en tête de liste (sauf skipSave) et, si entry.showMessage et hors tutoriel, affiche un message UI (guihooks Message, 15 s).

- `entry` (*table|nil*) : Données de l'entrée (type, title, text, cover…).
- `skipSave` (*boolean|nil*) : Si vrai, l'entrée est renvoyée mais pas stockée.
- **renvoie** : table L'entrée complétée.

#### `career_modules_logbook.deliveryFacilityUnlocked(id)`

Appelé quand une installation de livraison est débloquée : crée une entrée progress (nom et aperçu de l'installation). Ne fait rien si l'installation est introuvable.

- `id` (*string*) : Identifiant de l'installation.

#### `career_modules_logbook.genericInfoUnlocked(title, text, cover, ratio, flavour, type)`

Entrée « normale » d'information/tutoriel ; joue le son UI_Checkpoint (une seule fois par frame, jamais pendant le tutoriel).

- `title` (*string|table*) : Titre ou clé de traduction.
- `text` (*string|table*) : Contenu.
- `cover` (*string|nil*) : Image de couverture.
- `ratio` (*string|nil*) : Ratio d'image, "16x9" par défaut.
- `flavour` (*any*) : Non utilisé dans le code.
- `type` (*string|nil*) : Type d'entrée, "info" par défaut.
- **renvoie** : table L'entrée créée.

#### `career_modules_logbook.genericLogbookEntry(title, text, cover, coverText)`

Entrée générique de type info, sans son ni particularité.

- `title` (*string|table*) : Titre.
- `text` (*string|table*) : Contenu.
- `cover` (*string|nil*) : Image de couverture.
- `coverText` (*string|nil*) : Texte sur la couverture.
- **renvoie** : table L'entrée créée.

#### `career_modules_logbook.getLogbook()`

Renvoie une copie de la liste des entrées, enrichie par le hook onLogbookGetEntries et triée de la plus récente à la plus ancienne.

- **renvoie** : table[] Entrées du journal.

#### `career_modules_logbook.getLogbookMostRecentUnread(limit)`

Renvoie jusqu'à `limit` entrées récentes (hideInRecent exclu) en plaçant d'abord les non lues, puis les lues.

- `limit` (*integer|nil*) : Nombre maximal d'entrées, 3 par défaut.
- **renvoie** : table[] Entrées sélectionnées.

#### `career_modules_logbook.getPopups()`

Renvoie les entrées non lues (read faux) marquées isPopup.

- **renvoie** : table[] Entrées à afficher en popup.

#### `career_modules_logbook.logbookEntry(id)`

Crée une entrée d'aide depuis l'id d'une page : titre ui.introPopup.<id>.title, contenu de ui/modules/careerLogbook/pages/<id>/content.html (sauts de ligne retirés) et image header.jpg.

- `id` (*string*) : Nom de la page (ex. welcome, driving).

#### `career_modules_logbook.missionUnlocked(id)`

Appelé quand une mission est débloquée : crée une entrée de type progress avec nom et image de la mission.

- `id` (*string*) : Identifiant de la mission.

#### `career_modules_logbook.onCareerActive(active)`

Hook : charge logbook.json ; si vide, crée les entrées d'introduction dans l'ordre inverse de la liste interne.

- `active` (*boolean*) : Rien si false.

#### `career_modules_logbook.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit {logbook = ...} dans <save>/career/logbook.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_logbook.setLogbookEntryRead(entryId, read)`

Met isNew = not read sur l'entrée d'identifiant entryId. Ignore entryId == -1.

- `entryId` (*integer*) : Identifiant de l'entrée.
- `read` (*boolean*) : true pour la marquer lue.

#### `career_modules_logbook.spawnPointUnlocked(spawnPoint)`

Appelé quand un point d'apparition est découvert : crée une entrée progress avec showMessage = true.

- `spawnPoint` (*table*) : Point d'apparition (translationId, previews, logbookEntry).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLogbookGetEntries` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/logbook.lua`.*
