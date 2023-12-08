@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Request'
define view entity ZR_ML2023_REQUEST
  as select from zml2023_request
  association to parent ZR_ML2023_EMPLOYEE as _Employee on $projection.Applicant = _Employee.EmployeeUuid
association[1..1] to ZI_ML2023_StatusText as _StatusText on $projection.Status = _StatusText.ValueLow
association[1..1] to ZI_ML2023_ApproverText as _ApproverText on $projection.Approver = _ApproverText.EmployeeUuid
association[1..1] to ZI_ML2023_ApplicantText as _ApplicantText on $projection.Applicant = _ApplicantText.EmployeeUuid
//association[1..1] to ZI_ML2023_PLANDAYSTEXT as _PlanDaysText on $projection.Applicant = _PlanDaysText.applicant
//association[1..1] to ZI_ML2023_DAYTAKENTEXT as _DaysTakenText on $projection.Applicant = _DaysTakenText.applicant
{
      @EndUserText: {label: 'Request UUID', quickInfo: 'Request UUID' }
  key request_uuid as RequestUuid,
      applicant    as Applicant,
      @ObjectModel.text.element: ['ApproverName']
      approver     as Approver,
      startdate    as Startdate,
      enddate      as Enddate,
      holidays as Holidays,
      comment1     as Comment1,
      @ObjectModel.text.element: ['StatusName']
      status       as Status,
      @Semantics.user.createdBy: true
      created_by as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
        /*Transional Data */
   _StatusText.StatusName,
   _ApproverText.Name as ApproverName,
   _ApplicantText.Name as ApplicantName,
   //_PlanDaysText.TotalRequestedHoliday as RequestedDays,
   //_DaysTakenText.TotalTakenHoliday as TakenDays,
    
    case status when 'B' then 2
    when 'A' then 1
    when 'G' then 3
    else 0
    end as StatusCriticality,
    
      /*Associations */
      _Employee
}
