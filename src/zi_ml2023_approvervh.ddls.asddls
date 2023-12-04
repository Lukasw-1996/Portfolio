@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Approver'


define view entity ZI_ML2023_ApproverVH  as select from zml2023_employee
{
key employee_uuid as EmployeeUuid,
employeenumber as Employeenumber,
forename as Forename,
surename as Surename,
entrydate as EntryDate,
created_by as CreatedBy,
created_at as CreatedAt,
last_changed_by as LastChangedBy,
last_changed_at as LastChangedAt

  }
  
    
