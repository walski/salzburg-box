#Scalable Web Architectures
#Wolfgang Vogl

##Documentation:



##Iteration 2:

Im nächsten Schritt habe ich geplant Caching einzubauen um die Performance zu verbessern. 

Da in der Aufgabenstellung stand, dass die Objekte maximal 10 Minuten gecached werden sollen, habe ich mich für die Verwendung von Action Caches entschieden. Ich habe in den Controllern home, user und recipe die jeweils in den Tests aufgerufenen index oder show Actions gecached und :expires_in auf 10.minutes gesetzt.

Nach der ersten Ausführung des AB Tests für die Home Seite war auch das Ziel Nummer 1 Erreicht, es werden nun 10 von 10 Requests ohne Fehler abgearbeitet.

Es wurde das Dalli gem aus den Folien verwendet.

In den Plots compare_cach_vs_no_cache_home.png, compare_cach_vs_no_cache_recipes.png und compare_cach_vs_no_cache_users.png werden die Responsezeiten aus iteration1 und iteration2 miteinander verglichen.

Wie man erkennen kann hat sich durch die Verwendung von Caching die Performance stark verbessert.