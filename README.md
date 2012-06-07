What?
=====

A generic login page for mod_auth_openid

This application renders a friendly login page with an optional list of
secured sites in the menu bar.

It handles all the error codes supported by mod_auth_openid and shows
friendly error messages

Usage?
======

Install this in a vhost using your favorite method like Apache + Passenger
then configure your mod_auth_openid secured page as follows:

       <Location /supersecret>
			    AuthType                     OpenID
          AuthOpenIDLoginPage          http://login.your.net/
					require valid-user
      </Location>

For full details on how to configure mod_auth_openid please see it's
home page, the key part is the *AuthOpenIDLoginPage* URL.

You can con configure various aspects of the look and feel including the
the menus in the top menu, a sample yaml config file can be seen here:

    :title: OpenID Login
    :prompt: "An OpenID login is required:"
    :links:
      - :url: http://google.com/
        :title: Example Secured Application

This file should be in the same directory as the *login.rb*

Example?
========

Some screenshots of the login page in action below.

![Login Screen](https://github.com/ripienaar/mod_auth_openid_loginpage/raw/master/examples/login.png)

![Error Screen](https://github.com/ripienaar/mod_auth_openid_loginpage/raw/master/examples/error.png)

Contact?
--------

R.I.Pienaar / rip@devco.net / http://www.devco.net/ / @ripienaar
