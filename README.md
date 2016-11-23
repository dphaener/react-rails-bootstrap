# React Rails Bootstrap

This is a bootstrapped app that gets you up and running with a Rails 5
Relay API and a React/Relay/Recompose front end.

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

### Generators

There is a single generator that will create all the resources needed for a
new Rails model. Usage:

```bash
$ rails g graphql_resource User email:string password_digest:string
```

That will generate:

* A `User` model with the given fields
* A `UserResolver` with `Create`, `Update`, and `Destroy` mutations
* A `UserPolicy` for use with Pundit
* A `UserPresenter` for generating view only data
* Optionally: `UserBuilder` and `UserUpdater` services
* Optionally: Run the migration and generate the graphql types and mutations.

Any of these can be used on their own:

```bash
$ rails g resolver User
$ rails g policy User
$ rails g presenter User
$ rails g service User
$ rails g graphql User
```

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
- [ ] Hook the custom generators into model generation
