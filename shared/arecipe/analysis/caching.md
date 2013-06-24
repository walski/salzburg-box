# 5. Einbinden von Caching

## Testumgebung

*   Ruby-1.9.3
*   Unicorn 
*   Production Mode
*   mySQL
*	memcached

## Server starten mit bundle exec unicorn -p 300 -c ./config/unicorn.rb -E production

## Zusammenfassung der Ergebnisse in Requests per second

### Ergebnisse des Ausgangssystems

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20 [#/sec]
* Recipes: ~ 1.35 [#/sec]

### Ergebnisse aus vorherigem Schritt

* Homepage:  2.84 [#/sec]
* Users: ~  4.55 [#/sec]
* Recipes: ~  33.35 [#/sec]

### Neue Ergebnisse

* Homepage:  61.61 [#/sec]
* Users: ~   64,18 [#/sec]
* Recipes: ~   61.47 [#/sec]

## Improvement

* Improved front page requests per second by 36241%
* Improved user page requests per second by 32090%
* Improved page requests per second by 4553%

## Durchgeführte Tests

### Homepage: ab -n100 -c1 http://localhost:3000/

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6722 bytes

	Concurrency Level:      1
	Time taken for tests:   1.623 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      734200 bytes
	HTML transferred:       672200 bytes
	Requests per second:    61.61 [#/sec] (mean)
	Time per request:       16.231 [ms] (mean)
	Time per request:       16.231 [ms] (mean, across all concurrent requests)
	Transfer rate:          441.73 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    11   16   7.9     14      81
	Waiting:       10   15   7.8     13      81
	Total:         11   16   7.9     14      81

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     16
	  75%     17
	  80%     18
	  90%     19
	  95%     25
	  98%     39
	  99%     81
	 100%     81 (longest request)     
	

### User 1: ab -n100 -c1 http://localhost:3000/users/50

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/50
	Document Length:        7314 bytes

	Concurrency Level:      1
	Time taken for tests:   1.599 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      793400 bytes
	HTML transferred:       731400 bytes
	Requests per second:    62.52 [#/sec] (mean)
	Time per request:       15.994 [ms] (mean)
	Time per request:       15.994 [ms] (mean, across all concurrent requests)
	Transfer rate:          484.44 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:     9   16   6.7     14      51
	Waiting:        9   15   6.5     13      51
	Total:          9   16   6.7     14      51

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     16
	  75%     17
	  80%     17
	  90%     19
	  95%     33
	  98%     49
	  99%     51
	 100%     51 (longest request)	

### User 2: ab -n100 -c1 http://localhost:3000/users/43

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/43
	Document Length:        8258 bytes

	Concurrency Level:      1
	Time taken for tests:   1.534 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      887800 bytes
	HTML transferred:       825800 bytes
	Requests per second:    65.17 [#/sec] (mean)
	Time per request:       15.344 [ms] (mean)
	Time per request:       15.344 [ms] (mean, across all concurrent requests)
	Transfer rate:          565.04 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    12   15   5.3     13      49
	Waiting:       11   14   5.3     13      48
	Total:         12   15   5.3     14      49

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     15
	  75%     17
	  80%     17
	  90%     18
	  95%     19
	  98%     42
	  99%     49
	 100%     49 (longest request)	


### User 3: ab -n100 -c1 http://localhost:3000/users/41

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   1.542 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      675200 bytes
	HTML transferred:       613200 bytes
	Requests per second:    64.85 [#/sec] (mean)
	Time per request:       15.421 [ms] (mean)
	Time per request:       15.421 [ms] (mean, across all concurrent requests)
	Transfer rate:          427.57 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    11   15   6.3     14      54
	Waiting:       10   15   6.3     13      54
	Total:         11   15   6.3     14      54

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     15
	  75%     16
	  80%     17
	  90%     18
	  95%     19
	  98%     52
	  99%     54
	 100%     54 (longest request)	

### Recipe 1: ab -n100 -c1 http://localhost:3000/recipes/2042

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2042
	Document Length:        2997 bytes

	Concurrency Level:      1
	Time taken for tests:   1.607 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      361700 bytes
	HTML transferred:       299700 bytes
	Requests per second:    62.24 [#/sec] (mean)
	Time per request:       16.066 [ms] (mean)
	Time per request:       16.066 [ms] (mean, across all concurrent requests)
	Transfer rate:          219.85 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    12   16   6.3     14      55
	Waiting:       11   15   6.2     13      54
	Total:         12   16   6.3     14      55

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     15
	  75%     17
	  80%     18
	  90%     19
	  95%     22
	  98%     54
	  99%     55
	 100%     55 (longest request)	

### Recipe 2: ab -n100 -c1 http://localhost:3000/recipes/2082

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2082
	Document Length:        3542 bytes

	Concurrency Level:      1
	Time taken for tests:   1.556 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      416200 bytes
	HTML transferred:       354200 bytes
	Requests per second:    64.26 [#/sec] (mean)
	Time per request:       15.563 [ms] (mean)
	Time per request:       15.563 [ms] (mean, across all concurrent requests)
	Transfer rate:          261.16 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:     9   15   5.6     14      52
	Waiting:        8   15   5.6     13      51
	Total:          9   15   5.6     14      52

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     15
	  75%     17
	  80%     17
	  90%     19
	  95%     20
	  98%     51
	  99%     52
	 100%     52 (longest request)

### Recipe 3: ab -n100 -c1 http://localhost:3000/recipes/2005

	Server Software:
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2005
	Document Length:        3358 bytes

	Concurrency Level:      1
	Time taken for tests:   1.726 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      397800 bytes
	HTML transferred:       335800 bytes
	Requests per second:    57.92 [#/sec] (mean)
	Time per request:       17.264 [ms] (mean)
	Time per request:       17.264 [ms] (mean, across all concurrent requests)
	Transfer rate:          225.02 [Kbytes/sec] received

	Connection Times (ms)
	              min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       1
	Processing:    10   17  13.0     14     134
	Waiting:       10   16  12.4     14     127
	Total:         10   17  13.1     14     134

	Percentage of the requests served within a certain time (ms)
	  50%     14
	  66%     16
	  75%     17
	  80%     17
	  90%     19
	  95%     34
	  98%     52
	  99%    134
	 100%    134 (longest request)

	



     





