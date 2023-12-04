@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Applicant'


define view entity ZI_ML2023_ApplicantText
  as select from zml2023_employee
{
  key employee_uuid                            as EmployeeUuid,
      forename                                 as Forename,
      surename                                 as Surname,

      concat_with_space(forename, surename, 1) as Name
}
