---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/client.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Very lightweight HTTP client for a local speech transcription service (http://localhost:27872) used to recognize spoken notes during a rally recce. It exposes sending a request to cut the recording and reading the latest transcripts. The HTTP timeout is 0.5 s. Many other calls (recording start/stop, remote audio, proxy) are commented out in the code.
--- Access: extension `gameplay_rally_client`: `extensions.load("gameplay_rally_client")`, then the global `gameplay_rally_client`
---@class gameplay_rally_client
gameplay_rally_client = {}

--- Sends the recording cut request as a JSON POST to /recordings/actions/cut.
---Source: lua/ge/extensions/gameplay/rally/client.lua:96
---@param requestBody table Request body, JSON-encoded (content defined by the external service).
---@return table  Decoded server response, or {ok=false, error, client_msg} on failure.
function gameplay_rally_client.transcribe_recording_cut(requestBody) end

--- Fetches the transcripts with a GET to /transcripts/<count>.
---Source: lua/ge/extensions/gameplay/rally/client.lua:112
---@param count integer Number of transcripts requested (inserted in the URL).
---@return table  Decoded server response, or {ok=false, error, client_msg} on failure.
function gameplay_rally_client.transcribe_transcripts_get(count) end

