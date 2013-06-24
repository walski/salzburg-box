# 1. Analyze the Existing App

## Getestet wurde mit:

*   Ruby-1.8.7-p370
*   Webrick 1.3.1 
*   Development Mode
*   SQLite

## Requests pro Sekunde ohne Session:

*	front page:		  0,23 [#/sec]
*	user page:		~ 0,346 [#/sec] (3 Messungen)
*	recipes page:	~ 1,886 [#/sec] (3 Messungen)

## Requests pro Sekunde mit Session:

*	front page:		  0,24 [#/sec]
*	user page:		~ 0,353 [#/sec] (3 Messungen)
*	recipes page:	~ 1,88 [#/sec] (3 Messungen)

Da sich die Messungen mit Session nur geringfügig von denen ohne Session unterscheiden werden diese nachfolgend nicht mehr durchgeführt.

## Ziel:

*	Improve front page requests per second by 200%.
*	Improve user page requests per second by 100%.
*	Improve recipe page requests per second by 100%.

## Nächster Schritt:

*	Production Mode: Die Applikation sollte in Production Mode laufen


***


# Messungen ohne Session

### front page: ab -n10 -c1 http://localhost:3000/

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /
    Document Length:        8220 bytes
    
    Concurrency Level:      1
    Time taken for tests:   43.915 seconds
    Complete requests:      10
    Failed requests:        9
       (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
    Write errors:           0
    Total transferred:      88227 bytes
    HTML transferred:       82057 bytes
    Requests per second:    0.23 [#/sec] (mean)
    Time per request:       4391.511 [ms] (mean)
    Time per request:       4391.511 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.96 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.1      0       0
    Processing:  4196 4391 174.8   4391    4691
    Waiting:     4195 4390 175.0   4390    4690
    Total:       4196 4391 174.8   4391    4691
    
    Percentage of the requests served within a certain time (ms)
      50%   4391
      66%   4434
      75%   4528
      80%   4625
      90%   4691
      95%   4691
      98%   4691
      99%   4691
     100%   4691 (longest request)

### user page 1: ab -n10 -c1 http://localhost:3000/users/41

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/41
    Document Length:        7640 bytes
    
    Concurrency Level:      1
    Time taken for tests:   30.460 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      82570 bytes
    HTML transferred:       76400 bytes
    Requests per second:    0.33 [#/sec] (mean)
    Time per request:       3046.010 [ms] (mean)
    Time per request:       3046.010 [ms] (mean, across all concurrent requests)
    Transfer rate:          2.65 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.1      0       0
    Processing:  2995 3046  39.2   3045    3112
    Waiting:     2994 3045  39.0   3045    3110
    Total:       2995 3046  39.2   3045    3112
    
    Percentage of the requests served within a certain time (ms)
      50%   3045
      66%   3068
      75%   3071
      80%   3086
      90%   3112
      95%   3112
      98%   3112
      99%   3112
     100%   3112 (longest request)

### user page 2: ab -n10 -c1 http://localhost:3000/users/47

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/47
    Document Length:        6436 bytes
    
    Concurrency Level:      1
    Time taken for tests:   25.668 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      70530 bytes
    HTML transferred:       64360 bytes
    Requests per second:    0.39 [#/sec] (mean)
    Time per request:       2566.784 [ms] (mean)
    Time per request:       2566.784 [ms] (mean, across all concurrent requests)
    Transfer rate:          2.68 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.2      0       1
    Processing:  2523 2567  53.5   2546    2692
    Waiting:     2523 2566  53.6   2545    2692
    Total:       2523 2567  53.5   2546    2692
    
    Percentage of the requests served within a certain time (ms)
      50%   2546
      66%   2574
      75%   2582
      80%   2618
      90%   2692
      95%   2692
      98%   2692
      99%   2692
     100%   2692 (longest request)

### user page 3: ab -n10 -c1 http://localhost:3000/users/49

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/49
    Document Length:        7604 bytes
    
    Concurrency Level:      1
    Time taken for tests:   30.806 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      82210 bytes
    HTML transferred:       76040 bytes
    Requests per second:    0.32 [#/sec] (mean)
    Time per request:       3080.614 [ms] (mean)
    Time per request:       3080.614 [ms] (mean, across all concurrent requests)
    Transfer rate:          2.61 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.0      0       0
    Processing:  3021 3081  43.8   3071    3153
    Waiting:     3021 3080  43.8   3071    3152
    Total:       3021 3081  43.8   3071    3153
    
    Percentage of the requests served within a certain time (ms)
      50%   3071
      66%   3109
      75%   3109
      80%   3136
      90%   3153
      95%   3153
      98%   3153
      99%   3153
     100%   3153 (longest request)

### recipe page 1: ab -n10 -c1 http://localhost:3000/recipes/2003

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2003
    Document Length:        5796 bytes
    
    Concurrency Level:      1
    Time taken for tests:   5.569 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      64130 bytes
    HTML transferred:       57960 bytes
    Requests per second:    1.80 [#/sec] (mean)
    Time per request:       556.932 [ms] (mean)
    Time per request:       556.932 [ms] (mean, across all concurrent requests)
    Transfer rate:          11.24 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.1      0       0
    Processing:   527  557  29.7    578     601
    Waiting:      527  556  29.5    578     600
    Total:        527  557  29.8    578     601
    
    Percentage of the requests served within a certain time (ms)
      50%    578
      66%    579
      75%    581
      80%    582
      90%    601
      95%    601
      98%    601
      99%    601
     100%    601 (longest request)

### recipe page 2: ab -n10 -c1 http://localhost:3000/recipes/2061

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2061
    Document Length:        4063 bytes
    
    Concurrency Level:      1
    Time taken for tests:   5.109 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      46800 bytes
    HTML transferred:       40630 bytes
    Requests per second:    1.96 [#/sec] (mean)
    Time per request:       510.927 [ms] (mean)
    Time per request:       510.927 [ms] (mean, across all concurrent requests)
    Transfer rate:          8.95 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.0      0       0
    Processing:   482  511  23.2    530     537
    Waiting:      482  511  23.3    530     537
    Total:        482  511  23.2    530     537
    
    Percentage of the requests served within a certain time (ms)
      50%    530
      66%    530
      75%    531
      80%    534
      90%    537
      95%    537
      98%    537
      99%    537
     100%    537 (longest request)

### recipe page 3: ab -n10 -c1 http://localhost:3000/recipes/2066

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2066
    Document Length:        4998 bytes
    
    Concurrency Level:      1
    Time taken for tests:   5.255 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      56150 bytes
    HTML transferred:       49980 bytes
    Requests per second:    1.90 [#/sec] (mean)
    Time per request:       525.490 [ms] (mean)
    Time per request:       525.490 [ms] (mean, across all concurrent requests)
    Transfer rate:          10.43 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.0      0       0
    Processing:   495  525  29.4    533     574
    Waiting:      495  525  29.4    532     574
    Total:        495  525  29.4    533     574
    
    Percentage of the requests served within a certain time (ms)
      50%    533
      66%    543
      75%    548
      80%    559
      90%    574
      95%    574
      98%    574
      99%    574
     100%    574 (longest request)

# Messungen mit Session

### front page: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /
	Document Length:        8161 bytes

	Concurrency Level:      1
	Time taken for tests:   41.815 seconds
	Complete requests:      10
	Failed requests:        9
	   (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
	Write errors:           0
	Total transferred:      88123 bytes
	HTML transferred:       81953 bytes
	Requests per second:    0.24 [#/sec] (mean)
	Time per request:       4181.477 [ms] (mean)
	Time per request:       4181.477 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.06 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:  3641 4181 297.5   4385    4454
	Waiting:     3641 4181 297.4   4384    4453
	Total:       3641 4181 297.5   4385    4454

	Percentage of the requests served within a certain time (ms)
	  50%   4385
	  66%   4390
	  75%   4426
	  80%   4440
	  90%   4454
	  95%   4454
	  98%   4454
	  99%   4454
	 100%   4454 (longest request)

### user page 1: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/users/41

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/41
	Document Length:        7640 bytes

	Concurrency Level:      1
	Time taken for tests:   30.280 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      82570 bytes
	HTML transferred:       76400 bytes
	Requests per second:    0.33 [#/sec] (mean)
	Time per request:       3027.962 [ms] (mean)
	Time per request:       3027.962 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.66 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.2      0       1
	Processing:  2997 3028  25.9   3027    3076
	Waiting:     2997 3027  26.0   3027    3075
	Total:       2997 3028  25.8   3027    3076

	Percentage of the requests served within a certain time (ms)
	  50%   3027
	  66%   3038
	  75%   3039
	  80%   3058
	  90%   3076
	  95%   3076
	  98%   3076
	  99%   3076
	 100%   3076 (longest request)

### user page 2: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/users/47

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/47
	Document Length:        6436 bytes

	Concurrency Level:      1
	Time taken for tests:   25.226 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      70530 bytes
	HTML transferred:       64360 bytes
	Requests per second:    0.40 [#/sec] (mean)
	Time per request:       2522.616 [ms] (mean)
	Time per request:       2522.616 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.73 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:  2480 2523  32.9   2511    2584
	Waiting:     2479 2522  32.9   2511    2584
	Total:       2480 2523  32.9   2511    2584

	Percentage of the requests served within a certain time (ms)
	  50%   2511
	  66%   2533
	  75%   2540
	  80%   2565
	  90%   2584
	  95%   2584
	  98%   2584
	  99%   2584
	 100%   2584 (longest request)

### user page 3: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/users/49

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /users/49
	Document Length:        7604 bytes

	Concurrency Level:      1
	Time taken for tests:   30.636 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      82210 bytes
	HTML transferred:       76040 bytes
	Requests per second:    0.33 [#/sec] (mean)
	Time per request:       3063.598 [ms] (mean)
	Time per request:       3063.598 [ms] (mean, across all concurrent requests)
	Transfer rate:          2.62 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:  3023 3064  30.9   3065    3106
	Waiting:     3022 3063  31.1   3065    3105
	Total:       3023 3064  31.0   3065    3106

	Percentage of the requests served within a certain time (ms)
	  50%   3065
	  66%   3072
	  75%   3093
	  80%   3106
	  90%   3106
	  95%   3106
	  98%   3106
	  99%   3106
	 100%   3106 (longest request)

### recipe page 1: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/recipes/2003

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2003
	Document Length:        5796 bytes

	Concurrency Level:      1
	Time taken for tests:   5.566 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      64130 bytes
	HTML transferred:       57960 bytes
	Requests per second:    1.80 [#/sec] (mean)
	Time per request:       556.582 [ms] (mean)
	Time per request:       556.582 [ms] (mean, across all concurrent requests)
	Transfer rate:          11.25 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   520  557  22.8    568     580
	Waiting:      520  556  22.9    567     580
	Total:        520  557  22.7    568     580

	Percentage of the requests served within a certain time (ms)
	  50%    568
	  66%    573
	  75%    574
	  80%    576
	  90%    580
	  95%    580
	  98%    580
	  99%    580
	 100%    580 (longest request)

### recipe page 2: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/recipes/2061

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2061
	Document Length:        4063 bytes

	Concurrency Level:      1
	Time taken for tests:   5.134 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      46800 bytes
	HTML transferred:       40630 bytes
	Requests per second:    1.95 [#/sec] (mean)
	Time per request:       513.421 [ms] (mean)
	Time per request:       513.421 [ms] (mean, across all concurrent requests)
	Transfer rate:          8.90 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   481  513  25.6    513     547
	Waiting:      480  513  25.6    512     547
	Total:        481  513  25.6    514     547

	Percentage of the requests served within a certain time (ms)
	  50%    514
	  66%    537
	  75%    537
	  80%    543
	  90%    547
	  95%    547
	  98%    547
	  99%    547
	 100%    547 (longest request)

### recipe page 3: ab -n10 -c1 -C BAh7CSIPc2V... http://localhost:3000/recipes/2066

	Server Software:        WEBrick/1.3.1
	Server Hostname:        localhost
	Server Port:            3000

	Document Path:          /recipes/2066
	Document Length:        4998 bytes

	Concurrency Level:      1
	Time taken for tests:   5.304 seconds
	Complete requests:      10
	Failed requests:        0
	Write errors:           0
	Total transferred:      56150 bytes
	HTML transferred:       49980 bytes
	Requests per second:    1.89 [#/sec] (mean)
	Time per request:       530.422 [ms] (mean)
	Time per request:       530.422 [ms] (mean, across all concurrent requests)
	Transfer rate:          10.34 [Kbytes/sec] received

	Connection Times (ms)
				  min  mean[+/-sd] median   max
	Connect:        0    0   0.1      0       0
	Processing:   473  530  46.6    536     639
	Waiting:      472  530  46.8    536     639
	Total:        474  530  46.6    536     639

	Percentage of the requests served within a certain time (ms)
	  50%    536
	  66%    547
	  75%    551
	  80%    551
	  90%    639
	  95%    639
	  98%    639
	  99%    639
	 100%    639 (longest request)
