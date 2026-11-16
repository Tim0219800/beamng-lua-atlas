# `core_chat`

*Fichier : `lua/ge/extensions/core/chat.lua` · VM : Game Engine (GE) · 179 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/chat")` (fichier sous extensions/ mais pas une extension classique)

Ancien client de chat IRC (irc.beamng.com, canal #beamng). Tout le code du fichier est en commentaire (bloc --[[ ... ]], marqué « not working atm ») : le module ne renvoie donc rien d'utilisable et ne définit aucune fonction.

## Remarques

- Le fichier ne contient aucun code actif ; require renvoie nil. Ne pas s'en servir.
- Le code commenté prévoyait M.activate, M.deactivate, M.send(target, message), M.requestState, M.onInit, M.onUpdate et émettait le hook onChatMessage et l'évènement UI ChatMessage/ChatState.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/chat.lua`.*
