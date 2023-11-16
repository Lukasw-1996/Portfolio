CLASS zcl_ml2023_vacation_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ML2023_VACATION_GENERATOR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA requests TYPE TABLE OF zml2023_request.
    DATA request TYPE zml2023_request.

    "Daten löschen
    DELETE FROM zml2023_request.

    "Daten erstellen
    request-applicant = '1'.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20220701'.
    request-enddate = '20220710'.
    request-comment1 = 'Sommerurlaub'.
    request-status = 'G'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

     "Daten erstellen
    request-applicant = '1'.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20221227'.
    request-enddate = '20221230'.
    request-comment1 = 'Weihnachtsurlaub'.
    request-status = 'A'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

     "Daten erstellen
    request-applicant = '1'.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20221228'.
    request-enddate = '20221230'.
    request-comment1 = 'Weihnachtsurlaub (2. Versuch)'.
    request-status = 'G'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
   " request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

      "Daten erstellen
    request-applicant = '1'.
    request-approver = '2'.
    request-client = sy-mandt.
    request-comment1 = ' '.
    request-startdate = '20230527'.
    request-enddate = '20230614'.
    request-status = 'G'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
   " request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

    "Daten erstellen
    request-applicant = '1'.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20231220'.
    request-enddate = '20231231'.
    request-comment1 = 'Winterurlaub'.
    request-status = 'B'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
   " request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

    "Daten erstellen
    request-applicant = '3'.
    request-approver = '1'.
    request-client = sy-mandt.
    request-startdate = '20231227'.
    request-enddate = '20231231'.
    request-comment1 = 'Weihnachtsurlaub'.
    request-status = 'B'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    "request-employee_uuid  = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND request TO requests.

    "Daten hinzufügen
    INSERT zml2023_request FROM TABLE @requests.

    DATA claims TYPE TABLE OF zml2023_claim.
    DATA claim TYPE zml2023_claim.

    "Daten löschen
    DELETE FROM zml2023_claim.

    "Daten erstellen
    claim-employee = '1'.
    claim-year1 = '2022'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND claim TO claims.

    "Daten erstellen
    claim-employee = '1'.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND claim TO claims.

     "Daten erstellen
    claim-employee = '2'.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND claim TO claims.

     "Daten erstellen
    claim-employee = '3'.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '7'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND claim TO claims.

    "Daten hinzufügen
    INSERT zml2023_claim FROM TABLE @claims.

    DATA employees TYPE TABLE OF zml2023_employee.
    DATA employee TYPE zml2023_employee.

    "Daten löschen
    DELETE FROM zml2023_employee.

    "Daten erstellen
    employee-employeenumber = '1'.
    employee-forename = 'Hans'.
    employee-surename = 'Maier'.
    employee-client = sy-mandt.
    employee-entrydate = '20000501'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees.

    "Daten erstellen
    employee-employeenumber = '2'.
    employee-forename = 'Lisa'.
    employee-surename = 'Müller'.
    employee-client = sy-mandt.
    employee-entrydate = '20100701'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees.


    "Daten erstellen
    employee-employeenumber = '3'.
    employee-forename = 'Petra'.
    employee-surename = 'Schmid'.
    employee-client = sy-mandt.
    employee-entrydate = '20221001'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    APPEND employee TO employees.

    "Daten hinzufügen
    INSERT zml2023_employee FROM TABLE @employees.





  ENDMETHOD.
ENDCLASS.
