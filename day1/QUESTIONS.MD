## 1. How much is the current memory capacity of a canister?
**ANSWER**: The stable memory of a canister is 8 GB (used to be 4 GB). The Wasm heap is limited to 4 GB.

## 2. What is the issue with the following code sample?
```motoko
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```
**ANSWER**: The declaration of `counter` using `let` means that counter is immutable, therefore, we can not change counter value after declaration.

## 3. What is the issue with the following code sample?
```motoko
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
```
**ANSWER**: The `type` of the `message` variable at declaration is `Text`, therefore, we can not assign a number to `message`.

## 4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
**ANSWER**: False.