# shefesh-site
Static site for the Sheffield Ethical Student Hackers Society

## Setup

To host this website locally, follow these steps

**Clone this repository:**

`git clone git@github.com:Twigonometry/shefesh-site.git`

**Install Jekyll:**

`gem install bundler jekyll`

**Navigate to website folder:**

`cd shefesh-site/shefesh-site`

**Launch Server:**

Make sure you are in the child directory (*shefesh-site/shefesh-site*) when you do this, not the parent directory! (Otherwise a _site folder will be generated in the top level of the repository and the site will not compile correctly)

`bundle exec jekyll serve`

The serve command builds the site automatically. You can build it manually without serving the site by running

`bundle exec jekyll serve`

If bundler is set up correctly, you should be able to omit 'bundle exec' from these commands

**Serve Alias**

To run the above with one command, add the following alias to your *.bashrc* (or equivalent)

alias serve='cd /path/to/shefesh-site/shefesh-site; jekyll build; jekyll serve'

**Navigate to site in browser**

Site is hosted at the following address by default - Jekyll will tell you if this is different when you run `jekyll serve`

`http://localhost:4000`

## Using Jekyll

All code for the site is stored in the child *shefesh-site* directory

*_site* and *jekyll-cache* directories are excluded by gitignore - these will be generated locally when running `jekyll serve`

### _includes

Content to be included in pages. Similar to partials in Rails

### _layouts

Liquid page templates. Can contain liquid logic as well as objects

### _posts

Content for blog posts

### assets

*css* directory contains *styles.scss*, which serves as the main stylesheet for the site

### _sass

Stylesheets for site, to be imported into *styles.scss*