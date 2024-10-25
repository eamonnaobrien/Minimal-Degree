// exceptional groups from Phi23

NonQuadraticResidue := function (p)
   for x in GF (p) do
     if not IsPower (x, 2) then return x; end if;
   end for;
end function;
   
Table3Phi23 := function(p)
   Z := Integers ();
   nu := Z ! (NonQuadraticResidue (p)); // nu
   
   F<a1, a2, a3, a4, a5, a6> := FreeGroup (6);
   Alpha := [a3, a4, a5, a6];
   Beta := [a1, a2];
   
   // common relations, typically commutators
   Comms := [
   (a3, a4) = 1, (a3, a5)= 1, (a3, a6) = a1,
   (a4, a5) = a2, (a4, a6)= a3, (a5, a6)= a4,  
   (a1, a2) = 1, a1^p = 1, a2^p = 1] cat
   &cat([[(Beta[i], Alpha[j]) = Id(F) : j in [1..4]]: i in [1..2]]);
   
   L := [];
   
   // G23, 1
   G := quo <F | Comms, a3^p = a4^p = a5^p = a6^p = 1>;
   Append (~L, G);
   
   // G23, 2
   G := quo <F | Comms, a3^p = a4^p = a5^p = 1, a6^p = a1>;
   Append (~L, G);
   
   // G23, 6
   G := quo <F | Comms, a3^p = a4^p = a6^p = 1, a5^p = a2>;
   Append (~L, G);
   
   // G23, 9r (r=0)
   G := quo <F | Comms, a3^p = a4^p = 1, a5^p = a2, a6^p = a1>;
   Append (~L, G);
   
   return L;
end function;
   
Check23 := function(L, p)
   w := PrimitiveRoot(p);
   
   K := GF(p);
   
   Z := Integers ();
   nu := Z ! (NonQuadraticResidue (p)); // nu
   
   Glist := [];
   Tlist := [];
   Nlist := [];
   MuGlist := [];
   MuTlist := [];
   
   count := 0;
   
   // (23, 1)
   count := count+1;
   F := L[count];
   Alpha := [F.1, F.2]; Beta:= [F.3, F.4, F.5, F.6];
   G1, phi := pQuotient(F, p, 6);
   Append(~Glist, G1);
   N1 := sub<G1 | phi( F.1*F.2 ) >;
   Append(~Nlist, N1);
   
   // Q is phi_10(1^5)
   
   Q := Group < a, a1, a2, a3, a4 | (a1, a) = a2, (a2, a) = a3,
               (a3, a) = a4, (a4, a) = 1, (a1, a2) = a4, (a1, a4)= 1, 
               (a1, a3) = 1, (a2, a3) = 1, (a2, a4) = 1, (a3, a4) = 1, 
                a2^p = 1, a3^p = 1, a^p = 1, a1^p = 1, a4^p = 1>;
   B := pQuotient (Q, p, 5);
   Append(~Tlist, B);
   
   Append(~MuGlist, 2*p^2);
   Append(~MuTlist, p^3);
   
   // (23, 2)
   count := count+1;
   F := L[count];
   Alpha := [F.1, F.2]; Beta:= [F.3, F.4, F.5, F.6];
   G1, phi := pQuotient(F, p, 6);
   Append(~Glist, G1);
   N1 := sub<G1 | phi( F.1*F.2 ) >;
   Append(~Nlist, N1);
   
   // Q is phi_10(2111)a_1
   Q := Group < a, a1, a2, a3, a4 | (a1, a) = a2, (a2, a) = a3,
                (a3, a) = a4, (a4, a) = 1, (a1, a2) = a4, (a1, a4)= 1, 
                (a1, a3) = 1, (a2, a3) = 1, (a2, a4) = 1, (a3, a4) = 1, 
                a2^p = 1, a3^p = 1, a^p = a4, a1^p = 1, a4^p = 1>;
   B := pQuotient (Q, p, 5);
   Append(~Tlist, B);
   
   Append(~MuGlist, 2*p^2);
   Append(~MuTlist, p^3);
   
   // (23, 6)
   count := count+1;
   F := L[count];
   Alpha := [F.1, F.2]; Beta:= [F.3, F.4, F.5, F.6];
   G1, phi := pQuotient(F, p, 6);
   Append(~Glist, G1);
   N1 := sub<G1 | phi( F.1*F.2 ) >;
   Append(~Nlist, N1);
   
   // Q is phi_10(2111)b_1
   Q := Group < a, a1, a2, a3, a4 | (a1, a) = a2, (a2, a) = a3,
                (a3, a) = a4, (a4, a) = 1, (a1, a2) = a4, (a1, a4)= 1, 
                (a1, a3) = 1, (a2, a3) = 1, (a2, a4) = 1, (a3, a4) = 1, 
                a2^p = 1, a3^p = 1, a^p = 1, a1^p = a4, a4^p = 1>;
   B := pQuotient (Q, p, 5);
   Append(~Tlist, B);
   
   Append(~MuGlist, 2*p^2);
   Append(~MuTlist, p^3);
   
   Append(~MuGlist, 2*p^2);
   Append(~MuTlist, p^3);
   
   // (23, 9r) (r=0)
   count := count+1;
   F := L[count];
   Alpha := [F.1, F.2]; Beta:= [F.3, F.4, F.5, F.6];
   G1, phi := pQuotient(F, p, 6);
   Append(~Glist, G1);
   N1 := sub<G1 | phi( F.1*F.2 ) >;
   Append(~Nlist, N1);
   
   // Q is phi_10(2111)b_1
   Q := Group < a, a1, a2, a3, a4 | (a1, a) = a2, (a2, a) = a3,
                (a3, a) = a4, (a4, a) = 1, (a1, a2) = a4, (a1, a4)= 1, 
                (a1, a3) = 1, (a2, a3) = 1, (a2, a4) = 1, (a3, a4) = 1, 
                a2^p = 1, a3^p = 1, a^p = 1, a1^p = a4, a4^p = 1>;
   B := pQuotient (Q, p, 5);
   Append(~Tlist, B);
   
   Append(~MuGlist, 2*p^2);
   Append(~MuTlist, p^3);
   
   return Glist, Tlist, Nlist, MuGlist, MuTlist;
end function;

for p in PrimesInInterval (5, 13) do 
   "\nprocess p = ", p;
   L := Table3Phi23(p);

   Glist, Tlist, Nlist, MuGlist, MuTlist := Check23(L, p);

   for i in [1..#L] do
      P := Glist[i];
      N := Nlist[i];
      T := Tlist[i];
      MuP := MuGlist[i];
      MuT := MuTlist[i];
      assert IsNormal (P, N);
      Q := quo< P | N>;
      assert IsIsomorphic(Q, T);
      assert MuP eq Mu(P);
      assert MuT eq Mu(T);
   end for;
end for;
