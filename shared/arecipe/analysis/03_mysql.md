# 3. Sqlite durch MySql ersetzt

## Getestet wurde mit:

*   Ruby-1.8.7-p370
*   Webrick 1.3.1
*   Production Mode
*   MySql (neu)

## Requests pro Sekunde:

*	front page:		  3,48 [#/sec]
*	user page:		~ 4,683 [#/sec] (3 Messungen)
*	recipes page:	~ 24,47 [#/sec] (3 Messungen)

## Ergebnis:

*	Improved front page requests per second by 1413,1%.
*	Improved user page requests per second by 1253,5%.
*	Improved recipe page requests per second by 1197,5%.

## Nächster Schritt:

*	Ruby updaten auf 1.9.3 für bessere garbage collection.


***


# Messungen 

### front page: ab -n10 -c1 http://localhost:3000/

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6703 bytes

	Concurrency Level:      1
	Time taken for tests:   2.871 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      73468 bytes
	HTML transferred:       67008 bytes
	Requests per second:    3.48 [#/sec] (mean)
	Time per request:       287.106 [ms] (mean)
	Time per request:       287.106 [ms] (mean, across all concurrent requests)
	Transfer rate:          24.99 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   230  287  44.3    286     394
	Waiting:      230  287  44.0    286     392
	Total:        230  287  44.4    286     394

	Percentage of the requests served within a certain time (ms)
	  50%    286
	  66%    298
	  75%    298
	  80%    302
	  90%    394
	  95%    394
	  98%    394
	  99%    394
	 100%    394 (longest request)

### user page 1: ab -n10 -c1 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   2.288 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67780 bytes
	HTML transferred:       61320 bytes
	Requests per second:    4.37 [#/sec] (mean)
	Time per request:       228.811 [ms] (mean)
	Time per request:       228.811 [ms] (mean, across all concurrent requests)
	Transfer rate:          28.93 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   182  229  60.2    234     384
	Waiting:      182  228  59.9    234     383
	Total:        182  229  60.3    234     384

	Percentage of the requests served within a certain time (ms)
	  50%    234
	  66%    234
	  75%    236
	  80%    237
	  90%    384
	  95%    384
	  98%    384
	  99%    384
	 100%    384 (longest request)

### user page 2: ab -n10 -c1 http://localhost:3000/users/47

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        4928 bytes

	Concurrency Level:      1
	Time taken for tests:   1.866 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      55740 bytes
	HTML transferred:       49280 bytes
	Requests per second:    5.36 [#/sec] (mean)
	Time per request:       186.609 [ms] (mean)
	Time per request:       186.609 [ms] (mean, across all concurrent requests)
	Transfer rate:          29.17 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   165  187  34.7    168     266
	Waiting:      165  186  34.5    167     264
	Total:        165  187  34.8    168     266

	Percentage of the requests served within a certain time (ms)
	  50%    168
	  66%    168
	  75%    216
	  80%    217
	  90%    266
	  95%    266
	  98%    266
	  99%    266
	 100%    266 (longest request)

### user page 3: ab -n10 -c1 http://localhost:3000/users/49

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/49
	Document Length:        6096 bytes

	Concurrency Level:      1
	Time taken for tests:   2.314 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      67420 bytes
	HTML transferred:       60960 bytes
	Requests per second:    4.32 [#/sec] (mean)
	Time per request:       231.414 [ms] (mean)
	Time per request:       231.414 [ms] (mean, across all concurrent requests)
	Transfer rate:          28.45 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   192  231  27.8    242     275
	Waiting:      192  231  27.6    242     273
	Total:        192  231  27.9    242     275

	Percentage of the requests served within a certain time (ms)
	  50%    242
	  66%    242
	  75%    244
	  80%    246
	  90%    275
	  95%    275
	  98%    275
	  99%    275
	 100%    275 (longest request)

### recipe page 1: ab -n50 -c1 http://localhost:3000/recipes/2003

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        4288 bytes

	Concurrency Level:      1
	Time taken for tests:   3.016 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      246700 bytes
	HTML transferred:       214400 bytes
	Requests per second:    16.58 [#/sec] (mean)
	Time per request:       60.312 [ms] (mean)
	Time per request:       60.312 [ms] (mean, across all concurrent requests)
	Transfer rate:          79.89 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:    41   60  25.5     44     105
	Waiting:       41   60  25.4     44     104
	Total:         41   60  25.5     44     106

	Percentage of the requests served within a certain time (ms)
	  50%     44
	  66%     47
	  75%     96
	  80%     96
	  90%     97
	  95%     97
	  98%    106
	  99%    106
	 100%    106 (longest request)

### recipe page 2: ab -n50 -c1 http://localhost:3000/recipes/2061

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        2555 bytes

	Concurrency Level:      1
	Time taken for tests:   1.658 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      160050 bytes
	HTML transferred:       127750 bytes
	Requests per second:    30.16 [#/sec] (mean)
	Time per request:       33.161 [ms] (mean)
	Time per request:       33.161 [ms] (mean, across all concurrent requests)
	Transfer rate:          94.27 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:    22   33  20.7     24      85
	Waiting:       22   33  20.6     23      83
	Total:         22   33  20.7     24      85

	Percentage of the requests served within a certain time (ms)
	  50%     24
	  66%     24
	  75%     25
	  80%     26
	  90%     76
	  95%     77
	  98%     85
	  99%     85
	 100%     85 (longest request)

### recipe page 3: ab -n50 -c1 http://localhost:3000/recipes/2066

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        3490 bytes

	Concurrency Level:      1
	Time taken for tests:   1.875 seconds
	Complete requests:      50
	Failed requests:        0
	Write errors:           0
	Total transferred:      206800 bytes
	HTML transferred:       174500 bytes
	Requests per second:    26.67 [#/sec] (mean)
	Time per request:       37.495 [ms] (mean)
	Time per request:       37.495 [ms] (mean, across all concurrent requests)
	Transfer rate:          107.72 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:    26   37  20.3     28      83
	Waiting:       26   37  20.3     28      83
	Total:         26   37  20.3     28      83

	Percentage of the requests served within a certain time (ms)
	  50%     28
	  66%     29
	  75%     30
	  80%     39
	  90%     80
	  95%     81
	  98%     83
	  99%     83
	 100%     83 (longest request)
 