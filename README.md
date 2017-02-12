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

## Contributing

This project will get much better with more people contributing to it. Please
contribute by opening issues to document problems or submitting pull requests to
fix them. All improvements are welcome and appreciated. Consider contributing
by:

 - Opening issues to document problem or confusing parts of existing labs.
 - Opening pull requests to make existing labs better.
 - Opening a pull request to add a new lab. (Please make sure it fits in with
   the existing scope & sequence of labs.)
 - Opening a pull request to improve the site's theme.
 - etc.

### Setup Dev Environment

 1. Clone the repository.
  `git clone git@github.com:mkasberg/container-immersion.git`
 2. Make sure Bundler is installed. `gem install bundler`
 3. Install Jekyll & dependencies. `cd container-immersion && bundle install
  --path vendor/bundle` (Path optional, but encouraged.)
 4. Run the site. `bundle exec jekyll serve`. You can visit the site at
  [http://localhost:4000](http://localhost:4000). Essentially, this is just
  Jekyll. So read the Jekyll docs if you get stuck.
