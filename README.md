A Socks5 proxy server based on Alpine Docker image and Dante server
=================================================================

What is this
-------------

This is a smallest images of Alphine os with preinstelled Dante socks5 sever.
Main aim of It is accessing for Telegram clients free. But there is not any restriction to use for another puprose.
Keept Its easy with added scripts.

[**Dante**](http://www.inet.no/dante/index.html) Socks5 implements RFC 1928 and related standards.
Dante server provides several benefits, including security and TCP/IP termination (no direct contact between hosts inside and outside of the customer network), resource control (bandwidth, sessions), logging (host information, data transferred), and authentication



Requirements
-------------

Required docker, docker-compose to install



How to use
----------

There are some useful scripts to work easy.
Like building an image, start up our container, add and delete user, list users.

1. Build at first:

      $ cd ./docker && sh ./build.sh

Wait for a while

2. Run docker container:
     
     $ ./start.sh

Change its configuration by mounting a custom `/etc/sockd.conf`
(see [sample config files](http://www.inet.no/dante/doc/latest/config/server.html)).

3. Set up one user at least. Look how to set up authentication below.



Authentication set up
---------------------

By default this image doesn't allow anyone to use the proxy.
You should add a simple authentication (which will send data unencrypted) by running a script at host system like:

     $ ./adduser.sh someuser

Gets a user password generated randomly. Copy and use It.



Client-side set up
-------------------

Let's check in how to work proxy.

    $ curl -v -x socks5://someuser:password@server_address:1080 https://t.me

It should produce a succesfull answer like "HTTP/1.1 302 Found"
Warning: Many browsers do not support SOCKS authentication so SOCKS v4 will be blocked

And finally run at your browser to set up the proxy for Telegram client:

    https://t.me/socks?server=server_address&port=1080&user=proxyuser&pass=password



Feedbacks
---------

Suggestions are welcome to my [GitHub issue tracker](https://github.com/shinevit/dante-alphine/issues).


