# 4. Applikation im Production Mode starten

## Testumgebung

*   Ruby-1.9.3
*   Unicorn 
*   Production Mode
*   mySQL

## Server starten mit bundle exec unicorn -p 300 -c ./config/unicorn.rb -E production

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse des Ausgangssystems

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20
* Recipes: ~ 1.35

### Ergebnisse aus vorherigem Schritt

* Homepage: 4.41 [#/sec]
* Users: ~ 5.24 [#/sec]
* Recipes: ~ 26.68 [#/sec]

### Neue Ergebnisse

* Homepage:  2.84 [#/sec]
* Users: ~  4.55 [#/sec]
* Recipes: ~  33.35 [#/sec]

### Tests mit Concurrency Level 3 - Ergebnisse aus vorherigem Schritt

* Homepage: 5.16 [#/sec]
* Users: ~ 5.6 [#/sec]
* Recipes: ~ 28.04 [#/sec]

### Tests mit Concurrency Level 3 - Neue Ergebnisse

* Homepage:  4.95 [#/sec]
* Users: ~  5.37 [#/sec]
* Recipes: ~  30.15 [#/sec]

## Improvement

* Es ist hier lediglich bei Recipes eine Verbesserung zu erkennen
* Homepage und User werden langsamer, auch bei mehreren gleichzeitigen Zugriffen

* Improved front page requests per second by 1670% (Tests ohne Concurrency)
* Improved user page requests per second by 2275% (Tests ohne Concurrency)
* Improved page requests per second by 2470% (Tests ohne Concurrency)

## Nächster Schritt

* Als letzter Schritt soll Caching eingebaut werden, sodass bei mehrfachem Zugriff weniger Daten geladen werden müssen.

## Durchgeführte Tests

### Homepage: ab -n10 -c1 http://localhost:3000/
     
	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6734 bytes

	Concurrency Level:      1
	Time taken for tests:   3.525 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73384 bytes
	HTML transferred:       67184 bytes
	Requests per second:    2.84 [#/sec] (mean)
	Time per request:       352.501 [ms] (mean)
	Time per request:       352.501 [ms] (mean, across all concurrent requests)
	Transfer rate:          20.33 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:   154  352 339.1    216     997
	Waiting:      154  351 337.6    215     990
	Total:        154  352 339.2    216     998

	Percentage of the requests served within a certain time (ms)
	  50%    216
	  66%    218
	  75%    222
	  80%    991
	  90%    998
	  95%    998
	  98%    998
	  99%    998
	 100%    998 (longest request)

### User 1: ab -n10 -c1 http://localhost:3000/users/50

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      1
	Time taken for tests:   3.410 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      79340 bytes
	HTML transferred:       73140 bytes
	Requests per second:    2.93 [#/sec] (mean)
	Time per request:       341.009 [ms] (mean)
	Time per request:       341.009 [ms] (mean, across all concurrent requests)
	Transfer rate:          22.72 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:   156  341 349.8    176    1022
	Waiting:      155  339 348.6    176    1016
	Total:        156  341 349.8    177    1022

	Percentage of the requests served within a certain time (ms)
	  50%    177
	  66%    207
	  75%    207
	  80%    985
	  90%   1022
	  95%   1022
	  98%   1022
	  99%   1022
	 100%   1022 (longest request)

### User 2: ab -n10 -c1 http://localhost:3000/users/43

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      1
	Time taken for tests:   2.847 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      88780 bytes
	HTML transferred:       82580 bytes
	Requests per second:    3.51 [#/sec] (mean)
	Time per request:       284.721 [ms] (mean)
	Time per request:       284.721 [ms] (mean, across all concurrent requests)
	Transfer rate:          30.45 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:   172  284 255.9    216    1009
	Waiting:      172  283 255.9    215    1008
	Total:        172  285 255.9    216    1009

	Percentage of the requests served within a certain time (ms)
	  50%    216
	  66%    222
	  75%    235
	  80%    248
	  90%   1009
	  95%   1009
	  98%   1009
	  99%   1009
	 100%   1009 (longest request)


### User 3: ab -n10 -c1 http://localhost:3000/users/41

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   1.389 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67520 bytes
	HTML transferred:       61320 bytes
	Requests per second:    7.20 [#/sec] (mean)
	Time per request:       138.942 [ms] (mean)
	Time per request:       138.942 [ms] (mean, across all concurrent requests)
	Transfer rate:          47.46 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   115  139  24.9    129     188
	Waiting:      115  137  23.6    128     181
	Total:        115  139  24.9    129     188

	Percentage of the requests served within a certain time (ms)
	  50%    129
	  66%    130
	  75%    164
	  80%    167
	  90%    188
	  95%    188
	  98%    188
	  99%    188
	 100%    188 (longest request)

### Recipe 1: ab -n50 -c1 http://localhost:3000/recipes/2042

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      1
	Time taken for tests:   1.644 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      180850 bytes
	HTML transferred:       149850 bytes
	Requests per second:    30.41 [#/sec] (mean)
	Time per request:       32.882 [ms] (mean)
	Time per request:       32.882 [ms] (mean, across all concurrent requests)
	Transfer rate:          107.42 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    23   33  31.6     24     203
	Waiting:       22   32  31.1     24     198
	Total:         23   33  31.6     24     203

	Percentage of the requests served within a certain time (ms)
	  50%     24
	  66%     25
	  75%     26
	  80%     26
	  90%     32
	  95%     71
	  98%    203
	  99%    203
	 100%    203 (longest request)

### Recipe 2: ab -n50 -c1 http://localhost:3000/recipes/2082

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      1
	Time taken for tests:   1.295 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      208100 bytes
	HTML transferred:       177100 bytes
	Requests per second:    38.62 [#/sec] (mean)
	Time per request:       25.891 [ms] (mean)
	Time per request:       25.891 [ms] (mean, across all concurrent requests)
	Transfer rate:          156.98 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    22   26   8.4     24      66
	Waiting:       22   25   8.4     23      65
	Total:         23   26   8.4     24      66

	Percentage of the requests served within a certain time (ms)
	  50%     24
	  66%     24
	  75%     24
	  80%     25
	  90%     28
	  95%     33
	  98%     66
	  99%     66
	 100%     66 (longest request)

### Recipe 3: ab -n50 -c1 http://localhost:3000/recipes/2005

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      1
	Time taken for tests:   1.612 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      198900 bytes
	HTML transferred:       167900 bytes
	Requests per second:    31.02 [#/sec] (mean)
	Time per request:       32.239 [ms] (mean)
	Time per request:       32.239 [ms] (mean, across all concurrent requests)
	Transfer rate:          120.50 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    25   32  22.2     27     170
	Waiting:       24   31  22.1     26     169
	Total:         25   32  22.2     27     170

	Percentage of the requests served within a certain time (ms)
	  50%     27
	  66%     27
	  75%     28
	  80%     30
	  90%     32
	  95%     71
	  98%    170
	  99%    170
	 100%    170 (longest request)

### Homepage: ab -n50 -c3 http://localhost:3000/
	
	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6683 bytes

	Concurrency Level:      3
	Time taken for tests:   10.105 seconds
	Complete requests:      50
	Failed requests:        47
	   (Connect: 0, Receive: 0, Length: 47, Exceptions: 0)
	Write errors:           0
	Total transferred:      365969 bytes
	HTML transferred:       334969 bytes
	Requests per second:    4.95 [#/sec] (mean)
	Time per request:       606.279 [ms] (mean)
	Time per request:       202.093 [ms] (mean, across all concurrent requests)
	Transfer rate:          35.37 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       3
	Processing:   421  603  98.0    565     812
	Waiting:      420  601  98.1    563     809
	Total:        421  603  98.3    565     815

	Percentage of the requests served within a certain time (ms)
	  50%    565
	  66%    614
	  75%    695
	  80%    728
	  90%    762
	  95%    774
	  98%    815
	  99%    815
	 100%    815 (longest request)

### User 1: ab -n50 -c3 http://localhost:3000/users/50

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      3
	Time taken for tests:   9.940 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      396700 bytes
	HTML transferred:       365700 bytes
	Requests per second:    5.03 [#/sec] (mean)
	Time per request:       596.418 [ms] (mean)
	Time per request:       198.806 [ms] (mean, across all concurrent requests)
	Transfer rate:          38.97 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.7      0       4
	Processing:   342  590 101.1    544     800
	Waiting:      342  588 101.0    542     797
	Total:        342  591 101.0    544     800

	Percentage of the requests served within a certain time (ms)
	  50%    544
	  66%    563
	  75%    708
	  80%    716
	  90%    733
	  95%    765
	  98%    800
	  99%    800
	 100%    800 (longest request)

     
### User 2: ab -n50 -c3 http://localhost:3000/users/43

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      3
	Time taken for tests:   11.106 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      443900 bytes
	HTML transferred:       412900 bytes
	Requests per second:    4.50 [#/sec] (mean)
	Time per request:       666.359 [ms] (mean)
	Time per request:       222.120 [ms] (mean, across all concurrent requests)
	Transfer rate:          39.03 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   1.1      0       5
	Processing:   378  658  99.4    616     809
	Waiting:      377  655  98.6    612     807
	Total:        378  658  99.5    616     809

	Percentage of the requests served within a certain time (ms)
	  50%    616
	  66%    750
	  75%    771
	  80%    780
	  90%    793
	  95%    798
	  98%    809
	  99%    809
	 100%    809 (longest request)

 
### User 3: ab -n50 -c3 http://localhost:3000/users/41

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      3
	Time taken for tests:   7.584 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      337600 bytes
	HTML transferred:       306600 bytes
	Requests per second:    6.59 [#/sec] (mean)
	Time per request:       455.015 [ms] (mean)
	Time per request:       151.672 [ms] (mean, across all concurrent requests)
	Transfer rate:          43.47 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.8      0       4
	Processing:   265  450  79.1    417     612
	Waiting:      265  448  78.8    415     608
	Total:        265  450  79.2    417     612

	Percentage of the requests served within a certain time (ms)
	  50%    417
	  66%    429
	  75%    436
	  80%    580
	  90%    591
	  95%    596
	  98%    612
	  99%    612
	 100%    612 (longest request)
	

 
### Recipe 1: ab -n200 -c3 http://localhost:3000/recipes/2042

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      3
	Time taken for tests:   6.539 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      723400 bytes
	HTML transferred:       599400 bytes
	Requests per second:    30.59 [#/sec] (mean)
	Time per request:       98.079 [ms] (mean)
	Time per request:       32.693 [ms] (mean, across all concurrent requests)
	Transfer rate:          108.04 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.7      0       7
	Processing:    67   98  35.8     91     265
	Waiting:       65   95  35.5     89     264
	Total:         67   98  36.1     91     271

	Percentage of the requests served within a certain time (ms)
	  50%     91
	  66%     95
	  75%     95
	  80%     98
	  90%    104
	  95%    115
	  98%    263
	  99%    264
	 100%    271 (longest request)
     
### Recipe 2: ab -n200 -c3 http://localhost:3000/recipes/2082

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      3
	Time taken for tests:   6.403 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      832400 bytes
	HTML transferred:       708400 bytes
	Requests per second:    31.23 [#/sec] (mean)
	Time per request:       96.051 [ms] (mean)
	Time per request:       32.017 [ms] (mean, across all concurrent requests)
	Transfer rate:          126.95 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.4      0       4
	Processing:    45   96  36.1     90     278
	Waiting:       44   93  36.0     87     276
	Total:         45   96  36.1     90     278

	Percentage of the requests served within a certain time (ms)
	  50%     90
	  66%     93
	  75%     94
	  80%     97
	  90%    100
	  95%    107
	  98%    257
	  99%    272
	 100%    278 (longest request)
     
### Recipe 3: ab -n200 -c3 http://localhost:3000/recipes/2005

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      3
	Time taken for tests:   6.986 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      795600 bytes
	HTML transferred:       671600 bytes
	Requests per second:    28.63 [#/sec] (mean)
	Time per request:       104.793 [ms] (mean)
	Time per request:       34.931 [ms] (mean, across all concurrent requests)
	Transfer rate:          111.21 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.5      0       5
	Processing:    57  104  38.5     97     287
	Waiting:       57  103  38.4     95     286
	Total:         57  104  38.5     97     287

	Percentage of the requests served within a certain time (ms)
	  50%     97
	  66%    100
	  75%    101
	  80%    103
	  90%    109
	  95%    251
	  98%    269
	  99%    287
	 100%    287 (longest request)



	



     





