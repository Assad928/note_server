#Installez et configurez le serveur VNC pour se connecter à l'interface graphique à partir de clients distants.
apt -y install tigervnc-standalone-server
#Connectez-vous avec un utilisateur que vous souhaitez définir VNC. À propos, cet exemple montre comment utiliser MATE Desktop sur une connexion VNC.
# définir le mot de passe VNC
vncpasswd
vi ~/.vnc/xstartup
#créer un nouveau fichier (utiliser la session de bureau MATE sur cet exemple)
exec /usr/bin/mate-session &
# Commencez par le numéro d'affichage [1] (port 5901), résolution d'écran [800x600], avec autoriser l'hôte distant
vncserver :1 -geometry 800x600 -localhost no
#Installez  VNC viewer sur l'ordinateur client, cet exemple sous Windows 10.
#Après avoir installé UltraVNC, cliquez sur [UltraVNC Viewer] pour exécuter, puis l'écran suivant s'affiche.
#Saisissez [(nom d'hôte ou adresse IP du serveur): (afficher le numéro ou le numéro de port entier)] comme dans l'exemple suivant, puis cliquez sur le bouton [Connexion].
#Mot de passe requis. Entrez le mot de passe VNC que vous avez défini dans la section

#Installez noVNC qui est un outil client VNC pour se connecter au serveur VNC via un navigateur Web.
apt -y install novnc python-websockify
#Démarrez VNC Server avec un utilisateur
#Cet exemple est basé sur le fait que l'utilisateur [debian] exécute le serveur VNC avec le port [5901].
#Connectez-vous en tant qu'utilisateur qui exécute VNC et crée des certificats, puis démarrez Websockify vers le proxy [localhost: 5901] sur le port [6080].
openssl req -x509 -nodes -newkey rsa:2048 -keyout novnc.pem -out novnc.pem -days 365
websockify -D --web=/usr/share/novnc/ --cert=/home/debian/novnc.pem 6080 localhost:5901
#Accès à [https: // (nom d'hôte ou adresse IP du serveur): 6080 / vnc.html] 
#depuis un ordinateur client avec navigateur Web, puis le formulaire noVNC s'affiche comme suit, cliquez sur [Connect] pour continuer.
#Mot de passe requis. Entrez le mot de passe VNC de l'utilisateur







