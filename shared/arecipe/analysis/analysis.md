# 1. Analyze the Existing App

## Testumgebung

*   Ruby-1.8.7-p370
*   WEBrick/1.3.1 
*   Development Mode
*   SQLite

## Zusammenfassung der Ergebnisse in Requests per second

### Ohne Login

* Homepage: 0.17 [#/sec]
* Users: ~ 0.20 [#/sec]
* Recipes: ~ 1.35 [#/sec]

### Mit Login

* Homepage: 0.17 [#/sec]
* Users: 0.20 [#/sec]
* Recipes: ~ 1.35 [#/sec]

## Ziele

* Improve front page requests per second by 200%
* Improve user page requests per second by 100%
* Improve page requests per second by 100%

## Nächster Schritt

* Die Applikation soll im Production Mode laufen

## Durchgeführte Tests ohne Login

### Homepage: ab -n10 -c1 http://localhost:3000/

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /
    Document Length:        8146 bytes
    
    Concurrency Level:      1
    Time taken for tests:   59.262 seconds
    Complete requests:      10
    Failed requests:        9
       (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
    Write errors:           0
    Total transferred:      87933 bytes
    HTML transferred:       81763 bytes
    Requests per second:    0.17 [#/sec] (mean)
    Time per request:       5926.211 [ms] (mean)
    Time per request:       5926.211 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.45 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   0.8      0       3
    Processing:  5594 5925 160.3   5999    6054
    Waiting:     5592 5922 160.1   5993    6052
    Total:       5595 5926 160.2   6000    6054
    WARNING: The median and mean for the initial connection time are not within a no
    rmal deviation
            These results are probably not that reliable.
    
    Percentage of the requests served within a certain time (ms)
      50%   6000
      66%   6032
      75%   6033
      80%   6051
      90%   6054
      95%   6054
      98%   6054
      99%   6054
     100%   6054 (longest request)
     


### User 1: ab -n10 -c1 http://localhost:3000/users/50


    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/50
    Document Length:        8822 bytes
    
    Concurrency Level:      1
    Time taken for tests:   54.194 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      94390 bytes
    HTML transferred:       88220 bytes
    Requests per second:    0.18 [#/sec] (mean)
    Time per request:       5419.361 [ms] (mean)
    Time per request:       5419.361 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.70 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.9      0       6
    Processing:  5369 5418  41.3   5406    5493
    Waiting:     5367 5415  41.3   5404    5491
    Total:       5370 5419  41.2   5406    5493
    
    Percentage of the requests served within a certain time (ms)
      50%   5406
      66%   5421
      75%   5425
      80%   5489
      90%   5493
      95%   5493
      98%   5493
      99%   5493
     100%   5493 (longest request)
     
     
### User 2: ab -n10 -c1 http://localhost:3000/users/43

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/43
    Document Length:        9766 bytes
    
    Concurrency Level:      1
    Time taken for tests:   58.522 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      103830 bytes
    HTML transferred:       97660 bytes
    Requests per second:    0.17 [#/sec] (mean)
    Time per request:       5852.228 [ms] (mean)
    Time per request:       5852.228 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.73 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.6      1       6
    Processing:  5750 5851 104.2   5809    6099
    Waiting:     5748 5847 102.7   5805    6091
    Total:       5750 5852 105.6   5810    6105
    
    Percentage of the requests served within a certain time (ms)
      50%   5810
      66%   5856
      75%   5908
      80%   5923
      90%   6105
      95%   6105
      98%   6105
      99%   6105
     100%   6105 (longest request)
 
 
### User 3: ab -n10 -c1 http://localhost:3000/users/41

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/41
    Document Length:        7640 bytes
    
    Concurrency Level:      1
    Time taken for tests:   42.494 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      82570 bytes
    HTML transferred:       76400 bytes
    Requests per second:    0.24 [#/sec] (mean)
    Time per request:       4249.409 [ms] (mean)
    Time per request:       4249.409 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.90 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.7      0       6
    Processing:  4157 4248  86.0   4233    4406
    Waiting:     4156 4246  86.1   4231    4404
    Total:       4157 4249  86.3   4233    4406
    
    Percentage of the requests served within a certain time (ms)
      50%   4233
      66%   4266
      75%   4310
      80%   4365
      90%   4406
      95%   4406
      98%   4406
      99%   4406
     100%   4406 (longest request)
 
### Recipe 1: ab -n10 -c1 http://localhost:3000/recipes/2042

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2042
    Document Length:        4505 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.358 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      51220 bytes
    HTML transferred:       45050 bytes
    Requests per second:    1.36 [#/sec] (mean)
    Time per request:       735.774 [ms] (mean)
    Time per request:       735.774 [ms] (mean, across all concurrent requests)
    Transfer rate:          6.80 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.3      0       4
    Processing:   693  735  31.7    729     785
    Waiting:      692  734  31.6    728     784
    Total:        693  736  31.8    729     786
    
    Percentage of the requests served within a certain time (ms)
      50%    729
      66%    744
      75%    770
      80%    771
      90%    786
      95%    786
      98%    786
      99%    786
     100%    786 (longest request)
     
### Recipe 2: ab -n10 -c1 http://localhost:3000/recipes/2082

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2082
    Document Length:        5050 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.479 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      56670 bytes
    HTML transferred:       50500 bytes
    Requests per second:    1.34 [#/sec] (mean)
    Time per request:       747.909 [ms] (mean)
    Time per request:       747.909 [ms] (mean, across all concurrent requests)
    Transfer rate:          7.40 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.7      0       6
    Processing:   691  747  38.9    743     809
    Waiting:      690  746  38.8    742     808
    Total:        691  748  39.4    743     810
    
    Percentage of the requests served within a certain time (ms)
      50%    743
      66%    771
      75%    785
      80%    788
      90%    810
      95%    810
      98%    810
      99%    810
     100%    810 (longest request)
     
### Recipe 3: ab -n10 -c1 http://localhost:3000/recipes/2005

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2005
    Document Length:        4866 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.458 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      54830 bytes
    HTML transferred:       48660 bytes
    Requests per second:    1.34 [#/sec] (mean)
    Time per request:       745.755 [ms] (mean)
    Time per request:       745.755 [ms] (mean, across all concurrent requests)
    Transfer rate:          7.18 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.4      0       5
    Processing:   714  745  29.1    737     796
    Waiting:      714  744  29.1    735     795
    Total:        715  745  28.9    737     797
    
    Percentage of the requests served within a certain time (ms)
      50%    737
      66%    743
      75%    768
      80%    786
      90%    797
      95%    797
      98%    797
      99%    797
     100%    797 (longest request)
     
## Durchgeführte Tests mit Login

Session ID aus Request Header Cookie:
_arecipe_session=BAh7CSIQX2NzcmZfdG9rZW4iMUYvUjdVYU0wWWFmV2R6TlNGbW1KYkJSanBQRldyNzl6cGFOYndEWXh1VjA9Ig9zZXNzaW9uX2lkIiVmMjFkNmE0N2MyOGVmNmIzYjg3ZmFjN2M2YjA2N2YxZSIKZmxhc2hvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZsYXNoSGFzaAk6DUBmbGFzaGVzewY6C25vdGljZSIcU2lnbmVkIGluIHN1Y2Nlc3NmdWxseS46DEBjbG9zZWRGOgpAdXNlZG86CFNldAY6CkBoYXNoewA6CUBub3cwIhl3YXJkZW4udXNlci51c2VyLmtleVsHWwZpOCIiJDJhJDEwJFh3bHhjWFJXSTVHNS9hWmpWM1VGSk8%3D--e2c5f2ad1645b76f23297b127f8d5fbc65c8ddf6

### Homepage: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /
    Document Length:        8457 bytes
    
    Concurrency Level:      1
    Time taken for tests:   58.415 seconds
    Complete requests:      10
    Failed requests:        9
       (Connect: 0, Receive: 0, Length: 9, Exceptions: 0)
    Write errors:           0
    Total transferred:      93335 bytes
    HTML transferred:       84665 bytes
    Requests per second:    0.17 [#/sec] (mean)
    Time per request:       5841.488 [ms] (mean)
    Time per request:       5841.488 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.56 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   0.7      1       3
    Processing:  5384 5840 266.1   5984    6115
    Waiting:     5383 5838 266.0   5981    6112
    Total:       5385 5841 266.0   5984    6116
    
    Percentage of the requests served within a certain time (ms)
      50%   5984
      66%   5993
      75%   6007
      80%   6082
      90%   6116
      95%   6116
      98%   6116
      99%   6116
     100%   6116 (longest request)

### User 1: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/users/50

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/50
    Document Length:        9025 bytes
    
    Concurrency Level:      1
    Time taken for tests:   52.522 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      98920 bytes
    HTML transferred:       90250 bytes
    Requests per second:    0.19 [#/sec] (mean)
    Time per request:       5252.154 [ms] (mean)
    Time per request:       5252.154 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.84 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   0.6      0       2
    Processing:  5219 5251  39.9   5250    5352
    Waiting:     5215 5249  40.4   5248    5350
    Total:       5220 5252  39.7   5250    5352
    
    Percentage of the requests served within a certain time (ms)
      50%   5250
      66%   5258
      75%   5258
      80%   5273
      90%   5352
      95%   5352
      98%   5352
      99%   5352
     100%   5352 (longest request)

### User 2: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/users/43

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/43
    Document Length:        9969 bytes
    
    Concurrency Level:      1
    Time taken for tests:   57.943 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      108360 bytes
    HTML transferred:       99690 bytes
    Requests per second:    0.17 [#/sec] (mean)
    Time per request:       5794.293 [ms] (mean)
    Time per request:       5794.293 [ms] (mean, across all concurrent requests)
    Transfer rate:          1.83 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.7      0       6
    Processing:  5739 5793  62.7   5774    5957
    Waiting:     5737 5791  62.7   5771    5955
    Total:       5739 5794  64.2   5775    5963
    
    Percentage of the requests served within a certain time (ms)
      50%   5775
      66%   5776
      75%   5804
      80%   5827
      90%   5963
      95%   5963
      98%   5963
      99%   5963
     100%   5963 (longest request)

### User 3: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/users/41

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /users/41
    Document Length:        7843 bytes
    
    Concurrency Level:      1
    Time taken for tests:   41.867 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      87100 bytes
    HTML transferred:       78430 bytes
    Requests per second:    0.24 [#/sec] (mean)
    Time per request:       4186.683 [ms] (mean)
    Time per request:       4186.683 [ms] (mean, across all concurrent requests)
    Transfer rate:          2.03 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.6      0       6
    Processing:  4118 4185  65.5   4185    4339
    Waiting:     4117 4183  65.3   4183    4336
    Total:       4119 4186  66.9   4185    4345
    
    Percentage of the requests served within a certain time (ms)
      50%   4185
      66%   4189
      75%   4218
      80%   4233
      90%   4345
      95%   4345
      98%   4345
      99%   4345
     100%   4345 (longest request)

### Recipe 1: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/recipes/2042

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2042
    Document Length:        4797 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.175 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      56640 bytes
    HTML transferred:       47970 bytes
    Requests per second:    1.39 [#/sec] (mean)
    Time per request:       717.497 [ms] (mean)
    Time per request:       717.497 [ms] (mean, across all concurrent requests)
    Transfer rate:          7.71 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.1      0       4
    Processing:   685  717  32.0    700     762
    Waiting:      684  715  31.8    698     760
    Total:        686  717  32.5    701     762
    
    Percentage of the requests served within a certain time (ms)
      50%    701
      66%    741
      75%    751
      80%    761
      90%    762
      95%    762
      98%    762
      99%    762
     100%    762 (longest request)

### Recipe 2: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/recipes/2082

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2082
    Document Length:        5342 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.621 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      62090 bytes
    HTML transferred:       53420 bytes
    Requests per second:    1.31 [#/sec] (mean)
    Time per request:       762.050 [ms] (mean)
    Time per request:       762.050 [ms] (mean, across all concurrent requests)
    Transfer rate:          7.96 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   2.3      0       8
    Processing:   705  761  42.4    771     822
    Waiting:      704  758  41.9    769     817
    Total:        706  762  43.7    771     830
    
    Percentage of the requests served within a certain time (ms)
      50%    771
      66%    783
      75%    803
      80%    806
      90%    830
      95%    830
      98%    830
      99%    830
     100%    830 (longest request)

### Recipe 3: ab -n10 -c1 -C _arecipe_session=BAh7CSI... http://localhost:3000/recipes/2005

    Server Software:        WEBrick/1.3.1
    Server Hostname:        localhost
    Server Port:            3000
    
    Document Path:          /recipes/2005
    Document Length:        5158 bytes
    
    Concurrency Level:      1
    Time taken for tests:   7.480 seconds
    Complete requests:      10
    Failed requests:        0
    Write errors:           0
    Total transferred:      60250 bytes
    HTML transferred:       51580 bytes
    Requests per second:    1.34 [#/sec] (mean)
    Time per request:       747.968 [ms] (mean)
    Time per request:       747.968 [ms] (mean, across all concurrent requests)
    Transfer rate:          7.87 [Kbytes/sec] received
    
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   1.6      0       5
    Processing:   714  747  32.1    736     800
    Waiting:      711  745  32.1    734     798
    Total:        714  748  31.9    742     800
    
    Percentage of the requests served within a certain time (ms)
      50%    742
      66%    771
      75%    778
      80%    783
      90%    800
      95%    800
      98%    800
      99%    800
     100%    800 (longest request)






