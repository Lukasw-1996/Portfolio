CLASS zcl_ml2023_vacation_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ml2023_vacation_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA requests TYPE TABLE OF zml2023_request.
    DATA request TYPE zml2023_request.

    DATA claims TYPE TABLE OF zml2023_claim.
    DATA claim TYPE zml2023_claim.

    DATA employees TYPE TABLE OF zml2023_employee. "List<Trave> travels = new ArrayList<>();
    DATA employee TYPE zml2023_employee. "Travel travel;

    "Daten löschen
    DELETE FROM zml2023_request.
    DELETE FROM zml2023_claim.
    DELETE FROM zml2023_employee.

    "Worker 1
    "Daten erstellen
    employee-employeenumber = '1'.
     employee-forename = 'Hans'.
     employee-surename = 'Maier'.
     employee-client = sy-mandt.
     employee-entrydate = '20000501'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    employee-created_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-created_at.
    employee-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-last_changed_at.

    APPEND employee TO employees. "travels.add(travel)



*    hier iwan die createdby etc.

    APPEND request TO requests.

    request-applicant = employee-employee_uuid.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20221227'.
    request-enddate = '20221230'.
    request-comment1 = 'Weihnachtsurlaub'.
    request-status = 'A'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-created_by = 'GENERATOR'.
    get TIME STAMP FIELD request-created_at.
    request-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD request-last_changed_at.

    APPEND request TO requests.


    request-applicant = employee-employee_uuid.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20221228'.
    request-enddate = '20221230'.
    request-comment1 = 'Weihnachtsurlaub (2. Versuch)'.
    request-status = 'G'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-created_by = 'GENERATOR'.
    get TIME STAMP FIELD request-created_at.
    request-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD request-last_changed_at.
    "aktualisieren

    APPEND request TO requests.


    request-applicant = employee-employee_uuid.
    request-approver = '2'.
    request-client = sy-mandt.
    request-comment1 = ' '.
    request-startdate = '20230527'.
    request-enddate = '20230614'.
    request-status = 'G'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-created_by = 'GENERATOR'.
    get TIME STAMP FIELD request-created_at.
    request-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD request-last_changed_at.

    APPEND request TO requests.

    request-applicant = employee-employee_uuid.
    request-approver = '2'.
    request-client = sy-mandt.
    request-startdate = '20231220'.
    request-enddate = '20231231'.
    request-comment1 = 'Winterurlaub'.
    request-status = 'B'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-created_by = 'GENERATOR'.
    get TIME STAMP FIELD request-created_at.
    request-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD request-last_changed_at.

    APPEND request TO requests.
    "Daten erstellen
    claim-employee_uuid = employee-employee_uuid.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    claim-created_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-created_at.
    claim-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-last_changed_at.

    APPEND claim TO claims.

    "Daten erstellen
    claim-employee_uuid = employee-employee_uuid.
    claim-year1 = '2022'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    claim-created_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-created_at.
    claim-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-last_changed_at.

    APPEND claim TO claims.

    "Worker 2
    "Daten erstellen
    employee-employeenumber = '2'.
    employee-forename = 'Lisa'.
    employee-surename = 'Müller'.
    employee-client = sy-mandt.
    employee-entrydate = '20100701'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    employee-created_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-created_at.
    employee-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-last_changed_at.

    APPEND employee TO employees. "travels.add(travel)

    claim-employee_uuid = employee-employee_uuid.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '30'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    claim-created_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-created_at.
    claim-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-last_changed_at.

    APPEND claim TO claims.

    "Worker 3
    " Daten erstellen
    employee-employeenumber = '3'.
    employee-forename = 'Petra'.
    employee-surename = 'Schmid'.
    employee-client = sy-mandt.
    employee-entrydate = '20221001'.
    employee-employee_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    employee-created_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-created_at.
    employee-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD employee-last_changed_at.

    APPEND employee TO employees. "travels.add(travel)

    "Daten erstellen
    request-applicant = employee-employee_uuid.
    request-approver = '1'.
    request-client = sy-mandt.
    request-startdate = '20231227'.
    request-enddate = '20231231'.
    request-comment1 = 'Weihnachtsurlaub'.
    request-status = 'B'.
    request-request_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    request-created_by = 'GENERATOR'.
    get TIME STAMP FIELD request-created_at.
    request-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD request-last_changed_at.

    APPEND request TO requests.

    "Daten erstellen
    claim-employee_uuid = employee-employee_uuid.
    claim-year1 = '2023'.
    claim-client = sy-mandt.
    claim-vacations = '7'.
    claim-claim_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    claim-created_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-created_at.
    claim-last_changed_by = 'GENERATOR'.
    get TIME STAMP FIELD claim-last_changed_at.

    APPEND claim TO claims.

    "Daten hinzufügen
    INSERT zml2023_employee FROM TABLE @employees.
    INSERT zml2023_request FROM TABLE @requests.
    INSERT zml2023_claim FROM TABLE @claims.


  ENDMETHOD.
ENDCLASS.
