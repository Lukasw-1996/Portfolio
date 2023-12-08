@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZR_ML2023_EMPLOYEE
  as select from zml2023_employee
  composition [0..*] of ZR_ML2023_REQUEST as _Request
  composition [0..*] of ZR_ML2023_CLAIM   as _Claim
  association[1..1] to ZI_ML2023_AvailableDays as _AvailableDays on $projection.EmployeeUuid = _AvailableDays.employee_uuid
  association[1..1] to ZI_ML2023_PLANDAYSTEXT as _PlanDaysText on $projection.EmployeeUuid = _PlanDaysText.applicant
  association[1..1] to ZI_ML2023_DAYTAKENTEXT as _DaysTakenText on $projection.EmployeeUuid = _DaysTakenText.applicant
{
      @EndUserText: { label: 'Employee UUID', quickInfo: 'Employee UUID' }
  key employee_uuid   as EmployeeUuid,
  @EndUserText:{ label: 'EmployeeNumber', quickInfo: 'EmployeeNumber' }
      employeenumber  as Employeenumber,
      @EndUserText:{ label: 'Forename', quickInfo: 'Forename' }
      forename        as Forename,
      @EndUserText:{ label: 'Surename', quickInfo: 'Surname' }
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
      _Claim,
      _AvailableDays.AvailableHoliday as AvailableHoliday,
      _PlanDaysText.PlannedVacationDays as PlannedVacationDays,
      _DaysTakenText.TotalTAKENHoliday as TotalTakenHolidays,
      
      '3' as AvailableDaysCriticality,
      '2' as PlannedVacationDaysCriticality,
      '1' as TotalTakenHolidaysCriticality

}
