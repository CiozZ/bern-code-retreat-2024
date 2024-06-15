CLASS ycl_game_of_life_2024 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF cell_type,
             status TYPE abap_bool,
             x      TYPE i,
             y      TYPE i,
           END OF cell_type.

    TYPES cells_field_type TYPE STANDARD TABLE OF cell_type WITH EMPTY KEY.

    DATA cell TYPE cell_type.
    DATA cells_field TYPE cells_field_type.

    METHODS constructor.
    METHODS run_first_rule.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_game_of_life_2024 IMPLEMENTATION.

  METHOD constructor.
    cell = VALUE #( x = 1 y = 1 ).

    cells_field = VALUE #(
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

  ENDMETHOD.


  METHOD run_first_rule.
    cells_field = VALUE #(
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
  ENDMETHOD.

ENDCLASS.
