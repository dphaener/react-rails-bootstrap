/* @flow */

// Vendor
import React from 'react';

// Types
export type AppInput = {
  children: Object | Array<Object>
};

// Main Component
export const App = ({
  children
}: AppInput): React$Element<any> =>
  <div>
    {children}
  </div>;

export default App;
