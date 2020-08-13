# shefesh-site
Static site for the Sheffield Ethical Student Hackers Society

Live site at https://www.shefesh.com

Built with [Jekyll](https://jekyllrb.com/)

## Setup

To host this website locally, follow these steps

**Clone this repository:**

`git clone git@github.com:Twigonometry/shefesh-site.git`

**Install Ruby:**

Skip this step if you have it already. Tested with Ruby Version 2.6.2

`sudo apt-get install ruby-full`

**Install Jekyll:**

Skip this step if you have it already. Tested with Jekyll Version 4.1.1

`gem install bundler jekyll`

**Navigate to website folder:**

`cd shefesh-site/shefesh-site`

**Launch Server:**

Make sure you are in the child directory (*shefesh-site/shefesh-site*) when you do this, not the parent directory! (Otherwise a _site folder will be generated in the top level of the repository and the site will not compile correctly)

`bundle exec jekyll serve`

The serve command builds the site automatically. You can build it manually without serving the site by running

`bundle exec jekyll build`

If bundler is set up correctly, you should be able to omit 'bundle exec' from these commands

**Serve Alias**

To run the above with one command, add the following alias to your *.bashrc* (or equivalent)

`alias serve='cd /path/to/shefesh-site/shefesh-site; jekyll build; jekyll serve'`

**Navigate to site in browser**

Site is hosted at the following address by default - Jekyll will tell you if this is different when you run `jekyll serve`

`http://localhost:4000`

## Using Jekyll

All code for the site is stored in the child *shefesh-site* directory

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
