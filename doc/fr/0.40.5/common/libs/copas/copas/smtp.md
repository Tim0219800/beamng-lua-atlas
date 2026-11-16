# `libs_copas_copas_smtp`

*Fichier : `lua/common/libs/copas/copas/smtp.lua` · VM : Commun (GE + véhicule) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/smtp")`

Sous-module SMTP de la bibliothèque tierce Copas : identique à socket.smtp de LuaSocket mais avec des sockets Copas asynchrones. Définit copas.smtp ; les constantes PORT, SERVER, TIMEOUT, DOMAIN et TIMEZONE sont redirigées vers socket.smtp quand on les affecte, les autres lectures retombent sur socket.smtp.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_smtp.send(mailt)` | Envoie un courriel comme socket.smtp.send, en utilisant par défaut un socket Copas pour mailt.create. | 29 |

### Détail des paramètres

#### `libs_copas_copas_smtp.send(mailt)`

Envoie un courriel comme socket.smtp.send, en utilisant par défaut un socket Copas pour mailt.create.

- `mailt` (*table*) : Table de message LuaSocket (from, rcpt, source, server, …)
- **renvoie** : any Résultat de socket.smtp.send (1 ou nil + erreur)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/smtp.lua`.*
