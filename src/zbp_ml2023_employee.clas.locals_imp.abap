CLASS lhc_request DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Request RESULT result.

    METHODS cancelrequest FOR MODIFY
      IMPORTING keys FOR ACTION request~cancelrequest RESULT result.

    METHODS approverequest FOR MODIFY
      IMPORTING keys FOR ACTION request~approverequest RESULT result.

    METHODS validatedates FOR VALIDATE ON SAVE
      IMPORTING keys FOR request~validatedates.

    METHODS determinestatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR request~determinestatus.

    METHODS determineHoliday FOR DETERMINE ON MODIFY
      IMPORTING keys FOR request~determineHoliday.

    METHODS determinestatusp FOR DETERMINE ON MODIFY
      IMPORTING keys FOR request~determinestatusp.



ENDCLASS.

CLASS lhc_request IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.
  METHOD CancelRequest.

    DATA message TYPE REF TO zcm_ml2023_request.

    "Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
      FIELDS ( Status Comment1 )
      WITH CORRESPONDING #( keys )
      RESULT DATA(requests).


    "Process Travels

    LOOP AT requests REFERENCE INTO DATA(request). "for (Travel travel : travels) {...}

      "Validate Status and Create Error Message
      IF request->Status = 'A'.
        message = NEW zcm_ml2023_request(
         textid      = zcm_ml2023_request=>request_already_cancelled
         severity    = if_abap_behv_message=>severity-error
        comment1 = request->Comment1 ). " TravelMessage = new TravelMessage(1, "E", "Italienurlaub");
        APPEND VALUE #( %tky = request->%tky %msg = message ) TO reported-request.
        APPEND VALUE #( %tky = request->%tky ) TO failed-request.

        DELETE requests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      "Set Status on Cancelled and Create Success Message
      request->Status = 'A'.
      message = NEW zcm_ml2023_request(
        textid      = zcm_ml2023_request=>request_cancelled_successfully
        severity    = if_abap_behv_message=>severity-success
        comment1 = request->Comment1 ).
      APPEND VALUE #( %tky = request->%tky %msg = message ) TO reported-request.

    ENDLOOP.

    "Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_ml2023_request
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR t IN requests ( %tky = t-%tky Status = t-Status ) ).

    "Set Result
    result = VALUE #( FOR t IN requests ( %tky = t-%tky %param = t ) ).
  ENDMETHOD.

  "METHOD determineStatus.


  METHOD validatedates.
    DATA message TYPE REF TO zcm_ml2023_request.

     "Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
         FIELDS ( Startdate Enddate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(requests).

     "Process Travels
    LOOP AT requests INTO DATA(request).
       "Validate Dates and Create Error Message
      IF request-Enddate < request-Startdate.
        message = NEW zcm_ml2023_request( textid = zcm_ml2023_request=>invalid_dates
        severity    = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = request-%tky
                       %msg = message ) TO reported-request.
        APPEND VALUE #( %tky = request-%tky ) TO failed-request.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  "METHOD validatedates.
   " DATA message TYPE REF TO zcm_ml2023_request.

    " Read Travels
    "READ ENTITY IN LOCAL MODE zr_ml2023_request
    "     FIELDS (  Holidays )
     "    WITH CORRESPONDING #( keys )
      "   RESULT DATA(requests).



    " Process Travels
    "LOOP AT requests INTO DATA(request).
      " Validate Dates and Create Error Message
    "  IF request-Enddate < request-Startdate.
     "   message = NEW zcm_ml2023_request( textid = zcm_ml2023_request=>invalid_dates
      "  severity    = if_abap_behv_message=>severity-error ).
       " APPEND VALUE #( %tky = request-%tky
        "                %msg = message ) TO reported-request.
        "APPEND VALUE #( %tky = request-%tky ) TO failed-request.
      "ENDIF.
   " ENDLOOP.
  "ENDMETHOD.



  METHOD determinestatus.
    " Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
         FIELDS ( Status )
         WITH CORRESPONDING #( keys )
         RESULT DATA(requests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_ml2023_request
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR t IN requests
                         ( %tky   = t-%tky
                           Status = 'B' ) ).
  ENDMETHOD.

  METHOD determineStatusP.
    " Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
         FIELDS ( Status )
         WITH CORRESPONDING #( keys )
         RESULT DATA(requests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_ml2023_request
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR t IN requests WHERE ( Status = 'G' )
                         ( %tky   = t-%tky
                           Status = 'B' ) ).
  ENDMETHOD.


  METHOD determineHoliday.
Try.
    "Define Calendar
    DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
    " Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
          FIELDS ( Holidays )
        WITH CORRESPONDING #( keys )
         RESULT DATA(requests).

    " Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_ml2023_request
           UPDATE FIELDS ( Holidays )
           WITH VALUE #( FOR t IN requests
                         ( %tky   = t-%tky
                           Holidays = calendar->calc_workingdays_between_dates( iv_start = t-startdate iv_end = t-enddate ) ) ).
CATCH cx_root INTO DATA(error).

endtry.
  ENDMETHOD.

  METHOD approverequest.

    DATA message TYPE REF TO zcm_ml2023_request.

    "Read Travels
    READ ENTITY IN LOCAL MODE zr_ml2023_request
      FIELDS ( Status Comment1 )
      WITH CORRESPONDING #( keys )
      RESULT DATA(requests).


    "Process Travels

    LOOP AT requests REFERENCE INTO DATA(request). "for (Travel travel : travels) {...}

      "Validate Status and Create Error Message
      IF request->Status = 'G'.
        message = NEW zcm_ml2023_request(
         textid      = zcm_ml2023_request=>request_already_approved
         severity    = if_abap_behv_message=>severity-error
        comment1 = request->Comment1 ). " TravelMessage = new TravelMessage(1, "E", "Italienurlaub");
        APPEND VALUE #( %tky = request->%tky %msg = message ) TO reported-request.
        APPEND VALUE #( %tky = request->%tky ) TO failed-request.

        DELETE requests INDEX sy-tabix.
        CONTINUE.
      ENDIF.

      "Set Status on Cancelled and Create Success Message
      request->Status = 'G'.
      message = NEW zcm_ml2023_request(
        textid      = zcm_ml2023_request=>request_approved_successfully
        severity    = if_abap_behv_message=>severity-success
        comment1 = request->Comment1 ).
      APPEND VALUE #( %tky = request->%tky %msg = message ) TO reported-request.

    ENDLOOP.

    "Modify Travels
    MODIFY ENTITY IN LOCAL MODE zr_ml2023_request
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR t IN requests ( %tky = t-%tky Status = t-Status ) ).

    "Set Result
    result = VALUE #( FOR t IN requests ( %tky = t-%tky %param = t ) ).
  ENDMETHOD.


ENDCLASS.

CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
