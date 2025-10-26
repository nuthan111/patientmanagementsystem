class LabPrescription
{
  bool bmiReport;
  bool cbCount;
  bool lipidProfile;
  
  
  LabPrescription({
    this.bmiReport=false,
    this.cbCount=false,
    this.lipidProfile=false
    });
  
  
  String toString()
  {
    List<String> tests=[];
    
    if(bmiReport) tests.add("BMIReport");
    if(cbCount) tests.add("Complete Blood Count");
    if(lipidProfile) tests.add("lipidProfile");
    
    return "LabPrescription(Tests: ${tests.join(',')})";
    
  }
}