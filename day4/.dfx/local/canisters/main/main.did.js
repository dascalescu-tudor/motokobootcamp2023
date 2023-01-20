export const idlFactory = ({ IDL }) => {
  const Status = IDL.Variant({
    'Rejected' : IDL.Null,
    'Accepted' : IDL.Null,
    'Pending' : IDL.Null,
  });
  const Proposal = IDL.Record({
    'id' : IDL.Nat,
    'status' : Status,
    'creator' : IDL.Principal,
    'downVotes' : IDL.Nat,
    'upVotes' : IDL.Nat,
    'motion' : IDL.Text,
  });
  return IDL.Service({
    'creat_proposal' : IDL.Func(
        [IDL.Text],
        [IDL.Variant({ 'ok' : IDL.Text, 'error' : IDL.Text })],
        [],
      ),
    'list_all_proposals' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Nat, Proposal))],
        ['query'],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
