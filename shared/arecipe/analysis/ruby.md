# 4. Auf Ruby Version 1.9.3 umstellen

## Testumgebung

*   Ruby-1.9.3
*   WEBrick/1.3.1 
*   Production Mode
*   mySQL

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse des Ausgangssystems

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20 [#/sec]
* Recipes: ~ 1.35 [#/sec]

### Ergebnisse aus vorherigem Schritt

* Homepage: 2.82 [#/sec]
* Users: ~ 2.98 [#/sec]
* Recipes: ~ 20.22 [#/sec]

### Neue Ergebnisse

* Homepage: 4.41 [#/sec]
* Users: ~ 5.24 [#/sec]
* Recipes: ~ 26.68 [#/sec]

## Improvement

* Improved front page requests per second by 2594%
* Improved user page requests per second by 2620%
* Improved page requests per second by 1976%

## Tests mit Concurrency Level 3

* Homepage: 5.16 [#/sec]
* Users: ~ 5.6 [#/sec]
* Recipes: ~ 28.04 [#/sec]

## Nächster Schritt

* Webrick durch Unicorn ersetzen, da Unicorn mehrere Requests gleichzeitig verarbeiten kann

## Durchgeführte Tests

### Homepage: ab -n10 -c1 http://localhost:3000/
     
	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6707 bytes

	Concurrency Level:      1
	Time taken for tests:   2.268 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73802 bytes
	HTML transferred:       67062 bytes
	Requests per second:    4.41 [#/sec] (mean)
	Time per request:       226.813 [ms] (mean)
	Time per request:       226.813 [ms] (mean, across all concurrent requests)
	Transfer rate:          31.78 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       2
	Processing:   199  226  38.4    220     332
	Waiting:      199  225  37.4    219     329
	Total:        200  227  39.0    220     335

	Percentage of the requests served within a certain time (ms)
	  50%    220
	  66%    223
	  75%    224
	  80%    226
	  90%    335
	  95%    335
	  98%    335
	  99%    335
	 100%    335 (longest request)
	

### User 1: ab -n10 -c1 http://localhost:3000/users/50

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      1
	Time taken for tests:   2.170 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      79880 bytes
	HTML transferred:       73140 bytes
	Requests per second:    4.61 [#/sec] (mean)
	Time per request:       217.004 [ms] (mean)
	Time per request:       217.004 [ms] (mean, across all concurrent requests)
	Transfer rate:          35.95 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    1   1.2      0       4
	Processing:   178  216  61.4    201     390
	Waiting:      177  216  61.3    200     389
	Total:        178  217  62.6    201     394

	Percentage of the requests served within a certain time (ms)
	  50%    201
	  66%    202
	  75%    202
	  80%    202
	  90%    394
	  95%    394
	  98%    394
	  99%    394
	 100%    394 (longest request)

     
### User 2: ab -n10 -c1 http://localhost:3000/users/43

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      1
	Time taken for tests:   2.221 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      89320 bytes
	HTML transferred:       82580 bytes
	Requests per second:    4.50 [#/sec] (mean)
	Time per request:       222.149 [ms] (mean)
	Time per request:       222.149 [ms] (mean, across all concurrent requests)
	Transfer rate:          39.26 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.8      0       3
	Processing:   212  222   6.6    223     236
	Waiting:      212  221   6.8    222     236
	Total:        213  222   6.5    223     236

	Percentage of the requests served within a certain time (ms)
	  50%    223
	  66%    224
	  75%    224
	  80%    226
	  90%    236
	  95%    236
	  98%    236
	  99%    236
	 100%    236 (longest request)	

 
### User 3: ab -n10 -c1 http://localhost:3000/users/41

	
	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   1.511 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      68060 bytes
	HTML transferred:       61320 bytes
	Requests per second:    6.62 [#/sec] (mean)
	Time per request:       151.149 [ms] (mean)
	Time per request:       151.149 [ms] (mean, across all concurrent requests)
	Transfer rate:          43.97 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       2
	Processing:   134  151  10.5    155     162
	Waiting:      133  150  10.4    154     161
	Total:        134  151  10.7    155     162

	Percentage of the requests served within a certain time (ms)
	  50%    155
	  66%    155
	  75%    161
	  80%    161
	  90%    162
	  95%    162
	  98%    162
	  99%    162
	 100%    162 (longest request)

 
### Recipe 1: ab -n50 -c1 http://localhost:3000/recipes/2042

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      1
	Time taken for tests:   1.780 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      183550 bytes
	HTML transferred:       149850 bytes
	Requests per second:    28.09 [#/sec] (mean)
	Time per request:       35.603 [ms] (mean)
	Time per request:       35.603 [ms] (mean, across all concurrent requests)
	Transfer rate:          100.69 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.6      0       4
	Processing:    31   35   6.4     33      57
	Waiting:       31   35   6.4     32      56
	Total:         32   35   6.5     33      57

	Percentage of the requests served within a certain time (ms)
	  50%     33
	  66%     33
	  75%     34
	  80%     35
	  90%     52
	  95%     54
	  98%     57
	  99%     57
	 100%     57 (longest request)
     
### Recipe 2: ab -n50 -c1 http://localhost:3000/recipes/2082

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      1
	Time taken for tests:   1.777 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      210800 bytes
	HTML transferred:       177100 bytes
	Requests per second:    28.13 [#/sec] (mean)
	Time per request:       35.546 [ms] (mean)
	Time per request:       35.546 [ms] (mean, across all concurrent requests)
	Transfer rate:          115.83 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.4      0       3
	Processing:    31   35   7.4     32      58
	Waiting:       30   35   7.4     32      57
	Total:         31   35   7.6     32      61

	Percentage of the requests served within a certain time (ms)
	  50%     32
	  66%     33
	  75%     33
	  80%     34
	  90%     52
	  95%     54
	  98%     61
	  99%     61
	 100%     61 (longest request)	
     
### Recipe 3: ab -n50 -c1 http://localhost:3000/recipes/2005

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      1
	Time taken for tests:   2.099 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      201600 bytes
	HTML transferred:       167900 bytes
	Requests per second:    23.83 [#/sec] (mean)
	Time per request:       41.970 [ms] (mean)
	Time per request:       41.970 [ms] (mean, across all concurrent requests)
	Transfer rate:          93.82 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       2
	Processing:    32   42  27.9     35     229
	Waiting:       32   41  27.4     35     225
	Total:         33   42  28.1     35     231

	Percentage of the requests served within a certain time (ms)
	  50%     35
	  66%     36
	  75%     38
	  80%     42
	  90%     54
	  95%     55
	  98%    231
	  99%    231
	 100%    231 (longest request)	


### Homepage: ab -n50 -c3 http://localhost:3000/

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6656 bytes

	Concurrency Level:      3
	Time taken for tests:   9.692 seconds
	Complete requests:      50
	Failed requests:        49
	   (Connect: 0, Receive: 0, Length: 49, Exceptions: 0)
	Write errors:           0
	Total transferred:      368855 bytes
	HTML transferred:       335155 bytes
	Requests per second:    5.16 [#/sec] (mean)
	Time per request:       581.546 [ms] (mean)
	Time per request:       193.849 [ms] (mean, across all concurrent requests)
	Transfer rate:          37.16 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.7      0       5
	Processing:   310  568  49.9    568     727
	Waiting:      310  566  50.1    567     722
	Total:        315  569  49.5    568     728

	Percentage of the requests served within a certain time (ms)
	  50%    568
	  66%    583
	  75%    592
	  80%    602
	  90%    610
	  95%    611
	  98%    728
	  99%    728
	 100%    728 (longest request)


### User 1: ab -n50 -c3 http://localhost:3000/users/50

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      3
	Time taken for tests:   9.724 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      399400 bytes
	HTML transferred:       365700 bytes
	Requests per second:    5.14 [#/sec] (mean)
	Time per request:       583.442 [ms] (mean)
	Time per request:       194.481 [ms] (mean, across all concurrent requests)
	Transfer rate:          40.11 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   1.1      0       8
	Processing:   397  572  41.5    576     781
	Waiting:      396  570  41.1    574     776
	Total:        397  572  42.2    576     788

	Percentage of the requests served within a certain time (ms)
	  50%    576
	  66%    579
	  75%    579
	  80%    580
	  90%    581
	  95%    589
	  98%    788
	  99%    788
	 100%    788 (longest request)

### User 2: ab -n50 -c3 http://localhost:3000/users/43

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      3
	Time taken for tests:   10.600 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      446600 bytes
	HTML transferred:       412900 bytes
	Requests per second:    4.72 [#/sec] (mean)
	Time per request:       635.976 [ms] (mean)
	Time per request:       211.992 [ms] (mean, across all concurrent requests)
	Transfer rate:          41.15 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.9      0       6
	Processing:   258  623  59.9    632     663
	Waiting:      257  621  59.9    631     662
	Total:        264  623  59.1    632     663

	Percentage of the requests served within a certain time (ms)
	  50%    632
	  66%    637
	  75%    639
	  80%    642
	  90%    648
	  95%    660
	  98%    663
	  99%    663
	 100%    663 (longest request)

### User 3: ab -n50 -c3 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      3
	Time taken for tests:   7.206 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      340300 bytes
	HTML transferred:       306600 bytes
	Requests per second:    6.94 [#/sec] (mean)
	Time per request:       432.356 [ms] (mean)
	Time per request:       144.119 [ms] (mean, across all concurrent requests)
	Transfer rate:          46.12 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.8      0       6
	Processing:   158  424  48.0    433     465
	Waiting:      158  421  47.8    429     464
	Total:        164  424  47.4    433     465

	Percentage of the requests served within a certain time (ms)
	  50%    433
	  66%    447
	  75%    449
	  80%    450
	  90%    458
	  95%    463
	  98%    465
	  99%    465
	 100%    465 (longest request)


### Recipe 1: ab -n200 -c3 http://localhost:3000/recipes/2042

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      3
	Time taken for tests:   7.242 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      734200 bytes
	HTML transferred:       599400 bytes
	Requests per second:    27.62 [#/sec] (mean)
	Time per request:       108.633 [ms] (mean)
	Time per request:       36.211 [ms] (mean, across all concurrent requests)
	Transfer rate:          99.00 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.4      0       4
	Processing:    94  108  21.8     99     257
	Waiting:       91  106  21.9     98     257
	Total:         95  108  22.1     99     261

	Percentage of the requests served within a certain time (ms)
	  50%     99
	  66%    102
	  75%    105
	  80%    115
	  90%    141
	  95%    148
	  98%    161
	  99%    229
	 100%    261 (longest request)


### Recipe 2: ab -n200 -c3 http://localhost:3000/recipes/2082

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      3
	Time taken for tests:   6.830 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      843200 bytes
	HTML transferred:       708400 bytes
	Requests per second:    29.28 [#/sec] (mean)
	Time per request:       102.444 [ms] (mean)
	Time per request:       34.148 [ms] (mean, across all concurrent requests)
	Transfer rate:          120.57 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.3      0       4
	Processing:    53  102  15.6     96     147
	Waiting:       51  100  15.7     95     145
	Total:         57  102  15.5     96     147

	Percentage of the requests served within a certain time (ms)
	  50%     96
	  66%     97
	  75%     99
	  80%    102
	  90%    137
	  95%    140
	  98%    144
	  99%    145
	 100%    147 (longest request)

### Recipe 3: ab -n200 -c3 http://localhost:3000/recipes/2005

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      3
	Time taken for tests:   7.348 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      806400 bytes
	HTML transferred:       671600 bytes
	Requests per second:    27.22 [#/sec] (mean)
	Time per request:       110.217 [ms] (mean)
	Time per request:       36.739 [ms] (mean, across all concurrent requests)
	Transfer rate:          107.18 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.3      0       5
	Processing:    65  109  16.0    103     154
	Waiting:       61  108  15.9    101     153
	Total:         69  110  15.9    103     154

	Percentage of the requests served within a certain time (ms)
	  50%    103
	  66%    105
	  75%    107
	  80%    110
	  90%    144
	  95%    148
	  98%    152
	  99%    152
	 100%    154 (longest request)


     





