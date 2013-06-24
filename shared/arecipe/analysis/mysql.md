# 3. Datenbank auf mySQL2 umstellen

## Testumgebung

*   Ruby-1.8.7-p370
*   WEBrick/1.3.1 
*   Production Mode
*   mySQL

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse des Ausgangssystems

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20 [#/sec]
* Recipes: ~ 1.35 [#/sec]

### Ergebnisse aus vorherigem Schritt

* Homepage: 0.19 [#/sec]
* Users: ~ 0.22 [#/sec]
* Recipes: ~ 2.36 [#/sec]

### Neue Ergebnisse

* Homepage: 2.82 [#/sec]
* Users: ~ 2.98 [#/sec]
* Recipes: ~ 20.22 [#/sec]

## Improvement

* Improved front page requests per second by 1658%
* Improved user page requests per second by 1490%
* Improved page requests per second by 1498%

## Nächster Schritt

* Auf Ruby 1.9.3 umstellen, da dies eine bessere Garbage Collection bietet

## Durchgeführte Tests

### Homepage: ab -n10 -c1 http://localhost:3000/
     
	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6715 bytes

	Concurrency Level:      1
	Time taken for tests:   3.547 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73584 bytes
	HTML transferred:       67124 bytes
	Requests per second:    2.82 [#/sec] (mean)
	Time per request:       354.660 [ms] (mean)
	Time per request:       354.660 [ms] (mean, across all concurrent requests)
	Transfer rate:          20.26 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    1   1.3      0       4
	Processing:   264  354  59.0    360     466
	Waiting:      263  353  58.8    360     465
	Total:        264  355  59.8    360     470

	Percentage of the requests served within a certain time (ms)
	  50%    360
	  66%    383
	  75%    385
	  80%    399
	  90%    470
	  95%    470
	  98%    470
	  99%    470
	 100%    470 (longest request)	

### User 1: ab -n10 -c1 http://localhost:3000/users/50

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      1
	Time taken for tests:   3.568 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      79600 bytes
	HTML transferred:       73140 bytes
	Requests per second:    2.80 [#/sec] (mean)
	Time per request:       356.788 [ms] (mean)
	Time per request:       356.788 [ms] (mean, across all concurrent requests)
	Transfer rate:          21.79 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.9      0       3
	Processing:   290  356  41.8    363     433
	Waiting:      290  355  41.1    363     429
	Total:        290  357  42.4    364     436

	Percentage of the requests served within a certain time (ms)
	  50%    364
	  66%    364
	  75%    366
	  80%    391
	  90%    436
	  95%    436
	  98%    436
	  99%    436
	 100%    436 (longest request)	
     
### User 2: ab -n10 -c1 http://localhost:3000/users/43

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      1
	Time taken for tests:   3.910 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      89040 bytes
	HTML transferred:       82580 bytes
	Requests per second:    2.56 [#/sec] (mean)
	Time per request:       390.996 [ms] (mean)
	Time per request:       390.996 [ms] (mean, across all concurrent requests
	Transfer rate:          22.24 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.7      0       2
	Processing:   376  390  22.6    384     454
	Waiting:      376  389  21.0    383     448
	Total:        376  391  23.2    384     456

	Percentage of the requests served within a certain time (ms)
	  50%    384
	  66%    385
	  75%    386
	  80%    393
	  90%    456
	  95%    456
	  98%    456
	  99%    456
	 100%    456 (longest request)	
 
### User 3: ab -n10 -c1 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   2.787 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67780 bytes
	HTML transferred:       61320 bytes
	Requests per second:    3.59 [#/sec] (mean)
	Time per request:       278.709 [ms] (mean)
	Time per request:       278.709 [ms] (mean, across all concurrent requests)
	Transfer rate:          23.75 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       2
	Processing:   229  278  74.7    241     473
	Waiting:      228  277  73.6    240     468
	Total:        229  279  75.3    241     475

	Percentage of the requests served within a certain time (ms)
	  50%    241
	  66%    296
	  75%    297
	  80%    304
	  90%    475
	  95%    475
	  98%    475
	  99%    475
	 100%    475 (longest request)	
 
### Recipe 1: ab -n50 -c1 http://localhost:3000/recipes/2042

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      1
	Time taken for tests:   2.466 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      182150 bytes
	HTML transferred:       149850 bytes
	Requests per second:    20.28 [#/sec] (mean)
	Time per request:       49.321 [ms] (mean)
	Time per request:       49.321 [ms] (mean, across all concurrent requests)
	Transfer rate:          72.13 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       2
	Processing:    36   49  24.4     38     108
	Waiting:       36   48  24.4     38     107
	Total:         36   49  24.4     39     108

	Percentage of the requests served within a certain time (ms)
	  50%     39
	  66%     40
	  75%     40
	  80%     42
	  90%    103
	  95%    105
	  98%    108
	  99%    108
	 100%    108 (longest request)	
     
### Recipe 2: ab -n50 -c1 http://localhost:3000/recipes/2082

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      1
	Time taken for tests:   2.314 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      209400 bytes
	HTML transferred:       177100 bytes
	Requests per second:    21.61 [#/sec] (mean)
	Time per request:       46.280 [ms] (mean)
	Time per request:       46.280 [ms] (mean, across all concurrent requests)
	Transfer rate:          88.37 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       4
	Processing:    34   46  23.4     37     108
	Waiting:       34   45  23.4     36     108
	Total:         34   46  23.4     37     109

	Percentage of the requests served within a certain time (ms)
	  50%     37
	  66%     37
	  75%     38
	  80%     40
	  90%    102
	  95%    103
	  98%    109
	  99%    109
	 100%    109 (longest request)
     
### Recipe 3: ab -n50 -c1 http://localhost:3000/recipes/2005

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      1
	Time taken for tests:   2.666 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      200200 bytes
	HTML transferred:       167900 bytes
	Requests per second:    18.76 [#/sec] (mean)
	Time per request:       53.315 [ms] (mean)
	Time per request:       53.315 [ms] (mean, across all concurrent requests)
	Transfer rate:          73.34 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.5      0       4
	Processing:    38   53  26.3     41     121
	Waiting:       37   52  26.4     41     121
	Total:         38   53  26.5     41     125

	Percentage of the requests served within a certain time (ms)
	  50%     41
	  66%     43
	  75%     44
	  80%     45
	  90%    107
	  95%    107
	  98%    125
	  99%    125
	 100%    125 (longest request)



     





