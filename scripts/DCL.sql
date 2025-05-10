
GRANT ALL PRIVILEGES ON restaurant.* TO 'niginaabdukhalimova'@'localhost';


GRANT SELECT ON restaurant.* TO 'readonly_user'@'localhost';


REVOKE ALL PRIVILEGES ON restaurant.* FROM 'guest_user'@'localhost';


CREATE USER 'new_user'@'localhost' IDENTIFIED BY '12345678';
GRANT SELECT, INSERT ON restaurant.* TO 'root'@'localhost';


SET PASSWORD FOR 'niginaabdukhalimova'@'localhost' = PASSWORD('12345678');


SHOW GRANTS FOR 'root'@'localhost';


