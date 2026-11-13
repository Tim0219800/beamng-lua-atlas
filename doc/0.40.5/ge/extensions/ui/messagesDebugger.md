# `ui_messagesDebugger`

*Fichier : `lua/ge/extensions/ui/messagesDebugger.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_messagesDebugger` : `extensions.load("ui_messagesDebugger")`, puis la globale `ui_messagesDebugger`

Fenêtre ImGui de débogage des messages à l'écran (événements UI « Message »). Elle permet de composer un message (texte, catégorie, icône, durée en secondes), de l'envoyer par guihooks.message, d'effacer une catégorie ou tous les messages, et d'activer un contournement du TTL côté interface. Utile pour tester l'affichage des messages et des liaisons [action=...].

## Exemple

```lua
extensions.load('ui_messagesDebugger'); ui_messagesDebugger.show()
```

## Remarques

- Événements guihooks émis : Message (avec clear = true pour effacer une catégorie), ClearAllMessages, MessagesDebug ({bypassTtl}).
- La case « Regex clear » n'a aucun effet : les deux branches de _clearCategory envoient le même événement (la catégorie est donc traitée telle quelle).
- Le bouton « Test 3 Messages » envoie trois messages dans les catégories <catégorie>.1, .2 et .3 avec des durées de 3, 4 et 5 s.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_messagesDebugger.hide()` | Ferme la fenêtre. | 38 |
| `ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image ; dessine la fenêtre si elle est ouverte (rien sinon). *(interne)* *(hook)* | 42 |
| `ui_messagesDebugger.show()` | Ouvre la fenêtre « Messages Debugger ». | 37 |
| `ui_messagesDebugger.toggle()` | Inverse l'état d'ouverture de la fenêtre. | 39 |

### Détail des paramètres

#### `ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image ; dessine la fenêtre si elle est ouverte (rien sinon).

- `dtReal` (*number*) : Temps réel écoulé (s), non utilisé.
- `dtSim` (*number*) : Temps de simulation écoulé (s), non utilisé.
- `dtRaw` (*number*) : Temps brut écoulé (s), non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_imgui. |

**Évènements UI (guihooks.trigger) :** `ClearAllMessages`, `Message`, `MessagesDebug`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/messagesDebugger.lua`.*
