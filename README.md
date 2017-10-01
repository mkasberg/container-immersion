# Container Immersion
🐳 A tour that walks through the fundamentals of Docker.

Go to [**Container Immersion**](https://mkasberg.github.io/container-immersion).

Or, skip ahead to the [Table of
Contents](https://mkasberg.github.io/container-immersion/toc.html).

## About Container Immersion

Many years ago, when [Git](https://git-scm.com/) was a relatively new
technology, I used [Git Immersion](http://gitimmersion.com/) to learn how to use
it. Git Immersion is based on the premise that the best way to learn a new
technology is by immersing yourself in it and *using it*.

Today, [Docker](https://www.docker.com/) is a young technology. I found Git
Immersion such an effective tool for learning Git that I was inspired to create
a similar tutorial for Docker. I hope that Container Immersion can be as
effective for others as I found Git Immersion to be for me.

## Setup Dev Environment

 1. Clone the repository.
  `git clone git@github.com:mkasberg/container-immersion.git`
 2. Make sure Bundler is installed. `gem install bundler`
 3. Install Jekyll & dependencies. `cd container-immersion && bundle install
  --path vendor/bundle` (Path optional, but encouraged.)
 4. Run the site. `bundle exec jekyll serve`. You can visit the site at
  [http://localhost:4000/container-immersion/](http://localhost:4000/container-immersion/).
  Essentially, this is just Jekyll. So read the [Jekyll](http://jekyllrb.com/)
  docs if you get stuck.

### About Jekyll

Container Immersion if built on top of [Jekyll](http://jekyllrb.com), a static
site generator. When you run `bundle exec jekyll serve`, Jekyll will watch for
changes and continue regenerating the site and serving it from `_site` until you
hit `^C`. Don't edit the files in `_site` directly, since they are just
generated files.

### Project Structure

 - HTML layouts are at `_layouts`. We have a layout for the homepage, table of
   contents, and the lab pages.
 - These layouts can include HTML snippets from `_includes` (like the nav bar).
 - CSS is at `assets/css/immersion.scss`.
 - Each lab is a Markdown file at `_labs`. Jekyll converts it to a page using
   the `lab.html` layout.

## Contributing

This project will get much better with more people contributing to it. Please
contribute by opening issues to document problems or submitting pull requests to
fix them. All improvements are welcome and appreciated.

See [CONTRIBUTING](CONTRIBUTING.md) for more info.

