## 1. Who controls the ledger canister?
**ANSWER**: The NNS controls the ledger canister.

## 2.What is the subnet of the canister with the id: **mwrha-maaaa-aaaab-qabqq-cai**? How much nodes are running this subnet?
**ANSWER**: Subnet Id: pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe. Nodes: 16

## 3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
**ANSWER**: Voting Power: 10 ICP * Disolve delay * Maturity multiplier;
Disolve Delay: 1.501;
Maturity multiplier: 1.125;
=> 16.88

## 4. What is wrong with the following code?

```motoko
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
}
```
**ANSWER**: The import of Nat is missing and variables n, t are redudant.

## 5. What is wrong with the following code?
```motoko
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}
```
**ANSWER**: Fisrt of all, we must write `var` inside the `languages` array. Second, shared types, used in messaging, cannot contain mutable fields or arrays.

## 6. What is wrong with the following code?
```motoko
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
 
}
```
**ANSWER**: The import of Array lib is missing, and append is deppricated. It is better to use a Buffer.