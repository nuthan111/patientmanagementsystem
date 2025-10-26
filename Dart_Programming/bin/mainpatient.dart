import 'dart:math';
import '../lib/PatientManagementSystem/Patient.dart';
import '../lib/PatientManagementSystem/GenericQueue.dart';
import '../lib/PatientManagementSystem/LabService.dart';
import '../lib/PatientManagementSystem/LabPrescription.dart';

void main()
{

 
  
  
  final p1=Patient("Nuthan",25,1.65,60,"Male");
  final p2=Patient("Sai",23,1.65,85,"Male");
  final p3=Patient("Vinay",20,1.35,90,"Male");
  final p4=Patient("Gopi",27,1.85,90,"Male");
  final p5=Patient("Sweety",29,1.75,78,"Female");
  
  
  final queue=GenericQueue<Patient>();

  GenericQueue<MapEntry<Patient,LabPrescription>> prescriptionqueue=GenericQueue<MapEntry<Patient,LabPrescription>>();
  

  queue.enqueue(p1);
  queue.enqueue(p2);
  queue.enqueue(p3);
  queue.enqueue(p4);
  queue.enqueue(p5);
  
  
  
  
//   var patients = [p1, p2, p3, p4, p5];
var random = Random();
// var patient = patients[random.nextInt(patients.length)];

    
   while(!queue.isEmpty)
   {
    final patient=queue.dequeue();
    
  
  if(patient!=null)
  {
    var prescription=LabPrescription(
    bmiReport:random.nextBool(),
    cbCount:random.nextBool(),
    lipidProfile:random.nextBool(),
    );
    
    print("Selected Patient$patient:");
    print("Generated prescription:$prescription");

    prescriptionqueue.enqueue(MapEntry(patient, prescription));
  }

  while(!prescriptionqueue.isEmpty)
  {
    MapEntry<Patient,LabPrescription>? pres=prescriptionqueue.dequeue();

    
  if(pres!=null)
    {
      LabService.runTests(pres.key, pres.value);
    }
    }

  }
}
  

  

