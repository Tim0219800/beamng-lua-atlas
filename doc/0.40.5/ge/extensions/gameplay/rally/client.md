# `gameplay_rally_client`

*File: `lua/ge/extensions/gameplay/rally/client.lua` · VM: Game Engine (GE) · 196 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_client`: `extensions.load("gameplay_rally_client")`, then the global `gameplay_rally_client`

Very lightweight HTTP client for a local speech transcription service (http://localhost:27872) used to recognize spoken notes during a rally recce. It exposes sending a request to cut the recording and reading the latest transcripts. The HTTP timeout is 0.5 s. Many other calls (recording start/stop, remote audio, proxy) are commented out in the code.

## Notes

- An HTTP code other than 200 yields {ok=false, error=<code>} and an error in the log; otherwise the server's JSON response is returned as is.
- The external service must be running on port 27872: without it, every call fails after the 0.5 s timeout.
- On failure, client_msg is added to the response (copy of error). If the server answers 200 but with JSON lacking an ok field, resp.ok is nil and client_msg is also set.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_client.transcribe_recording_cut(requestBody)` | Sends the recording cut request as a JSON POST to /recordings/actions/cut. | 96 |
| `gameplay_rally_client.transcribe_transcripts_get(count)` | Fetches the transcripts with a GET to /transcripts/<count>. | 112 |

### Parameter details

#### `gameplay_rally_client.transcribe_recording_cut(requestBody)`

Sends the recording cut request as a JSON POST to /recordings/actions/cut.

- `requestBody` (*table*) : Request body, JSON-encoded (content defined by the external service).
- **returns**: table Decoded server response, or {ok=false, error, client_msg} on failure.

#### `gameplay_rally_client.transcribe_transcripts_get(count)`

Fetches the transcripts with a GET to /transcripts/<count>.

- `count` (*integer*) : Number of transcripts requested (inserted in the URL).
- **returns**: table Decoded server response, or {ok=false, error, client_msg} on failure.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/client.lua`.*
