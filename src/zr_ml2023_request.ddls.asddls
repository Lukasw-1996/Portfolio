@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request'
define view entity ZR_ML2023_REQUEST
  as select from zml2023_request
  association to parent ZR_ML2023_EMPLOYEE as _Employee on $projection.RequestUuid = _Employee.EmployeeUuid

{
      @EndUserText: {label: 'Request UUID', quickInfo: 'Request UUID' }
  key request_uuid as RequestUuid,
      applicant    as Applicant,
      approver     as Approver,
      startdate    as Startdate,
      enddate      as Enddate,
      comment1     as Comment1,
      status       as Status,

      /*Associations */
      _Employee
}
