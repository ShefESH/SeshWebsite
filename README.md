# Archived

This website is no longer in use, and the repository has been archived. It can still be viewed at https://old.shefesh.com. The new website can be found at https://github.com/ShefESH/SeshWebsiteNanoc, and viewed at https://shefesh.com.



# shefesh-site
Static site for the Sheffield Ethical Student Hackers Society

Live site at https://www.shefesh.com

Built with [Jekyll](https://jekyllrb.com/)

## Setup

### The simple way (Docker-compose)

[Install Docker and Docker-Compose](https://docs.docker.com/compose/install/)

Download the repository

`git clone git@github.com:ShefESH/SeshWebsite.git`


Navigate into the repository

`cd SeshWebsite`

Run the docker-compose script

`docker-compose up`

You're done! You should now be able to live edit the website on your host machine and have the container live update 
the website. 

### The manual way
To host this website locally, follow these steps

**Clone this repository:**

`git clone git@github.com:ShefESH/SeshWebsite.git`

**Install Ruby:**

Skip this step if you have it already. Tested with Ruby Version 2.6.2

`sudo apt-get install ruby-full`

**Install Jekyll:**

Skip this step if you have it already. Tested with Jekyll Version 4.1.1

`gem install bundler jekyll`

**Navigate to website folder:**

`cd SeshWebsite`

**Launch Server:**

`bundle exec jekyll serve`

The serve command builds the site automatically. You can build it manually without serving the site by running

`bundle exec jekyll build`

If bundler is set up correctly, you should be able to omit 'bundle exec' from these commands

**Serve Alias**

To run the above with one command, add the following alias to your *.bashrc* (or equivalent)

`alias serve='cd /path/to/SeshWebsite; jekyll build; jekyll serve'`

**Navigate to site in browser**

Site is hosted at the following address by default - Jekyll will tell you if this is different when you run `jekyll serve`

`http://localhost:4000`

## Using Jekyll

*_site* and *jekyll-cache* directories are excluded by gitignore - these will be generated locally when running `jekyll serve`

### pages

Pages are stored in the top level of the *shefesh-site/shefesh-site* directory, and can be written in either HTML or Markdown

### _includes

Content to be included in pages. Similar to partials in Rails

Include the HTML/Markdown content in a HTML/Markdown page using `{% include filename.extension %}`

### _layouts

Liquid page templates. Can contain liquid logic as well as objects

Layouts specify the general template of the page, and can be reused. The `{{ content }}` liquid variable refers to the content of the top-level page (e.g. index.html)

Use a layout in a top-level page by referencing it in the front matter e.g.

```
---
layout: default
---
```

### _posts

Content for blog posts

### assets

*css* directory contains *styles.scss*, which serves as the main stylesheet for the site

Other stylesheets in the _sass folder can be imported into here e.g. by

`@import "main";`

### _sass

Stylesheets for site, to be imported into *assets/css/main.scss*

## Using Liquid

### Variables

Use double curly brackets `{{ }}` to reference variables

### Ruby Code (I think)

Write Ruby code contained in brackets as so `{% %}`
