@EndUserText.label: 'Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ML2023_EMPLOYEE02
provider contract transactional_query
  as projection on ZR_ML2023_EMPLOYEE
{
  key EmployeeUuid,
  @Search.defaultSearchElement: true
      Employeenumber,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Forename,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Surename,
      Entrydate,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Associations */
      _Request : redirected to composition child ZC_ML2023_REQUEST02
    
      
      
}
