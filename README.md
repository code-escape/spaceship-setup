# Spaceship-In-Trouble - Setup

Ce répository contient les fichiers et la base de code permettant d'installer les outils et le code pour avoir une 
situation initiale pour les équipes.

Le script ``setup.sh`` est executé au démarrage de la machine depuis la branche main.

## Tester le script d'installation en local

Il est possible de lancer une machine semblable à l'environnement de sandbox avec la commande ci-dessous.

Elle requiert une installation fonctionnelle de ``Docker`` 

> docker-compose run --rm --build -p 7777:80 instance bash

Une fois connecté à l'instance, il est possible d'executer le script via

> ./setup.sh
