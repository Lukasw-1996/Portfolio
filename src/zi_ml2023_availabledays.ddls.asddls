
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_ML2023_AVAILABLEDAYS'
define view entity ZI_ML2023_AVAILABLEDAYS as select from zml2023_claim
association [1..1] to ZI_ML2023_PLANDAYSTEXT as _Dayplanned on $projection.employee_uuid = _Dayplanned.applicant
association [1..1] to ZI_ML2023_DAYTAKENTEXT as _Daystaken on $projection.employee_uuid = _Daystaken.applicant

{

key employee_uuid,
sum(vacations) - coalesce(_Daystaken.TotalTAKENHoliday, 0) - coalesce(_Dayplanned.PlannedVacationDays, 0) as AvailableHoliday

}
where year1 = '2023'
group by
employee_uuid,
_Daystaken.TotalTAKENHoliday,
_Dayplanned.PlannedVacationDays
