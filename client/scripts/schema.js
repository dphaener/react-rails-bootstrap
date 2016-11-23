var fetch = require('node-fetch');
var utils = require('graphql/utilities');
var buildClientSchema = utils.buildClientSchema;
var introspectionQuery = utils.introspectionQuery;
var printSchema = utils.printSchema;
var chalk = require('chalk');
var fs = require('fs');

function fetchSchema(url = 'http://localhost:7000/graphql', token = 'introspection') {
  console.log(chalk.green('Fetching new schema...'));
  fetch(url, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
    body: JSON.stringify({ query: introspectionQuery }),
  }).then(res => res.json()).then(schemaJSON => {
    if (schemaJSON.data) {
      console.log(chalk.green('Writing schema.json...'));
      fs.writeFileSync(
        'config/schema.json',
        JSON.stringify(schemaJSON, null, 2)
      );
      const graphQLSchema = buildClientSchema(schemaJSON.data);
      console.log(chalk.green('Writing schema.graphql...'));
      fs.writeFileSync(
        'config/schema.graphql',
        printSchema(graphQLSchema)
      );
      console.log(chalk.green('Success!'));
    } else {
      console.log(chalk.red('Error while fetching schema:'));
      console.log(JSON.stringify(schemaJSON));
    }
  }).catch(ex => {
    console.log(chalk.red(`Error while fetching schema: ${ex.message}`));
    console.log(ex.stack);
  });
}

fetchSchema();
