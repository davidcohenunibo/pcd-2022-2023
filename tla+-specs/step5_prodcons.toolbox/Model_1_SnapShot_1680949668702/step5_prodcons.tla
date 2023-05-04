--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS Sequences, TLC

CONSTANT X, Y, N

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
*)


=============================================

