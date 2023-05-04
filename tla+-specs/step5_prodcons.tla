--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS Integers, Sequences, TLC, FiniteSets

CONSTANTS X, Y, N, BS

NP == N
NC == N

(*--algorithm Distribution
VARIABLES buffer, readCount, writeCount, readSemaphore, writeSemaphore

process WriteInterval(key \in SUBSET X, item \in Y)
begin
    WriteLoop:
        await writeSemaphore[key] > 0;
        writeSemaphore[key] := writeSemaphore[key] - 1;
        await writeCount[key] = 0;
        writeCount[key] := 1;
        buffer[key] := <<item>>;
        writeCount[key] := 0;
        writeSemaphore[key] := writeSemaphore[key] + 1;
end process;

process ReadInterval(key \in SUBSET X)
variables list
begin
    ReadLoop:
        await readSemaphore[key] > 0;
        readSemaphore[key] := readSemaphore[key] - 1;
        readCount[key] := readCount[key] + 1;
        readSemaphore[key] := readSemaphore[key] + 1;
        list := buffer[key];
        await Len(list) <= N;
        readCount[key] := readCount[key] - 1;
        buffer[key] := SubSeq(buffer[key], Len(list)+1, Len(buffer[key]));
        return list;
end process;

process Producer(self)
variables i
begin
    ProdLoop:
        i := 0;
        while i < BS
        do 
            i := i + 1;
            Think: 
                await pc[self] = "Think";
                pc[self] := "ProdLoop";
            ProdCrit: 
                with in <- (in + 1) % BS,
                     buffer[SUBSET X][in] <- self,
                     count <- count + 1
                do 
                    if count = 1 then
                        Signal(consSem);
                    end if;
                end with;
                pc[self] := "Think";
        end while;
end process;

process Consumer(self)
variables item
begin
    ConsLoop:
        while TRUE
        do 
            Think: 
                await pc[self] = "Think";
                pc[self] := "ConsLoop";
            with item <- ReadInterval(SUBSET X)
            do 
                with out <- (out + 1) % BS,
                     count <- count - 1
                do 
                    if count = BS - 1 then
                        Signal(prodSem);
                    end if;
                end with;
                pc[self] := "Think";
            end with;
        end while;
end process;

(*-- Initial state of the algorithm *)
Init == /\ buffer = [x \in SUBSET X |-> <<>>]
        /\ readCount = [x \in SUBSET X |-> 0]
        /\ writeCount = [x \in SUBSET X |-> 0]
        /\ readSemaphore = [x \in SUBSET X |-> 0]
        /\ writeSemaphore = [x \in SUBSET X |-> 1]
        /\ pc = [i \in 1..NP+NC |-> "Think"]
        /\ count = 0
        /\ in = 0
        /\ out = 0
        /\ prodSem = 0
        /\ consSem = 0
        
(*-- Next state of the algorithm *)
Next == \/ /\ [self \in 1..NP |-> ProdLoop(self)]
        \/ /\ [self \in NP+1..NP+NC |-> ConsLoop(self)]
        \/ /\ [self \in 1..NP |


=============================================

