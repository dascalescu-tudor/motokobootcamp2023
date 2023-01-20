export const idlFactory = ({ IDL }) => {
  const List = IDL.Rec();
  List.fill(IDL.Opt(IDL.Tuple(IDL.Nat, List)));
  return IDL.Service({
    'add_username' : IDL.Func([IDL.Text], [], []),
    'find_in_buffer_test' : IDL.Func([], [IDL.Opt(IDL.Nat)], []),
    'get_usernames' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Principal, IDL.Text))],
        [],
      ),
    'is_anynomous' : IDL.Func([], [IDL.Bool], []),
    'reverse_test' : IDL.Func([List], [List], []),
    'unique_test' : IDL.Func([List], [List], []),
  });
};
export const init = ({ IDL }) => { return []; };
