# `ui_router_guards_photomode`

*Fichier : `lua/ge/extensions/ui/router/guards/photomode.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_guards_photomode` : `extensions.load("ui_router_guards_photomode")`, puis la globale `ui_router_guards_photomode`

Garde de sortie « confirmPhotomodeExit » : empêche de quitter le mode photo sans confirmation. Elle autorise la navigation si la route cible est encore dans le mode photo (route « <profil>.photomode » ou ses sous-routes, le profil venant de ui_photomode_shared.S.activeProfile, « pause » par défaut), si aucune session photo n'est active, si la session persistante est activée, ou si le contournement de confirmation est armé. Sinon elle demande la confirmation via ui_photomode_session.requestExitConfirmation et bloque la navigation (renvoie false).

## Champs

| Champ | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table des gardes exposées : {confirmPhotomodeExit = function(route, params, context) -> boolean}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/guards/photomode.lua`.*
