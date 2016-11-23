/* @flow */

import { Route } from 'react-router';
import React from 'react';

// Components
//
// Main Layout
import App from '../App';

export default (
  <Route component={App}>
    <Route path='*' component={NotFound} />
  </Route>
);
