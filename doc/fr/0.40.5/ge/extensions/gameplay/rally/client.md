# `gameplay_rally_client`

*Fichier : `lua/ge/extensions/gameplay/rally/client.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_client` : `extensions.load("gameplay_rally_client")`, puis la globale `gameplay_rally_client`

Client HTTP très léger vers un service local de transcription vocale (http://localhost:27872) utilisé pour la reconnaissance des notes parlées pendant la reconnaissance (recce) d'un rallye. Il expose l'envoi d'une demande de coupure d'enregistrement et la lecture des dernières transcriptions. Le délai HTTP est de 0,5 s. Beaucoup d'autres appels (start/stop d'enregistrement, audio distant, proxy) sont commentés dans le code.

## Remarques

- Un code HTTP différent de 200 donne {ok=false, error=<code>} et une erreur dans le log ; sinon la réponse JSON du serveur est renvoyée telle quelle.
- Le service externe doit tourner sur le port 27872 : sans lui, chaque appel échoue après le timeout de 0,5 s.
- En cas d'échec, client_msg est ajouté à la réponse (copie de error). Si le serveur répond 200 mais un JSON sans champ ok, resp.ok est nil et client_msg est aussi défini.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_client.transcribe_recording_cut(requestBody)` | Envoie en POST JSON la demande de coupure d'enregistrement à /recordings/actions/cut. | 96 |
| `gameplay_rally_client.transcribe_transcripts_get(count)` | Récupère en GET les transcriptions à /transcripts/<count>. | 112 |

### Détail des paramètres

#### `gameplay_rally_client.transcribe_recording_cut(requestBody)`

Envoie en POST JSON la demande de coupure d'enregistrement à /recordings/actions/cut.

- `requestBody` (*table*) : Corps de la requête, encodé en JSON (contenu défini par le service externe).
- **renvoie** : table Réponse décodée du serveur, ou {ok=false, error, client_msg} en cas d'échec.

#### `gameplay_rally_client.transcribe_transcripts_get(count)`

Récupère en GET les transcriptions à /transcripts/<count>.

- `count` (*integer*) : Nombre de transcriptions demandées (inséré dans l'URL).
- **renvoie** : table Réponse décodée du serveur, ou {ok=false, error, client_msg} en cas d'échec.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/client.lua`.*
