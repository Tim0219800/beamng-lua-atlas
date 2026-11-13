# `flowgraph_builder`

*Fichier : `lua/ge/extensions/flowgraph/builder.lua` · VM : Game Engine (GE) · 440 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/builder")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_builder")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:Begin(nodeID)` |  | 55 |
| `C:BeginPinDynamic(pin)` |  | 156 |
| `C:End(node)` |  | 68 |
| `C:EndHeader()` |  | 133 |
| `C:EndInput()` |  | 151 |
| `C:EndOutput()` |  | 193 |
| `C:EndPin()` |  | 406 |
| `C:EndPinDynamic(pin)` |  | 164 |
| `C:Header(color)` |  | 128 |
| `C:Input(pin)` |  | 137 |
| `C:Middle()` |  | 172 |
| `C:Output(pin)` |  | 179 |
| `C:Pin(pin, kind)` |  | 386 |
| `C:SetStage(stage)` |  | 206 |
| `C:expectOutPinWidth(width)` |  | 198 |
| `C:init()` |  | 36 |
| `C:makeAlignmentPin(pin)` |  | 417 |
| `C:setExpectedHeaderSize(width)` |  | 202 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/builder.lua`.*
