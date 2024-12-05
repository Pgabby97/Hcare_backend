import TrieMap "mo:base/TrieMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import LabTypes "types";

actor LaboratoryModule {
    public type LabRequestForm = LabTypes.LabRequestForm;
    public type RadiologyModule = LabTypes.RadiologyModule;
    public type NewbornBabyForm = LabTypes.NewbornBabyForm;
    public type ApgarScore = LabTypes.ApgarScore;
    public type NewbornExamination = LabTypes.NewbornExamination;

    //--------------------------------------------
    // TrieMaps for each form type
    //--------------------------------------------
    var labform = TrieMap.TrieMap<Text, LabRequestForm>(Text.equal, Text.hash);
    var radiologyData = TrieMap.TrieMap<Text, RadiologyModule>(Text.equal, Text.hash);
    var newbornBabyForms = TrieMap.TrieMap<Text, NewbornBabyForm>(Text.equal, Text.hash);
    var apgarScores = TrieMap.TrieMap<Text, ApgarScore>(Text.equal, Text.hash);
    var newbornExaminations = TrieMap.TrieMap<Text, NewbornExamination>(Text.equal, Text.hash);

    stable var labformEntries: [(Text, LabRequestForm)] = [];
    stable var radiologyDataEntries: [(Text, RadiologyModule)] = [];
    stable var newbornBabyFormEntries: [(Text, NewbornBabyForm)] = [];
    stable var apgarScoreEntries: [(Text, ApgarScore)] = [];
    stable var newbornExaminationEntries: [(Text, NewbornExamination)] = [];

    system func preupgrade() {
        labformEntries := Iter.toArray(labform.entries());
        radiologyDataEntries := Iter.toArray(radiologyData.entries());
        newbornBabyFormEntries := Iter.toArray(newbornBabyForms.entries());
        apgarScoreEntries := Iter.toArray(apgarScores.entries());
        newbornExaminationEntries := Iter.toArray(newbornExaminations.entries());
    };

    system func postupgrade() {
        labform := TrieMap.fromEntries(labformEntries.vals(), Text.equal, Text.hash);
        radiologyData := TrieMap.fromEntries(radiologyDataEntries.vals(), Text.equal, Text.hash);
        newbornBabyForms := TrieMap.fromEntries(newbornBabyFormEntries.vals(), Text.equal, Text.hash);
        apgarScores := TrieMap.fromEntries(apgarScoreEntries.vals(), Text.equal, Text.hash);
        newbornExaminations := TrieMap.fromEntries(newbornExaminationEntries.vals(), Text.equal, Text.hash);
    };

    public shared func createLabRequestForm(args: LabRequestForm): async () {
        labform.put(args.patientId, args);
    };

    public shared func updateLabRequestForm(args: LabRequestForm): async Result.Result<Text, Text> {
        switch (labform.get(args.patientId)) {
            case (null) {
                return #err("No such lab request form found");
            };
            case (?existingForm) {
                labform.put(args.patientId, args);
                return #ok("Lab request form updated successfully");
            };
        }
    };

    public shared query func getLabRequestFormById(patientId: Text): async Result.Result<LabRequestForm, Text> {
        switch (labform.get(patientId)) {
            case (null) {
                return #err("No such lab request form found");
            };
            case (?labRequestForm) {
                return #ok(labRequestForm);
            };
        }
    };

    public shared query func getAllLabRequestForms(): async [LabRequestForm] {
        return Iter.toArray(labform.vals());
    };

    public shared func deleteLabRequestForm(patientId: Text): async Result.Result<Text, Text> {
        switch (labform.remove(patientId)) {
            case (null) {
            return #err("No such lab request form found to delete");
        };
        case (?removedForm) {
            return #ok("Lab request form deleted successfully");
        };
    }
};



    public shared func createRadiologyData(args: RadiologyModule): async () {
        radiologyData.put(args.patientId, args);
    };

    public shared func updateRadiologyData(args: RadiologyModule): async Result.Result<Text, Text> {
        switch (radiologyData.get(args.patientId)) {
            case (null) {
                return #err("No such radiology data found");
            };
            case (?existingData) {
                radiologyData.put(args.patientId, args);
                return #ok("Radiology data updated successfully");
            };
        }
    };

    public shared query func getRadiologyDataById(patientId: Text): async Result.Result<RadiologyModule, Text> {
        switch (radiologyData.get(patientId)) {
            case (null) {
                return #err("No such radiology data found");
            };
            case (?radiologyData) {
                return #ok(radiologyData);
            };
        }
    };

    public shared query func getAllRadiologyData(): async [RadiologyModule] {
        return Iter.toArray(radiologyData.vals());
    };

    public shared func deleteRadiologyData(patientId: Text): async Result.Result<Text, Text> {
        switch (radiologyData.remove(patientId)) {
            case (null) {
            return #err("No such radiology data found to delete");
        };
        case (?removedData) {
            return #ok("Radiology data deleted successfully");
        };
    }
};


 
    public shared func createNewbornBabyForm(args: NewbornBabyForm): async () {
        newbornBabyForms.put(args.patientId, args);
    };

    public shared func updateNewbornBabyForm(args: NewbornBabyForm): async Result.Result<Text, Text> {
        switch (newbornBabyForms.get(args.patientId)) {
            case (null) {
                return #err("No such newborn baby form found");
            };
            case (?existingForm) {
                newbornBabyForms.put(args.patientId, args);
                return #ok("Newborn baby form updated successfully");
            };
        }
    };

    public shared query func getNewbornBabyFormById(patientId: Text): async Result.Result<NewbornBabyForm, Text> {
        switch (newbornBabyForms.get(patientId)) {
            case (null) {
                return #err("No such newborn baby form found");
            };
            case (?newbornBabyForm) {
                return #ok(newbornBabyForm);
            };
        }
    };

    public shared query func getAllNewbornBabyForms(): async [NewbornBabyForm] {
        return Iter.toArray(newbornBabyForms.vals());
    };

    public shared func deleteNewbornBabyForm(patientId: Text): async Result.Result<Text, Text> {
        switch (newbornBabyForms.remove(patientId)) {
            case (null) {
            return #err("No such newborn baby form found to delete");
        };
        case (?removedForm) {
            return #ok("Newborn baby form deleted successfully");
        };
    }
};


   
    public shared func createApgarScore(args: ApgarScore): async () {
        apgarScores.put(args.patientId, args);
    };

    public shared func updateApgarScore(args: ApgarScore): async Result.Result<Text, Text> {
        switch (apgarScores.get(args.patientId)) {
            case (null) {
                return #err("No such Apgar score found");
            };
            case (?existingScore) {
                apgarScores.put(args.patientId, args);
                return #ok("Apgar score updated successfully");
            };
        }
    };

    public shared query func getApgarScoreById(patientId: Text): async Result.Result<ApgarScore, Text> {
        switch (apgarScores.get(patientId)) {
            case (null) {
                return #err("No such Apgar score found");
            };
            case (?apgarScore) {
                return #ok(apgarScore);
            };
        }
    };

    public shared query func getAllApgarScores(): async [ApgarScore] {
        return Iter.toArray(apgarScores.vals());
    };


    public shared func deleteApgarScore(patientId: Text): async Result.Result<Text, Text> {
        switch (apgarScores.remove(patientId)) {
        case (null) {
            return #err("No such Apgar score found to delete");
        };
        case (?removedScore) {
            return #ok("Apgar score deleted successfully");
        };
    }
};

    public shared func createNewbornExamination(args: NewbornExamination): async () {
        newbornExaminations.put(args.patientId, args);
    };

    public shared func updateNewbornExamination(args: NewbornExamination): async Result.Result<Text, Text> {
        switch (newbornExaminations.get(args.patientId)) {
            case (null) {
                return #err("No such newborn examination found");
            };
            case (?existingExamination) {
                newbornExaminations.put(args.patientId, args);
                return #ok("Newborn examination updated successfully");
            };
        }
    };

    public shared query func getNewbornExaminationById(patientId: Text): async Result.Result<NewbornExamination, Text> {
        switch (newbornExaminations.get(patientId)) {
            case (null) {
                return #err("No such newborn examination found");
            };
            case (?newbornExamination) {
                return #ok(newbornExamination);
            };
        }
    };

    public shared query func getAllNewbornExaminations(): async [NewbornExamination] {
        return Iter.toArray(newbornExaminations.vals());
    };

    public shared func deleteNewbornExamination(patientId: Text): async Result.Result<Text, Text> {
        switch (newbornExaminations.remove(patientId)) {
        case (null) {
            return #err("No such newborn examination found to delete");
        };
        case (?removedExamination) {
            return #ok("Newborn examination deleted successfully");
        };
    }
};

};


