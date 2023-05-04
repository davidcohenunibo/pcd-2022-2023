---- MODULE MC ----
EXTENDS step5_prodcons, TLC

\* CONSTANT definitions @modelParameterConstants:0N
const_168095118244717000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1X
const_168095118244718000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:2Y
const_168095118244719000 == 
2
----

\* INIT definition @modelBehaviorNoSpec:0
init_168095118244720000 ==
FALSE/\prodSem = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_168095118244721000 ==
FALSE/\prodSem' = prodSem
----
=============================================================================
\* Modification History
\* Created Sat Apr 08 12:53:02 CEST 2023 by Dach-
