@EndUserText.label: 'Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ML2023_REQUEST
  as projection on ZR_ML2023_REQUEST
{
 key RequestUuid,
 Applicant,
 Approver,
 Startdate,
 Enddate,
 Comment1,
 Status,
 /* Associations */
 _Employee : redirected to parent ZC_ML2023_EMPLOYEE
}
