Plumatra (Sinatra w/ Puma included)
===

This is a simple Puma + Sinatra setup to start building your own webapp.

Simple Warning: Use versions inside the Gemfile, try not to mess up with upgrades unless it's necessary.

For references click [here](http://www.sinatrarb.com/intro)

---


Database
---

Works with PostgreSQL. Edit `config.yml` with your database configuration.

Migrate (fill the database)


    scripts/db.rb migrate


Upgrade to apply changes (just new tables or columns)

    scripts/db.rb upgrade


---

Routes
---

Routes are autoloaded from `routes.rb`. You can divide your routes in files inside `routes/` folder. There is a working example in the `routes/` folder. 

---

Models
---

Models are abstract representations of tables in the database, mapped as Objects. They're stored in the `models/` folder, where you can find a NON-WORKING example. Files inside the models folder should have `.rb` extension.

---


Static Files
---

CSS and Js files are stored inside `public/` folder. Divide as you please and conquer!

---

NGINX!!!!
---

This is the config file for Nginx and the server's default configuration

```
# /etc/nginx/sites-available/your_server.conf

upstream your_server {
  server 0.0.0.0:9292 fail_timeout=0;
}

server {
  listen 8080;
  root /path/to/your/server;

  try_files $uri @your_server;

  location @your_server {
    proxy_pass http://your_server;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect on;
  }

  error_page 500 502 503 504 /500.html;
  client_max_body_size 13M;
  keepalive_timeout 10;
}
```

