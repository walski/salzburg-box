#Scalable Web Architectures
#Wolfgang Vogl

##Documentation:



##Iteration 1:

Um eine bessere Performance zu erreichen habe ich für die erste Iteration geplant MySQL anstatt SQLite zu verwenden und anschließend die Indices zu kontrollieren und gegebenfalls in einer Migration neu zu setzen.

Bereits mit dem verwenden von MySQL wurden die Ziele 3 und 4 erreicht ohne weitere Änderungen vorgenommen zu haben.

Als nächstes habe ich den home_controller angeschaut und anschließend in recipe.rb nachgeschaut was hier alles passiert wenn die "/" Url aufgerufen wird. In der schema.rb habe ich dann gesehen, dass nur wenige indices gesetzt sind und habe in einer Migration folgende Indices gesetzt:

add_index( :likes, :recipe_id)
add_index(:preparation_steps, :recipe_id)
add_index(:preparation_steps, :duration)
add_index(:recipe_ingredients, :recipe_id)
add_index(:recipe_ingredients, :amount)
add_index(:ingredients, :price)

Die Response time zur Url "/" beträgt nun 2 Sekunden, also die Hälfte des gesetzten Ziels. Das Problem mit den Failed Requests besteht nach wie vor. Von 10 Requests kommt nur eine Response zurück, die restlichen 9 schlagen fehl.

Im analysis Ordner befinden sich die Dateien compare_sqlite_and_mysql_home.png, compare_sqlite_and_mysql_users.png und compare_sqlite_and_mysql_recipes.png . In den Plots wurden die Requests mit Unicorn Ruby Enterprise Edition vom Ordner basic_unicorn (blau) mit den Requests im Ordner iteration1_unicorn (rot) gegenübergestellt.

Man kann eine deutliche Performance steigerung und bessere stabilität erkennen. Bei den recipes gibt es jedoch eine Abweichung für die ersten Requests, welche teilweise auch von SQLite schnell ausgeführt werden konnten.