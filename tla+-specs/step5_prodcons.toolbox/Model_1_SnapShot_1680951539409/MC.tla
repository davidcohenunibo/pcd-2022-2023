---- MODULE MC ----
EXTENDS step5_prodcons, TLC

\* CONSTANT definitions @modelParameterConstants:0N
const_168095153836828000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1X
const_168095153836829000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:2Y
const_168095153836830000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3BS
const_168095153836831000 == 
2
----

\* INIT definition @modelBehaviorNoSpec:0
init_168095153836832000 ==
FALSE/\prodSem = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_168095153836833000 ==
FALSE/\prodSem' = prodSem
----
=============================================================================
\* Modification History
\* Created Sat Apr 08 12:58:58 CEST 2023 by Dach-
