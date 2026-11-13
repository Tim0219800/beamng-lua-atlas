# `util_logStreams`

*Fichier : `lua/ge/extensions/util/logStreams.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_logStreams` : `extensions.load("util_logStreams")`, puis la globale `util_logStreams`

Petit utilitaire d'entrée/sortie pour sauvegarder et relire les « streams » (flux de données de véhicule) journalisés, sous trois formats dans le dossier utilisateur : loggedStreams.json, loggedStreams.txt (wikitable) et loggedStreams.rst. Les fonctions ne font que lire/écrire ces fichiers ; la génération du contenu se fait ailleurs.

## Remarques

- readWikitable et readRst remplacent les retours à la ligne par la séquence littérale \n (« huge hack » selon le commentaire du code), pour pouvoir transmettre le texte sous forme de chaîne.
- readWikitable/readRst échouent (erreur Lua sur nil) si le fichier n'existe pas, car readFile renvoie nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_logStreams.readJson()` | Lit et décode loggedStreams.json. | 16 |
| `util_logStreams.readRst()` | Lit loggedStreams.rst en remplaçant chaque retour à la ligne par la séquence littérale \n. | 33 |
| `util_logStreams.readWikitable()` | Lit loggedStreams.txt en remplaçant chaque retour à la ligne par la séquence littérale \n. | 24 |
| `util_logStreams.saveJson(data)` | Écrit data dans loggedStreams.json (jsonWriteFile, format lisible). | 12 |
| `util_logStreams.saveRst(data)` | Écrit le texte fourni dans loggedStreams.rst. | 29 |
| `util_logStreams.saveWikitable(data)` | Écrit le texte fourni dans loggedStreams.txt. | 20 |

### Détail des paramètres

#### `util_logStreams.readJson()`

Lit et décode loggedStreams.json.

- **renvoie** : table|nil Contenu décodé, ou nil si le fichier est absent

#### `util_logStreams.readRst()`

Lit loggedStreams.rst en remplaçant chaque retour à la ligne par la séquence littérale \n.

- **renvoie** : string Contenu avec \n échappés
- **renvoie** : integer Nombre de remplacements (second retour de gsub)

#### `util_logStreams.readWikitable()`

Lit loggedStreams.txt en remplaçant chaque retour à la ligne par la séquence littérale \n.

- **renvoie** : string Contenu avec \n échappés
- **renvoie** : integer Nombre de remplacements (second retour de gsub)

#### `util_logStreams.saveJson(data)`

Écrit data dans loggedStreams.json (jsonWriteFile, format lisible).

- `data` (*table*) : Données à sérialiser

#### `util_logStreams.saveRst(data)`

Écrit le texte fourni dans loggedStreams.rst.

- `data` (*string*) : Texte au format reStructuredText

#### `util_logStreams.saveWikitable(data)`

Écrit le texte fourni dans loggedStreams.txt.

- `data` (*string*) : Texte au format wikitable

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/logStreams.lua`.*
