import Text "mo:base/Text";
import Float "mo:base/Float";


module {

    public type LabRequestForm = {
        wardName: Text;
        patientId: Text;
        samplesCollectedBy: Text;
        timeDateCollected: Text;
        dateRequested: Text;
        haematologyTexts: [HaematologyTests];
        chemistry: [Chemistry];
        parasitology: [Parasitology];
        bacteriology: [Bacteriology];
        rapidTests: [RapidTests];

    };
    public type HaematologyTests = {
            #Full_Blood_Count;
            #Peripheral_Blood_Smear;
            #Cd4_counter;
            #Others: ?[Text];
        };
    public type Chemistry = {
            #Alanine_Transaminase;
            #Aspartate_Transaminase;
            #Creatinine;
            #Urea;
            #Fasting_Blood_Sugar;
            #Random_Blood_Sugar;
            #Others: ?[Text];
        };
    public type Parasitology = {
            #Urinalisis;
            #Urine_Wet_Mount;
            #Microscopy;
            #Modified_ZN_Stain;
            #Malaria_Parasites;
            #Others: ?[Text];
        };
    public type Bacteriology = {
            #GramStain;
            #MicroscopyCultureSensitivity;
            #Others: ?[Text];
        };
    public type RapidTests = {
            #Malaria;
            #RapidPlasmaReagin;
            #Syphilis;
            #Hepatitis_B_SurfaceAntigen;
            #TB_LAM;
            #Gravindex;
            #Others: ?[Text];
        };
    
//radiology types

    public type RadiologyModule = {
        patientId: Text;
        appointmentDate: Text;
        diagnosis: Text;
        examinationRequired: Text;
        requestedBy: Text;
        examinationRequested: Text;
        previousExamination: [PreviousExamination];
        department: [Department];
    };

public type PreviousExamination = {
        #XrayScan;
        #CTScan;
        #UltraSound;
};

        
public type Department = {
    #Maternity;
    #Opd;
    #Inpd;
    #Theatre;
};

//Type for newbornbabyform
    
public type NewbornBabyForm = {
        patientId: Text;
        babyGender: {
            #Male;
            #Female;
            #Other: ?[Text];
        };
        babyStatus: {
            #Alive;
            #Dead;
        };
        gestationalAge: {
            #Mature;
            #Premature: ?[Text];
        };
        conditionOfDelivery: {
            #BeforeLabour;
            #AfterLabour;
            #Fresh;
            #Macerated;
        };

    intrapartumComplications: [IntrapartumComplications];

    };

    
    public type IntrapartumComplications = {
            #Caput;
            #Moulding;
            #LaborProgressionIssues;
            #PerinealTears;
            #UmbilicalCordProblems;
            #AbnormalFetalHeartRate;
            #EarlyRuptureOfMembranes;
    };

    public type ApgarScore = {
        patientId: Text;
        heartRate: {
            #Absent_0;
            #Below100_1;
            #Above100_2;
        };
        respiration: {
            #Absent_0;
            #SlowIrregular_1;
            #GoodCry_2;
        };
        tone: {
            #Nil_0;
            #SomeMotion_1;
            #Cry_2;
        };
        reflex: {
            #Limb_0;
            #SomeFlexion_1;
            #Active_2;
        };
        color: {
            #AllBlueOrWhite_0;
            #PinkBodyBlueExtremities_1;
            #AllPink_2;
        };
        apgarscoreat1min: {
            #One; #Two; #Three; #Four; #Five; #Six; #Seven; #Eight; #Nine; #Ten;
        };
        apgarscoreat5min: {
            #One; #Two; #Three; #Four; #Five; #Six; #Seven; #Eight; #Nine; #Ten;
        };
        resuscitationMethods: Text;
        drugs: Text;
        birthWeight: Float;
    };

    public type NewbornExamination = {
        patientId: Text;
        clownHeelLength: Float;
        headCircumference: Float;
        skin: {
            #Jaundice;
            #Other: ?[Text];
        };
        fontanelles: Text;
        mouth: Text;
        chest: Text;
        umbilicus: Text;
        anus: Text;
        upperLimbs: Text;
        lowerLimbs: Text;
        back: Text;
        eyes: Text;
        treatment: Text;
        neck: Text;
        genitalia: Text;
        urine: Text;
        meconium: Text;
        erbParalysis: Text;
        ortolaniSign: Text;
        newBornProgressNote: Text;
        reflexes: [Reflexes];

    };
    public type Reflexes = {
            #Grasp;
            #Moro_startle;
            #Sucking;
        };
}
