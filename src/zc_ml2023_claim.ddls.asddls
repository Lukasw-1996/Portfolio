@EndUserText.label: 'Claim'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ML2023_CLAIM
  as projection on ZR_ML2023_CLAIM
{
key ClaimUuid,
Employee,
Year1,
Vacations,

/* Associations */
_Employee : redirected to parent ZC_ML2023_EMPLOYEE

  }
