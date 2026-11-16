# `ui_router_guards_legal`

*Fichier : `lua/ge/extensions/ui/router/guards/legal.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_guards_legal` : `extensions.load("ui_router_guards_legal")`, puis la globale `ui_router_guards_legal`

Garde d'entrée « onlineConsentSet » : n'autorise la navigation vers une route que si le consentement en ligne a été donné, c'est-à-dire si les réglages onlineFeatures et telemetry ne valent plus "ask". Les routes du module « legal » (premier segment du nom de route) sont toujours autorisées pour que l'assistant de consentement puisse se terminer. Les gardes sont enregistrées par GuardManager à partir de M.guards.

## Remarques

- Les réglages sont lus avec core_settings_settings.getValue("onlineFeatures") et ("telemetry").

## Champs

| Champ | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table des gardes exposées : {onlineConsentSet = function(route) -> boolean}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/guards/legal.lua`.*
