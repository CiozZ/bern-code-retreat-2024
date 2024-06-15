CLASS ltc_game_of_life DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_game_of_life_2024_ii.

    METHODS cell_should_exist       FOR TESTING.
    METHODS cell_field_should_exist FOR TESTING.
    METHODS cell_2_2_should_have_8nb  FOR TESTING.
    METHODS cell_1_1_should_have_3nb FOR TESTING.
    "!Cell 2 2 should have 1 living neighbour
    METHODS cell_2_2_should_have_1ln FOR TESTING.

ENDCLASS.

CLASS ltc_game_of_life IMPLEMENTATION.

  METHOD cell_should_exist.

    cut = NEW #( ).

    DATA(expected_cell) = VALUE ycl_game_of_life_2024_ii=>cell_type( x = 1 y = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = expected_cell
                                        act = cut->cell ).

  ENDMETHOD.

  METHOD cell_field_should_exist.

    cut = NEW #( ).

    DATA(expected_cell_field) = VALUE ycl_game_of_life_2024_ii=>cell_table_type(
    ( x = 1 y = 1 )
    ( x = 1 y = 2 )
    ( x = 1 y = 3 )
    ( x = 2 y = 1 )
    ( x = 2 y = 2 )
    ( x = 2 y = 3 )
    ( x = 3 y = 1 )
    ( x = 3 y = 2 )
    ( x = 3 y = 3 )
    ).

    cl_abap_unit_assert=>assert_equals( exp = expected_cell_field
                                        act = cut->cell_field ).

  ENDMETHOD.

  METHOD cell_2_2_should_have_8nb.

    "Arrange
    cut = NEW #( ).
    cut->cell_field = VALUE #(
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

    DATA(expected_nb) = VALUE ycl_game_of_life_2024_ii=>cell_table_type(
      ( x = 1 y = 1 )
      ( x = 1 y = 2 )
      ( x = 1 y = 3 )
      ( x = 2 y = 1 )
      ( x = 2 y = 3 )
      ( x = 3 y = 1 )
      ( x = 3 y = 2 )
      ( x = 3 y = 3 ) ).

    "Assert
    cl_abap_unit_assert=>assert_equals( exp = expected_nb
                                        act = cut->determine_nb( VALUE #( x = 2 y = 2 ) ) ).

  ENDMETHOD.

  METHOD cell_1_1_should_have_3nb.
    "Arrange
    cut = NEW #( ).
    cut->cell_field = VALUE #(
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

    DATA(expected_nb) = VALUE ycl_game_of_life_2024_ii=>cell_table_type(
      ( x = 1 y = 2 )
      ( x = 2 y = 1 )
      ( x = 2 y = 2 ) ).


    "Assert
    cl_abap_unit_assert=>assert_equals( exp = expected_nb
                                        act = cut->determine_nb( VALUE #( x = 1 y = 1 ) ) ).
  ENDMETHOD.

  METHOD cell_2_2_should_have_1ln.

    "Arrange
    cut = NEW #( ).
    cut->cell_field = VALUE #(
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

    cl_abap_unit_assert=>assert_equals( exp = 1
                                        act = cut->count_living_neighbours( VALUE #( x = 2 y = 2 ) ) ).

  ENDMETHOD.

ENDCLASS.
