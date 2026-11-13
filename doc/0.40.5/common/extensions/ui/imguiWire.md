# `ui_imguiWire`

*Fichier : `lua/common/extensions/ui/imguiWire.lua` · VM : Commun (GE + véhicule) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_imguiWire` : `extensions.load("ui_imguiWire")`, puis la globale `ui_imguiWire`

Prototype de « câble » ImGui : charge ui_imgui puis remplace chaque fonction de ui_imgui par un wrapper qui, au lieu d'appeler ImGui, enregistre l'appel (nom + arguments) dans un tampon. clear() exécute ensuite tout le tampon via ui_imgui et mémorise les valeurs de retour, qui sont renvoyées au prochain cycle aux appels identiques. Pensé pour envoyer des appels ImGui d'une VM à une autre (commentaires « send buf to GE / GE: execute »).

## Remarques

- Problème connu indiqué dans le code : les nil sont « avalés » (c.ProgressBar(0.4, nil, 'FOO') devient c.ProgressBar(0.4, 'FOO')).
- Les appels non encore exécutés renvoient false (unpack(returns[id] or {false})) ; les valeurs de retour ne sont disponibles qu'au cycle suivant.
- Les résultats sont identifiés par une clé construite avec tostring des arguments + un compteur d'occurrences : deux appels identiques dans le même cycle reçoivent des clés différentes.
- Le wrapper n'est créé que pour les clés présentes dans ui_imgui au chargement de ce module.
- Le module ne renvoie que M.clear ; les fonctions wrappées sont ajoutées à M (donc M.Begin, M.Text…).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_imguiWire.clear()` | Exécute tous les appels ImGui mémorisés dans l'ordre sur ui_imgui, garde les valeurs de retour non vides pour les appels du prochain cycle, puis vide le tampon et le cache d'identifiants. | 61 |

**Charge les extensions :** `ui_imgui`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imguiWire.lua`.*
