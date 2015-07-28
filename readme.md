Gulp boilerplate for Github hosted example site built with Jade, Stylus, Coffeescript and Bower. It's an easy way to make a quick demo and upload it to a self-contained page.

## Setup
```sh
bower install
gulp
gulp deploy
```

Comes with Normalize.css and jQuery already set up.

Use Bower to install new dependencies. Bower files are copied to `production/lib`. If you need to you can override the main files in `bower.json`... see https://github.com/ck86/main-bower-files#overrides-options.

Don't forget to add any new Bower dependencies to the `scripts` and/or `styles` array in `index.jade` so that they are included in the page.

Local code goes in `source` in the `index.jade`, `style.styl`, and `script.coffee` files.

## Gulp Tasks
Mostly you can just run `gulp` to work and `gulp deploy` to publish to GitHub Pages.

Other gulp tasks include...
- `gulp html`: compiles `index.jade` to `production`
- `gulp css`: compiles `style.styl` to `production`
- `gulp js`: compiles `script.coffee` to `production`
- `gulp bower`: moves main Bower files for each component to `production/lib`
- `gulp compile`: all of the above
- `gulp js-watch`: helper for browser sync reload
- `gulp html-watch`: helper for browser sync reload
- `gulp deploy`: deploys to GitHub Pages
- `gulp serve`: runs `compile` then creates Browser Sync server and watches files for development
