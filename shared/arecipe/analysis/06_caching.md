# 6. Caching einbauen

## Getestet wurde mit:

*   Ruby-1.9.3-p429 
*   Thin 1.5.1 (neu)
*   Production Mode
*   MySql
*	Caching

## Requests pro Sekunde:

*	front page:		   99,55 [#/sec]
*	user page:		~ 101,05 [#/sec] (3 Messungen)
*	recipes page:	~ 107,79 [#/sec] (3 Messungen)

## Ergebnis:

*	Improved front page requests per second by 43182,6%.
*	Improved user page requests per second by 29105,2%.
*	Improved recipe page requests per second by 5615,3%.

## Nächster Schritt:

*	schnell genug ;)


***


# Messungen 

### front page: ab -n200 -c5 http://localhost:3000/

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6669 bytes

	Concurrency Level:      5
	Time taken for tests:   2.009 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      1463400 bytes
	HTML transferred:       1333800 bytes
	Requests per second:    99.55 [#/sec] (mean)
	Time per request:       50.228 [ms] (mean)
	Time per request:       10.046 [ms] (mean, across all concurrent requests)
	Transfer rate:          711.30 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       1
	Processing:    38   50  28.2     43     219
	Waiting:        8   43  31.3     42     219
	Total:         38   50  28.3     43     220

	Percentage of the requests served within a certain time (ms)
	  50%     43
	  66%     45
	  75%     47
	  80%     50
	  90%     64
	  95%     70
	  98%    220
	  99%    220
	 100%    220 (longest request)

### user page 1: ab -n200 -c5 http://localhost:3000/users/41

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      5
	Time taken for tests:   2.046 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      1356000 bytes
	HTML transferred:       1226400 bytes
	Requests per second:    97.73 [#/sec] (mean)
	Time per request:       51.159 [ms] (mean)
	Time per request:       10.232 [ms] (mean, across all concurrent requests)
	Transfer rate:          647.11 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       1
	Processing:    40   51  30.3     43     235
	Waiting:        8   43  33.5     42     235
	Total:         40   51  30.5     43     236

	Percentage of the requests served within a certain time (ms)
	  50%     43
	  66%     47
	  75%     49
	  80%     49
	  90%     64
	  95%     68
	  98%    236
	  99%    236
	 100%    236 (longest request)

### user page 2: ab -n200 -c5 http://localhost:3000/users/47

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        4928 bytes

	Concurrency Level:      5
	Time taken for tests:   1.761 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      1115200 bytes
	HTML transferred:       985600 bytes
	Requests per second:    113.55 [#/sec] (mean)
	Time per request:       44.033 [ms] (mean)
	Time per request:       8.807 [ms] (mean, across all concurrent requests)
	Transfer rate:          618.32 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    40   44   6.3     42      64
	Waiting:       39   44   6.3     42      64
	Total:         40   44   6.3     42      64

	Percentage of the requests served within a certain time (ms)
	  50%     42
	  66%     43
	  75%     43
	  80%     44
	  90%     60
	  95%     64
	  98%     64
	  99%     64
	 100%     64 (longest request)

### user page 3: ab -n200 -c5 http://localhost:3000/users/49

Server Software:        thin
Server Hostname:        localhost
Server Port:            3000

Document Path:          /users/49
Document Length:        6096 bytes

Concurrency Level:      5
Time taken for tests:   2.177 seconds
Complete requests:      200
Failed requests:        0
Write errors:           0
Total transferred:      1348800 bytes
HTML transferred:       1219200 bytes
Requests per second:    91.87 [#/sec] (mean)
Time per request:       54.425 [ms] (mean)
Time per request:       10.885 [ms] (mean, across all concurrent requests)
Transfer rate:          605.04 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:    39   54  40.3     43     252
Waiting:        8   46  40.9     42     252
Total:         39   54  40.3     43     252

Percentage of the requests served within a certain time (ms)
  50%     43
  66%     46
  75%     47
  80%     50
  90%     64
  95%    200
  98%    252
  99%    252
 100%    252 (longest request)

### recipe page 1: ab -n200 -c5 http://localhost:3000/recipes/2003

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        4288 bytes

	Concurrency Level:      5
	Time taken for tests:   1.874 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      987200 bytes
	HTML transferred:       857600 bytes
	Requests per second:    106.75 [#/sec] (mean)
	Time per request:       46.839 [ms] (mean)
	Time per request:       9.368 [ms] (mean, across all concurrent requests)
	Transfer rate:          514.56 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    40   47   6.1     45      64
	Waiting:       40   47   6.1     45      64
	Total:         40   47   6.1     45      64

	Percentage of the requests served within a certain time (ms)
	  50%     45
	  66%     46
	  75%     47
	  80%     48
	  90%     63
	  95%     64
	  98%     64
	  99%     64
	 100%     64 (longest request)

### recipe page 2: ab -n200 -c5 http://localhost:3000/recipes/2061

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        2555 bytes

	Concurrency Level:      5
	Time taken for tests:   1.841 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      640600 bytes
	HTML transferred:       511000 bytes
	Requests per second:    108.66 [#/sec] (mean)
	Time per request:       46.017 [ms] (mean)
	Time per request:       9.203 [ms] (mean, across all concurrent requests)
	Transfer rate:          339.87 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    41   46   6.0     44      64
	Waiting:       40   46   6.0     44      64
	Total:         41   46   6.0     44      64

	Percentage of the requests served within a certain time (ms)
	  50%     44
	  66%     45
	  75%     45
	  80%     45
	  90%     63
	  95%     64
	  98%     64
	  99%     64
	 100%     64 (longest request)

### recipe page 3: ab -n200 -c5 http://localhost:3000/recipes/2066

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        3490 bytes

	Concurrency Level:      5
	Time taken for tests:   1.853 seconds
	Complete requests:      200
	Failed requests:        0
	Write errors:           0
	Total transferred:      827600 bytes
	HTML transferred:       698000 bytes
	Requests per second:    107.95 [#/sec] (mean)
	Time per request:       46.320 [ms] (mean)
	Time per request:       9.264 [ms] (mean, across all concurrent requests)
	Transfer rate:          436.21 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    40   46   6.5     44      68
	Waiting:       40   46   6.6     44      68
	Total:         40   46   6.5     44      68

	Percentage of the requests served within a certain time (ms)
	  50%     44
	  66%     46
	  75%     47
	  80%     48
	  90%     61
	  95%     64
	  98%     68
	  99%     68
	 100%     68 (longest request)
 