SetLogFile ("exceptional-2-3.log");
SetEchoInput (true);

// determine the exceptional 2- and 3-groups of order dividing p^6 

// for "small" groups Magma can compute Mu directly

MagmaMu := function (G)
   phi, P := MinimalDegreePermutationRepresentation (G);
   return Degree (P);
end function;

// G has minimal degree mu; brute-force check whether G is exceptional

IsExceptional := function (G, mu)
   N:=NormalSubgroups (G);
   N := [x`subgroup: x in N];
   N := [x: x in N | #x gt 1 and #x lt #G];
   for i in [1..#N] do 
     Q := quo < G | N[i]>;
     m := MagmaMu (Q);
     if m gt mu then return true, N[i]; end if;
   end for;
   return false;
end function;

for p in [2, 3] do
   for n in [5, 6] do
      X := SmallGroups (p^n);
      I := [i: i in [1..#X] | IsExceptional (X[i], MagmaMu (X[i]))];
      "\n\nExceptional groups of order ", p^n;
      "The # of exceptional groups of this order is", #I;
      "Their SmallGroup identifiers are the following"; 
      I;
   end for; 
end for;
      I;
