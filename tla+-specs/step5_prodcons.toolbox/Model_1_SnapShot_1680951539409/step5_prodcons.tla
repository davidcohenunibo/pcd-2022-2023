--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS Integers, Sequences, TLC, FiniteSets

CONSTANT X, Y, N,BS
NP == N
NC == N

(*--algorithm Distribution
variables 
    buffer = [x \in SUBSET X |-> <<>>],
    readCount = [x \in SUBSET X |-> 0],
    writeCount = [x \in SUBSET X |-> 0],
    readSemaphore = [x \in SUBSET X |-> 0],
    writeSemaphore = [x \in SUBSET X |-> 0];

macro wait(s) begin
  await s > 0;  
  s := s - 1;
end macro;

macro signal(s) begin
  s := s + 1;
end macro;

process WriteInterval(key \in X, item \in Y)
begin
WriteLoop:
    wait(writeSemaphore[key]);
    writeSemaphore[key] := writeSemaphore[key] - 1;
    wait(writeCount[key] = 0);
    writeCount[key] := writeCount[key] + 1;
    buffer[key] := <<item>>;
    writeCount[key] := writeCount[key] - 1;
    signal(writeSemaphore[key]);
end process;

process ReadInterval(key \in X)
variables list
begin
ReadLoop:
    wait(readSemaphore[key]);
    readSemaphore[key] := readSemaphore[key] - 1;
    readCount[key] := readCount[key] + 1;
    signal(readSemaphore[key]);
    list := buffer[key];
    wait(Len(list) <= N);
    readCount[key] := readCount[key] - 1;
    return list;
end process;
end algorithm;*)

\* BEGIN TRANSLATION (chksum(pcal) = "1f8ad4c4" /\ chksum(tla) = "b54d5e5c")
VARIABLES buffer, in, out, count, prodSem, consSem, pc



vars == << buffer, in, out, count, prodSem, consSem, pc >>

Init == (* Global variables *)
        /\ buffer = <<>>
        /\ in = 0
        /\ out = 0
        /\ count = 0
        /\ consSem = 0
        
ProcSet == (1..NP) 

ProdLoop(self) == /\ pc[self] = "ProdLoop"
                  /\ \/ /\ pc' = [pc EXCEPT ![self] = "Think"]
                     \/ /\ pc' = [pc EXCEPT ![self] = "ProdCrit"]
                  /\ UNCHANGED << buffer, in, out, count, prodSem, consSem >>
                  
Think(self) == /\ pc[self] = "Think"
               /\ pc' = [pc EXCEPT ![self] = "ProdLoop"]
               /\ UNCHANGED << buffer, in, out, count, prodSem, consSem >>

signal(semaphore) == /\ semaphore' = semaphore + 1
                     /\ UNCHANGED << buffer, in, out, count, prodSem, consSem, pc >>
               

ProdCrit(self) == /\ pc[self] = "ProdCrit"
                  /\ in' = (in + 1) % BS
                  /\ out' = out
                  /\ count' = count + 1
                  /\ buffer' = [buffer EXCEPT ![in] = self]
                  /\ signal(consSem)
                  /\ pc' = [pc EXCEPT ![self] = "Think"]
                  /\ UNCHANGED << prodSem >>


=============================================

