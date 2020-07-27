# symfony_server_stderr_in_header

A message from stderr ends up in the HTTP response.

$ curl -v http://localhost:4090/default
```
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 4090 (#0)
> GET /default HTTP/1.1
> Host: localhost:4090
> User-Agent: curl/7.52.1
> Accept: */*
> 
< HTTP/1.1 200 OK
< Cache-Control: no-cache, private
< Content-Type: application/json
< Date: Mon, 27 Jul 2020 07:57:58 GMT
< PHP message: [info] Matched route "default".
< X-Powered-By: PHP/7.4.8
< X-Robots-Tag: noindex
< Content-Length: 93
< 
* Curl_http_done: called premature == 0
* Connection #0 to host localhost left intact
{"message":"Welcome to your new controller!","path":"src\/Controller\/DefaultController.php"}
```

Steps to reproduce:

- git clone git@github.com:lulhum/symfony_server_stderr_in_header.git
- cd symfony_server_stderr_in_header
- docker-compose build app
- docker-compose run app composer install
- docker-compose up -d app
- curl -v http://localhost:4090/default
