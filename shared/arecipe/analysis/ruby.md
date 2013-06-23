# 4. Applikation im Production Mode starten

## Testumgebung

*   Ruby-1.9.3
*   WEBrick/1.3.1 
*   Production Mode
*   mySQL

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse des Ausgangssystems

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20
* Recipes: ~ 1.35

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



     





