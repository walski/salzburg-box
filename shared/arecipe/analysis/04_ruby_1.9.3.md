# 4. Ruby auf 1.9.3 updaten

## Getestet wurde mit:

*   Ruby-1.9.3-p429 (neu)
*   Webrick 1.3.1
*   Production Mode
*   MySql

## Requests pro Sekunde:

*	front page:		  7,51 [#/sec]
*	user page:		~ 9,46 [#/sec] (3 Messungen)
*	recipes page:	~ 39,62 [#/sec] (3 Messungen)

## Ergebnis:

*	Improved front page requests per second by 3029,2%.
*	Improved user page requests per second by 2634,1%.
*	Improved recipe page requests per second by 2000,1%.

## Nächster Schritt:

*	Webrick durch Thin austauschen um Requests asynchron zu verarbeiten.


***


# Messungen 

### front page: ab -n20 -c1 http://localhost:3000/

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6719 bytes

	Concurrency Level:      1
	Time taken for tests:   2.664 seconds
	Complete requests:      20
	Failed requests:        19
	   (Connect: 0, Receive: 0, Length: 19, Exceptions: 0)
	Write errors:           0
	Total transferred:      147625 bytes
	HTML transferred:       134145 bytes
	Requests per second:    7.51 [#/sec] (mean)
	Time per request:       133.199 [ms] (mean)
	Time per request:       133.199 [ms] (mean, across all concurrent requests)
	Transfer rate:          54.12 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   102  133  16.2    132     157
	Waiting:      102  133  16.3    132     157
	Total:        102  133  16.2    132     157

	Percentage of the requests served within a certain time (ms)
	  50%    132
	  66%    145
	  75%    149
	  80%    151
	  90%    156
	  95%    157
	  98%    157
	  99%    157
	 100%    157 (longest request)

### user page 1: ab -n20 -c1 http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      1
	Time taken for tests:   2.240 seconds
	Complete requests:      20
	Failed requests:        0
	Write errors:           0
	Total transferred:      136120 bytes
	HTML transferred:       122640 bytes
	Requests per second:    8.93 [#/sec] (mean)
	Time per request:       111.988 [ms] (mean)
	Time per request:       111.988 [ms] (mean, across all concurrent requests)
	Transfer rate:          59.35 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.3      0       1
	Processing:    90  112  28.7    112     213
	Waiting:       90  112  28.4    112     211
	Total:         90  112  28.9    113     214

	Percentage of the requests served within a certain time (ms)
	  50%    113
	  66%    114
	  75%    129
	  80%    131
	  90%    132
	  95%    214
	  98%    214
	  99%    214
	 100%    214 (longest request)

### user page 2: ab -n20 -c1 http://localhost:3000/users/47

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        4928 bytes

	Concurrency Level:      1
	Time taken for tests:   1.879 seconds
	Complete requests:      20
	Failed requests:        0
	Write errors:           0
	Total transferred:      112040 bytes
	HTML transferred:       98560 bytes
	Requests per second:    10.64 [#/sec] (mean)
	Time per request:       93.965 [ms] (mean)
	Time per request:       93.965 [ms] (mean, across all concurrent requests)
	Transfer rate:          58.22 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:    80   94  14.7     85     120
	Waiting:       80   94  14.7     85     120
	Total:         80   94  14.7     85     120

	Percentage of the requests served within a certain time (ms)
	  50%     85
	  66%     98
	  75%    100
	  80%    119
	  90%    120
	  95%    120
	  98%    120
	  99%    120
	 100%    120 (longest request)

### user page 3: ab -n20 -c1 http://localhost:3000/users/49

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/49
	Document Length:        6096 bytes

	Concurrency Level:      1
	Time taken for tests:   2.267 seconds
	Complete requests:      20
	Failed requests:        0
	Write errors:           0
	Total transferred:      135400 bytes
	HTML transferred:       121920 bytes
	Requests per second:    8.82 [#/sec] (mean)
	Time per request:       113.363 [ms] (mean)
	Time per request:       113.363 [ms] (mean, across all concurrent requests)
	Transfer rate:          58.32 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:    96  113  15.9    115     140
	Waiting:       95  113  16.0    115     139
	Total:         96  113  15.9    115     140

	Percentage of the requests served within a certain time (ms)
	  50%    115
	  66%    118
	  75%    132
	  80%    136
	  90%    139
	  95%    140
	  98%    140
	  99%    140
	 100%    140 (longest request)

### recipe page 1: ab -n100 -c1 http://localhost:3000/recipes/2003

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        4288 bytes

	Concurrency Level:      1
	Time taken for tests:   3.579 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      496200 bytes
	HTML transferred:       428800 bytes
	Requests per second:    27.94 [#/sec] (mean)
	Time per request:       35.788 [ms] (mean)
	Time per request:       35.788 [ms] (mean, across all concurrent requests)
	Transfer rate:          135.40 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    29   36  10.7     32      69
	Waiting:       29   36  10.7     31      68
	Total:         29   36  10.7     32      69

	Percentage of the requests served within a certain time (ms)
	  50%     32
	  66%     32
	  75%     33
	  80%     33
	  90%     50
	  95%     67
	  98%     68
	  99%     69
	 100%     69 (longest request)

### recipe page 2: ab -n100 -c1 http://localhost:3000/recipes/2061

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        2555 bytes

	Concurrency Level:      1
	Time taken for tests:   2.044 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      322900 bytes
	HTML transferred:       255500 bytes
	Requests per second:    48.91 [#/sec] (mean)
	Time per request:       20.444 [ms] (mean)
	Time per request:       20.444 [ms] (mean, across all concurrent requests)
	Transfer rate:          154.24 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    17   20   7.8     18      56
	Waiting:       17   20   7.8     18      56
	Total:         17   20   7.8     18      56

	Percentage of the requests served within a certain time (ms)
	  50%     18
	  66%     19
	  75%     19
	  80%     19
	  90%     20
	  95%     38
	  98%     54
	  99%     56
	 100%     56 (longest request)

### recipe page 3: ab -n100 -c1 http://localhost:3000/recipes/2066

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        3490 bytes

	Concurrency Level:      1
	Time taken for tests:   2.380 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      416400 bytes
	HTML transferred:       349000 bytes
	Requests per second:    42.01 [#/sec] (mean)
	Time per request:       23.805 [ms] (mean)
	Time per request:       23.805 [ms] (mean, across all concurrent requests)
	Transfer rate:          170.82 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:    20   24   8.0     22      60
	Waiting:       20   24   8.0     21      60
	Total:         20   24   8.0     22      60

	Percentage of the requests served within a certain time (ms)
	  50%     22
	  66%     22
	  75%     22
	  80%     22
	  90%     26
	  95%     43
	  98%     58
	  99%     60
	 100%     60 (longest request)
 