class CarePlan {
  final String id;
  String name;
  final String userId;
  String legalName;
  String preferredName;
  String pronouns;
  String homePhone;
  String cellPhone;
  String residentialAddress;
  List<String> allergies;
  List<String> diagnoses;
  List<String> medications;
  List<String> emergencyContacts;
  Map<String, String> localFirstResponders;
  String primaryCareProviderAddress;
  String primaryCareProviderPhone;
  String notes;

  CarePlan(
      this.id,
      this.name,
      this.userId,
      this.legalName,
      this.preferredName,
      this.pronouns,
      this.homePhone,
      this.cellPhone,
      this.residentialAddress,
      this.allergies,
      this.diagnoses,
      this.medications,
      this.emergencyContacts,
      this.localFirstResponders,
      this.primaryCareProviderAddress,
      this.primaryCareProviderPhone,
      this.notes);
}