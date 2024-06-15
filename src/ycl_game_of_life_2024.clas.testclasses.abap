CLASS ltc_game_of_life DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_game_of_life_2024.

    METHODS cell_should_exit        FOR TESTING.
    METHODS cell_field_should_exist FOR TESTING.
    METHODS cell_should_die_rule_1  FOR TESTING.

ENDCLASS.

CLASS ltc_game_of_life IMPLEMENTATION.

  METHOD cell_should_exit.
    cut = NEW #( ).
    DATA(expected_cell) = VALUE ycl_game_of_life_2024=>cell_type( x = 1 y = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = expected_cell
                                        act = cut->cell ).
  ENDMETHOD.

  METHOD cell_field_should_exist.
    cut = NEW #( ).
    DATA(expected_cells_field) = VALUE ycl_game_of_life_2024=>cells_field_type(
    ( x = 1 y = 1 )
    ( x = 1 y = 2 )
    ( x = 1 y = 3 )
    ( x = 2 y = 1 )
    ( x = 2 y = 2 status = abap_true )
    ( x = 2 y = 3 )
    ( x = 3 y = 1 )
    ( x = 3 y = 2 )
    ( x = 3 y = 3 status = abap_true )
    ).

    cl_abap_unit_assert=>assert_equals( exp = expected_cells_field
                                        act = cut->cells_field ).
  ENDMETHOD.

  METHOD cell_should_die_rule_1.
    cut = NEW #( ).
    DATA(expected_cells_field) = VALUE ycl_game_of_life_2024=>cells_field_type(
    ( x = 1 y = 1 )
    ( x = 1 y = 2 )
    ( x = 1 y = 3 )
    ( x = 2 y = 1 )
    ( x = 2 y = 2 status = abap_false )
    ( x = 2 y = 3 )
    ( x = 3 y = 1 )
    ( x = 3 y = 2 )
    ( x = 3 y = 3 status = abap_false )
    ).

    cut->run_first_rule( ).

    cl_abap_unit_assert=>assert_equals( exp = expected_cells_field
                                        act = cut->cells_field ).
  ENDMETHOD.

ENDCLASS.
