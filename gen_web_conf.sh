GENED_DOMAIN=$(python3 generate_config.py "$@")
sudo cp "${GENED_DOMAIN}.conf" /etc/apache2/sites-available/
sudo certbot --apache
sudo a2ensite "${GENED_DOMAIN}"
sudo systemctl reload apache2
rm "${GENED_DOMAIN}.conf"
