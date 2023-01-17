## 1. How much is the current memory capacity of a canister?
**ANSWER**: At present, canisters are practically limited to 4 GB memory size. This is because the size memory uses a 32-bit addressing scheme, and when a container is updated, its Wasm-memory is erased.

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
**ANSWER**: The `type` of the `message` variable at declaration is `Text` 

## 4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
**ANSWER**: False