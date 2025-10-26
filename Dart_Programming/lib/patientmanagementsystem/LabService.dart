import 'LabPrescription.dart';
import 'Patient.dart';
import 'dart:math';
class LabService
  {

    static void runTests(Patient patient,LabPrescription prescription)
    {
      print("Running lab tests for:${patient.name}");

      
      
      if(prescription.bmiReport)
      {
        double bmi=patient.weight/(patient.height*patient.height);
        print("BMI report:${bmi.toStringAsFixed(2)}");
}
      if(prescription.cbCount)
      {
        print("Complete Blood Count:Hemoglobin=${12 + Random().nextDouble()*4}");
}
      if(prescription.lipidProfile)
      {
        print("lipidProfile:Total Cholestrol=${150+Random().nextInt(100)}");
}
}
}