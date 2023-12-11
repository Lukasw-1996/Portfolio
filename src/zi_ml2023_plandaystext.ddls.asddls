@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_ML2023_PLANDAYSTEXT'

define view entity ZI_ML2023_PLANDAYSTEXT
  as select from zml2023_request
{
  key applicant as applicant,
    sum(holidays) as PlannedVacationDays
}
where status <> 'D'
and enddate >= $session.system_date
group by applicant;
