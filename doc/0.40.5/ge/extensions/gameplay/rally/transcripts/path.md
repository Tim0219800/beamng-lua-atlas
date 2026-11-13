# `gameplay_rally_transcripts_path`

*Fichier : `lua/ge/extensions/gameplay/rally/transcripts/path.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/transcripts/path")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_transcripts_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(selected_id)` |  | 75 |
| `C:drawDebugTranscripts(selected_id)` | helped me figure out quat rotation<br> test 1<br> local function toRadians(degrees)<br>   return degrees * (math.pi / 180)<br> end<br> local theta = toRadians(45) / 2  -- Convert 45 degrees to radians and halve it<br> local testQ = quat({<br>   w = math.cos(theta),<br>   x = 0,<br>   y = 0,<br>   z = math.sin(theta)<br> })<br> print("Quaternion for 45-degree rotation around Z-axis:", testQ.w, testQ.x, testQ.y, testQ.z)<br> local testP = {x=-373.3353577, y=18.58174515, z=49.07889557}<br> local h = 2<br> local l = 5<br> testP = pos<br> testP = testP + vec3(0,0,20)<br> testQ = rot<br> local upVector = vec3(0, 0, 1)  -- 'up' in a Z-up system<br> local rotatedUpVector = testQ * upVector * h  -- Rotate and scale the up vector<br> local topOfCar = testP + rotatedUpVector  -- This gives the top point of the car<br> local forwardVector = vec3(0, 1, 0)<br> local rotatedForwardVector = testQ * forwardVector * l<br> local frontOfCar = testP + rotatedForwardVector<br> debugDrawer:drawSphere(testP, 1, ColorF(0,1,0,shapeAlpha)) -- green<br> debugDrawer:drawSphere(topOfCar, 1, ColorF(0,0,1,shapeAlpha)) -- blue<br> debugDrawer:drawSphere(frontOfCar, 1, ColorF(0,1,1,shapeAlpha)) -- aqua | 119 |
| `C:getNextUniqueIdentifier()` |  | 11 |
| `C:init(fname)` |  | 19 |
| `C:load()` |  | 32 |
| `C:onDeserialized(data)` |  | 67 |
| `C:onSerialize()` |  | 59 |
| `C:save()` |  | 53 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/transcripts/path.lua`.*
