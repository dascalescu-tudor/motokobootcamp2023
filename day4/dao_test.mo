import Array "mo:base/Array";
import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";

actor Dao{

    type Status = {
		#Pending;
		#Accepted;
		#Rejected;
	};

    type Proposal = {
        id: Nat;
        creator: Principal;
        motion: Text;
        downVotes: Nat;
        upVotes: Nat;
        status : Status;
    };

    stable var stableProposals : [(Nat, Proposal)] = [];
    let proposals = HashMap.fromIter<Nat, Proposal>(stableProposals.vals(), Iter.size(stableProposals.vals()), Nat.equal, Hash.hash);

    system func preupgrade() {
        stableProposals := Iter.toArray(proposals.entries());
    };

    system func postupgrade() {
        stableProposals := [];
    };

    stable var proposalCurrentID : Nat = 0;

    // Create, Read, Update, Delete

    public shared ({caller}) func creat_proposal(motion : Text) : async {#ok : Text; #error : Text}{
        if(motion == "") {
            return #error("Enter a valid proposal");
        } else {
            let newProposal = {
                id = proposalCurrentID;
                creator = caller;
                motion = motion;
                downVotes = 0;
                upVotes = 0;
                status = #Pending;
            };
            proposals.put(proposalCurrentID, newProposal);
            proposalCurrentID += 1;
            return #ok("New proposal have been created successfully");
        };
    };

    public query func list_all_proposals() : async [(Nat, Proposal)] {
        return Iter.toArray<(Nat, Proposal)>(proposals.entries());
    };
};