import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface Proposal {
  'id' : bigint,
  'status' : Status,
  'creator' : Principal,
  'downVotes' : bigint,
  'upVotes' : bigint,
  'motion' : string,
}
export type Status = { 'Rejected' : null } |
  { 'Accepted' : null } |
  { 'Pending' : null };
export interface _SERVICE {
  'creat_proposal' : ActorMethod<
    [string],
    { 'ok' : string } |
      { 'error' : string }
  >,
  'list_all_proposals' : ActorMethod<[], Array<[bigint, Proposal]>>,
}
