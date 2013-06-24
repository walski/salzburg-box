# Fazit

![Ergebnisse - Requests per second - Diagramm](https://raw.github.com/oveja87/salzburg-box/master/shared/arecipe/analysis/scalable.jpg)

## Iterationsschritte

1. Ausganssituation  
2. Start im Production Mode
3. Ersetzen der Datenbank in mySQL
4. Update der Ruby Version auf 1.9.3
5. Unicorn als Application Server nutzen
6. Einsetzen von Caching mit Hilfe von memcached

## Resultate

Durch die eingesetzten Maßnahmen konnte die Webseite erfolgreich scaliert werden. Durch die verschiedenen Iterationsschritte konnten die Zugriffe pro Sekunde um das bis zu 350 Fache vermehrt werden. Dies wird im obigen Diagramm veranschaulicht.

Hierzu wurde die Applikation zunächst im Production Mode gestartet, was bereits eine geringe Verbesserung brachte. Da vor allem die große Anzahl an Datenbankzugriffen beobachtet werden konnte wurde als nächstes die Datenbank auf mySQL umgestellt. MySQL verarbeitet Zugriffe deutlich schneller als die vorher verwendetet Datenbank SQLite. Durch diesen Schritt konnte bereits eine deutliche Steigerung der Zugriffe erreicht werden. Bei der Homepage und den Userseiten wurde eine Vervielfachung der Zugriffe um das ca. 3,5-fache erreicht. Bei den Rezeptseiten wurden die Zugriffe sogar um einen Faktor von 15 im Vergleich zum Ausgangssystem vermehrt.

Nun konnte beim Aufrufen der Seite beobachtet werden, dass diese bei jedem 3. Ladevorgang länger benötigt. Dies kann vermieden werden, indem die Ruby Version auf 1.9.3. upgedatet wird, da es dort eine bessere Garbage Collection gibt. Durch diese Änderung konnte eine weitere Verbesserung der Zugriffsrate erzielt werden.

Anschließend wurde der Application Server von Webrick auf Unicorn geändern, da so Requests synchron verarbeitet werden können. Hier wurde für die Rezeptseiten wieder eine Steigerung von 25% im Vergleich zu den Ergebnissen aus dem vorherigen Schritt erreicht werden. Bei der Startseite und den Userseiten kann hier jedoch eine geringe Verschlechterung beobachtet werden. Da diese jedoch gering ist und die Verbesserung bei den Rezeptseiten im Vergleich groß, soll Unicorn dennoch verwendet werden.

Als letzer Schritt wurde schließlich Caching über memcached eingebunden. Hierdurch konnte bei allen Seiten nochmal eine deutliche Steigerung der Seitenzugriffe erreicht werden, unter der Vorraussetzung, dass die Inhalte bereits gecached sind. Durch Caching wurden bei allen Seiten zwischn 60 und 65 Zugriffe pro Sekunde erreicht.


