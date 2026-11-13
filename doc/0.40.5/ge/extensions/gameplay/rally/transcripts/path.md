# `gameplay_rally_transcripts_path`

*Fichier : `lua/ge/extensions/gameplay/rally/transcripts/path.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/transcripts/path")` (fichier sous extensions/ mais pas une extension classique)

Conteneur des transcriptions (texte reconnu de la voix du copilote lors de la reconnaissance) d'un rallye. Il charge et sauvegarde un fichier JSON, et gère une `sortedList` d'entrées (transcripts/entry.lua). Il fournit aussi les identifiants uniques et le dessin de debug des transcriptions. Le module renvoie un constructeur : `require(...)(fname)`.

## Remarques

- Le gros commentaire au-dessus de drawDebugTranscripts est du code de test mis en commentaire (rotation de quaternion) : il n'est pas exécuté.
- _draw_debug_hover_tsc_id n'est jamais modifié dans ce fichier ; seule la valeur nil est utilisée.

## Classe `C`

Chemin de transcriptions. Champs : fname, selection_sphere_r (4), _draw_debug_hover_tsc_id, transcripts (sortedList d'entrées).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_transcripts_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(selected_id)` | Point d'entrée du dessin de debug ; appelle drawDebugTranscripts. | 75 |
| `C:drawDebugTranscripts(selected_id)` | Appelle drawDebug(is_hovered, is_selected) sur chaque entrée de la liste triée. | 119 |
| `C:getNextUniqueIdentifier()` | Renvoie un entier croissant (1, 2, 3…) servant d'id aux entrées. | 11 |
| `C:init(fname)` | Constructeur : mémorise le nom du fichier et crée la sortedList `transcripts`. | 19 |
| `C:load()` | Charge le fichier JSON (jsonReadFile) et désérialise. Journalise un avertissement et renvoie false si fname est nil ou le fichier absent, une erreur si la lecture échoue. | 32 |
| `C:onDeserialized(data)` | Vide la liste et la recharge depuis data.transcripts. Ne fait rien si data est nil. | 67 |
| `C:onSerialize()` | Renvoie {transcripts = <liste sérialisée>}. | 59 |
| `C:save()` | Sérialise et écrit le fichier JSON (jsonWriteFile avec le paramètre compact à false). | 53 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/transcripts/path.lua`.*
