# Heroku buildpack for installing private npm packages
This buildpack, when combined with the default nodejs buildpack, enables the installation of private npm packages.
It only configures this support, and doesn't add any node functionality.

## Usage
First create a heroku app.

If you created the app in the dashboard, go to Settings, find the Buildpacks section and click "Add buildpack".
Enter `https://github.com/googol/heroku-buildpack-private-npm` as the buildpack url.

If you created the app with the command line client, you can run `heroku buildpacks:add https://github.com/googol/heroku-buildpack-private-npm`.

If you are using an app.json, you can list this buildpack in the `buildpacks` section (https://devcenter.heroku.com/articles/app-json-schema#buildpacks).

After that you need to add an environment variable called `NPM_TOKEN` with the npm authentication token.
You can get one by logging in on to npm with `npm login`, if you haven't already.
The token can be read from `~/.npmrc`, which will have a line like `//registry.npmjs.org/:_authToken=00000000-0000-0000-0000-000000000000`, where `00000000-0000-0000-0000-000000000000` would be the value of NPM_TOKEN.

## Testing
This buildpack has tests that can be run with the instructions on https://github.com/heroku/heroku-buildpack-testrunner.
