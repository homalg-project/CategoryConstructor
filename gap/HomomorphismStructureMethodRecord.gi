# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

InstallValue( HOMOMORPHISM_STRUCTURE_FROM_CLOSED_STRUCTURE_METHOD_NAME_RECORD, rec(

ObjectUniquelyLiftingMorphismsFromTensorUnit := rec(
  filter_list := [ "category", "object" ],
  return_type := "object",
),

MorphismUniquelyLiftingMorphismsFromTensorUnit := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "ObjectUniquelyLiftingMorphismsFromTensorUnit( cat, a )",
  output_range_getter_string := "a",
  with_given_object_position := "Source",
),

MorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenSource := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "h" ], [ "h", "a" ] ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "h" ],
  output_source_getter_string := "h",
  output_range_getter_string := "a",
),

LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota" ],
  output_source_getter_string := "Source( iota )",
  output_range_getter_string := "ObjectUniquelyLiftingMorphismsFromTensorUnit( cat, Source( iota ) )",
  with_given_object_position := "Range",
),

LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenRange := rec(
  filter_list := [ "category", "morphism", "object" ],
  io_type := [ [ "iota", "h" ], [ "iota_source", "h" ] ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota", "h" ],
  output_source_getter_string := "Source( iota )",
  output_range_getter_string := "h",
),

InterpretAsObjectInRangeCategoryOfHomomorphismStructure := rec(
  filter_list := [ "category", "object" ],
  return_type := "other_object",
),

InterpretAsMorphismInRangeCategoryOfHomomorphismStructure := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "other_morphism",
  input_arguments_names := [ "cat", "phi" ],
  output_source_getter_string := "InterpretAsObjectInRangeCategoryOfHomomorphismStructure( cat, Source( phi ) )",
  output_range_getter_string := "InterpretAsObjectInRangeCategoryOfHomomorphismStructure( cat, Range( phi ) )",
),

InterpretObjectFromRangeCategoryOfHomomorphismStructure := rec(
  filter_list := [ "category", "other_object" ],
  return_type := "object",
),

InterpretMorphismFromRangeCategoryOfHomomorphismStructure := rec(
  filter_list := [ "category", "other_morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "alpha" ],
  output_source_getter_string := "InterpretObjectFromRangeCategoryOfHomomorphismStructure( cat, Source( alpha ) )",
  output_range_getter_string := "InterpretObjectFromRangeCategoryOfHomomorphismStructure( cat, Range( alpha ) )",
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( HOMOMORPHISM_STRUCTURE_FROM_CLOSED_STRUCTURE_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    HOMOMORPHISM_STRUCTURE_FROM_CLOSED_STRUCTURE_METHOD_NAME_RECORD,
    "CategoryConstructor",
    "HomomorphismStructure.autogen.gd",
    "Futher CAP operations",
    "Add-methods"
);

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( HOMOMORPHISM_STRUCTURE_FROM_CLOSED_STRUCTURE_METHOD_NAME_RECORD );
