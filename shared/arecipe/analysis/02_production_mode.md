# 2. Applikation in Production Mode gestartet

## Getestet wurde mit:

*   Ruby-1.8.7-p370
*   Webrick 1.3.1 
*   Production Mode (neu)
*   SQLite

## Requests pro Sekunde:

*	front page:		  0,26 [#/sec]
*	user page:		~ 0,383 [#/sec] (3 Messungen)
*	recipes page:	~ 3,273 [#/sec] (3 Messungen)

## Ergebnis:

*	Improved front page requests per second by 13%.
*	Improved user page requests per second by 10,7%.
*	Improved recipe page requests per second by 74,1%.

## Nächster Schritt:

*	MySql statt Sqlite: Aufgrudn der vielen Datenbank Queries sollte eine bessere Datenbank Software eingesetzt werden


***


# Messungen 

### front page: ab -n10 -c1 http://localhost:3000/

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6649 bytes

	Concurrency Level:      1
	Time taken for tests:   39.451 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73154 bytes
	HTML transferred:       66694 bytes
	Requests per second:    0.26 [#/sec] (mean)
	Time per request:       3945.118 [ms] (mean)
	Time per request:       3945.118 [ms] (mean, across all concurrent requests)
	Transfer rate:          1.81 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:  3581 3945 223.3   3941    4222
	Waiting:     3581 3945 223.3   3940    4221
	Total:       3581 3945 223.3   3941    4222

	Percentage of the requests served within a certain time (ms)
	  50%   3941
	  66%   4111
	  75%   4123
	  80%   4209
	  90%   4222
	  95%   4222
	  98%   4222
	  99%   4222
	 100%   4222 (longest request)

### user page 1: ab -n10 -c1 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   28.076 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67780 bytes
	HTML transferred:       61320 bytes
	Requests per second:    0.36 [#/sec] (mean)
	Time per request:       2807.609 [ms] (mean)
	Time per request:       2807.609 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.36 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:  2769 2808  53.2   2791    2948
	Waiting:     2769 2807  52.8   2791    2946
	Total:       2769 2808  53.3   2791    2948

	Percentage of the requests served within a certain time (ms)
	  50%   2791
	  66%   2793
	  75%   2821
	  80%   2832
	  90%   2948
	  95%   2948
	  98%   2948
	  99%   2948
	 100%   2948 (longest request)

### user page 2: ab -n10 -c1 http://localhost:3000/users/47

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        4928 bytes

	Concurrency Level:      1
	Time taken for tests:   22.606 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      55740 bytes
	HTML transferred:       49280 bytes
	Requests per second:    0.44 [#/sec] (mean)
	Time per request:       2260.615 [ms] (mean)
	Time per request:       2260.615 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.41 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       1
	Processing:  2247 2261   7.0   2261    2275
	Waiting:     2247 2260   7.0   2261    2275
	Total:       2248 2261   7.0   2261    2276

	Percentage of the requests served within a certain time (ms)
	  50%   2261
	  66%   2262
	  75%   2263
	  80%   2264
	  90%   2276
	  95%   2276
	  98%   2276
	  99%   2276
	 100%   2276 (longest request)

### user page 3: ab -n10 -c1 http://localhost:3000/users/49

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/49
	Document Length:        6096 bytes

	Concurrency Level:      1
	Time taken for tests:   28.189 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67420 bytes
	HTML transferred:       60960 bytes
	Requests per second:    0.35 [#/sec] (mean)
	Time per request:       2818.909 [ms] (mean)
	Time per request:       2818.909 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.34 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:  2786 2819  26.5   2814    2864
	Waiting:     2786 2819  26.5   2814    2863
	Total:       2786 2819  26.5   2814    2864

	Percentage of the requests served within a certain time (ms)
	  50%   2814
	  66%   2818
	  75%   2845
	  80%   2854
	  90%   2864
	  95%   2864
	  98%   2864
	  99%   2864
	 100%   2864 (longest request)

### recipe page 1: ab -n10 -c1 http://localhost:3000/recipes/2003

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        4288 bytes

	Concurrency Level:      1
	Time taken for tests:   3.291 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      49340 bytes
	HTML transferred:       42880 bytes
	Requests per second:    3.04 [#/sec] (mean)
	Time per request:       329.129 [ms] (mean)
	Time per request:       329.129 [ms] (mean, across all concurrent requests)
	Transfer rate:          14.64 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   310  329  25.3    316     371
	Waiting:      309  329  25.1    316     371
	Total:        310  329  25.3    316     371

	Percentage of the requests served within a certain time (ms)
	  50%    316
	  66%    320
	  75%    355
	  80%    369
	  90%    371
	  95%    371
	  98%    371
	  99%    371
	 100%    371 (longest request)

### recipe page 2: ab -n10 -c1 http://localhost:3000/recipes/2061

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        2555 bytes

	Concurrency Level:      1
	Time taken for tests:   2.940 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      32010 bytes
	HTML transferred:       25550 bytes
	Requests per second:    3.40 [#/sec] (mean)
	Time per request:       293.951 [ms] (mean)
	Time per request:       293.951 [ms] (mean, across all concurrent requests)
	Transfer rate:          10.63 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   280  294  22.0    285     338
	Waiting:      280  294  22.0    285     338
	Total:        280  294  21.9    285     338

	Percentage of the requests served within a certain time (ms)
	  50%    285
	  66%    286
	  75%    288
	  80%    332
	  90%    338
	  95%    338
	  98%    338
	  99%    338
	 100%    338 (longest request)

### recipe page 3: ab -n10 -c1 http://localhost:3000/recipes/2066

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        3490 bytes

	Concurrency Level:      1
	Time taken for tests:   2.956 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      41360 bytes
	HTML transferred:       34900 bytes
	Requests per second:    3.38 [#/sec] (mean)
	Time per request:       295.623 [ms] (mean)
	Time per request:       295.623 [ms] (mean, across all concurrent requests)
	Transfer rate:          13.66 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   285  296  16.1    290     338
	Waiting:      285  295  15.9    290     337
	Total:        285  296  16.1    290     338

	Percentage of the requests served within a certain time (ms)
	  50%    290
	  66%    291
	  75%    293
	  80%    307
	  90%    338
	  95%    338
	  98%    338
	  99%    338
	 100%    338 (longest request)
 