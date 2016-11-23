# React Rails Bootstrap

This is a bootstrapped app that gets you up and running with a Rails 5
Relay API and a React/Relay/Recompose front end.

The Rails app comes loaded with custom generators that will create schema
types, mutations, resolvers, and presenters when a model is generated.

The React app uses an ejected and modified version of `create-react-app`
that runs an introspection query against the Rails server at runtime to
generate the Relay schema. Nodemon is used to watch the Rails graphql
schema files and restarts the node server and refetches the schema anytime
a change is made to one of the files.

Caveats:

Sometimes the node server explodes unexpectedly, but just type `rs` in the
window that is running the node server to restart it. This happens most
often when Flow can't find a module.

## Getting Started

To get started with the Rails server:

```bash
$ bundle install
$ rails s -p 7000
```

For the default configuration, you must run the Rails server on port 7000.

### Renaming the app

By default the app is named `MyReactRailsApp`. You'll probably want to change
that. Simply change the name of the module in `config/application.rb` and
you'll have an app named just for you!

You'll also want to update the database name in `config/database.yml` to
match your app.

### Getting started with the Node server

The React app lives in the `client` directory, and is entirely self contained.

```bash
$ cd client
$ yarn install
$ yarn start
```

That's it! Your app is running on `localhost:3000`.

Happy coding!

See the README in the client directory for more information on the React app.

# TODO

- [ ] Command line generators for the React App
- [ ] Turn this into a proper gem with a Rails template
