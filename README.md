# 🌆 Nesox Population Density

Script de gestion dynamique et synchronisée de la densité de population pour FiveM, utilisant le GlobalState pour une optimisation maximale.

## ✨ Caractéristiques
* **Performance (0.00ms)** : Le script est totalement inactif si la densité est réglée par défaut (1.0).
* **Synchronisation Instantanée** : Le changement de densité s'applique à tous les joueurs en temps réel via le GlobalState de FiveM.
* **Interface ox_lib** : Menu fluide avec sliders pour un réglage précis.
* **Sécurité ACE** : Système de permissions intégré pour éviter les abus.

## 🛠️ Installation
1. Déposez le dossier `nesox_density` dans vos ressources.
2. Assurez-vous d'avoir installé la dépendance [ox_lib](https://github.com/overextended/ox_lib).
3. Ajoutez `ensure nesox_density` dans votre `server.cfg`.

## 🔐 Configuration des Permissions
Par défaut, la commande est protégée par ACE. Ajoutez ceci dans votre `server.cfg` en remplaçant `group.admin` par le groupe de votre choix :
```char
add_ace group.admin command.setdensity allow
