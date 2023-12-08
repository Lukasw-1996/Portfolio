@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_ML2023_DAYTAKENTEXT'

define view entity ZI_ML2023_DAYTAKENTEXT
  as select from zml2023_request
{
  key applicant as applicant,
    sum(holidays) as TotalTAKENHoliday
}
where status='A'
and enddate < $session.user_date
group by applicant;
