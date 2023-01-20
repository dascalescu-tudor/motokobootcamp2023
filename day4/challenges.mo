import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Array "mo:base/Array";

actor{

     //1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
     //unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T> 

    
    func unique<T>(list : List.List<T>, equal : (T, T) -> Bool) : List.List<T> { 
        let array : [T] = List.toArray(list);
        let buf : Buffer.Buffer<T> = Buffer.fromArray<T>(array);
        let length : Nat = buf.size();
        let resultBuf = Buffer.Buffer<T>(length);
        var counter : Nat = 0;
        for (element1 in buf.vals()) {
            for (element2 in buf.vals()) {
                if(equal(element1, element2))
                {
                    counter += 1;
                }
            };
            
            if(counter == 1){
                resultBuf.add(element1);
            };
            counter := 0;
        };
        let resArr = Buffer.toArray<T>(resultBuf);
        let resList = List.fromArray<T>(resArr);
        resList;
     };

    public func unique_test(test_list : List.List<Nat>) : async List.List<Nat>{
        let val = unique<Nat>(test_list, Nat.equal);
        return val;
    };

    //2. Write a function reverse that takes l of type List and returns the reversed list.
    // reverse<T> : (l : List<T>) -> List<T>;

    func reverse<T>(l : List.List<T>) : List.List<T>{
        let revList : List.List<T> = List.reverse(l);
        return revList;
    };

    public func reverse_test(test_list : List.List<Nat>) : async List.List<Nat>{
        let val = reverse<Nat>(test_list);
        return val;
    };

    //3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    // is_anynomous : () -> async Bool;

    public shared ({caller}) func is_anynomous() : async Bool{
        Principal.isAnonymous(caller);
    };

    //4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    // find_in_buffer<T> :  (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) -> ?Nat

    func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T, equal : (T, T) -> Bool) : ?Nat{
        let index : ?Nat = Buffer.indexOf<T>(val, buf, equal);
        return index;
    };

    public func find_in_buffer_test() : async ?Nat {
        let test_buf = Buffer.Buffer<Nat>(4);
        test_buf.add(9);
        test_buf.add(10);
        test_buf.add(11);
        test_buf.add(12);
        let val = find_in_buffer<Nat>(test_buf, 11, Nat.equal);
        return val;
    };

    //5. Take a look at the code we've seen before in this guide:
    
    //-----------------------------------------------------------------------------------//
    
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
      usernames.put(caller, name);
    };

    //-----------------------------------------------------------------------------------//

    // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    // get_usernames : () -> async [(Principal, Text)];

    public func get_usernames () : async [(Principal, Text)] {
        return Iter.toArray<(Principal, Text)>(usernames.entries());
    };

};
