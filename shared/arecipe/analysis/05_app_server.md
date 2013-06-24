# 5. Webrick durch Thin ersetzen

## Getestet wurde mit:

*   Ruby-1.9.3-p429 
*   Thin 1.5.1 (neu)
*   Production Mode
*   MySql

## Requests pro Sekunde:

*	front page:		  7,73 [#/sec]
*	user page:		~ 10,02 [#/sec] (3 Messungen)
*	recipes page:	~ 47,74 [#/sec] (3 Messungen)

## Ergebnis:

*	Improved front page requests per second by 3260,9%.
*	Improved user page requests per second by 2796,0%.
*	Improved recipe page requests per second by 2431,3%.

## Nächster Schritt:

*	Caching einbauen um Datenbankabfragen zu minimieren.


***


# Messungen 

### front page: ab -n30 -c5 http://localhost:3000/

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        6724 bytes

	Concurrency Level:      5
	Time taken for tests:   3.882 seconds
	Complete requests:      30
	Failed requests:        29
	   (Connect: 0, Receive: 0, Length: 29, Exceptions: 0)
	Write errors:           0
	Total transferred:      220293 bytes
	HTML transferred:       200853 bytes
	Requests per second:    7.73 [#/sec] (mean)
	Time per request:       647.075 [ms] (mean)
	Time per request:       129.415 [ms] (mean, across all concurrent requests)
	Transfer rate:          55.41 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       1
	Processing:   634  647  11.7    647     669
	Waiting:      108  544 209.7    641     669
	Total:        634  647  11.6    647     669

	Percentage of the requests served within a certain time (ms)
	  50%    647
	  66%    647
	  75%    651
	  80%    651
	  90%    669
	  95%    669
	  98%    669
	  99%    669
	 100%    669 (longest request)

### user page 1: ab -n30 -c5 http://localhost:3000/users/41

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        6132 bytes

	Concurrency Level:      5
	Time taken for tests:   3.084 seconds
	Complete requests:      30
	Failed requests:        0
	Write errors:           0
	Total transferred:      203400 bytes
	HTML transferred:       183960 bytes
	Requests per second:    9.73 [#/sec] (mean)
	Time per request:       514.057 [ms] (mean)
	Time per request:       102.811 [ms] (mean, across all concurrent requests)
	Transfer rate:          64.40 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.3      0       1
	Processing:   498  514  13.7    522     532
	Waiting:       88  432 167.5    505     532
	Total:        498  514  13.8    522     532

	Percentage of the requests served within a certain time (ms)
	  50%    522
	  66%    522
	  75%    527
	  80%    527
	  90%    532
	  95%    532
	  98%    532
	  99%    532
	 100%    532 (longest request)

### user page 2: ab -n30 -c5 http://localhost:3000/users/47

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        4928 bytes

	Concurrency Level:      5
	Time taken for tests:   2.674 seconds
	Complete requests:      30
	Failed requests:        0
	Write errors:           0
	Total transferred:      167280 bytes
	HTML transferred:       147840 bytes
	Requests per second:    11.22 [#/sec] (mean)
	Time per request:       445.681 [ms] (mean)
	Time per request:       89.136 [ms] (mean, across all concurrent requests)
	Transfer rate:          61.09 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.3      0       1
	Processing:   441  445   5.5    443     456
	Waiting:       80  373 147.7    442     456
	Total:        441  446   5.7    443     457

	Percentage of the requests served within a certain time (ms)
	  50%    443
	  66%    444
	  75%    448
	  80%    448
	  90%    457
	  95%    457
	  98%    457
	  99%    457
	 100%    457 (longest request)

### user page 3: ab -n30 -c5 http://localhost:3000/users/49

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/49
	Document Length:        6096 bytes

	Concurrency Level:      5
	Time taken for tests:   3.290 seconds
	Complete requests:      30
	Failed requests:        0
	Write errors:           0
	Total transferred:      202320 bytes
	HTML transferred:       182880 bytes
	Requests per second:    9.12 [#/sec] (mean)
	Time per request:       548.345 [ms] (mean)
	Time per request:       109.669 [ms] (mean, across all concurrent requests)
	Transfer rate:          60.05 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.0      0       0
	Processing:   527  548  20.5    551     581
	Waiting:      527  548  20.5    551     581
	Total:        527  548  20.5    551     581

	Percentage of the requests served within a certain time (ms)
	  50%    551
	  66%    551
	  75%    567
	  80%    567
	  90%    581
	  95%    581
	  98%    581
	  99%    581
	 100%    581 (longest request)

### recipe page 1: ab -n100 -c5 http://localhost:3000/recipes/2003

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        4288 bytes

	Concurrency Level:      5
	Time taken for tests:   3.155 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      493600 bytes
	HTML transferred:       428800 bytes
	Requests per second:    31.70 [#/sec] (mean)
	Time per request:       157.738 [ms] (mean)
	Time per request:       31.548 [ms] (mean, across all concurrent requests)
	Transfer rate:          152.80 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       1
	Processing:   133  158  21.8    156     202
	Waiting:       26  132  54.5    137     202
	Total:        133  158  21.8    156     202

	Percentage of the requests served within a certain time (ms)
	  50%    156
	  66%    173
	  75%    178
	  80%    179
	  90%    197
	  95%    201
	  98%    202
	  99%    202
	 100%    202 (longest request)

### recipe page 2: ab -n100 -c5 http://localhost:3000/recipes/2061

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        2555 bytes

	Concurrency Level:      5
	Time taken for tests:   1.628 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      320300 bytes
	HTML transferred:       255500 bytes
	Requests per second:    61.44 [#/sec] (mean)
	Time per request:       81.380 [ms] (mean)
	Time per request:       16.276 [ms] (mean, across all concurrent requests)
	Transfer rate:          192.18 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       1
	Processing:    67   81  15.0     73     113
	Waiting:       13   68  29.8     71     113
	Total:         67   81  15.0     73     113

	Percentage of the requests served within a certain time (ms)
	  50%     73
	  66%     89
	  75%     91
	  80%     91
	  90%    112
	  95%    113
	  98%    113
	  99%    113
	 100%    113 (longest request)

### recipe page 3: ab -n100 -c5 http://localhost:3000/recipes/2066

	Server Software:        thin
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        3490 bytes

	Concurrency Level:      5
	Time taken for tests:   1.997 seconds
	Complete requests:      100
	Failed requests:        0
	Write errors:           0
	Total transferred:      413800 bytes
	HTML transferred:       349000 bytes
	Requests per second:    50.08 [#/sec] (mean)
	Time per request:       99.842 [ms] (mean)
	Time per request:       19.968 [ms] (mean, across all concurrent requests)
	Transfer rate:          202.37 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       1
	Processing:    83  100  22.0     86     145
	Waiting:       16   84  37.7     85     145
	Total:         83  100  22.1     86     145

	Percentage of the requests served within a certain time (ms)
	  50%     86
	  66%    105
	  75%    127
	  80%    129
	  90%    144
	  95%    145
	  98%    145
	  99%    145
	 100%    145 (longest request)
 