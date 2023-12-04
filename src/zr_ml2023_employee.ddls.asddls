@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_ML2023_EMPLOYEE
  as select from zml2023_employee
  composition [0..*] of ZR_ML2023_REQUEST as _Request
  composition [0..*] of ZR_ML2023_CLAIM   as _Claim
{
      @EndUserText: { label: 'Employee UUID', quickInfo: 'Employee UUID' }
  key employee_uuid   as EmployeeUuid,
      employeenumber  as Employeenumber,
      forename        as Forename,
      surename        as Surename,
      entrydate       as Entrydate,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,


      /*Associations*/
      _Request,
      _Claim

}
