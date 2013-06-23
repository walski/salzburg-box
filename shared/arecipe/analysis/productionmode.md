# 2. Applikation im Production Mode starten

## Testumgebung

*   Ruby-1.8.7-p370
*   WEBrick/1.3.1 
*   Production Mode
*   SQLite

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse aus vorherigem Schritt

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20
* Recipes: ~ 1.35

### Neue Ergebnisse

* Homepage: 0.19 [#/sec]
* Users: ~ 0.22 [#/sec]
* Recipes: ~ 2.36 [#/sec]

## Improvement

* Improved front page requests per second by 11.8%
* Improved user page requests per second by 10%
* Improved page requests per second by 74.8%

## Nächster Schritt

* Datenbank auf mySQL umstellen, da es viele Datenbankabfragen gibt - diese kann mySQL besser bewältigen als SQLite

## Durchgeführte Tests

### Homepage: ab -n10 -c1 http://localhost:3000/
     
	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6707 bytes

	Concurrency Level:      1
	Time taken for tests:   54.010 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73095 bytes
	HTML transferred:       66635 bytes
	Requests per second:    0.19 [#/sec] (mean)
	Time per request:       5400.961 [ms] (mean)
	Time per request:       5400.961 [ms] (mean, across all concurrent requests)
	Transfer rate:          1.32 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   1.0      0       3
	Processing:  4888 5400 252.9   5365    5733
	Waiting:     4887 5399 252.3   5364    5728
	Total:       4888 5401 253.3   5365    5737

	Percentage of the requests served within a certain time (ms)
	  50%   5365
	  66%   5387
	  75%   5678
	  80%   5700
	  90%   5737
	  95%   5737
	  98%   5737
	  99%   5737
	 100%   5737 (longest request)

### User 1: ab -n10 -c1 http://localhost:3000/users/50

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      1
	Time taken for tests:   50.413 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      79600 bytes
	HTML transferred:       73140 bytes
	Requests per second:    0.20 [#/sec] (mean)
	Time per request:       5041.297 [ms] (mean)
	Time per request:       5041.297 [ms] (mean, across all concurrent requests)
	Transfer rate:          1.54 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    1   1.6      0       5
	Processing:  4938 5041  77.9   5024    5215
	Waiting:     4938 5040  77.5   5024    5213
	Total:       4939 5041  79.1   5024    5220

	Percentage of the requests served within a certain time (ms)
	  50%   5024
	  66%   5056
	  75%   5063
	  80%   5106
	  90%   5220
	  95%   5220
	  98%   5220
	  99%   5220
	 100%   5220 (longest request)    
     
### User 2: ab -n10 -c1 http://localhost:3000/users/43

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      1
	Time taken for tests:   54.031 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      89040 bytes
	HTML transferred:       82580 bytes
	Requests per second:    0.19 [#/sec] (mean)
	Time per request:       5403.066 [ms] (mean)
	Time per request:       5403.066 [ms] (mean, across all concurrent requests)
	Transfer rate:          1.61 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   1.1      0       4
	Processing:  5334 5402  34.5   5418    5448
	Waiting:     5333 5402  34.3   5417    5447
	Total:       5334 5403  35.0   5418    5452

	Percentage of the requests served within a certain time (ms)
	  50%   5418
	  66%   5422
	  75%   5426
	  80%   5430
	  90%   5452
	  95%   5452
	  98%   5452
	  99%   5452
	 100%   5452 (longest request)
 
### User 3: ab -n10 -c1 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   38.135 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67780 bytes
	HTML transferred:       61320 bytes
	Requests per second:    0.26 [#/sec] (mean)
	Time per request:       3813.462 [ms] (mean)
	Time per request:       3813.462 [ms] (mean, across all concurrent requests)
	Transfer rate:          1.74 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    1   1.3      0       4
	Processing:  3769 3813  36.9   3804    3872
	Waiting:     3769 3812  36.8   3804    3871
	Total:       3769 3813  37.6   3805    3876

	Percentage of the requests served within a certain time (ms)
	  50%   3805
	  66%   3813
	  75%   3843
	  80%   3872
	  90%   3876
	  95%   3876
	  98%   3876
	  99%   3876
	 100%   3876 (longest request)
 
### Recipe 1: ab -n10 -c1 http://localhost:3000/recipes/2042

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      1
	Time taken for tests:   4.291 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      36430 bytes
	HTML transferred:       29970 bytes
	Requests per second:    2.33 [#/sec] (mean)
	Time per request:       429.109 [ms] (mean)
	Time per request:       429.109 [ms] (mean, across all concurrent requests)
	Transfer rate:          8.29 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.8      0       3
	Processing:   398  429  53.5    407     572
	Waiting:      397  428  52.5    406     568
	Total:        398  429  54.3    407     574

	Percentage of the requests served within a certain time (ms)
	  50%    407
	  66%    417
	  75%    421
	  80%    460
	  90%    574
	  95%    574
	  98%    574
	  99%    574
	 100%    574 (longest request)
     
### Recipe 2: ab -n10 -c1 http://localhost:3000/recipes/2082

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      1
	Time taken for tests:   4.261 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      41880 bytes
	HTML transferred:       35420 bytes
	Requests per second:    2.35 [#/sec] (mean)
	Time per request:       426.081 [ms] (mean)
	Time per request:       426.081 [ms] (mean, across all concurrent requests)
	Transfer rate:          9.60 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   1.1      0       4
	Processing:   392  425  30.9    416     475
	Waiting:      391  425  30.9    416     475
	Total:        393  426  31.2    416     476

	Percentage of the requests served within a certain time (ms)
	  50%    416
	  66%    450
	  75%    450
	  80%    466
	  90%    476
	  95%    476
	  98%    476
	  99%    476
	 100%    476 (longest request)
     
### Recipe 3: ab -n10 -c1 http://localhost:3000/recipes/2005

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      1
	Time taken for tests:   4.152 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      40040 bytes
	HTML transferred:       33580 bytes
	Requests per second:    2.41 [#/sec] (mean)
	Time per request:       415.219 [ms] (mean)
	Time per request:       415.219 [ms] (mean, across all concurrent requests)
	Transfer rate:          9.42 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    1   1.6      0       5
	Processing:   386  414  20.3    413     460
	Waiting:      386  414  20.2    413     459
	Total:        386  415  20.8    413     460

	Percentage of the requests served within a certain time (ms)
	  50%    413
	  66%    417
	  75%    419
	  80%    438
	  90%    460
	  95%    460
	  98%    460
	  99%    460
	 100%    460 (longest request)

     





