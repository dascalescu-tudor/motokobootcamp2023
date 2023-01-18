## 1. Who controls the ledger canister?
**ANSWER**: 

## 2.What is the subnet of the canister with the id: **mwrha-maaaa-aaaab-qabqq-cai**? How much nodes are running this subnet?
**ANSWER**: 

## 3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
**ANSWER**: 

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
**ANSWER**: 

## 5. What is wrong with the following code?
```motoko
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}
```
**ANSWER**: 

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
**ANSWER**: 