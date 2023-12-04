@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Claim'
define view entity ZR_ML2023_CLAIM
  as select from zml2023_claim
  association to parent ZR_ML2023_EMPLOYEE as _Employee on $projection.EmployeeUuid = _Employee.EmployeeUuid
{

     key zml2023_claim.claim_uuid as ClaimUuid,
     
     zml2023_claim.employee_uuid as EmployeeUuid,
     zml2023_claim.year1 as Year1,
     zml2023_claim.vacations as Vacations,
     zml2023_claim.created_by as CreatedBy,
     zml2023_claim.created_at as CreatedAt,
     zml2023_claim.last_changed_by as LastChangedBy,
     zml2023_claim.last_changed_at as LastChangedAt,
     
     _Employee
}
