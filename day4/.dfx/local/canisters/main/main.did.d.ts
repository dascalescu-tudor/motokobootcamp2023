import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export type List = [] | [[bigint, List]];
export interface _SERVICE {
  'add_username' : ActorMethod<[string], undefined>,
  'find_in_buffer_test' : ActorMethod<[], [] | [bigint]>,
  'get_usernames' : ActorMethod<[], Array<[Principal, string]>>,
  'is_anynomous' : ActorMethod<[], boolean>,
  'reverse_test' : ActorMethod<[List], List>,
  'unique_test' : ActorMethod<[List], List>,
}
