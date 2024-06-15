CLASS ycl_game_of_life_2024_ii DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF cell_type,
             status TYPE abap_bool,
             x      TYPE i,
             y      TYPE i,
           END OF cell_type.

    TYPES cell_table_type TYPE STANDARD TABLE OF cell_type WITH EMPTY KEY.

    DATA cell TYPE cell_type.
    DATA cell_field TYPE cell_table_type.

    METHODS constructor.

    METHODS run.

    METHODS determine_nb
      IMPORTING cell_to_ev      TYPE cell_type
      RETURNING VALUE(r_result) TYPE cell_table_type.

    METHODS count_living_neighbours
      IMPORTING cell_to_ev      TYPE cell_type
      RETURNING VALUE(r_result) TYPE i.


  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS ycl_game_of_life_2024_ii IMPLEMENTATION.

  METHOD constructor.
    cell = VALUE cell_type( x = 1 y = 1 ).

    cell_field = VALUE ycl_game_of_life_2024_ii=>cell_table_type(
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
  ENDMETHOD.

  METHOD run.

  ENDMETHOD.


  METHOD determine_nb.

    r_result = VALUE ycl_game_of_life_2024_ii=>cell_table_type(
    (  x = cell_to_ev-x - 1 y = cell_to_ev-y - 1 )
    (  x = cell_to_ev-x - 1 y = cell_to_ev-y     )
    (  x = cell_to_ev-x - 1 y = cell_to_ev-y + 1 )
    (  x = cell_to_ev-x     y = cell_to_ev-y - 1 )
    (  x = cell_to_ev-x     y = cell_to_ev-y + 1 )
    (  x = cell_to_ev-x + 1 y = cell_to_ev-y - 1 )
    (  x = cell_to_ev-x + 1 y = cell_to_ev-y     )
    (  x = cell_to_ev-x + 1 y = cell_to_ev-y + 1 ) ).

    DELETE r_result WHERE x < 1 OR y < 1.

  ENDMETHOD.


  METHOD count_living_neighbours.

    DATA(cell_neighbours) = determine_nb( cell_to_ev ).

    r_result = REDUCE #( INIT count = 0
                         FOR neighbour_cell IN cell_neighbours
                         FOR status_check IN cell_field WHERE ( x = neighbour_cell-x AND y = neighbour_cell-y AND status = abap_true )
                         NEXT count = count + 1 ).

  ENDMETHOD.

ENDCLASS.
