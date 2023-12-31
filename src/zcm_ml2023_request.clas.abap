CLASS zcm_ml2023_request DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    constants:
      begin of request_cancelled_successfully,
        msgid type symsgid value 'ZML2023_REQUEST',
        msgno type symsgno value '001',
        attr1 type scx_attrname value 'COMMENT1',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of request_cancelled_successfully.

    constants:
      begin of request_already_cancelled,
        msgid type symsgid value 'ZML2023_REQUEST',
        msgno type symsgno value '002',
        attr1 type scx_attrname value 'COMMENT1',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of REQUEST_ALREADY_CANCELLED.



     CONSTANTS:
      BEGIN OF invalid_dates,
        msgid TYPE symsgid      VALUE 'ZML2023_REQUEST',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_dates.

       CONSTANTS:
      BEGIN OF request_approved_successfully,
        msgid TYPE symsgid      VALUE 'ZML2023_REQUEST',
        msgno TYPE symsgno      VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF request_approved_successfully.

      CONSTANTS:
      BEGIN OF request_already_approved,
        msgid TYPE symsgid      VALUE 'ZML2023_REQUEST',
        msgno TYPE symsgno      VALUE '005',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF request_already_approved.

      "Attributes
      DATA comment1 TYPE zml2023_comment.

    METHODS constructor
      IMPORTING
        textid   LIKE if_t100_message=>t100key OPTIONAL
        severity type if_abap_behv_message=>t_severity
        previous LIKE previous OPTIONAL
        comment1 type zml2023_comment optional.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcm_ml2023_request IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
  super->constructor( previous = previous ).

  CLEAR me->textid.
  IF textid is INITIAL.
  if_t100_message~t100key = if_t100_message=>default_textid.
  ELSE.
  if_t100_message~t100key = textid.
  ENDIF.
  if_abap_behv_message~m_severity = severity.
  me->comment1 = comment1.


ENDMETHOD.
ENDCLASS.
