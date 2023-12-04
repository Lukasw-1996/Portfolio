CLASS lhc_request DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Request RESULT result.

    METHODS cancelrequest FOR MODIFY
      IMPORTING keys FOR ACTION request~cancelrequest RESULT result.

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
      IF request->Status = 'X'.
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
      request->Status = 'X'.
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
