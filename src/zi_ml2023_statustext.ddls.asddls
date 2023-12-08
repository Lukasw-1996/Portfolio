
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Status'


define view entity ZI_ML2023_StatusText as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name:'ZML2023_STATUS')
{
 key domain_name as DomainName,
    key value_position as ValuePosition,
    key language as Language,
    value_low as ValueLow,
    text as Text,
   
  
  concat_with_space( text, '', 1 ) as StatusName
}
