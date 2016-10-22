# Python Web Overview


## The Low-Level View

Most HTTP servers are written in C or C++, so they cannot execute Python code directly – a bridge is needed between the server and the program. These bridges, or rather interfaces, define how programs interact with the server.

Incoming request -> Sever’s socket receive it (C/C++ codes) -> CGI process -> Python codes that uses CGI (CGI scripts)

Server that support Python CGI will have “cgi” python module in its python environment. The Python web script (CGI) could import the module, and use it to access request info (i.e. form parameters)


### CGI (Common Gateway Interface)
“CGI”, is the oldest, and is supported by nearly every web server out of the box.

Programs using CGI to communicate with their web server need to be started by the server for every request. So, every request starts a new Python interpreter – which takes some time to start up – thus making the whole interface only usable for low load situations.


Note:
You will often put your cgi script in a special directory. 
ex: `/usr/local/apache2/cgi-bin/`


### FastCGI 
FastCGI and SCGI try to solve the performance problem of CGI in another way. Instead of embedding the interpreter into the web server, they create long-running background processes. 

There is still a module in the web server which makes it possible for the web server to “speak” with the background process. 

As the background process is independent of the server, it can be written in any language, including Python. The language just needs to have a library which handles the communication with the web server.


#### WSGI
Web Server Gateway Interface

that a WSGI container is a separate running process that runs on a different port than your web server

your web server is configured to pass requests to the WSGI container which runs your web application, then pass the response (in the form of HTML) back to the requester

##### Advantage
- The big benefit of WSGI is the unification of the application programming interface. When your program is compatible with WSGI – which at the outer level means that the framework you are using has support for WSGI – your program can be deployed via any web server interface for which there are WSGI wrappers.

- Serving thousands of requests for dynamic content at once is the domain of WSGI servers, not frameworks. WSGI servers handle processing requests from the web server and deciding how to communicate those requests to an application framework’s process. The segregation of responsibilities is important for efficiently scaling web traffic.


# Role of reserve proxy (i.e. Ngnix)
- Generally it relieves a lot of load from application server.
- Static file serving
- Managing connection
