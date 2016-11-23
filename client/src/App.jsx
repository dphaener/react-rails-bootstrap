/* @flow */

// Vendor
import React from 'react';

// Local
import Navigation from './components/shared/navigation';

// Types
export type AppInput = {
  children: Object | Array<Object>,
  router: Object
};

// Main Component
export const App = ({
  children,
  router
}: AppInput): React$Element<any> =>
  <div style={{ marginTop: '50px', padding: '20px' }}>
    <Navigation router={router} />
    {children}
  </div>;

export default App;
