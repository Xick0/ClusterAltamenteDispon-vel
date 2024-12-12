
SQL_COMMANDS="""
CREATE USER 'web'@'%' IDENTIFIED BY 'web';
GRANT ALL PRIVILEGES ON *.* TO 'web'@'%';
FLUSH PRIVILEGES;
"""

mysql -u root -e "$SQL_COMMANDS"

if [ $? -eq 0 ]; then
    echo "User 'web' created and granted privileges successfully."
else
    echo "Failed to execute SQL commands"
    exit 1
fi