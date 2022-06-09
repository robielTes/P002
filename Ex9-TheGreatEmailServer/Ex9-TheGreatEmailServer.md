# TheGreatEmailServer

Il s'agit de l'implémentation simpliste d'un serveur mail. Il est capable de recevoir des mails à travers le protocole SMTP.

Les mails reçus sont d'abord contrôlés puis soit rejetés selons plusieurs critères,
soit stockés dans un fichier texte dans un répertoire ayant comme nom l'adresse email du destinataire.

En plus le serveur tient des statistiques qui sont stockées dans un fichier texte.

## Exécution

Pour tester ce logiciel, vous pouvez utiliser votre client mail préféré en indiquant le serveur `localhost` sur le port `3325`.

Vous pouvez aussi utiliser le script `mini_send_mail` dans le répertoire `test` qui permet d'envoyer un mail.
Il y a également une batterie de test dans le script `run_suite_1`.

## Exigences

Voici les nouvelles contraintes, attention vous ne devez **pas les implémenter**,
simplement les prendre en compte comme indications pour ré-usiner le code **existant** avec des Design Patterns.

1. Je veux pouvoir facilement changer de gestionnaire SMTP (remplacer Dumster/Rumbster par un autre composant)
2. Ajouter les _stats_ suivantes:
   - volume (taille en byte) des mails rejetés.
   - volume (taille en byte) des mails stockés.
3. Ajouter le critère de blockage suivant:
   - les pièces jointes dont l'extension est `.rar`
