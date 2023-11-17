@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Claim'
define view entity ZR_ML2023_CLAIM
  as select from zml2023_claim
  association to parent ZR_ML2023_EMPLOYEE as _Employee on $projection.ClaimUuid = _Employee.EmployeeUuid
{

@EndUserText: {label: 'Claim UUID' , quickInfo: 'Request UUID'}

  key claim_uuid as ClaimUuid,
      employee   as Employee,
      year1      as Year1,
      vacations  as Vacations,

/*Associations */
      _Employee
}
