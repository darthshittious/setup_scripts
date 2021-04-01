sudo apt update
sudo apt install apache2
sudo apt install certbot python3-certbot-apache
sudo ufw allow 'Apache Full'
sudo certbot --apache
