@EndUserText.label: 'Request'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_ML2023_REQUEST02
  as projection on ZR_ML2023_REQUEST
{
  key RequestUuid,
      @ObjectModel.text.element: [ 'ApplicantName' ]
      Applicant,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ML2023_ApproverVH', element: 'EmployeeUuid' } }]
      Approver,
      Startdate,
      Enddate,
       @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Comment1,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ML2023_StatusVH', element: 'Status' } }]
      Status,
      Holidays,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      StatusCriticality,
      StatusName,

      /* Transient Data*/
      ApproverName,
      ApplicantName,

      /* Associations */
      _Employee : redirected to parent ZC_ML2023_EMPLOYEE02
}
