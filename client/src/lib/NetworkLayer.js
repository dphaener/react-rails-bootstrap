/* @flow */

// Vendor
import {
  RelayNetworkLayer,
  retryMiddleware,
  urlMiddleware,
  authMiddleware,
  loggerMiddleware,
  perfMiddleware,
  gqErrorsMiddleware
} from 'react-relay-network-layer';

const networkLayer = new RelayNetworkLayer([
  urlMiddleware({
    url: (req) => 'http://localhost:7000/graphql',
  }),
  loggerMiddleware(),
  gqErrorsMiddleware(),
  perfMiddleware(),
  retryMiddleware({
    fetchTimeout: 15000,
    retryDelays: (attempt) => Math.pow(2, attempt + 4) * 100,
    forceRetry: (cb, delay) => {
      window.forceRelayRetry = cb;
      console.log('call `forceRelayRetry()` for immediately retry! Or wait ' + delay + ' ms.');
    },
    statusCodes: [500, 503, 504]
  }),
  authMiddleware({
    token: () => 'my-secure-token'
  }),
], { disableBatchQuery: true });

export default networkLayer;
