--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS TLC, Integers, Sequences

CONSTANT BufferSize

CONSTANTS
    N, M

VARIABLES buffer, readers, writers

BoundedBuffer == Len(buffer) < BufferSize

vars == <<buffer, readers, writers>>

ProcSet == ({"reader1", "reader2"}) \cup ({"writer1", "writer2"})

Init == /\ buffer = <<>>
        /\ readers = [i \in 1..N |-> FALSE]
        /\ writers = [j \in 1..M |-> FALSE]

NextReader(i) == /\ \A j \in 1..M: \E buf \in SubSeq(buffer, 1, Len(buffer)):
                     \/ (buf.type = "write" /\ buf.owner = j /\ writers[j] = FALSE)
                     \/ buf.type = "read"
                  /\ buffer' = Append(buffer, <<"read", i>>)
                  /\ readers' = [readers EXCEPT ![i] = TRUE]
                  /\ UNCHANGED writers
                  
NextWriter(j) == /\ \A i \in 1..N: readers[i] = FALSE
                  /\ writers' = [writers EXCEPT ![j] = TRUE]
                  /\ buffer' = Append(buffer, <<"write", j>>)
                  /\ UNCHANGED readers

Next == (\E i \in 1..N: NextReader(i))
        \/ (\E j \in 1..M: NextWriter(j))

Spec == Init /\ [][Next]_vars

=============================================================