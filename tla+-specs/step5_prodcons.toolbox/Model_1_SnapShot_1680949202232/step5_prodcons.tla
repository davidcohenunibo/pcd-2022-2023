--------------------------- MODULE step5_prodcons ---------------------------

EXTENDS Integers, TLC, Sequences
(* --algorithm classab
variables 
    aSem = 0, 
    bSem = 0, 
    a = 0, 
    b = 0, 
    resourceSem = 0, 
    aInside = 0, 
    bInside = 0, 
    aIter = 0, 
    bIter = 0;

macro lock(sem) begin
  await sem = 0;
  sem := sem + 1;
end macro

macro unlock(sem) begin
  sem := sem - 1;
end macro  

fair process classA \in 1..2
begin
Iterations:
 while aIter < 5 do
   aIter := aIter + 1;
   LockEntry:
      lock(aSem);
   IncreaseCount:   
       either
         a := a + 1;
       or
         a := a - 10; rectifyInc: a := a + 11;
      end either;   
   MaybeLockResource:
      if (a = 1) then
        lock(resourceSem);  
      end if;        
   UnlockEntry:
     unlock(aSem);
   ClassExclusiveAccess:
     aInside := aInside + 1;
     assert bInside = 0;
   LockEntry2:
     lock(aSem);
   DecreaseCount:
     either
         a := a - 1;
     or
         a := a + 10; rectifyDec: a := a - 11;
     end either;       
   MaybeUnlockResource:
     aInside := aInside - 1;
     if (a = 0) then
       unlock(resourceSem);
     end if;
   UnlockEntry2:
     unlock(aSem);           
 end while;
end process

fair process classB \in 3..4
begin
Iterations:
 while bIter < 5 do
   bIter := bIter + 1;
   LockEntry:
      lock(bSem);
   IncreaseCount:   
       either
         b := b + 1;
       or
         b := b - 10; rectifyInc: b := b + 11;   
       end either;     
   MaybeLockResource:
      if (b = 1) then
        lock(resourceSem);  
      end if;        
   UnlockEntry:
     unlock(bSem);
   ClassExclusiveAccess:
     bInside := bInside + 1;
     assert aInside = 0;
   LockEntry2:
     lock(bSem);
   DecreaseCount:
        either
         b := b - 1;
       or
         b := b + 10; rectifyDec: b := b - 11;     
       end either;   
   MaybeUnlockResource:
     bInside := bInside - 1;
     if (b = 0) then
       unlock(resourceSem);
     end if;
   UnlockEntry2:
     unlock(bSem);           
 end while;
end process

end algorithm; *)
=============================================================================