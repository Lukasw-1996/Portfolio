@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_ML2023_EMPLOYEE
  as select from zml2023_employee
  composition [0..*]  of ZR_ML2023_REQUEST as _Request
{
    @EndUserText: { label: 'Employee UUID', quickInfo: 'Employee UUID' }
  key employee_uuid  as EmployeeUuid,
      employeenumber as Employeenumber,
      forename       as Forename,
      surename       as Surename,
      entrydate      as Entrydate,
      
      
     /*Associations*/
     _Request
}
