/* @flow */

// Vendor
import React from 'react';

const NotFound = ({ router }: Object): React$Element<any> =>
  <div>
    <h1>Uh Oh!</h1>
    <p>The page you were looking for doesn't exist</p>
    <div>
      <a onClick={() => router.goBack()}>Go Back</a>
    </div>
  </div>;

export default NotFound;
