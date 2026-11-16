# `util_testExtensionProxies`

*Fichier : `lua/ge/extensions/util/testExtensionProxies.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_testExtensionProxies` : `extensions.load("util_testExtensionProxies")`, puis la globale `util_testExtensionProxies`

Extension de test du système d'ExtensionProxy. Au chargement, elle crée 11 objets ExtensionProxyTester (id 0 à 10) et les soumet comme « event sinks » à un proxy créé par newExtensionProxy(M), de sorte que les hooks de l'extension (comme onUpdate) soient redistribués à chaque instance. Utile seulement pour comprendre ce mécanisme ou le déboguer.

## Remarques

- onExtensionUnloaded appelle extProxy:destroy() ; le commentaire précise que le système d'extensions nettoie de toute façon.
- Dans onExtensionLoaded, newExtensionProxyTester(id) reçoit une variable globale id (nil) que la fonction ignore : l'id est ensuite fixé à la main (e.id = i).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_testExtensionProxies.onExtensionLoaded()` | Appelé au chargement de l'extension. Crée 11 testeurs, un proxy d'extension, et lui soumet les testeurs avec submitEventSinks. *(interne)* *(hook)* | 27 |
| `util_testExtensionProxies.onExtensionUnloaded()` | Appelé au déchargement de l'extension. Détruit le proxy d'extension. *(interne)* *(hook)* | 22 |

## Classe `ExtensionProxyTester`

Objet de test avec un champ id ; reçoit les hooks redistribués par le proxy.

| Méthode | Description | Ligne |
|---|---|---|
| `ExtensionProxyTester:onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour : affiche dans la console l'id du testeur et dtReal. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/testExtensionProxies.lua`.*
