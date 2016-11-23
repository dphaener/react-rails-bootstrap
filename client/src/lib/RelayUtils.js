/* @flow */

// Vendor
import Relay from 'react-relay';
import { curry } from 'ramda';

export const parseErrors = (errors: Array<Object>): Array<string> =>
  errors.map(error => error.message.split(":")[1].trim());

export const relayError = (transaction: Object): void => {
  const error = transaction.getError().source || new Error('Unknown mutation error');
  console.error(error);
}

export const relaySuccess = (response: Object): void => {
  console.info('Relay Mutation successful with response:', response);
}

const commitUpdateBase = (
  mutation: Object,
  successCallback: Function = relaySuccess,
  failureCallback: Function = relayError
): void => {
  Relay.Store.commitUpdate(
    mutation,
    { onSuccess: successCallback, onFailure: failureCallback }
  );
}

export const commitUpdate = curry(commitUpdateBase);
