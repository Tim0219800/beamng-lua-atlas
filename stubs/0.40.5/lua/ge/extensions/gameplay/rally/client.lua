---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/client.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client HTTP très léger vers un service local de transcription vocale (http://localhost:27872) utilisé pour la reconnaissance des notes parlées pendant la reconnaissance (recce) d'un rallye. Il expose l'envoi d'une demande de coupure d'enregistrement et la lecture des dernières transcriptions. Le délai HTTP est de 0,5 s. Beaucoup d'autres appels (start/stop d'enregistrement, audio distant, proxy) sont commentés dans le code.
--- Accès : extension `gameplay_rally_client` : `extensions.load("gameplay_rally_client")`, puis la globale `gameplay_rally_client`
---@class gameplay_rally_client
gameplay_rally_client = {}

--- Envoie en POST JSON la demande de coupure d'enregistrement à /recordings/actions/cut.
---Source : lua/ge/extensions/gameplay/rally/client.lua:96
---@param requestBody table Corps de la requête, encodé en JSON (contenu défini par le service externe).
---@return table  Réponse décodée du serveur, ou {ok=false, error, client_msg} en cas d'échec.
function gameplay_rally_client.transcribe_recording_cut(requestBody) end

--- Récupère en GET les transcriptions à /transcripts/<count>.
---Source : lua/ge/extensions/gameplay/rally/client.lua:112
---@param count integer Nombre de transcriptions demandées (inséré dans l'URL).
---@return table  Réponse décodée du serveur, ou {ok=false, error, client_msg} en cas d'échec.
function gameplay_rally_client.transcribe_transcripts_get(count) end

