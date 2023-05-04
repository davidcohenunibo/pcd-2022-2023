--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS Sequences, TLC

CONSTANT X, Y, N

(*--algorithm Distribution
variables 
    buffer = [x \in SUBSET X |-> <<>>],
    writeLock = FALSE;

process WriteInterval(key \in X, item \in Y)
begin
WriteLoop:
    await ¬writeLock;
    writeLock := TRUE;
    buffer[key] := <<item>>;
    writeLock := FALSE;
end process;

process ReadInterval(key \in X)
variables list
begin
ReadLoop:
    await writeLock = FALSE;
    list := buffer[key];
    await Len(list) <= N;
    return list;
end process;
*)

(*--algorithm Distribution simulation
variables 
    buffer = [x \in SUBSET X |-> <<>>],
    writeLock = FALSE,
    results = <<>>;

process WriteInterval(key \in X, item \in Y)
begin
WriteLoop:
    await ¬writeLock;
    writeLock := TRUE;
    buffer[key] := <<item>>;
    results := Append(results, TRUE);
    writeLock := FALSE;
end process;

process ReadInterval(key \in X)
variables list
begin
ReadLoop:
    await writeLock = FALSE;
    list := buffer[key];
    await Len(list) <= N;
    results := Append(results, list);
    return list;
end process;

process CheckResults
begin
    await Len(results) = 10;
    Print(results);
    Terminate();
end process;
*)

=============================================