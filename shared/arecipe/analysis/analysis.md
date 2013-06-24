#Scalable Web Architectures
#Wolfgang Vogl

##Documentation:




##Ausgangssituation:

Als erstes habe ich die Applikation arecipe im Browser geöffnet um zu sehen, was überhaupt angezeigt wird. Da die Seite sehr lange benötigte um zu laden und die angezeigte Seite nur sehr wenig Content hatte habe ich als erstes die Ausgabe des Webrick Servers angeschaut. Auffällig waren die vielen Datenbank abfragen für sehr wenig Content.
Der erste Gedanke war das Kontrollieren ob alle Indices richtig gesetzt sind und die Einführung von Counter Columns für die Likes. Nach Aufmerksamen lesen der Aufgabenstellung wurde die Idee mit den Counter Columns wieder verworfen.

Vor dem Messen habe ich ein Rakefile geschrieben, das mittels der erhaltenen Übergabeparameter einen AB Test startet und den Dateinamen für den aktuellen Test generiert.

Filenamen:
[appserver] _ [url] _ [ruby version] _ [usersession] _ [zahl der Requests]
 
Begonnen habe ich mit dem Messen der URLs:

1.  /

2.  /users/42
    /users/45
    /users/50

3.  /recipes/2011
    /recipes/2068
    /recipes/2009


mit Thin und Unicorn und jeweils den Rubyversionen REE, 1.9.3 und 1.8.7.
Unicorn wurde mit 3 workern verwendet, da mit 3 workern die besten Ergebnisse erzielt wurden.
Die AB Ergebnisfiles mit der Dateiendung .dat sind in /shared/arecipe/analysis des basic commit zu finden. 
Es wurde jeweils ein Test mit und einer ohne Usersession gemacht.

In diesem Durchgang wurde für mehrere App Server ein Plot generiert, in welchem auch die Unterschiede zu den einzelnen Rubyversionen zu sehen sind.
Webrick wurde nach dem Test mit 1.8.7 verworfen, mich haben nur die Unterschiede interessiert. Webrick wurde aber in der Gesamtansicht nicht mehr angeführt.

In den Plots basic_recipes, basic_users und basic_home befindet sich jeweils ein Plot bei dem thin und unicorn mit den Objekten, welche eine sehr schlechte Performance hatten, gegenübergestellt wurden. 
Nach dem Analysieren der Plots habe ich mich entschieden noch einige Tests auszuführen mit concurrency 10 und 10 Requests. Aufgrund der abschließenden Tests habe ich mich entschieden Unicorn zu verwenden, da Unicorn auch mehrere Requests gleichzeitig abarbeiten konnte. Zu meiner Überraschung war Ruby 1.9.3 die schlechteste Ruby Version für die Tests die ich durchgeführt habe. Ruby 1.8.7 war ungefähr gleich schlecht wie REE dafür war es etwas stabiler, weshalb meine Wahl für die nachfolgenden Tests auf 1.8.7 REE viel.


###ZIELSETZUNG:
Da ich keine Ahnung habe wie sehr sich die geplanten Änderungen auswirken gibt es hier die erste vorsichtige Zielsetzung:

1. Unter der Url "/" 10 Complete Requests von 10 ausgeführten Request bei einer concurrency von 1

2. Unter der Url "/" soll die langsamste Response time nicht höher als 4 Sekunden sein.

3. Unter den "/users" eine 50% schnellere Response time.

4. Unter den "/recipes" eine 50% schnellere Response time.

