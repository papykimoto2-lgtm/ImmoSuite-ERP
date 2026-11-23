# Essai gratuit de 30 jours — ImmoSuite ERP

Pour proposer un essai à un prospect, lui envoyer le lien `…/essai.html` (à côté de `index.html`, même déploiement).

- Le prospect saisit sa société et son nom, puis l'application s'ouvre sur son **écran de premier démarrage** : il y crée son compte administrateur (identifiant et mot de passe de son choix). Aucune donnée d'exemple.
- L'espace est **local à l'appareil** : l'application reste en mode local (IndexedDB), aucune configuration cloud ne peut être enregistrée ni appliquée pendant l'essai, rien n'est envoyé à SANIX. Il faut garder le même appareil et le même navigateur.
- Un bandeau indique les jours restants (en rouge à 5 jours ou moins).
- À l'expiration, un écran de verrouillage propose de télécharger une sauvegarde (JSON : toutes les tables de la base locale, sans les comptes ni les mots de passe) et de contacter SANIX.
- Reculer l'horloge de l'appareil ne prolonge pas l'essai (la dernière date vue est mémorisée).
- Un appareil qui contient déjà un compte ImmoSuite est refusé, pour ne rien écraser.

Limite : l'essai est stocké dans le navigateur ; vider les données du site permet d'en démarrer un nouveau. Ce n'est pas une protection de licence. L'essai concerne l'application web ; le paquet Android (Capacitor) n'est pas modifié.

Fichiers : `essai.html` (activation), `essai.js` (mode local, bandeau, verrouillage, sauvegarde), une ligne dans `index.html` (`<script src="essai.js">` dans l'en-tête, avant le code de l'application).
