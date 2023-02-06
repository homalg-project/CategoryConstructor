# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
AddDerivationToCAP( ObjectUniquelyLiftingMorphismsFromTensorUnit,
  function( cat, a )
    
    return Source( MorphismUniquelyLiftingMorphismsFromTensorUnit( cat, a ) );
    
end : CategoryFilter := IsClosedMonoidalCategory,
      Description := "the object uniquely lifting morphisms from the tensor unit is the source of the corresponding morphism" );

##
AddDerivationToCAP( LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit,
  function( cat, iota )
    
    return Lift( cat, iota, MorphismUniquelyLiftingMorphismsFromTensorUnit( Range( iota ) ) );
    
end : CategoryFilter := IsClosedMonoidalCategory,
      Description := "LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenMorphism using Lift" );

####################################
## Final derived methods
####################################

##
AddFinalDerivationBundle(
                    [ [ IdentityMorphism, 1 ],
                      ],
                    [ 
                      ObjectUniquelyLiftingMorphismsFromTensorUnit,
                      MorphismUniquelyLiftingMorphismsFromTensorUnit,
                      MorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenSource,
                      LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenRange,
                      InterpretAsObjectInRangeCategoryOfHomomorphismStructure,
                      InterpretAsMorphismInRangeCategoryOfHomomorphismStructure,
                      InterpretObjectFromRangeCategoryOfHomomorphismStructure,
                      InterpretMorphismFromRangeCategoryOfHomomorphismStructure
                    ],
[        
  ObjectUniquelyLiftingMorphismsFromTensorUnit,
  function( cat, a )
    
    return a;
    
end
],
[
  MorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenSource,
  function( cat, a, h )
    
    return IdentityMorphism( a );
    
end
],
[
  LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenRange,
  function( cat, iota, h )
    
    return iota;
    
end
],
[
  InterpretAsObjectInRangeCategoryOfHomomorphismStructure,
  function( cat, h )
    
    return h;
    
end
],
[
  InterpretAsMorphismInRangeCategoryOfHomomorphismStructure,
  function( cat, alpha )
    
    return alpha;
    
end
],
[
  InterpretObjectFromRangeCategoryOfHomomorphismStructure,
  function( cat, o )
    
    return o;
    
end
],
[
  InterpretMorphismFromRangeCategoryOfHomomorphismStructure,
  
  function( cat, omega )
    
    return omega;
    
end
] : CategoryFilter := function( cat )
      return HasIsSymmetricClosedMonoidalCategory( cat ) and IsSymmetricClosedMonoidalCategory( cat ) and
             not HasRangeCategoryOfHomomorphismStructure( cat );
    end,
    FunctionCalledBeforeInstallation :=
      function( cat )
        SetRangeCategoryOfHomomorphismStructure( cat, cat );
    end,
    Description := "adding the trivial bidirectional interpretation assuming a closed symmetric structure"
);

##
AddFinalDerivationBundle(
                    [ [ TensorUnit, 1 ],
                      [ InternalHomOnObjects, 1 ],
                      [ InternalHomOnMorphisms, 1 ],
                      [ ObjectUniquelyLiftingMorphismsFromTensorUnit, 1 ],
                      [ MorphismUniquelyLiftingMorphismsFromTensorUnit, 1 ],
                      [ InterpretAsObjectInRangeCategoryOfHomomorphismStructure, 1 ],
                      [ PreCompose, 1 ],
                      [ LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit, 1 ],
                      [ InterpretAsMorphismInRangeCategoryOfHomomorphismStructure, 1 ],
                      [ InterpretMorphismFromRangeCategoryOfHomomorphismStructure, 1 ],
                      [ LambdaIntroduction, 1 ],
                      [ LambdaElimination, 1 ],
                      ],
                    [
                      DistinguishedObjectOfHomomorphismStructure,
                      HomomorphismStructureOnObjects,
                      HomomorphismStructureOnMorphismsWithGivenObjects,
                      InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure,
                      InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
                    ],
        
[
  DistinguishedObjectOfHomomorphismStructure,
  function( cat )
    local tensor_unit;
    
    tensor_unit := TensorUnit( cat );
    
    return InterpretAsObjectInRangeCategoryOfHomomorphismStructure( cat, tensor_unit );
    
  end
],
[
  HomomorphismStructureOnObjects,
  function( cat, a, b )
    local internalhom, h;
    
    internalhom := InternalHomOnObjects( cat, a, b );
    
    h:= ObjectUniquelyLiftingMorphismsFromTensorUnit( cat, internalhom );
    
    return InterpretAsObjectInRangeCategoryOfHomomorphismStructure( cat, h );
    
end
],
[
  HomomorphismStructureOnMorphismsWithGivenObjects,
  function( cat, s, alpha, beta, r )
    local internalhom, eta_s, hom;
    
    internalhom := InternalHomOnMorphisms( cat, alpha, beta );
    
    eta_s := MorphismUniquelyLiftingMorphismsFromTensorUnit( cat, Source( internalhom ) );
    
    hom := LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit( cat, PreCompose( cat, eta_s, internalhom ) );

    return InterpretAsMorphismInRangeCategoryOfHomomorphismStructure( cat, hom );
    
end
],
[
  InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure,
  function( cat, alpha )
    local iota;
    
    iota := LambdaIntroduction( cat, alpha );
    
    iota := LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit( cat, iota );
    
    return InterpretAsMorphismInRangeCategoryOfHomomorphismStructure( cat, iota );
    
  end
],
[
  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
  function( cat, a, b, iota )
    local internalhom;
    
    internalhom := InternalHomOnObjects( cat, a, b );
    
    iota := PreCompose( cat,
                    InterpretMorphismFromRangeCategoryOfHomomorphismStructure( cat, iota ),
                    MorphismUniquelyLiftingMorphismsFromTensorUnit( cat, internalhom ) );
    
    return LambdaElimination( cat, a, b, iota );
    
  end
] :
    Description := "adding the homomorphism structure using the closed structure and a bidirectional interpretation"
);
