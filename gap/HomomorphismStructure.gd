# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Declarations
#

####################################
##
#! @Chapter Futher CAP operations
##
#! @Section Homomorphism structure in closed monoidal categories
##
####################################

#! The following operations are used by &CAP; to derive a homomorphism structure
#! from the closed structure of a closed monoidal category and a bidirectional interpretation.

DeclareGlobalVariable( "HOMOMORPHISM_STRUCTURE_FROM_CLOSED_STRUCTURE_METHOD_NAME_RECORD" );

##   h
##   ↑ \
##   |   \
##   λ     η
##   |       \
##   |         ↘
##   1 -- ι --→ a

#! @Description
#!  The argument is an object $a$.
#!  The output is an object $h$, the source of a morphism $\eta: h \to a$
#!  constructed as $\eta =$<C>MorphismUniquelyLiftingMorphismsFromTensorUnit</C>($a$),
#!  such that for each morphism $\iota: 1 \to a$ from the tensor unit $1$
#!  there exists a unique lift $\lambda: 1 \to h$ of $\iota$ along $\eta$.
#! @Returns an object
#! @Arguments a
DeclareOperation( "ObjectUniquelyLiftingMorphismsFromTensorUnit",
                  [ IsCapCategoryObject ] );

#! @Description
#!  The argument is an object $a$.
#!  The output is a morphism $\eta: h \to a$,
#!  such that for each morphism $\iota: 1 \to a$ from the tensor unit $1$
#!  there exists a unique lift $\lambda: 1 \to h$ of $\iota$ along $\eta$.
#! @Returns a morphism in $\mathrm{Hom}(h,a)$
#! @Arguments a
DeclareOperation( "MorphismUniquelyLiftingMorphismsFromTensorUnit",
                  [ IsCapCategoryObject ] );

#! @Description
#!  The argument is an object $a$ and an object $h$.
#!  The output is a morphism $\eta: h \to a$,
#!  such that for each morphism $\iota: 1 \to a$ from the tensor unit $1$
#!  there exists a unique lift $\lambda: 1 \to h$ of $\iota$ along $\eta$.
#! @Returns a morphism in $\mathrm{Hom}(h,a)$
#! @Arguments a, h
DeclareOperation( "MorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenSource",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The argument is a morphism $\iota: 1 \to a$ from the tensor unit $1$.
#!  The output is the unique lift $\lambda: 1 \to h$ of $\iota$ along $\eta:h \to a$,
#!  where $\eta =$<C>MorphismUniquelyLiftingMorphismsFromTensorUnit</C>($a$).
#! @Returns a morphism in $\mathrm{Hom}(1,h)$
#! @Arguments iota
DeclareOperation( "LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnit",
                  [ IsCapCategoryMorphism ] );

#! @Description
#!  The argument is a morphism $\iota: 1 \to a$ from the tensor unit $1$ and an object $h$.
#!  The output is the unique lift $\lambda: 1 \to h$ of $\iota$ along $\eta:h \to a$,
#!  where $\eta =$<C>MorphismUniquelyLiftingMorphismsFromTensorUnit</C>($a$).
#! @Returns a morphism in $\mathrm{Hom}(1,h)$
#! @Arguments iota, h
DeclareOperation( "LiftAlongMorphismUniquelyLiftingMorphismsFromTensorUnitWithGivenRange",
                  [ IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#!  The argument is an object $h$ in the category $C$,
#!  for which there exists an object $a$ in $C$ such that
#!  $h=$<C>ObjectUniquelyLiftingMorphismsFromTensorUnit</C>($a$).
#!  The output is an object in the range category $D$
#!  of the homomorphism structure on $C$.
#! @Returns an object in $D$
#! @Arguments h
DeclareOperation( "InterpretAsObjectInRangeCategoryOfHomomorphismStructure",
                  [ IsCapCategoryObject ] );

#! @Description
#!  The argument is a morphism $\alpha:h_1 \to h_2$ in the category $C$,
#!  for which there exist objects $a_1, a_2$ in $C$ such that
#!  $h_i=$<C>ObjectUniquelyLiftingMorphismsFromTensorUnit</C>($a_i$)
#!  for $i=1,2$. The output is a morphism in the range category $D$
#!  of the homomorphism structure on $C$.
#! @Returns a morphism in $D$
#! @Arguments alpha
DeclareOperation( "InterpretAsMorphismInRangeCategoryOfHomomorphismStructure",
                  [ IsCapCategoryMorphism ] );

#! @Description
#!  The argument is an object $o$ in the range category $D$
#!  of the homomorphism structure on the category $C$.
#!  The output is an object $h$ in the category $C$ such that
#!  $o=$<C>InterpretAsObjectInRangeCategoryOfHomomorphismStructure</C>($h$).
#! @Returns an object in $C$
#! @Arguments o
DeclareOperation( "InterpretObjectFromRangeCategoryOfHomomorphismStructure",
                  [ IsCapCategory, IsCapCategoryObject ] );

#! @Description
#!  The argument is a morphism $\omega:o_1 \to o_2$ in the range category $D$
#!  of the homomorphism structure on the category $C$.
#!  The output is a morphism $\alpha:h_1 \to h_2$ in the category $C$ such that
#!  $\omega=$<C>InterpretAsMorphismInRangeCategoryOfHomomorphismStructure</C>($\alpha$).
#! @Returns a morphism in $C$
#! @Arguments omega
DeclareOperation( "InterpretMorphismFromRangeCategoryOfHomomorphismStructure",
                  [ IsCapCategory, IsCapCategoryMorphism ] );
