@EndUserText.label: 'Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ML2023_REQUEST
  as projection on ZR_ML2023_REQUEST
{
 key RequestUuid,
 @ObjectModel.text.element: [ 'ApplicantName' ]
 Applicant,
 @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ML2023_ApproverVH', element: 'EmployeeUuid' } }]
 Approver,
 Startdate,
 Enddate,
 Holidays,
 Comment1,
 @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ML2023_StatusVH', element: 'Status' } }]
 Status,
 CreatedBy,
CreatedAt,
LastChangedBy,
LastChangedAt,
StatusCriticality,
StatusName,

/* Transient Data*/
    ApproverName,
    ApplicantName,
    //RequestedDays,
    //TakenDays,
 
 /* Associations */
 _Employee : redirected to parent ZC_ML2023_EMPLOYEE 
}
