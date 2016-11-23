/* eslint-disable */

// Vendor
import React from 'react';
import { render } from 'react-dom';
import Relay from 'react-relay';
import useRelay from 'react-router-relay';
import { Router, browserHistory, applyRouterMiddleware } from 'react-router';

// Local
import networkLayer from './lib/NetworkLayer';
import routes from './config/routes';

// Styles
import '!style!css!./App.css';

Relay.injectNetworkLayer(networkLayer);

render(
  <Router
    render={applyRouterMiddleware(useRelay)}
    routes={routes}
    history={browserHistory}
    environment={Relay.Store}
    onError={(error) => console.log(error)}
  />,
  document.getElementById('root')
);
